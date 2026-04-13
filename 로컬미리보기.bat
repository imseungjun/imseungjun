@echo off
chcp 65001 >nul
cd /d "%~dp0"
title 배우 임승준 페이지 - 로컬 서버
echo.
echo  [배우 임승준 페이지] http://127.0.0.1:8010/
echo  브라우저가 열립니다. 종료하려면 이 창에서 Ctrl+C 를 누르세요.
echo.
start "" "http://127.0.0.1:8010/"
python -m http.server 8010
if errorlevel 1 (
  echo.
  echo Python을 찾을 수 없습니다. https://www.python.org/ 에서 설치하거나,
  echo index.html 을 브라우저로 직접 여세요. (YouTube 배경은 제한될 수 있음)
  echo.
  pause
)
