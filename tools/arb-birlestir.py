"""lib/l10n/parts/*_{tr,en}.json parcalarini ana .arb dosyalarina katar.

Ekranlar ayri ayri cevrildigi icin her ekran kendi parcasini yaziyor.
Bu betik onlari tek .arb'de birlestirir, cakisma ve eksik anahtar kontrolu yapar.

Kullanim:
  python tools/arb-birlestir.py --kuru   # sadece rapor
  python tools/arb-birlestir.py          # yaz
"""

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
L10N = ROOT / "app" / "lib" / "l10n"
PARTS = L10N / "parts"
DRY = "--kuru" in sys.argv


def load(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def main() -> int:
    if not PARTS.exists():
        print("parts/ yok")
        return 1

    problems = []

    for lang in ("tr", "en"):
        base_path = L10N / f"app_{lang}.arb"
        base = load(base_path)
        core_keys = {k for k in base if not k.startswith("@")}

        for part in sorted(PARTS.glob(f"*_{lang}.json")):
            data = load(part)
            for key, value in data.items():
                plain = key.lstrip("@")
                # Cekirdek ARB'de zaten olan anahtari ekran ezmesin.
                if plain in core_keys and not key.startswith("@"):
                    problems.append(f"{part.name}: '{key}' cekirdek ARB'de zaten var, atlandi")
                    continue
                if key in base and base[key] != value:
                    problems.append(f"{part.name}: '{key}' cakisiyor, atlandi")
                    continue
                base[key] = value

        if not DRY:
            base_path.write_text(
                json.dumps(base, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
            )
        print(f"app_{lang}.arb -> {len([k for k in base if not k.startswith('@')])} anahtar")

    # tr ve en ayni anahtarlari tasimali
    tr = {k for k in load(L10N / "app_tr.arb") if not k.startswith("@")}
    en = {k for k in load(L10N / "app_en.arb") if not k.startswith("@")}
    only_tr, only_en = sorted(tr - en), sorted(en - tr)
    if only_tr:
        problems.append(f"YALNIZ tr'de: {only_tr}")
    if only_en:
        problems.append(f"YALNIZ en'de: {only_en}")

    print()
    if problems:
        print("SORUNLAR:")
        for p in problems:
            print("  -", p)
    else:
        print("temiz: tr ve en anahtarlari birebir ortusuyor")

    print("KURU DENEME (yazilmadi)" if DRY else "YAZILDI")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
