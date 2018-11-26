# Microsoft Developer Studio Generated NMAKE File, Based on apr_crypto_openssl.dsp
!IF "$(CFG)" == ""
CFG=apr_crypto_openssl - Win32 Release
!MESSAGE No configuration specified. Defaulting to apr_crypto_openssl - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "apr_crypto_openssl - Win32 Release" && "$(CFG)" != "apr_crypto_openssl - Win32 Debug" && "$(CFG)" != "apr_crypto_openssl - x64 Release" && "$(CFG)" != "apr_crypto_openssl - x64 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "apr_crypto_openssl.mak" CFG="apr_crypto_openssl - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "apr_crypto_openssl - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "apr_crypto_openssl - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "apr_crypto_openssl - x64 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "apr_crypto_openssl - x64 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF "$(_HAVE_OSSL110)" == "1"
SSLCRP=libcrypto
SSLLIB=libssl
SSLINC=/I ../../openssl/include
SSLBIN=/libpath:../../openssl
!ELSE 
SSLCRP=libeay32
SSLLIB=ssleay32
SSLINC=/I ../../openssl/inc32
SSLBIN=/libpath:../../openssl/out32dll
!ENDIF 

!IF  "$(CFG)" == "apr_crypto_openssl - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\apr_crypto_openssl-1.dll" "$(DS_POSTBUILD_DEP)"

!ELSE 

ALL : "libaprutil - Win32 Release" "libapr - Win32 Release" "$(OUTDIR)\apr_crypto_openssl-1.dll" "$(DS_POSTBUILD_DEP)"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"libapr - Win32 ReleaseCLEAN" "libaprutil - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\apr_crypto_openssl-1.res"
	-@erase "$(INTDIR)\apr_crypto_openssl.obj"
	-@erase "$(INTDIR)\apr_crypto_openssl_src.idb"
	-@erase "$(INTDIR)\apr_crypto_openssl_src.pdb"
	-@erase "$(OUTDIR)\apr_crypto_openssl-1.dll"
	-@erase "$(OUTDIR)\apr_crypto_openssl-1.exp"
	-@erase "$(OUTDIR)\apr_crypto_openssl-1.lib"
	-@erase "$(OUTDIR)\apr_crypto_openssl-1.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /Zi /O2 /Oy- /I "../include" /I "../../apr/include" /I "../include/private" $(SSLINC) /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "APU_DSO_MODULE_BUILD" /D APU_HAVE_OPENSSL=1 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\apr_crypto_openssl_src" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o /win32 "NUL" 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\apr_crypto_openssl-1.res" /i "../include" /i "../../apr/include" /d DLL_NAME="apr_crypto_openssl" /d "NDEBUG" /d "APU_VERSION_ONLY" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\apr_crypto_openssl.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib advapi32.lib ws2_32.lib mswsock.lib ole32.lib $(SSLCRP).lib $(SSLLIB).lib /nologo /base:"0x6F100000" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\apr_crypto_openssl-1.pdb" /debug /out:"$(OUTDIR)\apr_crypto_openssl-1.dll" /implib:"$(OUTDIR)\apr_crypto_openssl-1.lib" $(SSLBIN) /opt:ref 
LINK32_OBJS= \
	"$(INTDIR)\apr_crypto_openssl.obj" \
	"$(INTDIR)\apr_crypto_openssl-1.res" \
	"..\..\apr\Release\libapr-1.lib" \
	"..\Release\libaprutil-1.lib"

"$(OUTDIR)\apr_crypto_openssl-1.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

TargetPath=.\Release\apr_crypto_openssl-1.dll
SOURCE="$(InputPath)"
PostBuild_Desc=Embed .manifest
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

"$(DS_POSTBUILD_DEP)" : "$(OUTDIR)\apr_crypto_openssl-1.dll"
   if exist .\Release\apr_crypto_openssl-1.dll.manifest mt.exe -manifest .\Release\apr_crypto_openssl-1.dll.manifest -outputresource:.\Release\apr_crypto_openssl-1.dll;2
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "apr_crypto_openssl - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\apr_crypto_openssl-1.dll" "$(DS_POSTBUILD_DEP)"

!ELSE 

