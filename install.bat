set initialdir=%CD%
REM batch alternative for bashs "basename"
for %%i in (%0) do set scriptdir=%%~pi
cd %scriptdir%

set vimrc=%HOMEPATH%\_vimrc

REM backup the old vimrc
if exist vimrc (
  move %vimrc% %HOMEPATH%\_vimrc.bak
)
REM copy the windows vimrc into the users homedir
copy .\config\vimrc.windows %vimrc%

REM batch alternative for bashs "basename"
for %%i in (%CD%) do set vimruntimedir=%%~ni
cd ../

REM rename the directory with the plugins to _vimruntime
IF NOT "%vimruntimedir%"=="_vimruntime" (
  move %vimruntimedir% _vimruntime
)

cd %initialdir%
echo "Vim configuration successfully installed!"

