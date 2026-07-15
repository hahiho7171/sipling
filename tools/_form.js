const {chromium}=require("playwright-core");
(async()=>{
  const b=await chromium.connectOverCDP("http://localhost:9360");
  const p=b.contexts()[0].pages().find(x=>!x.url().startsWith("devtools://"));
  await p.fill('#name','Sipling');
  await p.fill('#sku','sipling2026');
  const selects = await p.$$('select');
  await selects[0].selectOption({label:'English (U.S.)'});
  await selects[1].selectOption({index:1});
  await p.check('#userAccessFull');
  await p.waitForTimeout(700);
  await p.screenshot({path:process.argv[2]});
  const bundle = await selects[1].evaluate(s=>s.options[s.selectedIndex].text);
  console.log('bundle:', bundle);
  await b.close();
})();
