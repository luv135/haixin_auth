@echo off
echo 命令格式: 
echo  THIDMakeExpoLicense.exe /cmd -h hwinfo.dat [-f faceidsdk.lic] [-t maxtime] [-n maxgallery] [-m msglevel(-1,0~3)] 
echo -h hwinfo.dat:     输入硬件信息文件名称
echo -f faceidsdk.lic:  生成人脸授权文件名称
echo -t maxtime:        授权时间，格式2015.09.07
echo -n maxgallery:     最大库容，1~200000
echo -m msglevel:       错误提示框级别选择（默认0：全部提示框，1：文件错误；2：授权错误，-1：无提示框） 

REM 命令行方式，仅测试，提示使用方法
REM .\THIDMakeExpoLicense.exe /cmd

REM 命令行方式，正常运行，提示MessageBox时，程序暂停
.\THIDMakeExpoLicense.exe /cmd -h hwinfo.dat -f faceidsdk.lic -t 2037.1.1 -n 2000 -m -1

REM 命令行方式，仅允许提示文件校验及以上级别错误
REM .\THIDMakeExpoLicense.exe /cmd -h hwinfo_0.dat -f faceidsdk.lic  -m 1

REM 命令行方式，仅允许提示授权错误
REM .\THIDMakeExpoLicense.exe /cmd -h hwinfo_0.dat -f faceidsdk.lic  -m 2




pause