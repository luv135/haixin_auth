@echo off
:Loop

@echo ���͵��豸��
set lic_file=tmp-faceidsdk.lic
adb remount
adb push %lic_file% /system/faceidsdk.lic
adb push %lic_file% /sdcard/FACE_HAIXIN_SDKDATA/faceidsdk.lic

@echo ��鿴�豸�Ƿ��Ѿ��˳���Ȩ�ļ���ʧ����,����������
@echo ������һ̨�豸����..
pause > nul
goto Loop