ALL : "libaprutil - Win32 Debug" "libapr - Win32 Debug" "$(OUTDIR)\apr_crypto_openssl-1.dll" "$(DS_POSTBUILD_DEP)"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"libapr - Win32 DebugCLEAN" "libaprutil - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\apr_crypto_openssl-1.res"
	-@erase "$(INTDIR)\apr_crypto_openssl.obj"
	-@erase "$(INTDIR)\apr_crypto_openssl_src.idb"
	-@erase "$(INTDIR)\apr_crypto_openssl_src.pdb"
	-@erase "$(OUTDIR)\apr_crypto_openssl-1.dll"
	-@erase "$(OUTDIR)\apr_crypto_openssl-1.exp"
	-@erase "$(OUTDIR)\apr_crypto_openssl-1.lib"
	-@erase "$(OUTDIR)\apr_crypto_openssl-1.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Zi /Od /I "../include" /I "../../apr/include" /I "../include/private" $(SSLINC) /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "APU_DSO_MODULE_BUILD" /D APU_HAVE_OPENSSL=1 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\apr_crypto_openssl_src" /FD /D /EHsc /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o /win32 "NUL" 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\apr_crypto_openssl-1.res" /i "../include" /i "../../apr/include" /d DLL_NAME="apr_crypto_openssl" /d "_DEBUG" /d "APU_VERSION_ONLY" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\apr_crypto_openssl.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib advapi32.lib ws2_32.lib mswsock.lib ole32.lib $(SSLCRP).lib $(SSLLIB).lib /nologo /base:"0x6F100000" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\apr_crypto_openssl-1.pdb" /debug /out:"$(OUTDIR)\apr_crypto_openssl-1.dll" /implib:"$(OUTDIR)\apr_crypto_openssl-1.lib" $(SSLBIN) 
LINK32_OBJS= \
	"$(INTDIR)\apr_crypto_openssl.obj" \
	"$(INTDIR)\apr_crypto_openssl-1.res" \
	"..\..\apr\Debug\libapr-1.lib" \
	"..\Debug\libaprutil-1.lib"

"$(OUTDIR)\apr_crypto_openssl-1.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

TargetPath=.\Debug\apr_crypto_openssl-1.dll
SOURCE="$(InputPath)"
PostBuild_Desc=Embed .manifest
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

"$(DS_POSTBUILD_DEP)" : "$(OUTDIR)\apr_crypto_openssl-1.dll"
   if exist .\Debug\apr_crypto_openssl-1.dll.manifest mt.exe -manifest .\Debug\apr_crypto_openssl-1.dll.manifest -outputresource:.\Debug\apr_crypto_openssl-1.dll;2
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "apr_crypto_openssl - x64 Release"

OUTDIR=.\x64\Release
INTDIR=.\x64\Release
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep
# Begin Custom Macros
OutDir=.\x64\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\apr_crypto_openssl-1.dll" "$(DS_POSTBUILD_DEP)"

!ELSE 

ALL : "libaprutil - x64 Release" "libapr - x64 Release" "$(OUTDIR)\apr_crypto_openssl-1.dll" "$(DS_POSTBUILD_DEP)"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"libapr - x64 ReleaseCLEAN" "libaprutil - x64 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\apr_crypto_openssl-1.res"
	-@erase "$(INTDIR)\apr_crypto_openssl.obj"
	-@erase "$(INTDIR)\apr_crypto_openssl_src.idb"
	-@erase "$(INTDIR)\apr_crypto_openssl_src.pdb"
	-@erase "$(OUTDIR)\apr_crypto_openssl-1.dll"
	-@erase "$(OUTDIR)\apr_crypto_openssl-1.exp"
	-@erase "$(OUTDIR)\apr_crypto_openssl-1.lib"
	-@erase "$(OUTDIR)\apr_crypto_openssl-1.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /Zi /O2 /Oy- /I "../include" /I "../../apr/include" /I "../include/private" $(SSLINC) /D "NDEBUG" /D "WIN32" /D "WIN64" /D "_WINDOWS" /D "APU_DSO_MODULE_BUILD" /D APU_HAVE_OPENSSL=1 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\apr_crypto_openssl_src" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o /x64 "NUL" 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\apr_crypto_openssl-1.res" /i "../include" /i "../../apr/include" /d DLL_NAME="apr_crypto_openssl" /d "NDEBUG" /d "APU_VERSION_ONLY" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\apr_crypto_openssl.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib advapi32.lib ws2_32.lib mswsock.lib ole32.lib $(SSLCRP).lib $(SSLLIB).lib /nologo /base:"0x6F100000" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\apr_crypto_openssl-1.pdb" /debug /out:"$(OUTDIR)\apr_crypto_openssl-1.dll" /implib:"$(OUTDIR)\apr_crypto_openssl-1.lib" $(SSLBIN) /opt:ref 
LINK32_OBJS= \
	"$(INTDIR)\apr_crypto_openssl.obj" \
	"$(INTDIR)\apr_crypto_openssl-1.res" \
	"..\..\apr\x64\Release\libapr-1.lib" \
	"..\x64\Release\libaprutil-1.lib"

