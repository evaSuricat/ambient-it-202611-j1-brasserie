"use strict";

const listes = {
  biere: document.getElementById("liste-biere"),
  plat: document.getElementById("liste-plat"),
};
const contenu = document.getElementById("carte-contenu");
const erreur = document.getElementById("carte-erreur");

const prix = new Intl.NumberFormat("fr-FR", {
  minimumFractionDigits: 2,
  maximumFractionDigits: 2,
});

function creerLigne(plat) {
  const nom = document.createElement("span");
  nom.textContent = plat.nom;

  const description = document.createElement("span");
  description.textContent = plat.description;

  const montant = document.createElement("span");
  montant.className = "prix";
  montant.textContent = prix.format(plat.prix) + " €";

  const ligne = document.createElement("li");
  ligne.append(nom, " ", description, " ", montant);
  return ligne;
}

async function chargerCarte() {
  try {
    const reponse = await fetch("/api/cartes");
    if (!reponse.ok) {
      throw new Error("Réponse " + reponse.status);
    }
    const carte = await reponse.json();
    if (!Array.isArray(carte)) {
      throw new Error("Réponse inattendue");
    }
    for (const plat of carte) {
      if (listes[plat.categorie]) {
        listes[plat.categorie].append(creerLigne(plat));
      }
    }
    contenu.hidden = false;
  } catch (e) {
    console.error(e);
    erreur.hidden = false;
  }
}

chargerCarte();
