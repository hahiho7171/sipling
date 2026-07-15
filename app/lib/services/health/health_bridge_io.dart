import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:health/health.dart';

/// Health Connect'e **yalnız yazan** köprü. Hiçbir şey okumuyoruz.
///
/// Uygulamada içilen sıvı, Android'in ortak sağlık defterine `HydrationRecord`
/// olarak düşer; böylece başka sağlık uygulamaları da görebilir.
enum HealthAvailability { available, notInstalled, needsUpdate, unsupported }

class HealthBridge {
  static const _types = [HealthDataType.WATER];
  static const _access = [HealthDataAccess.WRITE];

  static bool _configured = false;

  static Health get _health {
    if (!_configured) {
      Health().configure();
      _configured = true;
    }
    return Health();
  }

  static Future<HealthAvailability> availability() async {
    if (!Platform.isAndroid) return HealthAvailability.unsupported;
    final status = await _health.getHealthConnectSdkStatus();
    return switch (status) {
      HealthConnectSdkStatus.sdkAvailable => HealthAvailability.available,
      HealthConnectSdkStatus.sdkUnavailableProviderUpdateRequired =>
        HealthAvailability.needsUpdate,
      HealthConnectSdkStatus.sdkUnavailable => HealthAvailability.notInstalled,
      _ => HealthAvailability.unsupported,
    };
  }

  static Future<bool> hasPermission() async {
    if (!Platform.isAndroid) return false;
    return await _health.hasPermissions(_types, permissions: _access) ?? false;
  }

  static Future<bool> requestPermission() async {
    if (!Platform.isAndroid) return false;
    return await _health.requestAuthorization(_types, permissions: _access);
  }

  static Future<void> openInstallPage() async {
    if (!Platform.isAndroid) return;
    await _health.installHealthConnect();
  }

  /// Su kaydı bir **zaman aralığıdır**, tek an değil. Bitiş başlangıca eşit olursa
  /// Health Connect `startTime must be before endTime` diye reddeder ve kayıt
  /// sessizce düşer. Bu yüzden bitişe 1 ms ekliyoruz. (Emülatörde yakalandı.)
  static const _span = Duration(milliseconds: 1);

  /// 🚨 `writeHealthData` su hacmini **LİTRE** bekliyor (`Volume.liters(value)`).
  /// `value: 250` yazarsan sağlık defterine 250 litre düşer.
  static Future<void> writeWater(int ml, DateTime at) async {
    if (!Platform.isAndroid || ml <= 0) return;
    try {
      await _health.writeHealthData(
        value: ml / 1000.0,
        unit: HealthDataUnit.LITER,
        type: HealthDataType.WATER,
        startTime: at,
        endTime: at.add(_span),
        recordingMethod: RecordingMethod.manual,
      );
    } catch (e) {
      // İzin çekilmiş ya da Health Connect kaldırılmış olabilir. Uygulamanın
      // kendi kaydı zaten tutuldu; kullanıcıyı rahatsız etmeye değmez.
      debugPrint('Sipling: Health Connect yazılamadı — $e');
    }
  }

  /// [writeWater] ile yazılan kaydı, tam olarak onun aralığını hedefleyerek siler.
  static Future<void> deleteWaterAt(DateTime at) async {
    if (!Platform.isAndroid) return;
    try {
      await _health.delete(
        type: HealthDataType.WATER,
        startTime: at,
        endTime: at.add(_span),
      );
    } catch (e) {
      debugPrint('Sipling: Health Connect kaydı silinemedi — $e');
    }
  }
}
