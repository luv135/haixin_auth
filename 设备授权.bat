REM @echo off
set last = "nul"
adb devices | findstr "\<device\>"
:Loop

for /f "delims=" %%i in ('adb shell getprop ro.serialno') do (set serial=%%i)
REM if "%last%"=="%serial%" (goto finish)
set start = %serial:~0,2% 
echo �ǺǺ� %start%
if %start% neq "FK"(
    echo ��ǰ�豸���к�δд��
    goto finish ) 

if exist  ��Ȩ\%serial%-hwinfo.dat (
   REM  echo ��ǰ�豸 :%serial% �Ѿ���Ȩ
    goto finish)
set last=%serial%
echo ��ǰ�豸���к�Ϊ:%serial%
del hwinfo.dat 
adb pull /sdcard/FACE_HAIXIN_SDKDATA/hwinfo.dat

@echo ������Ȩ��
call TestHisign_License.bat   

REM @echo "��������Ȩ�ļ�,�ɹ���س�..."
REM pause > nul
REM set /p lic_file=����������ļ��ϵ������ڼ���:


echo �������ݵ���Ȩ�ļ���..
copy hwinfo.dat ��Ȩ\%serial%-hwinfo.dat 
del hwinfo.dat 
copy faceidsdk.lic ��Ȩ\%serial%-faceidsdk.lic
del faceidsdk.lic

:finish
@echo ���͵��豸��
set lic_file=faceidsdk.lic
adb remount
REM adb push %lic_file% /system/faceidsdk.lic
REM adb push %lic_file% /sdcard/FACE_HAIXIN_SDKDATA/faceidsdk.lic
adb push ��Ȩ\%serial%-faceidsdk.lic /system/faceidsdk.lic
adb push ��Ȩ\%serial%-faceidsdk.lic /sdcard/FACE_HAIXIN_SDKDATA/faceidsdk.lic


echo ��鿴�豸�Ƿ��Ѿ��˳���Ȩ�ļ���ʧ����,����������

@echo ������һ̨�豸����..
pause > nul
goto Loop