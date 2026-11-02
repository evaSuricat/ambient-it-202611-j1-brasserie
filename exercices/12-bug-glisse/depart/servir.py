import json
import sqlite3
import sys
from http import HTTPStatus
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path

DOSSIER = Path(__file__).parent
BASE = DOSSIER / "carte.db"
HOTE = "127.0.0.1"


def lire_carte():
    # Ouverture en lecture seule : si carte.db manque, sqlite3 ne crée pas un fichier vide.
    with sqlite3.connect(f"{BASE.as_uri()}?mode=ro", uri=True) as c:
        c.row_factory = sqlite3.Row
        lignes = c.execute(
            "SELECT id, categorie, nom, description, prix FROM carte "
            "ORDER BY categorie, nom COLLATE NOCASE"
        ).fetchall()
    return [dict(l) for l in lignes]


class Gestionnaire(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(DOSSIER), **kwargs)

    def end_headers(self):
        self.send_header("Cache-Control", "no-store")
        super().end_headers()

    def do_GET(self):
        if self.path.split("?", 1)[0] == "/api/carte":
            self.repondre_carte()
        else:
            super().do_GET()

    def repondre_carte(self):
        try:
            corps, statut = lire_carte(), HTTPStatus.OK
        except sqlite3.Error as erreur:
            corps, statut = {"erreur": str(erreur)}, HTTPStatus.INTERNAL_SERVER_ERROR
        octets = json.dumps(corps, ensure_ascii=False).encode("utf-8")
        self.send_response(statut)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(octets)))
        self.end_headers()
        self.wfile.write(octets)


def main():
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 8000
    with ThreadingHTTPServer((HOTE, port), Gestionnaire) as serveur:
        print(f"Serveur prêt : http://{HOTE}:{port}/  (Ctrl+C pour arrêter)")
        try:
            serveur.serve_forever()
        except KeyboardInterrupt:
            print("\nServeur arrêté.")


if __name__ == "__main__":
    main()
