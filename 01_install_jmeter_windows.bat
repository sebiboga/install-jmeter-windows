@echo off
if exist C:\ (
    echo script developed by sebiboga
    echo let's begin   
) else echo error: C drive doesn't exist. please update this script to point to your HDD letter

if exist C:\JMeter (
    echo --- JMeter already exist 
) else (  
    mkdir C:\JMeter
    echo --- JMeter folder created
    )


if exist C:\JMeter\apache-jmeter-5.4.3.zip (
    echo --- apache-jmeter-5.4.3.zip already exist
    
) else ( 
powershell -command "Invoke-WebRequest   -Uri 'https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.4.3.zip' -OutFile 'C:\JMeter\apache-jmeter-5.4.3.zip'"
)

if exist C:\JMeter\apache-jmeter-5.4.3 (
    echo --- C:\JMeter\apache-jmeter-5.4.3 already exist
    
) else ( 
powershell -command "Expand-Archive -Force 'C:\JMeter\apache-jmeter-5.4.3.zip' 'C:\JMeter'"
del /F "C:\JMeter\apache-jmeter-5.4.3.zip"
)

if exist C:\JMeter\apache-jmeter-5.4.3\lib\ext\jmeter-plugins-manager-1.6.jar (
    echo --- C:\JMeter\apache-jmeter-5.4.3\lib\ext\jmeter-plugins-manager-1.6.jar already exist 
) else ( 
powershell -command "Invoke-WebRequest   -Uri 'https://jmeter-plugins.org/get/' -OutFile 'C:\JMeter\apache-jmeter-5.4.3\lib\ext\jmeter-plugins-manager-1.6.jar'"
)

c:\JMeter\apache-jmeter-5.4.3\bin\jmeter.bat
@echo on
