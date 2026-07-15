#!/usr/bin/env bash
# app/assets/icon/*.svg  →  aynı klasöre PNG.
# Chrome'u headless kullanır (ayrı profil: sipling-render-profile; 9360'a dokunmaz).
#
# Kullanım:  bash tools/ikon-uret.sh
# Sonra:     cd app && dart run flutter_launcher_icons
set -e

CHROME="/c/Program Files/Google/Chrome/Application/chrome.exe"
DIR="$(cd "$(dirname "$0")/.." && pwd)"
ICON="$DIR/app/assets/icon"
TMP="$ICON/.render"
mkdir -p "$TMP"

# svg_adi png_adi boyut şeffaf(1/0)
render() {
  local svg="$1" out="$2" size="$3" alpha="$4"
  printf '<style>html,body{margin:0;padding:0;background:transparent}svg{display:block;width:%spx;height:%spx}</style>\n' "$size" "$size" > "$TMP/$svg.html"
  cat "$ICON/$svg.svg" >> "$TMP/$svg.html"

  local bgflag=""
  [ "$alpha" = "1" ] && bgflag="--default-background-color=00000000"

  # Windows yolları: Chrome --screenshot ters bölü ile "erişim engellendi" veriyor, düz bölü şart.
  local winout winhtml
  winout="$(cygpath -m "$ICON/$out")"
  winhtml="$(cygpath -m "$TMP/$svg.html")"

  "$CHROME" --headless=new --disable-gpu \
    --user-data-dir="C:/Users/asim_/sipling-render-profile" \
    --screenshot="$winout" --window-size="$size,$size" --hide-scrollbars \
    $bgflag "file:///$winhtml" 2>&1 | tail -1
}

render icon    icon.png      1024 0   # legacy + iOS + web (opak)
render icon    play_icon.png  512 0   # Play mağaza ikonu (512x512)
render icon_fg icon_fg.png   1024 1   # Android adaptive ön katman (şeffaf)
render icon_bg icon_bg.png   1024 0   # Android adaptive arka katman

rm -rf "$TMP"
echo "Bitti → $ICON"
