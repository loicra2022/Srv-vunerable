#!/bin/bash

# Spécifiez le chemin du dossier temporaire Windows (par exemple, C:\Users\VotreNom\AppData\Local\Temp)
temp_dir="/mnt/c/Users/VotreNom/AppData/Local/Temp"

# Assurez-vous que le dossier temporaire est correctement monté
if [ -d "$temp_dir" ]; then
  # Supprimez les fichiers du dossier temporaire
  find "$temp_dir" -type f -exec rm -f {} \;
  echo "Nettoyage terminé."
else
  echo "Le dossier temporaire n'a pas été trouvé. Assurez-vous que le chemin est correct et que WSL est correctement configuré."
fi