"$(OUTDIR)\apr_crypto_openssl-1.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

TargetPath=.\x64\Release\apr_crypto_openssl-1.dll
SOURCE="$(InputPath)"
PostBuild_Desc=Embed .manifest
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

# Begin Custom Macros
OutDir=.\x64\Release
# End Custom Macros

"$(DS_POSTBUILD_DEP)" : "$(OUTDIR)\apr_crypto_openssl-1.dll"
   if exist .\x64\Release\apr_crypto_openssl-1.dll.manifest mt.exe -manifest .\x64\Release\apr_crypto_openssl-1.dll.manifest -outputresource:.\x64\Release\apr_crypto_openssl-1.dll;2
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "apr_crypto_openssl - x64 Debug"

OUTDIR=.\x64\Debug
INTDIR=.\x64\Debug
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep
# Begin Custom Macros
OutDir=.\x64\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\apr_crypto_openssl-1.dll" "$(DS_POSTBUILD_DEP)"

!ELSE 

ALL : "libaprutil - x64 Debug" "libapr - x64 Debug" "$(OUTDIR)\apr_crypto_openssl-1.dll" "$(DS_POSTBUILD_DEP)"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"libapr - x64 DebugCLEAN" "libaprutil - x64 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\apr_crypto_openssl-1.res"
	-@erase "$(INTDIR)\apr_crypto_openssl.obj"
	-@erase "$(INTDIR)\apr_crypto_openssl_src.idb"
	-@erase "$(INTDIR)\apr_crypto_openssl_src.pdb"
	-@erase "$(OUTDIR)\apr_crypto_openssl-1.dll"
	-@erase "$(OUTDIR)\apr_crypto_openssl-1.exp"
	-@erase "$(OUTDIR)\apr_crypto_openssl-1.lib"
	-@erase "$(OUTDIR)\apr_crypto_openssl-1.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Zi /Od /I "../include" /I "../../apr/include" /I "../include/private" $(SSLINC) /D "_DEBUG" /D "WIN32" /D "WIN64" /D "_WINDOWS" /D "APU_DSO_MODULE_BUILD" /D APU_HAVE_OPENSSL=1 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\apr_crypto_openssl_src" /FD /D /EHsc /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o /x64 "NUL" 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\apr_crypto_openssl-1.res" /i "../include" /i "../../apr/include" /d DLL_NAME="apr_crypto_openssl" /d "_DEBUG" /d "APU_VERSION_ONLY" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\apr_crypto_openssl.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib advapi32.lib ws2_32.lib mswsock.lib ole32.lib $(SSLCRP).lib $(SSLLIB).lib /nologo /base:"0x6F100000" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\apr_crypto_openssl-1.pdb" /debug /out:"$(OUTDIR)\apr_crypto_openssl-1.dll" /implib:"$(OUTDIR)\apr_crypto_openssl-1.lib" $(SSLBIN) 
LINK32_OBJS= \
	"$(INTDIR)\apr_crypto_openssl.obj" \
	"$(INTDIR)\apr_crypto_openssl-1.res" \
	"..\..\apr\x64\Debug\libapr-1.lib" \
	"..\x64\Debug\libaprutil-1.lib"

"$(OUTDIR)\apr_crypto_openssl-1.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

TargetPath=.\x64\Debug\apr_crypto_openssl-1.dll
SOURCE="$(InputPath)"
PostBuild_Desc=Embed .manifest
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

# Begin Custom Macros
OutDir=.\x64\Debug
# End Custom Macros

"$(DS_POSTBUILD_DEP)" : "$(OUTDIR)\apr_crypto_openssl-1.dll"
   if exist .\x64\Debug\apr_crypto_openssl-1.dll.manifest mt.exe -manifest .\x64\Debug\apr_crypto_openssl-1.dll.manifest -outputresource:.\x64\Debug\apr_crypto_openssl-1.dll;2
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("apr_crypto_openssl.dep")
!INCLUDE "apr_crypto_openssl.dep"
!ELSE 
!MESSAGE Warning: cannot find "apr_crypto_openssl.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "apr_crypto_openssl - Win32 Release" || "$(CFG)" == "apr_crypto_openssl - Win32 Debug" || "$(CFG)" == "apr_crypto_openssl - x64 Release" || "$(CFG)" == "apr_crypto_openssl - x64 Debug"
SOURCE=.\apr_crypto_openssl.c

"$(INTDIR)\apr_crypto_openssl.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "apr_crypto_openssl - Win32 Release"

