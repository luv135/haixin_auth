@echo off
echo �����ʽ: 
echo  THIDMakeExpoLicense.exe /cmd -h hwinfo.dat [-f faceidsdk.lic] [-t maxtime] [-n maxgallery] [-m msglevel(-1,0~3)] 
echo -h hwinfo.dat:     ����Ӳ����Ϣ�ļ�����
echo -f faceidsdk.lic:  ����������Ȩ�ļ�����
echo -t maxtime:        ��Ȩʱ�䣬��ʽ2015.09.07
echo -n maxgallery:     �����ݣ�1~200000
echo -m msglevel:       ������ʾ�򼶱�ѡ��Ĭ��0��ȫ����ʾ��1���ļ�����2����Ȩ����-1������ʾ�� 

REM �����з�ʽ�������ԣ���ʾʹ�÷���
REM .\THIDMakeExpoLicense.exe /cmd

REM �����з�ʽ���������У���ʾMessageBoxʱ��������ͣ
.\THIDMakeExpoLicense.exe /cmd -h hwinfo.dat -f faceidsdk.lic -t 2037.1.1 -n 2000 -m -1

REM �����з�ʽ����������ʾ�ļ�У�鼰���ϼ������
REM .\THIDMakeExpoLicense.exe /cmd -h hwinfo_0.dat -f faceidsdk.lic  -m 1

REM �����з�ʽ����������ʾ��Ȩ����
REM .\THIDMakeExpoLicense.exe /cmd -h hwinfo_0.dat -f faceidsdk.lic  -m 2




pause