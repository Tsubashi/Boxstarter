PowerShell -NoProfile -ExecutionPolicy Unrestricted -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Unrestricted -File """"%CD%\main.ps1"""" """"%CD%""""' -Verb RunAs}";