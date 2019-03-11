@echo off
@title BlackJack v 2
@mode con cols=80 lines=21

::Juego de Cartas en Batch
::BlackJack v 2.0
::Idea Original by Craphter - Dise๑o Grafico by Splendit

setlocal enabledelayedexpansion

:Menu
cls
Call :Inicio
echo.          
echo.         ษออออออออออออออออป
echo.         บ Black Jack v 2 บ
echo.         ศออออออออออออออออผ
echo.
echo.  Seleccione una Opcion:
echo.
echo.  1. Jugar       2. Salir
echo.
set opc=
set /p "opc=  >> "
if not defined opc goto menu
if "%opc%"=="2" Exit
echo.
echo.  Selecciones la Cantidad de la Apuesta
echo.
echo.  1. $10  2. $20  3. $50  4. $100
echo.
set ppp=
set /p "ppp=  >> "
if not defined ppp Goto :Menu
if "%ppp%"=="1" Set Pot=10
if "%ppp%"=="2" Set Pot=20
if "%ppp%"=="3" Set Pot=50
if "%ppp%"=="4" Set Pot=100
if %ppp% GTR 4 Goto :Menu
Set /a Money=Money-Pot

:Load
cls
Call :Reset
Call :Randomize
Call :Draw
Goto :Load

:Draw
echo.
echo.  Apuesta $ %Pot%         Total Acumulado: %Money%
echo.
echo.          Cartas del Jugador            -               Cartas del PC
for /l %%b in (1,1,11) do (echo. !CLine_%%b!)
echo.               %TotalUS% puntos                                 %TotalPC% puntos
echo.
if %TotalUS% LSS %TotalPC% (echo. Ha Ganado la PC...&Set /a "Money=Money-(Pot/2)")
if %TotalUS% EQU %TotalPC% (echo. Empatados...&Set /a "Money=Money+(Pot/2)")
if %TotalUS% GTR %TotalPC% (echo. Ganaste...&Set /a Money=Money+Pot)
echo.
set var=
Set /p "var=  Desea Volver a Jugar [S] [N] > "
If Not Defined var Goto :Eof
If /i "%var%"=="S" Goto :Eof
Goto :Menu

:Randomize
Set TotalPC=0&Set TotalUS=0
For /l %%a in (1,1,3) do (
Set /a "N%%a=!random:~-2! %% 13">NUL 2>&1
Set /a "S%%a=!random:~-2! %% 4">NUL 2>&1
Call :GenCards !N%%a! !S%%a! US
)
for /l %%c in (1,1,11) do (Set CLine_%%c=!CLine_%%c!   ณ  )
For /l %%a in (1,1,3) do (
Set /a "N%%a=!random:~-2! %% 13">NUL 2>&1
Set /a "S%%a=!random:~-2! %% 4">NUL 2>&1
Call :GenCards !N%%a! !S%%a! PC
)
Goto :Eof

:GenCards
Call :CARD!Tags:~%1,1! !Tags:~%1,1! !Symbols:~%2,1!
Set /a Total%3=Total%3+!Tags:~%1,1! >NUL 2>&1
Goto :Eof

:Inicio
If Not Defined Money Set Money=200
Set Symbols=
Set Tags=A23456789OJQK
Set A=11
Set J=10
Set Q=10
Set K=10
Set O=10
Goto :Eof

:Reset
for /l %%c in (1,1,11) do (Set CLine_%%c=)
Set Total=0
Goto :Eof

:CARDA
set CLine_1=%CLine_1% ษอออออออออป
set CLine_2=%CLine_2% บ%1        บ
set CLine_3=%CLine_3% บ%2ฺฤฤฤฤฤฟ บ
set CLine_4=%CLine_4% บ ณ     ณ บ
set CLine_5=%CLine_5% บ ณ     ณ บ
set CLine_6=%CLine_6% บ ณ  %2  ณ บ
set CLine_7=%CLine_7% บ ณ     ณ บ
set CLine_8=%CLine_8% บ ณ     ณ บ
set CLine_9=%CLine_9% บ ภฤฤฤฤฤู%2บ
set CLine_10=%CLine_10% บ        %1บ
set CLine_11=%CLine_11% ศอออออออออผ
Goto :Eof

:CARD2
set CLine_1=%CLine_1% ษอออออออออป
set CLine_2=%CLine_2% บ%1        บ
set CLine_3=%CLine_3% บ%2ฺฤฤฤฤฤฟ บ
set CLine_4=%CLine_4% บ ณ%2    ณ บ
set CLine_5=%CLine_5% บ ณ     ณ บ
set CLine_6=%CLine_6% บ ณ     ณ บ
set CLine_7=%CLine_7% บ ณ     ณ บ
set CLine_8=%CLine_8% บ ณ    %2ณ บ
set CLine_9=%CLine_9% บ ภฤฤฤฤฤู%2บ
set CLine_10=%CLine_10% บ        %1บ
set CLine_11=%CLine_11% ศอออออออออผ
Goto :Eof

