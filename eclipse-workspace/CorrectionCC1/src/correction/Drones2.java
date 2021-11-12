package correction;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

public class Drones2 {
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void main(String[] args) {

		String[] tabAgences = {
				"Drone2U place Gambetta Carmaux", 
				"Heli-ome rue Joseph Rigal Gaillac",
				"TPD avenue François Verdier Albi",
				"Drone2U avenue Victor Hugo Graulhet",
				"Heli-ome rue Marcel Ricard Albi",
				"TPD avenue Jean Calvet Gaillac", 
				"Drone2U avenue de Toulouse Mazamet",
				"Drone2U rue des Cordonniers Rabastens",
				"TPD rue Sabatier Castres",
				"TPD avenue Lieutenant Jacques Desplat Castres",
				"Heli-ome rue Victor Hugo Castres",
				"TPD boulevard du Languedoc Mazamet",
				"TPD avenue du Colonel Teyssier Albi",
				"Drone2U boulevard Montebello Albi",
				"Heli-ome place Stalingrad Lavaur",
		};

		//Q1 (1) Déclaration d'un dictionnaire
		HashMap<String, Set<String>> agences = new HashMap<String, Set<String>>();
		
		//Q2 (3) Remplissage à partir des données dans le tableau.
		//Alternativement, construction à la main.
		for (String a : tabAgences) {
			String[] parts = a.split(" ");
			String sct = parts[0];
			String ville = parts[parts.length-1];
			if (!agences.containsKey(sct)) agences.put(sct, new HashSet());
			agences.get(sct).add(ville);
		}
		System.out.println(agences);
		

		//Q3 Villes desservies (de préférence par ordre alphabétique)
		Set<String> villes = new TreeSet<String>();
		for (Set<String> v : agences.values()) {
			villes.addAll(v);
		}
		System.out.println(villes);

		//Q4 (2) Villes desservies par Drone2U mais pas TPD
		Set<String> villesTPD = agences.get("TPD");
		Set<String> villesDrone2U = agences.get("Drone2U");
		villesDrone2U.removeAll(villesTPD);
		System.out.println(villesDrone2U);

		//Q5 (2) Calcul du max 
		String agencesMax = null;
		for (String k : agences.keySet()) {
			if (agencesMax == null || agences.get(k).size()>agences.get(agencesMax).size()) {
				agencesMax = k;
			}
		}
		System.out.printf("%s est présente dans %d villes.\n",agencesMax, agences.get(agencesMax).size());

	}

}
