REM @echo off
set last = "nul"
adb devices | findstr "\<device\>"
:Loop

for /f "delims=" %%i in ('adb shell getprop ro.serialno') do (set serial=%%i)
REM if "%last%"=="%serial%" (goto finish)
set start = %serial:~0,2% 
echo 呵呵呵 %start%
if %start% neq "FK"(
    echo 当前设备序列号未写入
    goto finish ) 

if exist  授权\%serial%-hwinfo.dat (
   REM  echo 当前设备 :%serial% 已经授权
    goto finish)
set last=%serial%
echo 当前设备序列号为:%serial%
del hwinfo.dat 
adb pull /sdcard/FACE_HAIXIN_SDKDATA/hwinfo.dat

@echo 生成授权码
call TestHisign_License.bat   

REM @echo "请生成授权文件,成功后回车..."
REM pause > nul
REM set /p lic_file=输入或将生成文件拖到本窗口继续:


echo 保存数据到授权文件下..
copy hwinfo.dat 授权\%serial%-hwinfo.dat 
del hwinfo.dat 
copy faceidsdk.lic 授权\%serial%-faceidsdk.lic
del faceidsdk.lic

:finish
@echo 推送到设备端
set lic_file=faceidsdk.lic
adb remount
REM adb push %lic_file% /system/faceidsdk.lic
REM adb push %lic_file% /sdcard/FACE_HAIXIN_SDKDATA/faceidsdk.lic
adb push 授权\%serial%-faceidsdk.lic /system/faceidsdk.lic
adb push 授权\%serial%-faceidsdk.lic /sdcard/FACE_HAIXIN_SDKDATA/faceidsdk.lic


echo 请查看设备是否已经退出授权文件丢失界面,进入主界面

@echo 插入下一台设备继续..
pause > nul
goto Loop