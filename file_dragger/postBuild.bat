@echo off
set dllPath=%~1
set solutionDir=%~2
set projectDir=%~3
set arch=%~4
set config=%~5

echo Running post-build for %config%

set extName=file_dragger
set dllName=file_dragger
set gmlDir14=%solutionDir%file_dragger.gmx
set gmlDir22=%solutionDir%file_dragger_yy
set gmlDir23=%solutionDir%file_dragger_23
set ext14=%gmlDir14%\extensions\%extName%
set ext22=%gmlDir22%\extensions\%extName%
set ext23=%gmlDir23%\extensions\%extName%
set dllRel=%dllName%.dll
set csRel=%dllName%.cs
set csPath=%ext23%\%csRel%
set gmlPath=%ext23%\*.gml
set docName=%extName%.html
set docPath=%solutionDir%export\%docName%

echo Copying documentation...
copy /Y %docPath% %gmlDir23%\datafiles\%docName%
copy /Y %docPath% %gmlDir22%\datafiles\%docName%
copy /Y %docPath% %gmlDir14%\datafiles\%docName%

where /q gmxgen
if %ERRORLEVEL% EQU 0 (
	
	echo Combining the source files...
	type "%projectDir%*.cs" >"%csPath%" 2>nul
	
	echo Running GmxGen...
	
	gmxgen "%ext23%\%extName%.yy" ^
	--copy "%dllPath%" "%dllRel%:%arch%"

	gmxgen "%ext22%\%extName%.yy" ^
	--copy "%dllPath%" "%dllRel%:%arch%" ^
	--copy "%csPath%" "%csRel%" ^
	--copy "%gmlPath%" "*.gml"
	
	gmxgen "%ext14%.extension.gmx" ^
	--copy "%dllPath%" "%dllRel%:%arch%" ^
	--copy "%csPath%" "%csRel%" ^
	--copy "%gmlPath%" "*.gml"

) else (

	echo Copying DLLs...
	if "%arch%" EQU "x64" (
		copy /Y "%dllPath%" "%ext23%\%dllName%_x64.dll"
	) else (
		copy /Y "%dllPath%" "%ext22%\%dllRel%"
		copy /Y "%dllPath%" "%ext23%\%dllRel%"
		copy /Y "%dllPath%" "%ext14%\%dllRel%"
	)
	
	echo Copying GML files...
	robocopy %ext23% %ext22% *.gml /L >nul
	robocopy %ext23% %ext14% *.gml /L >nul

	echo postBuild.bat: Warning N/A: Could not find GmxGen - extensions will not be updated automatically. See https://github.com/YAL-GameMaker-Tools/GmxGen for setup.
)