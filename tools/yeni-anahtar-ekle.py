#!/usr/bin/env python3
"""Yeni l10n anahtarlarini 20 .arb dosyasina ekler.

Neden ayri betik: CLAUDE.md kural 9 — coklu dosyada bul/degistir isi inline
`python -c` ile YAPILMAZ (bir keresinde 70 dosyayi bozdu). Kuru deneme sart.

Kullanim:
    python tools/yeni-anahtar-ekle.py ceviriler.json --kuru   # sadece goster
    python tools/yeni-anahtar-ekle.py ceviriler.json          # yaz

ceviriler.json bicimi:
    {
      "_meta": { "needCurrentGoal": { "placeholders": { "ml": {"type": "int"} } } },
      "en": { "needTitle": "...", ... },
      "tr": { "needTitle": "...", ... }
    }

`_meta` yalnizca SABLON dosyaya (app_en.arb) yazilir — gen-l10n yer tutucu
tanimlarini sadece sablondan okur.

Dosyayi bastan JSON olarak yeniden yazmiyoruz (20 dosyanin bicimi degisirdi);
son `}` isaretinden once metin olarak ekliyoruz.
"""
import json
import sys
from pathlib import Path

ARB_DIR = Path(__file__).resolve().parent.parent / "app" / "lib" / "l10n"
TEMPLATE = "en"


def mevcut_anahtarlar(metin: str) -> set:
    try:
        return set(json.loads(metin).keys())
    except json.JSONDecodeError as e:
        raise SystemExit(f"BOZUK JSON: {e}")


def ekle(metin: str, yeni: dict, meta: dict) -> str:
    """Son `}` oncesine yeni anahtarlari ekler."""
    govde = metin.rstrip()
    if not govde.endswith("}"):
        raise SystemExit("Dosya '}' ile bitmiyor — beklenmedik bicim.")
    govde = govde[:-1].rstrip()          # kapanis parantezini at
    if govde.endswith(","):
        govde = govde[:-1]

    satirlar = []
    for anahtar, deger in yeni.items():
        satirlar.append(f"  {json.dumps(anahtar, ensure_ascii=False)}: "
                        f"{json.dumps(deger, ensure_ascii=False)}")
        if anahtar in meta:
            blok = json.dumps(meta[anahtar], ensure_ascii=False, indent=2)
            blok = "\n".join("  " + s for s in blok.splitlines())
            satirlar.append(f"  \"@{anahtar}\": {blok.lstrip()}")

    return govde + ",\n" + ",\n".join(satirlar) + "\n}\n"


def main() -> None:
    if len(sys.argv) < 2:
        raise SystemExit(__doc__)
    kuru = "--kuru" in sys.argv
    veri = json.loads(Path(sys.argv[1]).read_text(encoding="utf-8"))
    meta = veri.pop("_meta", {})

    for dil, yeni in veri.items():
        yol = ARB_DIR / f"app_{dil}.arb"
        if not yol.exists():
            raise SystemExit(f"YOK: {yol}")
        metin = yol.read_text(encoding="utf-8")
        var = mevcut_anahtarlar(metin)

        cakisan = var & set(yeni)
        if cakisan:
            raise SystemExit(f"{dil}: bu anahtarlar ZATEN VAR → {sorted(cakisan)}")

        sonuc = ekle(metin, yeni, meta if dil == TEMPLATE else {})
        json.loads(sonuc)  # yazmadan once gecerli JSON mu, dogrula

        if kuru:
            print(f"[kuru] {yol.name}: +{len(yeni)} anahtar (JSON gecerli)")
        else:
            yol.write_text(sonuc, encoding="utf-8")
            print(f"yazildi {yol.name}: +{len(yeni)} anahtar")


if __name__ == "__main__":
    main()
