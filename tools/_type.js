const {chromium}=require("playwright-core");
(async()=>{
  const b=await chromium.connectOverCDP("http://localhost:9360");
  const p=b.contexts()[0].pages().find(x=>!x.url().startsWith("devtools://"));
  const [,, sel, text, out] = process.argv;
  const el=await p.$(sel);
  if(!el){console.log("selector-yok:",sel); await b.close(); return;}
  await el.click({clickCount:3});
  await el.fill("");
  await p.keyboard.type(text,{delay:40});
  await p.waitForTimeout(800);
  if(out) await p.screenshot({path:out});
  console.log("yazildi:",text);
  await b.close();
})();
