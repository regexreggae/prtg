<#PSScriptInfo

.VERSION 1.0

.GUID 544799f9-c16b-40b7-8d8d-ba8c302bc64f

.AUTHOR regexreggae

.COMPANYNAME 

.COPYRIGHT 

.TAGS PowerShell PRTG PSRemoting

.LICENSEURI 

.PROJECTURI 

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES


.PRIVATEDATA


#>
<#

.DESCRIPTION
checks if a scheduled task is running on a remote machine with output suited for a PRTG advanced script sensor

#>

# script should be called with name of remote machine as first argument and name of task to monitor as second argument
$computer = $args[0] # in PowerShell, argument counting starts at 0, so this is the first argument
$taskName = $args[1] # ...this is the second argument

# open a remote session on the desired machine (the machine we're actually interested in)
$mySession=New-PSSession -ComputerName $computer

# let the script do its work - in a remote PS-Session
# do the main bit of the script on the remote machine, but save the output to a variable
$outputFromRemoteServer = Invoke-Command -Session $mySession -ScriptBlock {

# ^^^^ all the following lines will be executed on the remote machine ^^^^

# get state of target task. We need to refer back to $taskName for the name of the task, the variable can be referenced like so: "$Using:..."
$stateOfTargetTask=(Get-ScheduledTask -TaskName $Using:taskName).State

# $taskIsRunning is our most important and valuable variable here. It shows us whether the task we're interested in is running or not
if ($stateOfTargetTask -eq "Running") {$taskIsRunning = 1} else {$taskIsRunning = 0}

#$taskIsRunning = 0 #debug - simulate warning / error. This line should be commented out during productive use

# Output for PRTG: relevant variable(s) embedded in XML. In terms of PowerShell types, these are just a bunch of strings
"<prtg>"
    "<result>"
    "<channel>Task $Using:taskName status</channel>"
    "<value>$taskIsRunning</value>"
    "</result>"
"</prtg>"
}

# ^^^^ We're back on the Probe now. Just output what we retrieved from the remote machine ^^^^
$outputFromRemoteServer