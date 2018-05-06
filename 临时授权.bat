@echo off
:Loop

@echo 推送到设备端
set lic_file=tmp-faceidsdk.lic
adb remount
adb push %lic_file% /system/faceidsdk.lic
adb push %lic_file% /sdcard/FACE_HAIXIN_SDKDATA/faceidsdk.lic

@echo 请查看设备是否已经退出授权文件丢失界面,进入主界面
@echo 插入下一台设备继续..
pause > nul
goto Loop