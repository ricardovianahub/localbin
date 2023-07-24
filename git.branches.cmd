@echo off
setlocal EnableDelayedExpansion

REM Function to get the tracking information for a branch
:get_tracking_info
set "branch=%~1"
for /f "delims=" %%a in ('git rev-parse --abbrev-ref --symbolic-full-name "%branch%@{u}" 2^>nul') do set "tracking_info=%%a"
if not defined tracking_info set "tracking_info=:"
exit /b

REM Function to get the last commit date for a branch
:get_last_commit_date
set "branch=%~1"
for /f "delims=" %%a in ('git show -s --format="%%ci" "%branch%" 2^>nul') do set "last_commit_date=%%a"
if not defined last_commit_date set "last_commit_date=:"
exit /b

REM Loop through all branches
for /f "delims=" %%b in ('git for-each-ref --format="%%(refname:short)" refs/heads') do (
    call :get_tracking_info "%%b"
    call :get_last_commit_date "%%b"

    REM Padding for alignment
    set "branch_padded=          %%b"
    set "branch_padded=!branch_padded:~-30!"
    set "tracking_info_padded=     !tracking_info!"
    set "tracking_info_padded=!tracking_info_padded:~-20!"
    set "last_commit_date_padded=       !last_commit_date!"
    set "last_commit_date_padded=!last_commit_date_padded:~-25!"

    echo !branch_padded! !tracking_info_padded! !last_commit_date_padded!
)

endlocal
