@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ========================================
echo  배우 임승준 페이지 - GitHub 올리기
echo ========================================
echo.
echo [1] 브라우저에서 새 저장소 만들기
echo     - 이름: imseungjun (저장소 이름)
echo     - Public
echo     - README, .gitignore, license 는 추가하지 마세요 (비어 있어야 합니다)
echo.
start "" "https://github.com/new?name=imseungjun&visibility=public"

echo.
echo [2] 저장소를 만든 뒤 (초록색 Create repository 누른 뒤) 이 창에서 아무 키나 누르세요.
echo     GitHub 로그인이 필요하면 브라우저에서 진행하세요.
echo.
pause

git remote remove origin 2>nul
git remote add origin "https://github.com/imseungjun/imseungjun.git"
git branch -M main
git push -u origin main

if errorlevel 1 (
  echo.
  echo --- 실패했을 때 확인 ---
  echo 1) GitHub 에 imseungjun 저장소가 이미 만들어졌는지
  echo 2) git 이 설치되어 있는지 (git --version)
  echo 3) 로그인: git config --global user.name / user.email
  echo.
  pause
  exit /b 1
)

echo.
echo ========================================
echo  완료. 저장소: https://github.com/imseungjun/imseungjun
echo  Pages: Settings - Pages - Source: GitHub Actions 선택 후
echo  주소: https://imseungjun.github.io/imseungjun/
echo ========================================
echo.
pause