:CARD3
set CLine_1=%CLine_1% ษอออออออออป
set CLine_2=%CLine_2% บ%1        บ
set CLine_3=%CLine_3% บ%2ฺฤฤฤฤฤฟ บ
set CLine_4=%CLine_4% บ ณ%2    ณ บ
set CLine_5=%CLine_5% บ ณ     ณ บ
set CLine_6=%CLine_6% บ ณ  %2  ณ บ
set CLine_7=%CLine_7% บ ณ     ณ บ
set CLine_8=%CLine_8% บ ณ    %2ณ บ
set CLine_9=%CLine_9% บ ภฤฤฤฤฤู%2บ
set CLine_10=%CLine_10% บ        %1บ
set CLine_11=%CLine_11% ศอออออออออผ
Goto :Eof

:CARD4
set CLine_1=%CLine_1% ษอออออออออป
set CLine_2=%CLine_2% บ%1        บ
set CLine_3=%CLine_3% บ%2ฺฤฤฤฤฤฟ บ
set CLine_4=%CLine_4% บ ณ%2   %2ณ บ
set CLine_5=%CLine_5% บ ณ     ณ บ
set CLine_6=%CLine_6% บ ณ     ณ บ
set CLine_7=%CLine_7% บ ณ     ณ บ
set CLine_8=%CLine_8% บ ณ%2   %2ณ บ
set CLine_9=%CLine_9% บ ภฤฤฤฤฤู%2บ
set CLine_10=%CLine_10% บ        %1บ
set CLine_11=%CLine_11% ศอออออออออผ
Goto :Eof

:CARD5
set CLine_1=%CLine_1% ษอออออออออป
set CLine_2=%CLine_2% บ%1        บ
set CLine_3=%CLine_3% บ%2ฺฤฤฤฤฤฟ บ
set CLine_4=%CLine_4% บ ณ%2   %2ณ บ
set CLine_5=%CLine_5% บ ณ     ณ บ
set CLine_6=%CLine_6% บ ณ  %2  ณ บ
set CLine_7=%CLine_7% บ ณ     ณ บ
set CLine_8=%CLine_8% บ ณ%2   %2ณ บ
set CLine_9=%CLine_9% บ ภฤฤฤฤฤู%2บ
set CLine_10=%CLine_10% บ        %1บ
set CLine_11=%CLine_11% ศอออออออออผ
Goto :Eof

:CARD6
set CLine_1=%CLine_1% ษอออออออออป
set CLine_2=%CLine_2% บ%1        บ
set CLine_3=%CLine_3% บ%2ฺฤฤฤฤฤฟ บ
set CLine_4=%CLine_4% บ ณ%2   %2ณ บ
set CLine_5=%CLine_5% บ ณ     ณ บ
set CLine_6=%CLine_6% บ ณ%2   %2ณ บ
set CLine_7=%CLine_7% บ ณ     ณ บ
set CLine_8=%CLine_8% บ ณ%2   %2ณ บ
set CLine_9=%CLine_9% บ ภฤฤฤฤฤู%2บ
set CLine_10=%CLine_10% บ        %1บ
set CLine_11=%CLine_11% ศอออออออออผ
Goto :Eof

:CARD7
set CLine_1=%CLine_1% ษอออออออออป
set CLine_2=%CLine_2% บ%1        บ
set CLine_3=%CLine_3% บ%2ฺฤฤฤฤฤฟ บ
set CLine_4=%CLine_4% บ ณ%2   %2ณ บ
set CLine_5=%CLine_5% บ ณ     ณ บ
set CLine_6=%CLine_6% บ ณ%2 %2 %2ณ บ
set CLine_7=%CLine_7% บ ณ     ณ บ
set CLine_8=%CLine_8% บ ณ%2   %2ณ บ
set CLine_9=%CLine_9% บ ภฤฤฤฤฤู%2บ
set CLine_10=%CLine_10% บ        %1บ
set CLine_11=%CLine_11% ศอออออออออผ
Goto :Eof

