const {chromium}=require("playwright-core");
(async()=>{
  const b=await chromium.connectOverCDP("http://localhost:9360");
  const p=b.contexts()[0].pages().find(x=>!x.url().startsWith("devtools://"));
  await p.mouse.move(200,850); await p.waitForTimeout(800);
  const btn=p.getByText("1 değişikliği incelemeye gönder",{exact:true}).first();
  const box=await btn.boundingBox();
  console.log("buton konum:", box?Math.round(box.x)+','+Math.round(box.y):'YOK');
  if(!box){console.log("buton bulunamadi"); return;}
  await p.mouse.click(box.x+box.width/2, box.y+box.height/2);
  console.log("tiklandi @", Math.round(box.x+box.width/2), Math.round(box.y+box.height/2));
  await p.waitForTimeout(4500);
  const durum=await p.evaluate(()=>{
    const dlg=document.querySelector('[role=dialog],[role=alertdialog]');
    return {
      dlgAcik:!!dlg,
      dlgTxt:dlg?dlg.innerText.slice(0,350):null,
      dlgBtn:dlg?[...dlg.querySelectorAll('button')].map(x=>x.innerText.trim()).filter(Boolean):[]
    };
  });
  console.log("DURUM:",JSON.stringify(durum,null,1));
  await p.screenshot({path:process.argv[2]||'gonder3.png'});
})().catch(e=>console.log("HATA:",e.message));
