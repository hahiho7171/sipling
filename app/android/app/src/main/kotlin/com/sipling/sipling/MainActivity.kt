package com.sipling.sipling

import io.flutter.embedding.android.FlutterFragmentActivity

/**
 * 🚨 FlutterActivity DEĞİL, FlutterFragmentActivity.
 *
 * `health` paketi (13.3.1) Health Connect izni isterken `registerForActivityResult`
 * kullanıyor; bunun için Activity'nin ComponentActivity'ye cast edilebilmesi gerek.
 * FlutterActivity bunu karşılamıyor → izin ekranı HİÇ açılmıyor, çağrı sessizce
 * `false` dönüyor ve kullanıcı "İzin verilmedi, sağlık defterine yazılmayacak" görüyor.
 * Kaynak: health 13.3.1 README, "Android 14" bölümü (satır 135-151).
 *
 * Bu satırı geri alma — Health Connect anahtarı bir daha açılmaz.
 */
class MainActivity : FlutterFragmentActivity()
