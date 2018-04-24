@echo off
adb devices | findstr "\<device\>"
:Loop

for /f "delims=" %%i in ('adb shell getprop ro.serialno') do (set serial=%%i)
REM if "%last%"=="%serial%" (goto finish)

echo 当前设备序列号为:%serial%

@echo 推送到设备端
set lic_file=faceidsdk.lic
adb remount
adb push 授权\%serial%-faceidsdk.lic /system/faceidsdk.lic
adb push 授权\%serial%-faceidsdk.lic /sdcard/FACE_HAIXIN_SDKDATA/faceidsdk.lic

echo 请查看设备是否已经退出授权文件丢失界面,进入主界面
:finish
@echo 插入下一台设备继续..
pause > nul
goto Loop