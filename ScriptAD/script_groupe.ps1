

$groupe = Read-Host "Merci de Rentrer le nom du Groupe auquell l'utlisateur va etre ajoutée "
$prenom = Read-Host "Mersi de rentrer le prenom de l'utilisateur a ajouter "

Add-ADGroupMember -identity $groupe -Members $prenom
Write-Host "L’Utilisateur $nom a Bien Eté Inséré dans le Groupe $groupe."