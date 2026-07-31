# -*- coding: utf-8 -*-
"""
app/lib/l10n/app_<dil>.arb dosyalarina yeni anahtarlari ekler.
Kullanim:  python tools/arb_ekle.py --kuru   |   python tools/arb_ekle.py
"""
import io, json, os, sys, collections

KOK = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
L10N = os.path.join(KOK, 'app', 'lib', 'l10n')
YENI = os.path.join(KOK, 'tools', 'yeni_metinler.json')
KURU = '--kuru' in sys.argv

yeni = json.load(io.open(YENI, encoding='utf-8'))
dosyalar = sorted(f for f in os.listdir(L10N) if f.startswith('app_') and f.endswith('.arb'))

toplam, degisen = 0, 0
for f in dosyalar:
    kod = f[4:-4]                       # app_zh_Hant.arb -> zh_Hant
    yol = os.path.join(L10N, f)
    obj = json.load(io.open(yol, encoding='utf-8'), object_pairs_hook=collections.OrderedDict)
    if kod not in yeni:
        print('  ! ceviri YOK, atlandi:', kod); continue
    ekle = collections.OrderedDict((k, v) for k, v in yeni[kod].items() if k not in obj)
    if not ekle:
        print('  = zaten var:', kod); continue
    obj.update(ekle)
    toplam += len(ekle); degisen += 1
    print('  + %-8s %d anahtar' % (kod, len(ekle)))
    if not KURU:
        io.open(yol, 'w', encoding='utf-8', newline='\n').write(
            json.dumps(obj, ensure_ascii=False, indent=2) + '\n')

print('\nDosya: %d · degisen: %d · eklenen anahtar: %d' % (len(dosyalar), degisen, toplam))
eksik = [f[4:-4] for f in dosyalar if f[4:-4] not in yeni]
if eksik: print('CEVIRISI OLMAYAN DILLER:', eksik)
print('[KURU DENEME] yazilmadi.' if KURU else 'YAZILDI.')
