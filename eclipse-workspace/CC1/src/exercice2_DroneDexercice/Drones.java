package exercice2_DroneDexercice;

import java.util.Collection;
import java.util.Hashtable;


public class Drones {

	static String[] tabAgences = {"Drone2U place Gambetta Carmaux",
							"Heli-ome rue Joseph Rigal Gaillac",
							"TPD avenue Francois Verdier Albi",
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
							"Heli-ome place Stalingrad Lavaur",};
	

	@SuppressWarnings("null")
	public static String dronesEtudes(String[] tabAgences2) {
		
		Hashtable<String, Collection<String>> agences = new Hashtable<String, Collection<String>>();
		
		String[] tableau;
		Collection<String> destination = null;
				
				
		for(String i : tabAgences2) {
			tableau = i.split(" ");
			for(String b : tableau)
				System.out.println(b);
			if(agences.containsKey(tableau[0])) {
				Collection<String> d = agences.get(tableau[0]);
				d.add(tableau[tableau.length-1]);
				agences.replace(tableau[0], d);
				
			} else {
				destination.add(tableau[tableau.length-1]);
				agences.put(tableau[0],destination);
			}
					
		}
		
		String reponse = "";
		
		
		System.out.println(agences);
		
		return reponse;
	}
	
	
	
	
	public static void main(String[] args) {

		
		System.out.println(dronesEtudes(tabAgences));


	}

}
