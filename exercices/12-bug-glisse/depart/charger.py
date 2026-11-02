import csv
import sqlite3
from pathlib import Path

DOSSIER = Path(__file__).parent
BASE = DOSSIER / "carte.db"
CSV = DOSSIER / "carte.csv"


def charger():
    with open(CSV, newline="", encoding="utf-8-sig") as f:
        lignes = [
            (l["categorie"], l["nom"], l["description"], float(l["prix"]))
            for l in csv.DictReader(f)
        ]

    with sqlite3.connect(BASE) as c:
        c.execute(
            """CREATE TABLE IF NOT EXISTS carte (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                categorie TEXT NOT NULL,
                nom TEXT NOT NULL,
                description TEXT NOT NULL,
                prix REAL NOT NULL
            )"""
        )
        c.execute("DELETE FROM carte")
        c.execute("DELETE FROM sqlite_sequence WHERE name = 'carte'")
        c.executemany(
            "INSERT INTO carte (categorie, nom, description, prix) VALUES (?, ?, ?, ?)",
            lignes,
        )
    return len(lignes)


if __name__ == "__main__":
    print(f"{charger()} lignes chargées dans {BASE.name}")
