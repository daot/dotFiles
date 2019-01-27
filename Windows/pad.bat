@echo off
:: ssri says hi
:: Enter metaflac directory within ""
set metaflac="metaflac.exe"

cd /d %1
echo Current Directory: %1
echo. 1>&2
for %%A in (*.flac) do (
%metaflac% --dont-use-padding --remove --block-type=PADDING "%%A"
%metaflac% --add-padding=8192 "%%A"
echo [Processed %%A]
)
echo. 1>&2