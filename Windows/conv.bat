@echo off

:: Set Program Paths
set ffmpeg="ffmpeg.exe"
set metaflac="metaflac.exe"
set mktorrent="mktorrent.exe"

:: Set Announce URL
set announce=""

:: Name Output Directories
set FOLDERFLAC="%~nx1"
if not %FOLDERFLAC:flac=%==%FOLDERFLAC% (
	set FOLDER320=%FOLDERFLAC:flac=MP3 320%
	set FOLDERVBR=%FOLDERFLAC:flac=MP3 V0%
) else (
	set FOLDER320="%~nx1 (320)"
	set FOLDERVBR="%~nx1 (V0)"
)

:: Begin
cd /d %1
echo [Converting %FOLDERFLAC%]
echo. 1>&2

:: Create Output Directories
mkdir ..\%FOLDER320%
mkdir ..\%FOLDERVBR%

:: Copy Files
echo. 1>&2
echo [Copying Files]
set SUPRESS=/NP /NS /NC /NFL /NDL /NJH /NJS
set EXCLUDES=/XF *.flac *.mp3 *.m3u *.m3u8
robocopy . ../%FOLDER320% /MIR %EXCLUDES% %SUPRESS%
robocopy . ../%FOLDERVBR% /MIR %EXCLUDES% %SUPRESS%

:: Remove Artwork and Save to cover.jpg
echo [Extracing and Removing Artwork]
for %%A in (*.flac) do (
	%metaflac% --export-picture-to=cover.jpg "%%A"
	%metaflac% --export-picture-to=../%FOLDER320%/cover.jpg "%%A"
	%metaflac% --export-picture-to=../%FOLDERVBR%/cover.jpg "%%A"
	%metaflac% --dont-use-padding --remove --block-type=PICTURE "%%A"
)

:: Convert FLAC to MP3
:: Supress Output, Extract Embedded Cover Art as JPG, Copy Tags, Remove Padding
set OPTIONS=-hide_banner -loglevel error -fflags +bitexact
for %%A in (*.flac) do (
	echo [Removing Padding For "%%A"]
	%metaflac% --dont-use-padding --remove --block-type=PADDING "%%A"
	%metaflac% --add-padding=8192 "%%A"
	echo [Transcoding "%%A" at 320k]
	%ffmpeg% %OPTIONS% -i "%%A" -ab 320k -vcodec mjpeg -q:v 2 ../%FOLDER320%/"%%~nA.mp3"
	echo [Transcoding "%%A" at V0]
	%ffmpeg% %OPTIONS% -i "%%A" -q:a 0 -vcodec mjpeg -q:v 2 ../%FOLDERVBR%/"%%~nA.mp3"
)

:: Make Torrents
echo [Making Torrents]
cd ..
%mktorrent% -a %announce% -p -s RED %FOLDER320%
%mktorrent% -a %announce% -p -s RED %FOLDERVBR%
%mktorrent% -a %announce% -p -s RED %FOLDERFLAC%
pause