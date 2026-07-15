const {chromium}=require("playwright-core");
(async()=>{
  const b=await chromium.connectOverCDP("http://localhost:9360");
  const ctx=b.contexts()[0];
  const p=ctx.pages().find(x=>!x.url().startsWith("devtools://"))||await ctx.newPage();
  await p.setViewportSize({width:1280,height:900});
  const url=process.argv[2], out=process.argv[3];
  if(url&&url!=="-"){ try{ await p.goto(url,{waitUntil:"domcontentloaded",timeout:45000}); }catch(e){ console.log("goto-uyari:",e.message); } }
  await p.waitForTimeout(Number(process.argv[4]||4000));
  await p.screenshot({path:out});
  console.log("url:", p.url());
  await b.close();
})();
