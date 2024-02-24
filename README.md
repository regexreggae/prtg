# ![#c5f015](https://placehold.co/15x15/c5f015/c5f015.png) PRTG
scripts used within the context of the PRTG network monitoring tool 
***
## ![#1589F0](https://placehold.co/15x15/1589F0/1589F0.png) prtg_get_task_state.ps1

### Overview
This PowerShell script checks if a scheduled task is currently running on a remote computer. It [outputs](#output) XML that can be fed to the PRTG "Advanced Script" sensor.

### Installation / Setup / Requirements
Just normal PowerShell. And PSRemoting must be enabled on the target machine

### Usage

#### Arguments
1. DNS-name of the computer on which you want to check the task status
2. Name of the task

#### Flags
None

#### Examples
Call with two arguments as mentioned above, for example:  
`C:\scripts\prtg\prtg_get_task_state.ps1 "targetServerName" "scheduledTaskName"`

### Output
A large string, which happens to be XML readable by the PRTG "Advanced Script" Sensor, for example:

![image](https://github.com/regexreggae/prtg/assets/82324302/dc455f8a-0b0d-4249-a19c-400b7e36f62b)

### Documentation
None so far. Please also have a look at the comments within the script itself 😊  
Well, OK, and here is the PRTG documentation for the sensor that this script should be used together with:  
https://www.paessler.com/manuals/prtg/exe_script_advanced_sensor

### How to contribute
1. improve the code with a pull request
2. open an issue
