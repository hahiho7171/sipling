@echo off
REM Sipling (su hatirlatici) - kendi baglamiyla Claude Code baslatir.
REM
REM Claude Code hafizayi oturumun BASLADIGI klasore gore secer.
REM Buradan baslatilinca yalniz bu projenin hafizasi yuklenir;
REM diger projeler (Randevio, Misyon Koruma, Sipling, Cozy ASMR...) hic gorunmez.
REM
REM Kullanim: bu dosyaya cift tikla.

cd /d "%~dp0"
title Claude Code - Sipling (su hatirlatici)
echo.
echo   Sipling (su hatirlatici)
echo   C:\Users\asim_\Desktop\CloudWork\Sipling
echo   Yalnizca bu projenin hafizasi + CLAUDE.md yuklenecek.
echo.
claude --dangerously-skip-permissions %*