:CARD8
set CLine_1=%CLine_1% ษอออออออออป
set CLine_2=%CLine_2% บ%1        บ
set CLine_3=%CLine_3% บ%2ฺฤฤฤฤฤฟ บ
set CLine_4=%CLine_4% บ ณ%2   %2ณ บ
set CLine_5=%CLine_5% บ ณ  %2  ณ บ
set CLine_6=%CLine_6% บ ณ%2   %2ณ บ
set CLine_7=%CLine_7% บ ณ  %2  ณ บ
set CLine_8=%CLine_8% บ ณ%2   %2ณ บ
set CLine_9=%CLine_9% บ ภฤฤฤฤฤู%2บ
set CLine_10=%CLine_10% บ        %1บ
set CLine_11=%CLine_11% ศอออออออออผ
Goto :Eof

:CARD9
set CLine_1=%CLine_1% ษอออออออออป
set CLine_2=%CLine_2% บ%1        บ
set CLine_3=%CLine_3% บ%2ฺฤฤฤฤฤฟ บ
set CLine_4=%CLine_4% บ ณ%2 %2 %2ณ บ
set CLine_5=%CLine_5% บ ณ     ณ บ
set CLine_6=%CLine_6% บ ณ%2 %2 %2ณ บ
set CLine_7=%CLine_7% บ ณ     ณ บ
set CLine_8=%CLine_8% บ ณ%2 %2 %2ณ บ
set CLine_9=%CLine_9% บ ภฤฤฤฤฤู%2บ
set CLine_10=%CLine_10% บ        %1บ
set CLine_11=%CLine_11% ศอออออออออผ
Goto :Eof

:CARDO
set CLine_1=%CLine_1% ษอออออออออป
set CLine_2=%CLine_2% บ1%1       บ
set CLine_3=%CLine_3% บ%2ฺฤฤฤฤฤฟ บ
set CLine_4=%CLine_4% บ ณ%2   %2ณ บ
set CLine_5=%CLine_5% บ ณ %2 %2 ณ บ
set CLine_6=%CLine_6% บ ณ%2   %2ณ บ
set CLine_7=%CLine_7% บ ณ %2 %2 ณ บ
set CLine_8=%CLine_8% บ ณ%2   %2ณ บ
set CLine_9=%CLine_9% บ ภฤฤฤฤฤู%2บ
set CLine_10=%CLine_10% บ       1%1บ
set CLine_11=%CLine_11% ศอออออออออผ
Goto :Eof

:CARDJ
set CLine_1=%CLine_1% ษอออออออออป
set CLine_2=%CLine_2% บJ        บ
set CLine_3=%CLine_3% บ%2ฺฤฤฤฤฤฟ บ
set CLine_4=%CLine_4% บ ณ     ณ บ
set CLine_5=%CLine_5% บ ณ ,,, ณ บ
set CLine_6=%CLine_6% บ ณ(. .)ณ บ
set CLine_7=%CLine_7% บ ณ  l  ณ บ
set CLine_8=%CLine_8% บ ณ """ ณ บ
set CLine_9=%CLine_9% บ ภฤฤฤฤฤู%2บ
set CLine_10=%CLine_10% บ        Jบ
set CLine_11=%CLine_11% ศอออออออออผ
Goto :Eof

:CARDQ
set CLine_1=%CLine_1% ษอออออออออป
set CLine_2=%CLine_2% บQ        บ
set CLine_3=%CLine_3% บ%2ฺฤฤฤฤฤฟ บ
set CLine_4=%CLine_4% บ ณ ___ ณ บ
set CLine_5=%CLine_5% บ ณ.---.ณ บ
set CLine_6=%CLine_6% บ ณบ'.'บณ บ
set CLine_7=%CLine_7% บ ณบ\o/บณ บ
set CLine_8=%CLine_8% บ ณบ   บณ บ
set CLine_9=%CLine_9% บ ภฤฤฤฤฤู%2บ
set CLine_10=%CLine_10% บ        Qบ
set CLine_11=%CLine_11% ศอออออออออผ
Goto :Eof

:CARDK
set CLine_1=%CLine_1% ษอออออออออป
set CLine_2=%CLine_2% บK        บ
set CLine_3=%CLine_3% บ%2ฺฤฤฤฤฤฟ บ
set CLine_4=%CLine_4% บ ณ ,,, ณ บ
set CLine_5=%CLine_5% บ ณ\---/ณ บ
set CLine_6=%CLine_6% บ ณณ'_'ณณ บ
set CLine_7=%CLine_7% บ ณ\---/ณ บ
set CLine_8=%CLine_8% บ ณ     ณ บ
set CLine_9=%CLine_9% บ ภฤฤฤฤฤู%2บ
set CLine_10=%CLine_10% บ        Kบ
set CLine_11=%CLine_11% ศอออออออออผ
Goto :Eof
