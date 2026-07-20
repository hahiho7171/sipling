const {chromium}=require("playwright-core");
(async()=>{
  const b=await chromium.connectOverCDP("http://localhost:9360");
  const p=b.contexts()[0].pages().find(x=>!x.url().startsWith("devtools://"));
  const dlg=p.locator('[role=dialog],[role=alertdialog]').first();
  const btn=dlg.getByRole("button",{name:"Değişikliği incelemeye gönder"});
  await btn.click();
  console.log("'Degisikligi incelemeye gonder' tiklandi");
  await p.waitForTimeout(8000);
  const durum=await p.evaluate(()=>{
    const g=document.body.innerText;
    const sat=(g.match(/[^\n]*(İncelenmekte|inceleme|gönderildi|Henüz incelemeye|değişiklik yok|Gönderim etkinliği|başarıyla)[^\n]*/gi)||[]).slice(0,8);
    return {url:location.href, sat:[...new Set(sat)].slice(0,6)};
  });
  console.log("DURUM:",JSON.stringify(durum,null,1));
  await p.screenshot({path:process.argv[2]||'onayla.png'});
})().catch(e=>console.log("HATA:",e.message));
