#!/usr/bin/env ruby
# frozen_string_literal: true
#
# Sipling iOS ana-ekran widget'ını (SiplingWidget) Xcode projesine ekler.
#
# 🚨 Bu betik yalnız MAC'te çalışır (Windows'ta geliştiriliyoruz, orada test edilemedi).
#     Codemagic'in Mac makinesinde ya da kendi Mac'inde çalıştır:
#       cd app/ios && gem install xcodeproj && ruby tools/add_widget_target.rb
#
# Ne yapar (idempotent — iki kez çalışırsa ikinci sefer değişiklik yapmaz):
#   1) Runner hedefine App Group entitlements'ı bağlar (Runner/Runner.entitlements).
#   2) "SiplingWidget" adında bir WidgetKit uzantı hedefi ekler
#      (kaynaklar: SiplingWidget/SiplingWidget.swift, Info.plist, .entitlements).
#   3) Uzantıyı Runner uygulamasına gömer ("Embed App Extensions").
#
# Kaynak Swift/plist/entitlements dosyaları zaten ios/SiplingWidget/ altında hazır.
# Sorun çıkarsa çekilen tek şey bu betik; checked-in .pbxproj'a dokunulmadı, çekirdek
# uygulama her hâlükârda derlenir. Ayrıntı → wiki/05-yayin-apple.md.

require 'xcodeproj'

PROJECT = 'Runner.xcodeproj'
WIDGET  = 'SiplingWidget'
APP_ID  = 'com.sipling.app'
GROUP   = 'group.com.sipling.app'
DEPLOY  = '14.0' # WidgetKit iOS 14+

project = Xcodeproj::Project.open(PROJECT)

runner = project.targets.find { |t| t.name == 'Runner' }
raise 'Runner hedefi bulunamadı' unless runner

# 1) Runner → App Group entitlements
runner.build_configurations.each do |c|
  c.build_settings['CODE_SIGN_ENTITLEMENTS'] = 'Runner/Runner.entitlements'
end

# 2) Widget uzantı hedefi (zaten varsa atla)
if project.targets.any? { |t| t.name == WIDGET }
  puts "#{WIDGET} hedefi zaten var — atlandı."
else
  widget = project.new_target(:app_extension, WIDGET, :ios, DEPLOY)

  group = project.main_group.find_subpath(WIDGET, true)
  group.set_source_tree('SOURCE_ROOT')
  swift = group.new_reference("#{WIDGET}/#{WIDGET}.swift")
  group.new_reference("#{WIDGET}/Info.plist")
  group.new_reference("#{WIDGET}/#{WIDGET}.entitlements")

  widget.source_build_phase.add_file_reference(swift)

  widget.build_configurations.each do |c|
    s = c.build_settings
    s['PRODUCT_BUNDLE_IDENTIFIER'] = "#{APP_ID}.#{WIDGET}"
    s['PRODUCT_NAME'] = WIDGET
    s['INFOPLIST_FILE'] = "#{WIDGET}/Info.plist"
    s['CODE_SIGN_ENTITLEMENTS'] = "#{WIDGET}/#{WIDGET}.entitlements"
    s['IPHONEOS_DEPLOYMENT_TARGET'] = DEPLOY
    s['SWIFT_VERSION'] = '5.0'
    s['TARGETED_DEVICE_FAMILY'] = '1,2'
    s['GENERATE_INFOPLIST_FILE'] = 'NO'
    s['MARKETING_VERSION'] = '1.0'
    s['CURRENT_PROJECT_VERSION'] = '1'
    s['SKIP_INSTALL'] = 'YES'
  end

  # 3) Uzantıyı Runner'a göm
  embed = runner.build_phases.find do |ph|
    ph.respond_to?(:symbol_dst_subfolder_spec) &&
      ph.symbol_dst_subfolder_spec == :plug_ins
  end
  embed ||= begin
    ph = runner.new_copy_files_build_phase('Embed App Extensions')
    ph.symbol_dst_subfolder_spec = :plug_ins
    ph
  end
  ref = embed.add_file_reference(widget.product_reference)
  ref.settings = { 'ATTRIBUTES' => ['RemoveHeadersOnCopy'] }
  runner.add_dependency(widget)

  puts "#{WIDGET} hedefi eklendi."
end

project.save
puts 'Bitti — Runner.xcodeproj güncellendi.'
