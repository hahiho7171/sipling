const {chromium}=require("playwright-core");
(async()=>{
  const b=await chromium.connectOverCDP("http://localhost:9360");
  const p=b.contexts()[0].pages().find(x=>!x.url().startsWith("devtools://"));
  const btn=p.getByRole("button",{name:"Kaydet"}).last();
  const dis=await btn.isDisabled().catch(()=>true);
  console.log("Kaydet pasif mi:", dis);
  if(!dis){ await btn.click(); console.log("Kaydet tiklandi"); await p.waitForTimeout(8000); }
  const durum=await p.evaluate(()=>{
    const g=document.body.innerText;
    const sat=(g.match(/[^\n]*(incelemeye gönder|İncelemeye gönder|Yayın özeti|Değişiklikleri gönder|inceleniyor|İncelenmekte|kaydedildi)[^\n]*/gi)||[]).slice(0,8);
    return {url:location.href, sat:[...new Set(sat)]};
  });
  console.log("DURUM:",JSON.stringify(durum,null,1));
  await p.screenshot({path:process.argv[2]||'kaydet.png'});
})().catch(e=>console.log("HATA:",e.message));
