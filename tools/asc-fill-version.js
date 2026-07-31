const { chromium } = require('playwright-core');
const fs = require('fs');

const DESC = fs.readFileSync('C:/Users/asim_/Desktop/CloudWork/Sipling/store/metinler/apple-en.txt', 'utf8').trim();
const KEYWORDS = 'water tracker,drink reminder,hydration,water intake,daily water,health,habit,drink water,thirst';
const PROMO = 'Grow a forest, one glass at a time. Gentle reminders, no guilt — and your water history stays on your phone.';
const COPYRIGHT = '2026 Tuğba Gökcek';
const SUPPORT = 'https://sipling-app.web.app/destek';
const MARKETING = 'https://sipling-app.web.app';

const fields = [
  ['#description', DESC],
  ['#keywords', KEYWORDS],
  ['#promotionalText', PROMO],
  ['#copyright', COPYRIGHT],
  ['#supportUrl', SUPPORT],
  ['#marketingUrl', MARKETING],
];

(async () => {
  console.log('desc len:', DESC.length, '| keywords len:', KEYWORDS.length, '| promo len:', PROMO.length);
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  for (const [sel, val] of fields) {
    const el = await p.$(sel);
    if (!el) { console.log('YOK:', sel); continue; }
    await el.scrollIntoViewIfNeeded();
    await el.fill(val);
    await p.waitForTimeout(400);
    console.log('OK:', sel);
  }
  await p.waitForTimeout(500);
})().catch((e) => { console.error('HATA:', e.message.slice(0, 200)); process.exit(1); });
