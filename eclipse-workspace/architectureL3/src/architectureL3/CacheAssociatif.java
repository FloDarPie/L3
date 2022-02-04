package architectureL3;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class CacheAssociatif {

	int nombreLigne;
	int nombreEntre;
	int tailleBloc;
	int[] cache;

	public CacheAssociatif(int nombreLigne, int nombreEntre, int tailleBloc) {
		this.nombreLigne = (int) Math.pow(2,nombreLigne); //verifiez l'usage
		this.nombreEntre = nombreEntre; //verifiez l'usage
		this.tailleBloc = tailleBloc;

		System.out.println("Nombre de ligne :" + this.nombreLigne);

		this.cache = new int[2 ^ nombreLigne]; // 2^n lignes

	}
	
	public int convertirEnBit(String nombre) {
		int adresse = 0b0;
		
		String str = Integer.toString(Integer.parseInt(nombre), 2);
		
		System.out.println(str.length());
		
		System.out.println(str);
		
		for(int i = 1; i< str.length(); i++) {

			System.out.println(Integer.parseInt(str.substring(i-1, i)) * Math.pow(10, i));
			
			adresse += ( Integer.parseInt(str.substring(i-1, i)) * Math.pow(2, i));
			System.out.println(adresse);
			
			
			//entier / 2
		}
		
		
		String str2 = Integer.toString(Integer.parseInt(Integer.toString(adresse)), 2);
		System.out.println(str2);
		
		//adresse = Integer.parseInt(str);
		
		//adresse = 0b11001010;
		
		return adresse;
	}
	
	

	public void lecture_memorisation(String file) {
		// lecture ligne par ligne
		try (BufferedReader br = new BufferedReader(new FileReader(file))) {
			String line;
			while ((line = br.readLine()) != null) {
				String adresse = line.split(":")[0];
				System.out.println(line +" "+ adresse+" "+ convertirEnBit(adresse));
				break;
			}
		}

		catch (FileNotFoundException e) {System.out.println("Fichier non trouvé");e.printStackTrace();
		} catch (IOException e) {System.out.println("Erreur lors de la lecture");e.printStackTrace();}

		//memorisation de la ligne

		//ecriture dans le cache


	}


	public static void main(String[] args) {
		int nombreLigne = 4;
		int nombreEntre = 2;
		int tailleBloc = 32;
		CacheAssociatif monCache = new CacheAssociatif(nombreLigne, nombreEntre, tailleBloc);

		String chemin = "/home/flodarpie/Documents/Université/L3/S6/Architecture/cache/";
		String[] fichier = {"alea10.txt","matrice10.txt","matrice100.txt"};

		monCache.lecture_memorisation(chemin+fichier[0]);

	}

}
