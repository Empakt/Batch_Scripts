# For writing the user groups, this script needs to be run as admin

# We can execute specific commands if no error occured with:
# if (!$error) { "No Error Occured" }

# Writing warning for the user about the need for admin rights:
Write-Host "`nFor writing the user groups," `
"this script needs to be run as admin`n" -ForegroundColor yellow

# Infinite loop trying to use the input source username until no error occurs
do{
	# Asking for the username of the user that the list of groups will be copied from:
	$sourceUser = Read-Host "Input the source user's" `
	"username (e.g., walter.white or smith)"

	# Error handing. If the source username is not found, the while loop repeats
	$error.clear()
	try{
		# Saving the list of source user's groups into a variable:
		$sourceUserGroups = Get-ADUser -Identity "$sourceUser" -Properties memberof `
		| Select-Object -ExpandProperty memberof
		
		# Confirmation for the user what source username the user typed:
		Write-Host "`nSource username: " -NoNewline
		Write-Host "$sourceUser`n" -ForegroundColor green
	}
	catch{
		Write-Host "`nError occured: $error`nTry again`n" -ForegroundColor red
	}
}while ($error)

# Infinite loop trying to use the input destination username until no error occurs
do{
	# Asking for the username of the destination user where the groups will be copied to:
	$destinationUser = Read-Host "Input the destination user's" `
	"username (e.g., walter.white or smith)"

	# Error handing. If the destination username is not found, the while loop repeats
	$error.clear()
	try{
		
		# Command to check whether the username exists or will throw an error,
		# also used just below to show the already existing groups count:
		$destinationUserExistingGroupCount = (Get-ADUser -Identity "$destinationUser" `
		-Properties memberof | Select-Object -ExpandProperty memberof).Count
		
		# Confirmation for the user what destination username the user typed:
		Write-Host "`nDestination username: " -NoNewline
		Write-Host "$destinationUser`n" -ForegroundColor green
		
		# Printing the count of exsiting groups on the destination user
		Write-Host "Count of existing groups" `
		"on the destination user: " -NoNewline -ForegroundColor yellow
		Write-Host $destinationUserExistingGroupCount -ForegroundColor green
	}
	catch{
		Write-Host "`nError occured: $error`nTry again`n" -ForegroundColor red
	}
}while ($error)

# Confirmation for the user what groups are saved and will be copied:
Write-Host "`n---------- Start of source user's groups ----------" -ForegroundColor yellow

$sourceUserGroups

Write-Host "---------- End of source user's groups ----------" `
"`n`nCount of groups on the source user: " -NoNewline -ForegroundColor yellow
Write-Host $sourceUserGroups.Count -ForegroundColor green
Write-Host "`nMake sure that everything is correct" `
"and then proceed`nYou can exit the script with CTRL+C`n" -ForegroundColor yellow

# Pausing the script so that the user can confirm everything is correct:
pause

# Adding the groups to the destination user:
$sourceUserGroups | Add-ADGroupMember -Members "$destinationUser" -verbose

# Saving the list of destination user's newly copied groups into a variable:
$destinationUserGroups = Get-ADUser -Identity "$destinationUser" -Properties memberof `
| Select-Object -ExpandProperty memberof

# Confirmation of the destination user's group after they were copied:
Write-Host "`n---------- Start of the destination user's newly copied groups ----------" `
-ForegroundColor yellow

$destinationUserGroups

Write-Host "---------- End of the destination user's newly copied groups ----------" `
"`n`nCount of groups on destination user: " -NoNewline -ForegroundColor yellow
Write-Host $destinationUserGroups.Count -ForegroundColor green

if ($sourceUserGroups.Count -eq $destinationUserGroups.Count){
	Write-Host "`nThe count of groups of the source" `
	"and destination users now match`n" -ForegroundColor green
}else{
	Write-Host "`nThe count of groups of the source" `
	"and destination users DO NOT match!`nIf the destination user" `
	"had some existing groups before, then this is expected" -ForegroundColor red
}

# Pausing the script so that the user can confirm everything is correct:
pause
exit
