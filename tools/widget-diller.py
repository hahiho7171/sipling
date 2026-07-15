"""Ana ekran widget'inin metinlerini 20 dile uretir.

Widget Kotlin ile ciziliyor; Dart'in .arb cevirilerini GOREMEZ, kendi
res/values-<dil>/strings.xml kaynaklarini okur. Bu betik o dosyalari
mevcut cevirilerden turetir - elle 20 dosya yazmaya gerek yok.

Kaynak:
  widget_streak      <- app_<dil>.arb : sumStreakDays  ("{days} days" -> "🔥 %1$d days")
  widget_start_today <- app_<dil>.arb : sumStartToday
  widget_description <- store/metinler/<play>.json : slogan1
  widget_label       -> "Sipling" (marka, cevrilmez)
  widget_amount      -> "%1$d / %2$d ml" (sayi + birim, cevrilmez)

Kullanim: python tools/widget-diller.py [--kuru]
"""

import json
import sys
from pathlib import Path
from xml.sax.saxutils import escape

ROOT = Path(__file__).resolve().parent.parent
RES = ROOT / "app" / "android" / "app" / "src" / "main" / "res"
L10N = ROOT / "app" / "lib" / "l10n"
DRY = "--kuru" in sys.argv

# Android XML'de tek tirnak ve & kacilmali; %1$d bicim belirteci korunmali.
def xml_escape(s: str) -> str:
    return escape(s).replace("'", "\\'").replace('"', '\\"')


def main() -> int:
    langs = json.loads((ROOT / "tools" / "diller.json").read_text(encoding="utf-8"))["diller"]
    yazilan, atlanan = 0, []

    for L in langs:
        arb = L10N / f"app_{L['arb']}.arb"
        store = ROOT / "store" / "metinler" / f"{L['play']}.json"
        if not arb.exists() or not store.exists():
            atlanan.append(L["arb"])
            continue

        a = json.loads(arb.read_text(encoding="utf-8"))
        s = json.loads(store.read_text(encoding="utf-8"))

        # "{days} days" -> "🔥 %1$d days"   (Android bicim belirteci)
        streak = "🔥 " + a["sumStreakDays"].replace("{days}", "%1$d")
        start = a["sumStartToday"] + " 🌱"
        desc = s["slogan1"]

        # Varsayilan (en) values/ altina, digerleri values-<kod>/ altina.
        # Android dil klasoru: tr, pt-rBR degil sade dil kodu yeter (zh_Hant -> b+zh+Hant).
        if L["arb"] == "en":
            folder = RES / "values"
        elif L["arb"] == "zh_Hant":
            folder = RES / "values-b+zh+Hant"
        else:
            folder = RES / f"values-{L['arb']}"

        xml = f"""<?xml version="1.0" encoding="utf-8"?>
<!-- OTOMATİK ÜRETİLDİ: tools/widget-diller.py — elle düzenleme, üzerine yazılır.
     Kaynak: lib/l10n/app_{L['arb']}.arb + store/metinler/{L['play']}.json -->
<resources>
    <string name="widget_label">Sipling</string>
    <string name="widget_description">{xml_escape(desc)}</string>
    <string name="widget_streak">{xml_escape(streak)}</string>
    <string name="widget_start_today">{xml_escape(start)}</string>
    <string name="widget_amount">%1$d / %2$d ml</string>
</resources>
"""
        if not DRY:
            folder.mkdir(parents=True, exist_ok=True)
            (folder / "strings.xml").write_text(xml, encoding="utf-8")
        yazilan += 1
        print(f"  {folder.name:18} streak={streak[:22]!r}")

    print(f"\n{yazilan} dil yazildi" + (" (KURU DENEME)" if DRY else ""))
    if atlanan:
        print("atlanan (ceviri eksik):", ", ".join(atlanan))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
