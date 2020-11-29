
Write-Host "Functions can be managed via the `'function:`' drive. Since the drive is item based we can use most of the *-Item cmdlets."
Read-Host -Prompt "<Enter>"

Write-Host "We can list the number of available functions"
$functions = Get-ChildItem function:
$functions.Count


Write-Host "Let's add new function "

function NewFunction {
    param (
    )

    Write-Host "Hello World"
}


Write-Host "The count of function increased by 1"
$functions = Get-ChildItem function:
$functions.Count

Write-Host "Let's list the new function"
Get-ChildItem function:\NewFunction


Write-Host "Let's list the content new function"
Get-ChildItem function:\NewFunction | Format-Table Name, Definition -Wrap

Write-Host "The function can be removed from the current session via  'Remove-Item' "
Remove-Item function:\NewFunction

Write-Host "The count of function decreased by 1"
$functions = Get-ChildItem function:
$functions.Count