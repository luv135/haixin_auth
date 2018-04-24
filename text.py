# coding=utf8
import re
import subprocess
from pathlib import Path

import os

import shutil

import time

import sys


def check_device_sn():
    '''''检查设备是否连接成功，如果成功返回True，否则返回False'''
    try:
        '''''获取设备列表信息，并用"\r\n"拆分'''
        deviceInfo = subprocess.check_output('adb devices').decode().split("\r\n")[1].split("\t")[0]
        '''''如果没有链接设备或者设备读取失败，第二个元素为空'''
        if deviceInfo == '':
            print("\r设备未连接!!",end='')
            return False
        else:
            # if not deviceInfo.startswith("FK"):
            if not deviceInfo.startswith("20"):
                print("\r当前设备(%s)未写号" % deviceInfo,end='')
                return False
            else:

                return True
    except Exception as e:
        print("获取设备信息失败!", e)
        return False


def get_device_serial():
    try:
        serial_no = subprocess.check_output('adb shell getprop ro.serialno').decode().replace("\r\r\n", "")
        return serial_no
    except Exception as e:
        print("获取设备信息失败!", e)
        return None




if __name__ == '__main__':
    last_serial = ""
    if not Path("授权").is_dir():
        Path("授权").mkdir()
    while True:
        try:
            if check_device_sn():
                serial = get_device_serial()
                if last_serial != serial:
                    # print("当前设备: %s" % serial)
                    file = Path("授权\\%s-faceidsdk.lic" % serial)
                    if not file.is_file():
                        if Path("hwinfo.dat").is_file():
                            os.remove("hwinfo.dat")
                        os.system("adb pull /sdcard/FACE_HAIXIN_SDKDATA/hwinfo.dat")
                        # os.system("call TestHisign_License.bat")
                        os.system("THIDMakeExpoLicense.exe /cmd -h hwinfo.dat -f faceidsdk.lic -t 2037.1.1 -n 2000 -m -1")
                        # os.system("THIDMakeExpoLicense.exe /cmd -h hwinfo.dat -f faceidsdk.lic -t 2037.1.1 -n 2000")
                        shutil.copyfile("hwinfo.dat", "授权\\%s-hwinfo.dat" % serial)
                        shutil.copyfile("faceidsdk.lic", "授权\\%s-faceidsdk.lic" % serial)
                    os.system("adb remount")
                    if subprocess.check_output(
                            "adb push 授权\\%s-faceidsdk.lic /system/faceidsdk.lic" % serial).decode().startswith(
                        "[100%]") and subprocess.check_output(
                        "adb push 授权\\%s-faceidsdk.lic /sdcard/FACE_HAIXIN_SDKDATA/faceidsdk.lic" % serial).decode() \
                            .startswith("[100%]"):
                        last_serial = serial
                        print("-------------------------------------------")
                        print("请查看设备是否已经退出授权文件丢失界面,进入主界面")
                        print("-------------------------------------------")
                    else:
                        print("-------------------------------------------")
                        print("------------失败!------------------------")
                        print("-------------------------------------------")
                else:
                    print("\r请插入新的设备",end='')
                    time.sleep(1)
            else:
                time.sleep(1)
        except Exception as e:
            print("出现异常", e)
            time.sleep(1)
