@Echo Off
SetLocal EnableExtensions DisableDelayedExpansion

GoTo Boot

:Logo
ClS
Echo(
Echo                                        :!!.         Date: %date%
Echo                                      :!7^^.         Time: %time%
Echo                         ..         :!7^^
Echo                        Y??Y   :?YJJ?:
Echo                        J77? ^^JGGPPG!
Echo                           ^^YGBGGG5!
Echo                         ~YGGGGGY~
Echo                      .!5GGGBGJ^^
Echo                      ?BBGBGJ^^
Echo                      .~Y5?:
Echo ---------------------------------------------------------------------------
GoTo :EOF

:Boot
Call :Logo
Echo Welcome %UserName%.
Set "inPass="
Set /P "inPass=Password>" || GoTo Boot
Set inPass | %SystemRoot%\System32\findstr.exe /XLIC:"inpass=12345678" 1>NUL
If ErrorLevel 1 GoTo Boot

:Menu
Call :Logo
Echo Main menu
Echo 1. Notepad
Echo 2. Watch Star Wars
Echo 3. Calculator
Echo 4. System info
Echo 5. OS info
Echo 6. Reboot
Echo 7. Shutdown
Echo(
%SystemRoot%\System32\choice.exe /C 12345678
If ErrorLevel 7 exit
If ErrorLevel 6 GoTo Boot
If ErrorLevel 5 GoTo Info
If ErrorLevel 4 (
    Cls
    Call :Logo
    %SystemRoot%\System32\systeminfo.exe /Fo List
    Pause
    GoTo Menu
)
If ErrorLevel 3 (
    Start %SystemRoot%\System32\calc.exe
    GoTo Menu
)
If ErrorLevel 2 GoTo Movies
If ErrorLevel 1 (
    Start %SystemRoot%\System32\notepad.exe
    GoTo Menu
)
GoTo Menu

:Movies
Cls
Call :Logo
Echo(
Echo(Get the popcorn, it is movie time.
%SystemRoot%\System32\timeout.exe /T 3 /NoBreak 1>NUL
start "" telnet towel.blinkenlights.nl"
GoTo Menu

:Info
Cls
Call :Logo
Echo( SimpleBatch version 0.3.0
Echo( Codename Baseball
Echo( Build 3
Echo( Release Notes:
Echo( Version 0.1.0 and 0.2.0 are not released because of unexpected errors
Echo( so version 0.3.0 will release first, version 0.1 and 0.2 will release soon
Echo( will literally ZERO ERRORS
Pause
GoTo Menu