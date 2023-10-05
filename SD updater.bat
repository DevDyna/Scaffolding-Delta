@echo off
type pack_old.mcmeta
goto RUN

:ERROR_VERS
echo pack version is not a number valid
goto RUN

:RUN
set /p version="Versione pack >"
TIMEOUT /NOBREAK /T 1 > nul
echo(%version%|findstr "^[-][1-9][0-9]*$ ^[1-9][0-9]*$ ^0$">nul&&goto EXECUTE||goto ERROR_VERS


:EXECUTE

::debug file
set desc=DEBUG FILE VERSION
echo { > pack_old.mcmeta &echo "pack": { >> pack_old.mcmeta &echo  "pack_format":%version%,>> pack_old.mcmeta &echo  "description": "%desc%" >> pack_old.mcmeta &echo } >> pack_old.mcmeta &echo } >> pack_old.mcmeta



::fancy package
set desc=Scaffolding Delta Package
cd package/fancy
echo { > pack.mcmeta &echo "pack": { >> pack.mcmeta &echo  "pack_format":%version%,>> pack.mcmeta &echo  "description": "%desc%" >> pack.mcmeta &echo } >> pack.mcmeta &echo } >> pack.mcmeta

cd ..
echo ^> package-fancy
TIMEOUT /NOBREAK /T 0 > nul

::fast package
cd fast
echo { > pack.mcmeta &echo "pack": { >> pack.mcmeta &echo  "pack_format":%version%,>> pack.mcmeta &echo  "description": "%desc%" >> pack.mcmeta &echo } >> pack.mcmeta &echo } >> pack.mcmeta

cd ..
echo ^> package-fast
TIMEOUT /NOBREAK /T 0 > nul


::CTM module
cd ..
cd CTM
set desc=Scaffolding Delta Module
echo { > pack.mcmeta &echo "pack": { >> pack.mcmeta &echo  "pack_format":%version%,>> pack.mcmeta &echo  "description": "%desc%" >> pack.mcmeta &echo } >> pack.mcmeta &echo } >> pack.mcmeta

cd ..
echo ^> ctm-module
TIMEOUT /NOBREAK /T 0 > nul


::distance fancy
cd distance/fancy
echo { > pack.mcmeta &echo "pack": { >> pack.mcmeta &echo  "pack_format":%version%,>> pack.mcmeta &echo  "description": "%desc%" >> pack.mcmeta &echo } >> pack.mcmeta &echo } >> pack.mcmeta

cd ..
echo ^> distance-fancy-module
TIMEOUT /NOBREAK /T 0 > nul

::distance fast
cd fast
echo { > pack.mcmeta &echo "pack": { >> pack.mcmeta &echo  "pack_format":%version%,>> pack.mcmeta &echo  "description": "%desc%" >> pack.mcmeta &echo } >> pack.mcmeta &echo } >> pack.mcmeta

cd ..
echo ^> distance-fast-module
TIMEOUT /NOBREAK /T 0 > nul


::emit fancy
cd ..
set desc=%desc%\n\u00A74Require DistanceModule
cd emit/fancy
echo { > pack.mcmeta &echo "pack": { >> pack.mcmeta &echo  "pack_format":%version%,>> pack.mcmeta &echo  "description": "%desc%" >> pack.mcmeta &echo } >> pack.mcmeta &echo } >> pack.mcmeta

cd ..
echo ^> emit-fancy-module
TIMEOUT /NOBREAK /T 0 > nul

::emit fast
cd fast
echo { > pack.mcmeta &echo "pack": { >> pack.mcmeta &echo  "pack_format":%version%,>> pack.mcmeta &echo  "description": "%desc%" >> pack.mcmeta &echo } >> pack.mcmeta &echo } >> pack.mcmeta

echo ^> emit-fast-module
TIMEOUT /NOBREAK /T 0 > nul


echo:
echo Updated all files to %version%
TIMEOUT /NOBREAK /T 1 > nul