@echo off
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