"libapr - Win32 Release" : 
   cd ".\..\..\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Release" 
   cd "..\apr-util\crypto"

"libapr - Win32 ReleaseCLEAN" : 
   cd ".\..\..\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Release" RECURSE=1 CLEAN 
   cd "..\apr-util\crypto"

!ELSEIF  "$(CFG)" == "apr_crypto_openssl - Win32 Debug"

"libapr - Win32 Debug" : 
   cd ".\..\..\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Debug" 
   cd "..\apr-util\crypto"

"libapr - Win32 DebugCLEAN" : 
   cd ".\..\..\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\apr-util\crypto"

!ELSEIF  "$(CFG)" == "apr_crypto_openssl - x64 Release"

"libapr - x64 Release" : 
   cd ".\..\..\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - x64 Release" 
   cd "..\apr-util\crypto"

"libapr - x64 ReleaseCLEAN" : 
   cd ".\..\..\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - x64 Release" RECURSE=1 CLEAN 
   cd "..\apr-util\crypto"

!ELSEIF  "$(CFG)" == "apr_crypto_openssl - x64 Debug"

"libapr - x64 Debug" : 
   cd ".\..\..\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - x64 Debug" 
   cd "..\apr-util\crypto"

"libapr - x64 DebugCLEAN" : 
   cd ".\..\..\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - x64 Debug" RECURSE=1 CLEAN 
   cd "..\apr-util\crypto"

!ENDIF 

!IF  "$(CFG)" == "apr_crypto_openssl - Win32 Release"

"libaprutil - Win32 Release" : 
   cd ".\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" 
   cd ".\crypto"

"libaprutil - Win32 ReleaseCLEAN" : 
   cd ".\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" RECURSE=1 CLEAN 
   cd ".\crypto"

!ELSEIF  "$(CFG)" == "apr_crypto_openssl - Win32 Debug"

"libaprutil - Win32 Debug" : 
   cd ".\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" 
   cd ".\crypto"

"libaprutil - Win32 DebugCLEAN" : 
   cd ".\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" RECURSE=1 CLEAN 
   cd ".\crypto"

!ELSEIF  "$(CFG)" == "apr_crypto_openssl - x64 Release"

"libaprutil - x64 Release" : 
   cd ".\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - x64 Release" 
   cd ".\crypto"

"libaprutil - x64 ReleaseCLEAN" : 
   cd ".\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - x64 Release" RECURSE=1 CLEAN 
   cd ".\crypto"

!ELSEIF  "$(CFG)" == "apr_crypto_openssl - x64 Debug"

"libaprutil - x64 Debug" : 
   cd ".\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - x64 Debug" 
   cd ".\crypto"

"libaprutil - x64 DebugCLEAN" : 
   cd ".\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - x64 Debug" RECURSE=1 CLEAN 
   cd ".\crypto"

!ENDIF 

SOURCE=..\libaprutil.rc

!IF  "$(CFG)" == "apr_crypto_openssl - Win32 Release"


"$(INTDIR)\apr_crypto_openssl-1.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\apr_crypto_openssl-1.res" /i "../include" /i "../../apr/include" /i "\httpd-2.4.4\srclib\apr-util" /d DLL_NAME="apr_crypto_openssl" /d "NDEBUG" /d "APU_VERSION_ONLY" $(SOURCE)


!ELSEIF  "$(CFG)" == "apr_crypto_openssl - Win32 Debug"


"$(INTDIR)\apr_crypto_openssl-1.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\apr_crypto_openssl-1.res" /i "../include" /i "../../apr/include" /i "\httpd-2.4.4\srclib\apr-util" /d DLL_NAME="apr_crypto_openssl" /d "_DEBUG" /d "APU_VERSION_ONLY" $(SOURCE)


!ELSEIF  "$(CFG)" == "apr_crypto_openssl - x64 Release"


"$(INTDIR)\apr_crypto_openssl-1.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\apr_crypto_openssl-1.res" /i "../include" /i "../../apr/include" /i "\httpd-2.4.4\srclib\apr-util" /d DLL_NAME="apr_crypto_openssl" /d "NDEBUG" /d "APU_VERSION_ONLY" $(SOURCE)


!ELSEIF  "$(CFG)" == "apr_crypto_openssl - x64 Debug"


"$(INTDIR)\apr_crypto_openssl-1.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\apr_crypto_openssl-1.res" /i "../include" /i "../../apr/include" /i "\httpd-2.4.4\srclib\apr-util" /d DLL_NAME="apr_crypto_openssl" /d "_DEBUG" /d "APU_VERSION_ONLY" $(SOURCE)


!ENDIF 


!ENDIF 
