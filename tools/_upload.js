const {chromium}=require("playwright-core");
(async()=>{
  const b=await chromium.connectOverCDP("http://localhost:9360");
  const p=b.contexts()[0].pages().find(x=>!x.url().startsWith("devtools://"));
  const inp=await p.$('input[accept=".aab"]');
  if(!inp){console.log("aab-input-yok"); await b.close(); return;}
  await inp.setInputFiles(process.argv[2],{timeout:200000});
  console.log("dosya set edildi, isleniyor...");
  await p.waitForTimeout(Number(process.argv[3]||60000));
  await p.screenshot({path:process.argv[4]});
  console.log("bitti");
  await b.close();
})();
