::@echo off
::create directory
mkdir SD\Pack-fast
mkdir SD\Pack-fancy

::modules
mkdir SD\CTM
mkdir SD\emit-fast
mkdir SD\emit-fancy
mkdir SD\distance-fast
mkdir SD\distance-fancy

::copy files to SD/Pack-fast
::from package
robocopy /E package\fast SD\Pack-fast

::from modules
robocopy /E emit\fast\assets SD\Pack-fast\assets
robocopy /E distance\fast\assets SD\Pack-fast\assets

::copy files to SD/Pack-fancy
::from package
robocopy /E package\fancy SD\Pack-fancy

::from modules
robocopy /E ctm\assets SD\CTM\assets
robocopy /E distance\fancy\assets SD\Pack-fancy\assets
robocopy /E emit\fancy\assets SD\Pack-fancy\assets

::copy files to SD/CTM
robocopy /E ctm SD\CTM

::copy files to SD/distance-fast
robocopy /E distance\fast SD\distance-fast
::copy files to SD/distance-fancy
robocopy /E distance\fancy SD\distance-fancy

::copy files to SD/emit-fancy
robocopy /E emit\fast SD\emit-fast
::copy files to SD/emit-fast
robocopy /E emit\fancy SD\emit-fancy

mkdir zip
cd SD

cd CTM
tar.exe -cf CTM.zip assets pack.png pack.mcmeta
robocopy . .. CTM.zip
cd ..
robocopy . .. CTM.zip /MOVE

cd distance-fancy
tar.exe -cf distance-fancy.zip assets pack.png pack.mcmeta
robocopy . .. distance-fancy.zip
cd ..
robocopy . .. distance-fancy.zip /MOVE

cd distance-fast
tar.exe -cf distance-fast.zip assets pack.png pack.mcmeta
robocopy . .. distance-fast.zip
cd ..
robocopy . .. distance-fast.zip /MOVE

cd emit-fancy
tar.exe -cf emit-fancy.zip assets pack.png pack.mcmeta
robocopy . .. emit-fancy.zip
cd ..
robocopy . .. emit-fancy.zip /MOVE

cd emit-fast
tar.exe -cf emit-fast.zip assets pack.png pack.mcmeta
robocopy . .. emit-fast.zip
cd ..
robocopy . .. emit-fast.zip /MOVE

cd Pack-fancy
tar.exe -cf Pack-fancy.zip assets pack.png pack.mcmeta
robocopy . .. Pack-fancy.zip
cd ..
robocopy . .. Pack-fancy.zip /MOVE

cd Pack-fast
tar.exe -cf Pack-fast.zip assets pack.png pack.mcmeta
robocopy . .. Pack-fast.zip
cd ..
robocopy . .. Pack-fast.zip /MOVE

cd ..
robocopy . ZIP CTM.zip /MOVE
robocopy . ZIP distance-fancy.zip /MOVE
robocopy . ZIP distance-fast.zip /MOVE
robocopy . ZIP emit-fancy.zip /MOVE
robocopy . ZIP emit-fast.zip /MOVE
robocopy . ZIP Pack-fancy.zip /MOVE
robocopy . ZIP Pack-fast.zip /MOVE
rmdir /s /q SD