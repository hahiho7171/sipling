(() => {
  // shared_preferences web'de metin değerleri İKİ KEZ JSON'a çevirir. (wiki/02)
  const setStr = (k, v) => localStorage.setItem(k, JSON.stringify(JSON.stringify(v)));
  const setBool = (k, v) => localStorage.setItem(k, v);

  const profile = { g: 'male', a: 32, h: 178, w: 76, act: 'medium',
    wake: 480, sleep: 1380, goal: null, u: 'ml', ob: true };
  setStr('flutter.profile', profile);

  const species = ['oak', 'pine', 'sakura', 'maple', 'acacia', 'olive'];
  const days = {};
  const now = new Date();
  for (let i = 0; i < 26; i++) {
    const d = new Date(now.getTime() - i * 86400000);
    const key = d.toISOString().slice(0, 10);
    // Bazı günler tam, bazıları yarım — orman çeşitli görünsün.
    const frac = i % 5 === 0 ? 0.45 : (i % 7 === 0 ? 0.7 : 1.0);
    const total = Math.round(2300 * frac);
    // Dün (i=1) çeşitli içecek olsun ki dağılım çubuğu gerçekten test edilsin.
    const sips = i === 1
      ? [{ ml: 1200, t: 'water', at: d.getTime() },
         { ml: 400, t: 'coffee', at: d.getTime() + 1000 },
         { ml: 500, t: 'tea', at: d.getTime() + 2000 },
         { ml: 200, t: 'juice', at: d.getTime() + 3000 }]
      : [{ ml: total, t: 'water', at: d.getTime() }];
    days[key] = { d: key, g: 2300, sp: species[i % species.length], s: sips };
  }
  setStr('flutter.days', days);
  setBool('flutter.pro', true);          // temaları açmak için
  return 'tamam: ' + Object.keys(days).length + ' gun';
})()
