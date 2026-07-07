@echo off
:: Set title and colors
title Git Auto Update Tool
color 0B

echo ===================================================
echo               GIT REPOSITORY UPDATE TOOL
echo ===================================================
echo.

:: Check if Git is installed
where git >nul 2>nul
if %errorlevel% neq 0 (
    color 0C
    echo ERROR: Git is not installed or not in your PATH.
    echo Please install Git and try again.
    pause
    exit /b
)

:: Prompt for commit message
set "commit_msg="
set /p commit_msg="Enter your commit message (or press ENTER for default: 'Update codebase'): "

:: If empty, set default
if "%commit_msg%"=="" set commit_msg=Update codebase

echo.
echo [1/3] Staging all changes...
git add -A

echo.
echo [2/3] Committing changes with message: "%commit_msg%"
git commit -m "%commit_msg%"

echo.
echo [3/3] Pushing changes to GitHub (main branch)...
git branch -M main
git push origin main

echo.
echo ===================================================
echo              GIT UPDATE PROCESS COMPLETED!
echo ===================================================
echo.
pause
