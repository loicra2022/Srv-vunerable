import socket

def check_server(host, port):
    try:
        # Créez une socket pour se connecter au serveur
        
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(2)  # Définir un délai pour la connexion
        sock.connect((host, port))
        print(f"Le port {port} est ouvert sur {host}")
        sock.close()
    except socket.error:
        print(f"Le port {port} est fermé sur {host}")

if __name__ == "__main__":
    
    # Spécifiez l'adresse IP du serveur et le port que vous souhaitez vérifier

    server_ip = "127.0.0.1"  # Remplacez par l'adresse IP réelle du serveur
    ports_to_check = [80, 443, 8080]  # Liste des ports à vérifier

    for port in ports_to_check:
        check_server(server_ip, port)
