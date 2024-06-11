@echo off

if not exist "file_dragger-for-GMS1" mkdir "file_dragger-for-GMS1"
cmd /C copyre ..\file_dragger.gmx\extensions\file_dragger.extension.gmx file_dragger-for-GMS1\file_dragger.extension.gmx
cmd /C copyre ..\file_dragger.gmx\extensions\file_dragger file_dragger-for-GMS1\file_dragger
cmd /C copyre ..\file_dragger.gmx\datafiles\file_dragger.html file_dragger-for-GMS1\file_dragger\Assets\datafiles\file_dragger.html
cd file_dragger-for-GMS1
cmd /C 7z a file_dragger-for-GMS1.7z *
move /Y file_dragger-for-GMS1.7z ../file_dragger-for-GMS1.gmez
cd ..

if not exist "file_dragger-for-GMS2\extensions" mkdir "file_dragger-for-GMS2\extensions"
if not exist "file_dragger-for-GMS2\datafiles" mkdir "file_dragger-for-GMS2\datafiles"
if not exist "file_dragger-for-GMS2\datafiles_yy" mkdir "file_dragger-for-GMS2\datafiles_yy"
cmd /C copyre ..\file_dragger_yy\extensions\file_dragger file_dragger-for-GMS2\extensions\file_dragger
cmd /C copyre ..\file_dragger_yy\datafiles\file_dragger.html file_dragger-for-GMS2\datafiles\file_dragger.html
cmd /C copyre ..\file_dragger_yy\datafiles_yy\file_dragger.html.yy file_dragger-for-GMS2\datafiles_yy\file_dragger.html.yy
cd file_dragger-for-GMS2
cmd /C 7z a file_dragger-for-GMS2.zip *
move /Y file_dragger-for-GMS2.zip ../file_dragger-for-GMS2.yymp
cd ..

if not exist "file_dragger-for-GMS2.3+\extensions" mkdir "file_dragger-for-GMS2.3+\extensions"
if not exist "file_dragger-for-GMS2.3+\datafiles" mkdir "file_dragger-for-GMS2.3+\datafiles"
cmd /C copyre ..\file_dragger_23\extensions\file_dragger file_dragger-for-GMS2.3+\extensions\file_dragger
cmd /C copyre ..\file_dragger_23\datafiles\file_dragger.html file_dragger-for-GMS2.3+\datafiles\file_dragger.html
cd file_dragger-for-GMS2.3+
cmd /C 7z a file_dragger-for-GMS2.3+.zip *
move /Y file_dragger-for-GMS2.3+.zip ../file_dragger-for-GMS2.3+.yymps
cd ..

pause