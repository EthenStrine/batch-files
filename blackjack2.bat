@echo off
:top
cls
set /a dealnum1=%random% %% 11+1
set /a dealnum2=%random% %% 11+1
set /a dealnum3=%random% %% 11+1
set /a dealnum4=%random% %% 11+1
set /a dealnum5=%random% %% 11+1
set /a num1=%random% %% 11 + 1
set /a num2=%random% %% 11 + 1
set /a num3=%random% %% 11 + 1
set /a num4=%random% %% 11 + 1
set /a num5=%random% %% 11 + 1
color 0a
echo -----------------------
echo Welcome to Blackjack!
echo -----------------------
echo %num1%
echo %num2%
set /a sum=%num1%+%num2%
if %sum% GTR 21 goto :bust
if %sum% LEQ 21 echo Would you like to hit or stand?
set /p you=
if %you%==hit echo %num3%
if %you%==stand goto :stand 
set /a sum=%num1%+%num2%+%num3%
if %sum% GTR 21 goto :bust
if %sum% LEQ 21 echo Would you like to hit or stand?
set /p udefine=
if %udefine%==hit echo %num4%
if %udefine%==stand goto :stand
set /a sum=%num1%+%num2%+%num3%+%num4%
if %sum% GTR 21 goto :bust
if %sum% LEQ 21 echo Would you like to hit or stand?
set /p me=
if %me%==hit echo %num5%
if %me%==stand goto :stand
set /a sum=%num1%+%num2%+%num3%+%num4%+%num5%
if %sum% LSS 21 goto :5cardtrick
if %sum% GTR 21 goto :bust
if %sum% EQU 21 goto :5cardtrick
:bust
echo Oh no! Bust! Your total was %sum%
echo To play another round, press r, if not, press e
set /p chair=
if %chair%==r goto :top
if %chair%==e exit
:blackjack
echo Congratulations!
echo You got 21!
echo To play another round, press r, if not, press e
set /p watch=
if %watch%==r goto :top
if %watch%==e exit
:5cardtrick
echo Barely Noticeable! You win! Your total was %sum%
echo You have a 5 card trick! You have 5 cards, and if you add them up the sum is 21 or under!
echo To play another round, press r, if not, press e
set /p mouse=
if %mouse%==r goto :top
if %mouse%==e exit
:stand
echo Your total is %sum%
echo The dealer's first 2 cards are %dealnum1% and %dealnum2%
set /a dealsum=%dealnum1%+%dealnum2%
if %dealsum% GTR 21 goto :dealbust
if %dealsum% EQU 21 goto :dealwon
if %dealsum% GTR 18 goto :dealstand
if %dealsum% LSS 17 echo The dealer will hit. His 3rd card is %dealnum3%
set /a dealsum=%dealnum1%+%dealnum2%+%dealnum3%
if %dealsum% GTR 21 goto :dealbust
if %dealsum% EQU 21 goto :dealwon
if %dealsum% GTR 18 goto :dealstand
if %dealsum% LSS 17 echo The dealer will hit. His 4th card is %dealnum4%
set /a dealsum=%dealnum1%+%dealnum2%+%dealnum3%+%dealnum4%
if %dealsum% GTR 21 goto :dealbust
if %dealsum% EQU 21 goto :dealwon
if %dealsum% GTR 18 goto :dealstand
if %dealsum% LSS 17 echo The dealer will hit. His 5th card is %dealnum5%
set /a dealsum=%dealnum1%+%dealnum2%+%dealnum3%+%dealnum4%+%dealnum5%
if %dealsum% GTR 21 goto :dealbust
if %dealsum% EQU 21 goto :dealwon
if %dealsum% GTR 18 goto :dealstand
if %dealsum% LEQ 21 goto:deal5cardtrick
pause
:dealwon
echo The dealer won! His total is %dealsum%
ping localhost -n 3 >nul
goto :againornot
:dealbust
echo The dealer is bust! His total is %dealsum%
ping localhost -n 3 >nul
goto :againornot
:deal5cardtrick
echo The dealer has a 5 card trick! You lose!
ping localhost -n 3 >nul
goto :againornot
:dealstand
if %sum% GTR %dealsum% echo You won! Congratulations! Your total is %sum%
if %sum% LSS %dealsum% echo The dealer won! The dealers total is %dealsum%
ping localhost -n 4 >nul
goto :againornot
:againornot
echo If you would like to play another round, type "again", if not, type "leave"
set /p paper=
if %paper%==again goto :top
if %paper%==leave exit