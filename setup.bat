@echo off
REM set current directory
set DIR=%~dp0
cd /d %DIR%

REM install libs
"python.exe" -m venv venv
call .\venv\Scripts\activate.bat
pip install numpy pandas matplotlib torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu126

REM add .gitignore file
echo. > .gitignore
echo data/ >> .gitignore
echo venv/ >> .gitignore

REM download dataset
curl -L "https://download.pytorch.org/tutorial/hymenoptera_data.zip"
mkdir data
set "zipPath=hymenoptera_data.zip"
set "destFolder=data\hymenoptera_data\"
powershell -Command "Expand-Archive -Path '%zipPath%' -DestinationPath '%destFolder%' -Force"


pause