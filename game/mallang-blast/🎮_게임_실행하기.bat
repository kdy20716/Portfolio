@echo off
chcp 65001 > nul
title 말랑블라스트 WebGL 로컬 서버
echo ========================================================
echo   말랑블라스트 WebGL 로컬 서버를 실행합니다...
echo   기본 브라우저에서 게임이 자동으로 열립니다.
echo ========================================================
start "" "http://localhost:8080"
node "%~dp0server.js"
pause
