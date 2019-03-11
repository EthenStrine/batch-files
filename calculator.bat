@echo off
Title Calculator V0.8
setlocal enabledelayedexpansion
Echo "?" For Help
Echo.
:loop
set /a inf=1
set ans=0
set /p "input=Calculate: "
if "%input:~1,9%" equ "0" set /a inf=0

if "%input:~0,1%" equ "?" (
Echo.
Echo Calculator Made By Monacraft:
Echo Only deals with integers, but handles single step BODMAS
Echo Functions will only take input of 9 digits
Echo.
Echo Built in functions:
Echo. 
Echo         Standard:
Echo  - ? : Help Screen
Echo  - & : Clear Screen
Echo  - @ : Refers to previous answer(e.g. @+5^)
Echo  - $v(Equation^) : Creates variable `v` based on sum(e.g. $v1+2^)
Echo  - #v(Equation^) : Refers to variable `v`(e.g. #v+1^)
Echo  - ^^!f : Returns Factorial of `f`
Echo  - ~a : Triangular Sequence(Sum of `a` and all numbers below^)
Echo  - ^^p [newline] n : Returns `n` to the power of `p`
Echo.
Echo         Looping:
Echo  - *x : Prompts `x` times multiplying all numbers entered
Echo  - +x : Prompts `x` times adding all numbers entered
Echo.
Echo Note: with looping functions inputing '0' will recursivly prompt
Echo   until user enters '/' where the program will display total and restart
Echo Yet to enable the use of multiple variables : Expected in v1.0
Echo.
goto :loop
)

if "%input:~0,1%" equ "@" (
set /a ans=%prev%%input:~1,9%
goto :end
)

if "%input:~0,1%" equ "$" (
set /a %input:~1,1%=%input:~2,9%
set /a ans=!%input:~1,1%!
<nul set /p=%input:~1,1%
goto :end
)

if "%input:~0,1%" equ "&" (
cls
goto :loop
)


if "%input:~0,1%" equ "#" (
if not defined %input:~1,1% (
Echo %input:~1,1% is not defined!
Echo.
Echo.
Goto :loop
)
set /a ans=!%input:~1,1%!%input:~2,9%
Echo %input:~1,1%=!%input:~1,1%!
Echo.
<nul Set /p=Total
Goto :end
)

if "%input:~0,1%" equ "^" (
set /a ans=1
set /p "opp=Power of %input:~1,9%: "
for /l %%a in (1,1,%input:~1,9%) do (
set /a ans*=!opp!
)
goto :end)

if "%input:~0,1%" equ "!" (
set /a ans=1
for /l %%a in (1,1,%input:~1,9%) do (
set /a ans*=%%a
)
goto :end)

if "%input:~0,1%" equ "~" (
set /a ans=0
for /l %%a in (1,1,%input:~1,9%) do (
set /a ans+=%%a
)
goto :end)

if "%input:~0,1%" equ "*" (
set /a ans=1
for /l %%a in (%inf%,%inf%,%input:~1,9%) do (
set /p "opp=Var%%a: "
if "!opp!" equ "/" (
echo !ans!
pause|echo.
start calculator.bat
exit
)
set /a ans*=!opp!
)
goto :end)

if "%input:~0,1%" equ "+" (
set /a ans=0
for /l %%a in (%inf%,%inf%,%input:~1,9%) do (
set /p "opp=Var%%a: "
if "!opp!" equ "/" (
echo !ans!
pause|echo.
start calculator.bat
exit
)
set /a ans+=!opp!
)
goto :end)

set /a ans=%input%

:end
set prev=%ans%
echo =%ans%
Echo.
Echo.
goto :loop