#!/bin/bash

# Nom du fichier Excel de sortie

output_excel_file="utilisateurs_ad.xlsx"

# Commande PowerShell pour récupérer la liste des utilisateurs AD et les exporter vers Excel

powershell_script=$(cat <<EOF
Import-Module ActiveDirectory
Get-ADUser -Filter * -Properties * |
Select-Object Name, SamAccountName, UserPrincipalName, Enabled, EmailAddress |
Export-Csv -NoTypeInformation -Path "C:\temp\users.csv"
EOF
)

# Exécution du script PowerShell

echo "$powershell_script" | powershell -command -

# Conversion du fichier CSV en Excel en utilisant PowerShell

powershell -command "Import-Csv 'C:\temp\users.csv' | Export-Excel -Path 'C:\temp\utilisateurs_ad.xlsx' -NoHeader"

# Déplacement du fichier Excel généré vers le répertoire de travail actuel

mv 'C:\temp\utilisateurs_ad.xlsx' ./$output_excel_file

# Nettoyage des fichiers temporaires

rm 'C:\temp\users.csv'

echo "Liste des utilisateurs Active Directory exportée vers $output_excel_file"
