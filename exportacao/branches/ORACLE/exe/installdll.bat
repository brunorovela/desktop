@ECHO OFF

IF EXIST %windir%\SysWOW64 GOTO WIN64

:WIN32
IF NOT EXIST %windir%\System32\capicom.dll copy capicom.dll %windir%\System32
IF NOT EXIST %windir%\System32\msxml5.dll copy msxml5.dll %windir%\System32
IF NOT EXIST %windir%\System32\msxml5r.dll copy msxml5r.dll %windir%\System32
IF NOT EXIST %windir%\System32\msxml4.dll copy msxml4.dll %windir%\System32
IF NOT EXIST %windir%\System32\msxml4r.dll copy msxml4r.dll %windir%\System32

regsvr32 /u /s %windir%\System32\capicom.dll
regsvr32 /u /s %windir%\System32\msxml5.dll
regsvr32 /u /s %windir%\System32\msxml4.dll

regsvr32 /s %windir%\System32\capicom.dll
regsvr32 /s %windir%\System32\msxml5.dll
regsvr32 /s %windir%\System32\msxml4.dll

GOTO END

:WIN64
IF NOT EXIST %windir%\SysWOW64\capicom.dll copy capicom.dll %windir%\SysWOW64
IF NOT EXIST %windir%\SysWOW64\msxml5.dll copy msxml5.dll %windir%\SysWOW64
IF NOT EXIST %windir%\SysWOW64\msxml5r.dll copy msxml5r.dll %windir%\SysWOW64
IF NOT EXIST %windir%\SysWOW64\msxml4.dll copy msxml4.dll %windir%\SysWOW64
IF NOT EXIST %windir%\SysWOW64\msxml4r.dll copy msxml4r.dll %windir%\SysWOW64

regsvr32 /u /s %windir%\SysWOW64\capicom.dll
regsvr32 /u /s %windir%\SysWOW64\msxml5.dll
regsvr32 /u /s %windir%\SysWOW64\msxml4.dll

regsvr32 /s %windir%\SysWOW64\capicom.dll
regsvr32 /s %windir%\SysWOW64\msxml5.dll
regsvr32 /s %windir%\SysWOW64\msxml4.dll

GOTO END

:END
