$login = Read-Host "Merci de Rentrer le Login de l’Utilisateur à Créer"

$mdp = Read-Host "Merci de Rentrer le Mot de Passe de l’Utilisateur à Créer"

New-ADUser -Name $nom -SamAccountName $login -UserPrincipalName $login@abstergo.g1 -AccountPassword (ConvertTo-SecureString -AsPlainText $mdp -Force) -PasswordNeverExpires $true -CannotChangePassword $true -Enabled $true
