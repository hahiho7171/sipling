import WidgetKit
import SwiftUI

// Ana uygulama ile paylaşılan App Group. Runner.entitlements + bu uzantının
// entitlements'ıyla AYNI olmalı; Dart tarafı verileri buraya yazar.
private let appGroupId = "group.com.sipling.app"

// Marka renkleri (theme.dart ile aynı).
private let bgTop = Color(red: 0.917, green: 0.965, blue: 0.988)   // #EAF6FC
private let waterColor = Color(red: 0.310, green: 0.702, blue: 0.910) // #4FB3E8
private let inkColor = Color(red: 0.090, green: 0.220, blue: 0.290)   // #17384A
private let inkSoft = Color(red: 0.353, green: 0.478, blue: 0.541)    // #5A7A8A

struct SiplingEntry: TimelineEntry {
  let date: Date
  let todayMl: String
  let goalMl: String
  let percent: Int
  let streak: String
  let treeImagePath: String?
}

struct Provider: TimelineProvider {
  func placeholder(in context: Context) -> SiplingEntry {
    SiplingEntry(date: Date(), todayMl: "0", goalMl: "2000",
                 percent: 0, streak: "0", treeImagePath: nil)
  }

  func getSnapshot(in context: Context, completion: @escaping (SiplingEntry) -> Void) {
    completion(readEntry())
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<SiplingEntry>) -> Void) {
    // `home_widget` veri değişince WidgetCenter.reloadTimelines çağırır; yine de
    // güvenlik ağı olarak ~30 dk sonra bir kez daha tazele.
    let next = Calendar.current.date(byAdding: .minute, value: 30, to: Date()) ?? Date()
    completion(Timeline(entries: [readEntry()], policy: .after(next)))
  }

  private func readEntry() -> SiplingEntry {
    let ud = UserDefaults(suiteName: appGroupId)
    return SiplingEntry(
      date: Date(),
      todayMl: ud?.string(forKey: "today_ml") ?? "0",
      goalMl: ud?.string(forKey: "goal_ml") ?? "0",
      percent: Int(ud?.string(forKey: "percent") ?? "0") ?? 0,
      streak: ud?.string(forKey: "streak") ?? "0",
      treeImagePath: ud?.string(forKey: "tree_img")
    )
  }
}

struct SiplingWidgetEntryView: View {
  var entry: Provider.Entry

  private var treeImage: Image? {
    guard let path = entry.treeImagePath,
          let ui = UIImage(contentsOfFile: path) else { return nil }
    return Image(uiImage: ui)
  }

  var body: some View {
    VStack(spacing: 6) {
      if let img = treeImage {
        img.resizable().aspectRatio(contentMode: .fit).frame(height: 64)
      } else {
        Image(systemName: "leaf.fill").font(.system(size: 40)).foregroundColor(waterColor)
      }

      Text("\(entry.todayMl) / \(entry.goalMl) ml")
        .font(.system(size: 13, weight: .bold))
        .foregroundColor(inkColor)
        .lineLimit(1).minimumScaleFactor(0.7)

      // İlerleme çubuğu
      GeometryReader { geo in
        ZStack(alignment: .leading) {
          Capsule().fill(waterColor.opacity(0.18)).frame(height: 6)
          Capsule().fill(waterColor)
            .frame(width: geo.size.width * CGFloat(min(entry.percent, 100)) / 100.0, height: 6)
        }
      }
      .frame(height: 6)
      .padding(.horizontal, 4)

      Text("%\(entry.percent)")
        .font(.system(size: 11, weight: .semibold))
        .foregroundColor(inkSoft)
    }
    .padding(12)
    .widgetURL(URL(string: "sipling://open"))
  }
}

@main
struct SiplingWidget: Widget {
  let kind: String = "SiplingWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: Provider()) { entry in
      if #available(iOSApplicationExtension 17.0, *) {
        SiplingWidgetEntryView(entry: entry)
          .containerBackground(bgTop, for: .widget)
      } else {
        SiplingWidgetEntryView(entry: entry)
          .background(bgTop)
      }
    }
    .configurationDisplayName("Sipling")
    .description("Bugünkü suyun ve fidanın.")
    .supportedFamilies([.systemSmall, .systemMedium])
  }
}
