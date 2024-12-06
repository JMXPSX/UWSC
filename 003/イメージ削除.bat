@echo off
echo Deleting all BMP files in specified directories...
setlocal

:: List of directories (change these paths as needed)
set "dir1=C:\Users\admin\Desktop\UWSCリグレッション・テスト\003"

:: Create an array of directories
set dirs=%dir1% 

:: Loop through each directory and delete BMP files
for %%D in (%dirs%) do (
    if exist "%%D" (
        echo Deleting BMP files in %%D...
        cd /d "%%D"
        del /q *.bmp
        echo Deleted BMP files in %%D.
    ) else (
        echo Directory %%D does not exist, skipping...
    )
)

echo Done deleting BMP files.
endlocal



