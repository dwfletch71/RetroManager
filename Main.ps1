#region PRE REQUREMENTS
[reflection.assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
[System.Windows.Forms.Application]::EnableVisualStyles()
#endregion

#region GLOBALS
[datetime]$global:gameDate = "2003-07-01 09:00"
#endregion


#region FUNCTIONS

Function MyFunction{
    $global:gameDate = $global:gameDate.AddHours(3) #"2003-07-01 09:30"
    $lblDatTime.Text =$global:gameDate.ToString("dddd dd/MM/yyyy HH:mm")
}

#endregion

#region FORM
$folderForm = New-Object System.Windows.Forms.Form
$folderForm.Text = "Retro Manager 03/04"
$styleFormBgCol = "black"
$folderForm.BackColor = $styleFormBgCol
$folderForm.Opacity = 0.99
$folderForm.Height = 600
$folderForm.Width = 1200
$folderForm.Icon = "D:\Documents\PShell\cm\Graphics\iconfinder_Soccer_2138356.ico"
#endregion

#region PANEL - MENU
$panMenu = New-Object system.Windows.Forms.Panel
$panMenu.height = 545
$panMenu.width = 80
$panMenu.BackColor = "#405477"
$panMenu.Location = New-Object System.Drawing.Point(5,5)
#endregion

#region PANEL - MAIN
$panMain = New-Object system.Windows.Forms.Panel
$panMain.height = 545
$panMain.width = 1090
$panMain.BackColor = "white"
$panMainImage = [system.drawing.image]::FromFile("D:\Documents\PShell\cm\Graphics\default.jpg")
$panMain.BackgroundImage = $panMainImage
$panMain.Location = New-Object System.Drawing.Point(90,5)
#endregion

#region MENU
$lblDatTime = New-Object System.Windows.Forms.Label
$lblDatTime.Text = $global:gameDate.ToString("dddd dd/MM/yyyy HH:mm")
$lblDatTime.ForeColor = "yellow"
$lblDatTime.Width = 78
$lblDatTime.Height = 50
$lblDatTime.AutoSize = false
$lblDatTime.TextAlign = "MiddleCenter"
$lblDatTime.location = New-Object System.Drawing.Point(1,5)
$lblDatTime.Font = 'Arial,8,style=Bold'

$btnCont = New-Object system.Windows.Forms.Button
$btnCont.text = "Continue"
$btnCont.ForeColor = "yellow"
$btnCont.width = 78
$btnCont.height = 50
$btnCont.location = New-Object System.Drawing.Point(1,60)
$btnCont.Font = 'Arial,10,style=Bold'

$btnMngr = New-Object system.Windows.Forms.Button
$btnMngr.text = $playerName
$btnMngr.ForeColor = "white"
$btnMngr.width = 78
$btnMngr.height = 50
$btnMngr.location = New-Object System.Drawing.Point(1,115)
$btnMngr.Font = 'Arial,8,style=Bold'

$btnComp = New-Object system.Windows.Forms.Button
$btnComp.text = "Competitions"
$btnComp.ForeColor = "white"
$btnComp.width = 78
$btnComp.height = 50
$btnComp.location = New-Object System.Drawing.Point(1,170)
$btnComp.Font = 'Arial,7.5,style=Bold'

$btnNatClub = New-Object system.Windows.Forms.Button
$btnNatClub.text = "Nations and Clubs"
$btnNatClub.ForeColor = "white"
$btnNatClub.width = 78
$btnNatClub.height = 50
$btnNatClub.location = New-Object System.Drawing.Point(1,225)
$btnNatClub.Font = 'Arial,8,style=Bold'

$btnExit = New-Object system.Windows.Forms.Button
$btnExit.text = "Exit"
$btnExit.ForeColor = "white"
$btnExit.width = 78
$btnExit.height = 50
$btnExit.location = New-Object System.Drawing.Point(1,490)
$btnExit.Font = 'Arial,10,style=Bold'
#endregion

$playerName = "Donny O'Fletch"
Write-Output "Current Player: "$playerName

#region END
$folderForm.controls.AddRange(@($panMenu,$panMain))
$panMenu.controls.AddRange(@($lblDatTime,$btnCont,$btnMngr,$btnComp,$btnNatClub,$btnExit))

$btnCont.Add_Click({ MyFunction })
$folderForm.CancelButton = $btnExit
$folderForm.ShowDialog()
#endregion

