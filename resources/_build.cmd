@echo off

pushd "..\"

set "NAME=debloat_deknox_by_eladkarako"
set "VERSION=2021.01.20.1758"
set "FILENAME=%NAME%_v%VERSION%"

del /f /q "%FILENAME%_aligned.zip"          1>nul 2>nul
del /f /q "%FILENAME%.zip.old"              1>nul 2>nul
ren "%FILENAME%.zip" "%FILENAME%.zip.old"   1>nul 2>nul

call "resources\7z.exe" a -tzip -x!"%NAME%*.zip" -x!"%NAME%*.zip.old" -x!"%FILENAME%.old" -x!".git" -x!".github" -x!"resources" -x!".gitattributes" -x!"LICENSE" -x!"README.md" -y -mmt4 -mx9 -ssw "%FILENAME%.zip" *
echo.
call "resources\zipalign.exe" -f -v 4 "%FILENAME%.zip" "%FILENAME%_aligned.zip"

del /f /q "%FILENAME%.zip"                      1>nul 2>nul
ren "%FILENAME%_aligned.zip" "%FILENAME%.zip"   1>nul 2>nul

pause