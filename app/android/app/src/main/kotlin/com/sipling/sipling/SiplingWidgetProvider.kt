package com.sipling.sipling

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.graphics.BitmapFactory
import android.net.Uri
import android.view.View
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetBackgroundIntent
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider

/**
 * Ana ekran widget'ı.
 *
 * Veriyi AppState'ten okumaz — launcher ayrı bir süreçtir. Flutter tarafı
 * (lib/services/home_widget_service.dart) özet veriyi paylaşılan bir
 * SharedPreferences'a yazar, burası okur.
 *
 * 🚨 Bütün değerler String olarak saklanır. Paket, Dart int'ini putInt,
 * double'ı putLong olarak yazıyor; yanlış getter ClassCastException demek.
 */
class SiplingWidgetProvider : HomeWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences,
    ) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.sipling_widget)

            val today = widgetData.getString("today_ml", "0")?.toIntOrNull() ?: 0
            val goal = widgetData.getString("goal_ml", "0")?.toIntOrNull() ?: 0
            val percent = widgetData.getString("percent", "0")?.toIntOrNull() ?: 0
            val streak = widgetData.getString("streak", "0")?.toIntOrNull() ?: 0

            views.setTextViewText(
                R.id.widget_amount,
                context.getString(R.string.widget_amount, today, goal),
            )
            views.setProgressBar(R.id.widget_progress, 100, percent.coerceIn(0, 100), false)
            // Metinler res/values(-tr)/strings.xml'den gelir — widget Dart'ın
            // .arb çevirilerini göremez, kendi kaynaklarını kullanır.
            views.setTextViewText(
                R.id.widget_streak,
                if (streak > 0) {
                    context.getString(R.string.widget_streak, streak)
                } else {
                    context.getString(R.string.widget_start_today)
                },
            )

            // Ağaç: Flutter'ın çizdiği PNG. Yoksa (ör. arka planda çizilemediyse)
            // görsel gizlenir, sayılar yine görünür.
            val treePath = widgetData.getString("tree_img", null)
            val bitmap = treePath?.let { path ->
                runCatching { BitmapFactory.decodeFile(path) }.getOrNull()
            }
            if (bitmap != null) {
                views.setImageViewBitmap(R.id.widget_tree, bitmap)
                views.setViewVisibility(R.id.widget_tree, View.VISIBLE)
            } else {
                views.setViewVisibility(R.id.widget_tree, View.GONE)
            }

            // Karta dokunmak uygulamayı açar.
            views.setOnClickPendingIntent(
                R.id.widget_root,
                HomeWidgetLaunchIntent.getActivity(context, MainActivity::class.java),
            )

            // Üç hızlı bardak. Uygulama kapalıyken bile su ekler:
            // broadcast → HomeWidgetBackgroundReceiver → Dart onWidgetTap().
            val cupIds = intArrayOf(R.id.widget_cup0, R.id.widget_cup1, R.id.widget_cup2)
            for (i in cupIds.indices) {
                val ml = widgetData.getString("cup${i}_ml", null)
                if (ml == null) {
                    views.setViewVisibility(cupIds[i], View.GONE)
                    continue
                }
                val type = widgetData.getString("cup${i}_type", "water")
                views.setViewVisibility(cupIds[i], View.VISIBLE)
                views.setTextViewText(cupIds[i], "+$ml")
                // Her butonun URI'si farklı; PendingIntent eşitliği Intent.filterEquals ile
                // belirlenir ve data (uri) ona dahildir — yoksa üçü aynı intent olurdu.
                views.setOnClickPendingIntent(
                    cupIds[i],
                    HomeWidgetBackgroundIntent.getBroadcast(
                        context,
                        Uri.parse("sipling://add?ml=$ml&type=$type"),
                    ),
                )
            }

            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
