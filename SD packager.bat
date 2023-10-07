@echo off
echo #creating directories
TIMEOUT /NOBREAK /T 1 > nul
echo ^> ZIP\temp
::create directory
mkdir ZIP\temp\Pack-fast
echo ^> ZIP\temp\Pack-fast

mkdir ZIP\temp\Pack-fancy
echo ^> ZIP\temp\Pack-fancy

::modules
mkdir ZIP\temp\CTM
echo ^> ZIP\temp\CTM
TIMEOUT /NOBREAK /T 0 > nul
mkdir ZIP\temp\emit-fast
echo ^> ZIP\temp\emit-fast
TIMEOUT /NOBREAK /T 0 > nul
mkdir ZIP\temp\emit-fancy
echo ^> ZIP\temp\emit-fancy
TIMEOUT /NOBREAK /T 0 > nul
mkdir ZIP\temp\distance-fast
echo ^> ZIP\temp\distance-fast
TIMEOUT /NOBREAK /T 0 > nul
mkdir ZIP\temp\distance-fancy
echo ^> ZIP\temp\distance-fancy
TIMEOUT /NOBREAK /T 0 > nul

echo #robocopy pack.mcmeta on all modules
TIMEOUT /NOBREAK /T 1 > nul
::copy pack.mcmeta on directories
robocopy . ctm /is pack.mcmeta > nul
echo ^> ctm
TIMEOUT /NOBREAK /T 0 > nul
robocopy . distance\fancy /is pack.mcmeta > nul
echo ^> distance-fancy
TIMEOUT /NOBREAK /T 0 > nul
robocopy . distance\fast /is pack.mcmeta > nul
echo ^> distance-fast

TIMEOUT /NOBREAK /T 0 > nul
robocopy . emit\fancy /is pack.mcmeta > nul
echo ^> emit-fancy
TIMEOUT /NOBREAK /T 0 > nul
robocopy . emit\fast /is pack.mcmeta > nul
echo ^> emit-fast

TIMEOUT /NOBREAK /T 0 > nul
robocopy . package\fancy /is pack.mcmeta > nul
echo ^> package-fancy
TIMEOUT /NOBREAK /T 0 > nul
robocopy . package\fast /is pack.mcmeta > nul
echo ^> package-fast

TIMEOUT /NOBREAK /T 0 > nul

echo #robocopy files on directories
TIMEOUT /NOBREAK /T 1 > nul
::copy files to ZIP/Pack-fast
::from package
robocopy /E package\fast ZIP\temp\Pack-fast > nul
::from modules
robocopy /E emit\fast\assets ZIP\temp\Pack-fast\assets > nul
robocopy /E distance\fast\assets ZIP\temp\Pack-fast\assets > nul
echo ^> Pack-fast

::copy files to ZIP/Pack-fancy
::from package
robocopy /E package\fancy ZIP\temp\Pack-fancy > nul
::from modules
robocopy /E ctm\assets ZIP\temp\CTM\assets > nul
robocopy /E distance\fancy\assets ZIP\temp\Pack-fancy\assets > nul
robocopy /E emit\fancy\assets ZIP\temp\Pack-fancy\assets > nul
echo ^> Pack-fancy

::copy files to ZIP/CTM
robocopy /E ctm ZIP\temp\CTM > nul
echo ^> CTM-module

::copy files to ZIP/distance-fast
robocopy /E distance\fast ZIP\temp\distance-fast > nul
echo ^> distance-fast-module

::copy files to ZIP/distance-fancy
robocopy /E distance\fancy ZIP\temp\distance-fancy > nul
echo ^> distance-fancy-module

::copy files to ZIP/emit-fancy
robocopy /E emit\fast ZIP\temp\emit-fast > nul
echo ^> emit-fast-module

::copy files to ZIP/emit-fast
robocopy /E emit\fancy ZIP\temp\emit-fancy > nul
echo ^> emit-fancy-module

TIMEOUT /NOBREAK /T 1 > nul
echo #compressing resource to .zip files and move out TEMP folder
cd ZIP/temp
::####compression on zip####

::CTM zip and move out
cd CTM
tar.exe -a -cf CTM.zip assets pack.png pack.mcmeta
robocopy . .. CTM.zip /MOVE > nul
cd ..
robocopy . .. CTM.zip /MOVE > nul

echo ^> CTM-module

:: distance-fancy zip and move out
cd distance-fancy
tar.exe -a -cf distance-fancy.zip assets pack.png pack.mcmeta
robocopy . .. distance-fancy.zip /MOVE > nul
cd ..
robocopy . .. distance-fancy.zip /MOVE > nul

echo ^> distance-fancy-module

:: distance-fast zip and move out
cd distance-fast
tar.exe -a -cf distance-fast.zip assets pack.png pack.mcmeta
robocopy . .. distance-fast.zip /MOVE > nul
cd ..
robocopy . .. distance-fast.zip /MOVE > nul

echo ^> distance-fast-module

:: emit-fancy zip and move out
cd emit-fancy
tar.exe -a -cf emit-fancy.zip assets pack.png pack.mcmeta
robocopy . .. emit-fancy.zip /MOVE > nul
cd ..
robocopy . .. emit-fancy.zip /MOVE > nul

echo ^> emit-fancy-module

:: emit-fast zip and move out
cd emit-fast
tar.exe -a -cf emit-fast.zip assets pack.png pack.mcmeta
robocopy . .. emit-fast.zip /MOVE > nul
cd ..
robocopy . .. emit-fast.zip /MOVE > nul

echo ^> emit-fast-module

:: Pack-fancy zip and move out
cd Pack-fancy
tar.exe -a -cf Pack-fancy.zip assets pack.png pack.mcmeta
robocopy . .. Pack-fancy.zip /MOVE > nul
cd ..
robocopy . .. Pack-fancy.zip /MOVE > nul

echo ^> Pack-fancy

:: Pack-fast zip and move out
cd Pack-fast
tar.exe -a -cf Pack-fast.zip assets pack.png pack.mcmeta
robocopy . .. Pack-fast.zip /MOVE > nul
cd ..
robocopy . .. Pack-fast.zip /MOVE > nul

echo ^> Pack-fast
echo #removing zip/temp directory
TIMEOUT /NOBREAK /T 1 > nul
::rem temp packs
cd ..
rmdir /s /q temp

echo:
echo Packaged all files on zip/
TIMEOUT /NOBREAK /T 1 > nul