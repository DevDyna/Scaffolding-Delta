@echo off
type pack.mcmeta
goto RUN

:ERROR_VERS
echo pack version is not a number valid
goto RUN

:RUN
set /p version="Versione pack >"
echo(%version%|findstr "^[-][1-9][0-9]*$ ^[1-9][0-9]*$ ^0$">nul&&goto EXECUTE||goto ERROR_VERS


:EXECUTE

::fancy package
set desc=Scaffolding Delta Package
cd package/fancy
echo {"pack": {"pack_format":%version%,"description": "%desc%"}} > pack.mcmeta
cd ..
::fast package
cd fast
echo {"pack": {"pack_format":%version%,"description": "%desc%"}} > pack.mcmeta
cd ..

::CTM module
cd ..
cd CTM
set desc=Scaffolding Delta Module
echo {"pack": {"pack_format":%version%,"description": "%desc%"}} > pack.mcmeta
cd ..

::distance fancy
cd distance/fancy
echo {"pack": {"pack_format":%version%,"description": "%desc%"}} > pack.mcmeta
cd ..
::distance fast
cd fast
echo {"pack": {"pack_format":%version%,"description": "%desc%"}} > pack.mcmeta
cd ..

::emit fancy
cd ..
cd emit/fancy
echo {"pack": {"pack_format":%version%,"description": "%desc%"}} > pack.mcmeta
cd ..
::emit fast
cd fast
echo {"pack": {"pack_format":%version%,"description": "%desc%"}} > pack.mcmeta