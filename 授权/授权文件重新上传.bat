@echo off
adb devices | findstr "\<device\>"
:Loop

for /f "delims=" %%i in ('adb shell getprop ro.serialno') do (set serial=%%i)
REM if "%last%"=="%serial%" (goto finish)

echo ��ǰ�豸���к�Ϊ:%serial%

@echo ���͵��豸��
set lic_file=faceidsdk.lic
adb remount
adb push ��Ȩ\%serial%-faceidsdk.lic /system/faceidsdk.lic
adb push ��Ȩ\%serial%-faceidsdk.lic /sdcard/FACE_HAIXIN_SDKDATA/faceidsdk.lic

echo ��鿴�豸�Ƿ��Ѿ��˳���Ȩ�ļ���ʧ����,����������
:finish
@echo ������һ̨�豸����..
pause > nul
goto Loop