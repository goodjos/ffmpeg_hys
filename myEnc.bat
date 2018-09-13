@ECHO OFF&PUSHD %~DP0 &TITLE FFMPEG����ѡ��
mode con cols=150 lines=40
color 2F
>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)
:Menu
Cls
@ echo.
@ echo.��������HysProject �� �� �� �� ѡ ��
@ echo.
@ echo.     H264����(es): 1080p    ��     ������1
@ echo.                   720p     ��     ������2
@ echo.
@ echo.     H265����(ts): 2160p    ��     ������3
@ echo.                   1080p    ��     ������4
@ echo.                   720p     ��     ������5
@ echo.
@ echo.     H265����(es): 2160p    ��     ������6
@ echo.                   1080p    ��     ������7
@ echo.                   720p     ��     ������8
@ echo.
@ echo.     �˳�                   ��     ������9
@ echo.
set /p xj= �������ְ��س���
if /i "%xj%"=="1" Goto H264enc1080p
if /i "%xj%"=="2" Goto H264enc720p
if /i "%xj%"=="3" Goto H265enc2160p
if /i "%xj%"=="4" Goto H265enc1080p
if /i "%xj%"=="5" Goto H265enc720p
if /i "%xj%"=="6" Goto H265enc2160p2es
if /i "%xj%"=="7" Goto H265enc1080p2es
if /i "%xj%"=="8" Goto H265enc720p2es
if /i "%xj%"=="9" Goto myExit
@ echo.
echo      ѡ����Ч������������
ping -n 2 127.1>nul 
goto menu
:H264enc1080p
@ echo.
ECHO ������H264������..���Ե�..
taskkill /f /im ffmpeg*>NUL 2>NUL
ffmpeg.exe -pix_fmt yuv420p -s 1920x1080 -i bg1080p.yuv -r 25 -bf 0 -vcodec libx264 bg1080p.h264
goto h264finished
:H264enc720p
@ echo.
ECHO ������H264������..���Ե�..
taskkill /f /im ffmpeg*>NUL 2>NUL
ffmpeg.exe -pix_fmt yuv420p -s 1280x720 -i bg720p.yuv -r 25 -bf 0 -vcodec libx264 bg720p.h264
goto h264finished
:H265enc2160p
@echo.
ECHO ������H265������..���Ե�..
taskkill /f /im ffmpeg*>NUL 2>NUL
ffmpeg.exe -pix_fmt yuv420p -s 3840x2160 -i bg2160p.yuv -r 25 -bf 0 -vcodec libx265 -x265-params "keyint=25:bframes=0" -f mpegts h265_2160p.ts
goto h265finished
:H265enc1080p
@echo.
ECHO ������H265������..���Ե�..
taskkill /f /im ffmpeg*>NUL 2>NUL
ffmpeg.exe -pix_fmt yuv420p -s 1920x1080 -i bg1080p.yuv -r 25 -bf 0 -vcodec libx265 -x265-params "keyint=25:bframes=0" -f mpegts h265_1080p.ts
goto h265finished
:H265enc720p
@echo.
ECHO ������H265������..���Ե�..
taskkill /f /im ffmpeg*>NUL 2>NUL
ffmpeg.exe -pix_fmt yuv420p -s 1280x720 -i bg720p.yuv -r 25 -bf 0 -vcodec libx265 -x265-params "keyint=25:bframes=0" -f mpegts h265_720p.ts
goto h265finished
:H265enc2160p2es
@echo.
ECHO ������H265������..���Ե�..
taskkill /f /im ffmpeg*>NUL 2>NUL
ffmpeg.exe -pix_fmt yuv420p -s 3840x2160 -i bg2160p.yuv -r 25 -bf 0 -vcodec libx265 -x265-params "keyint=25:bframes=0" h265_2160p.h265
goto h265finished
:H265enc1080p2es
@echo.
ECHO ������H265������..���Ե�..
taskkill /f /im ffmpeg*>NUL 2>NUL
ffmpeg.exe -pix_fmt yuv420p -s 1920x1080 -i bg1080p.yuv -r 25 -bf 0 -vcodec libx265 -x265-params "keyint=25:bframes=0" h265_1080p.h265
goto h265finished
:H265enc720p2es
@echo.
ECHO ������H265������..���Ե�..
taskkill /f /im ffmpeg*>NUL 2>NUL
ffmpeg.exe -pix_fmt yuv420p -s 1280x720 -i bg720p.yuv -r 25 -bf 0 -vcodec libx265 -x265-params "keyint=25:bframes=0" h265_720p.h265
goto h265finished
:myExit
@ echo.
echo �����������˳�..���Ե�..
taskkill /f /im et*>NUL 2>NUL
goto Exit2
:h264finished
@ ECHO.
ECHO ������h264������ɣ�
ping -n 3 127.8>nul
goto menu
:h265finished
@ ECHO.
ECHO ������h265������ɣ�
ping -n 3 127.8>nul
goto menu
:Exit2
@ ECHO.
ECHO �������˳���ɣ�
ping -n 2 127.8>nul
goto menu
