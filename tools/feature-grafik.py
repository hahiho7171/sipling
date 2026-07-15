"""Play "one cikan grafik"lerini (1024x500) tum diller icin uretir.

Metin: store/metinler/<play-kodu>.json  (slogan1, slogan2, chip1, chip2)
Cikti: store/<play-kodu>/feature-graphic.png   1024x500, 24-bit PNG, alfa YOK

Kullanim:
  python tools/feature-grafik.py            # hepsi
  python tools/feature-grafik.py ar         # tek dil
"""

import json
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CHROME = r"C:\Program Files\Google\Chrome\Application\chrome.exe"
PROFILE = r"C:\Users\asim_\sipling-render-profile"

SVG_ICON = """
  <svg class="art" width="360" height="360" viewBox="0 0 1024 1024">
    <defs>
      <linearGradient id="w2l" x1="0" y1="0" x2="0" y2="1">
        <stop offset="0.05" stop-color="#66C2F0"/><stop offset="0.40" stop-color="#4FB3E8"/>
        <stop offset="0.66" stop-color="#4CAF7D"/><stop offset="1" stop-color="#2F8F5B"/>
      </linearGradient>
    </defs>
    <ellipse cx="512" cy="962" rx="250" ry="28" fill="#2F8F5B" opacity="0.13"/>
    <path d="M512 120 C512 120 806 468 806 648 A294 294 0 1 1 218 648 C218 468 512 120 512 120 Z" fill="url(#w2l)"/>
    <path d="M512 902 L512 296" stroke="#fff" stroke-width="28" stroke-linecap="round" opacity="0.9"/>
    <g stroke="#fff" stroke-width="22" stroke-linecap="round" opacity="0.75" fill="none">
      <path d="M512 760 C440 748 388 690 372 616"/><path d="M512 760 C584 748 636 690 652 616"/>
      <path d="M512 596 C452 586 410 538 398 478"/><path d="M512 596 C572 586 614 538 626 478"/>
    </g>
  </svg>
"""


def html(t: dict, rtl: bool) -> str:
    # RTL dillerde metin sagda, gorsel solda dursun.
    side = "right:64px" if rtl else "left:64px"
    art = "left:70px" if rtl else "right:70px"
    align = "right" if rtl else "left"
    dir_attr = "rtl" if rtl else "ltr"
    return f"""<!-- Otomatik uretildi: tools/feature-grafik.py -->
<style>
  html,body{{margin:0;padding:0}}
  .g{{width:1024px;height:500px;position:relative;overflow:hidden;
     background:linear-gradient(160deg,#EAF6FC 0%,#DCEFE6 55%,#CDE9D6 100%);
     font-family:"Segoe UI",Roboto,"Noto Sans","Noto Sans Arabic","Noto Sans JP","Noto Sans KR",
                 "Noto Sans SC","Noto Sans TC","Noto Sans Thai","Noto Sans Devanagari",Arial,sans-serif}}
  .hill{{position:absolute;left:0;right:0;bottom:0;height:210px}}
  .txt{{position:absolute;{side};top:120px;width:520px;text-align:{align}}}
  h1{{margin:0;font-size:58px;font-weight:800;color:#17384A;letter-spacing:-1px;direction:ltr;
     text-align:{align}}}
  p{{margin:14px 0 0;font-size:25px;line-height:1.4;color:#39627A;font-weight:500}}
  .chips{{margin-top:24px;display:flex;gap:10px;justify-content:{'flex-end' if rtl else 'flex-start'}}}
  .chip{{background:rgba(255,255,255,.78);color:#2F8F5B;font-size:15px;font-weight:600;
        padding:8px 14px;border-radius:20px;white-space:nowrap}}
  .art{{position:absolute;{art};top:56px}}
</style>
<div class="g" dir="{dir_attr}">
  <svg class="hill" viewBox="0 0 1024 210" preserveAspectRatio="none">
    <path d="M0 96 Q250 46 520 92 Q780 136 1024 78 L1024 210 L0 210 Z" fill="#C6E7D2"/>
    <path d="M0 146 Q260 106 540 142 Q800 176 1024 132 L1024 210 L0 210 Z" fill="#A9DEBB"/>
  </svg>
  <div class="txt">
    <h1>Sipling</h1>
    <p>{t['slogan1']}<br>{t['slogan2']}</p>
    <div class="chips">
      <div class="chip">{t['chip1']}</div>
      <div class="chip">{t['chip2']}</div>
    </div>
  </div>
  {SVG_ICON}
</div>
"""


def main() -> int:
    langs = json.loads((ROOT / "tools" / "diller.json").read_text(encoding="utf-8"))["diller"]
    only = sys.argv[1] if len(sys.argv) > 1 else None
    tmp = Path(tempfile.mkdtemp())
    made, missing = 0, []

    for L in langs:
        if only and L["arb"] != only:
            continue
        src = ROOT / "store" / "metinler" / f"{L['play']}.json"
        if not src.exists():
            missing.append(L["play"])
            continue
        t = json.loads(src.read_text(encoding="utf-8"))
        page = tmp / f"{L['play']}.html"
        page.write_text(html(t, L["rtl"]), encoding="utf-8")

        out = ROOT / "store" / L["play"] / "feature-graphic.png"
        out.parent.mkdir(parents=True, exist_ok=True)
        subprocess.run(
            [CHROME, "--headless=new", "--disable-gpu", f"--user-data-dir={PROFILE}",
             f"--screenshot={out.as_posix()}", "--window-size=1024,500", "--hide-scrollbars",
             f"file:///{page.as_posix()}"],
            capture_output=True, timeout=120,
        )
        made += 1
        print(f"  {L['play']:6} -> {out.relative_to(ROOT)}")

    print(f"\n{made} grafik uretildi")
    if missing:
        print("metni olmayan diller (once ceviri gerek):", ", ".join(missing))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
