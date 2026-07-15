const {chromium}=require("playwright-core");
(async()=>{
  const b=await chromium.connectOverCDP("http://localhost:9360");
  const p=b.contexts()[0].pages().find(x=>!x.url().startsWith("devtools://"));
  await p.mouse.move(640,400); await p.mouse.wheel(0,Number(process.argv[3]||600));
  await p.waitForTimeout(1200); await p.screenshot({path:process.argv[2]});
  console.log("ok"); await b.close();
})();
