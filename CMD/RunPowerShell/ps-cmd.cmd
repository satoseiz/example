@echo off
:: -Command��-File�̃I�v�V�����w��͏ȗ��\�Ȗ͗l
:: 1. �R�}���h�����ɂ����s
powershell ^
  $var = 'argument'; ^
  echo $var;

:: 2. �W�����͂ɂ����s
echo ^
  $var = 'stdin'; ^
  echo $var; ^
  | powershell -

:: 3. �t�@�C���ɂ����s
echo $var = 'file'>>file.ps1
echo echo $var>>file.ps1
type file.ps1 | powershell -
powershell - <file.ps1
powershell -ExecutionPolicy Unrestricted .\file.ps1
del file.ps1