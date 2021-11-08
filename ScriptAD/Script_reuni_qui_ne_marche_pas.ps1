$nom = Read-Host "Merci de Rentrer le Nom et le Prénom de l’Utilisateur à Créer"

$login = Read-Host "Merci de Rentrer le Login de l’Utilisateur à Créer"

$mdp = Read-Host "Merci de Rentrer le Mot de Passe de l’Utilisateur à Créer"

New-ADUser -Name $nom -SamAccountName $login -UserPrincipalName $login@abstergo.g1 -AccountPassword (ConvertTo-SecureString -AsPlainText $mdp -Force) -PasswordNeverExpires $true -CannotChangePassword $true -Enabled $true


$groupe = Read-Host "Merci de Rentrer le nom du Groupe auquell l'utlisateur va etre ajoutée "
$prenom = Read-Host "Merci de rentrer le prenom de l'utilisateur a ajouter "

Add-ADGroupMember -identity $groupe -Members $prenom
Write-Host "L’Utilisateur $nom a Bien Eté Inséré dans le Groupe $groupe."