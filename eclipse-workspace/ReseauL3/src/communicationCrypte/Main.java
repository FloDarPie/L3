package communicationCrypte;
/*
public class Main {

	public static void main(String[] args) {

		Des d = new Des();
		String mess = "Message secret";
		System.out.println("Avant crypatage : "+mess);
		int[] messCrypte = d.crypte(mess);
		String messDeCrypte = d.decrypte(messCrypte);
		System.out.println("decrypatage :" + messDeCrypte);
		
		
		
		String mess2 = "azertyuiopqsdfghjklmwxcvbn  ?,.;/:!%*^$1234567890+=) -(&~ #{[|`\\^@]";
		System.out.println("Avant crypatage : "+mess2);
		int[] messCrypte2 = d.crypte(mess2);
		String messDeCrypte2 = d.decrypte(messCrypte2);
		System.out.println("decrypatage :" + messDeCrypte2);
		
	
	
	}
*/	
	
	
class LesTests{

	@SuppressWarnings("rawtypes")
	static Des monDes = new Des();

	
	public static boolean testStringToBit(String mess, int[] bit) {
		int[] tableau = monDes.stringToBit(mess); 
		for(int i = 0;i<tableau.length;i++) {
			if(tableau[i]!=bit[i]) {
				return false;
			}
		}
		return true;
	}

	public static boolean testBitToString(int[] bit, String mess) {
		String leMessage = monDes.bitToString(bit); 
		return leMessage.equals(mess);
	}
	
	public static boolean testSuiteBittoBloc(int[] liste, int[][] verif) {
		int[][] blocs = monDes.suiteBitToBloc(liste, monDes.sous_bloc);
		for (int i = 0; i < verif.length; i++) {
			for (int j = 0; j < verif[0].length; j++) {
				if (blocs[i][j] != verif[i][j]) {
					System.out.println(i+" "+j +'/'+blocs[i][j]+' '+verif[i][j]);
					return false;
				}
				
			}
		}
		
		return true;
	}

	public static boolean testPermutAvant(int[][] blocs, int[][] verif, int[] ref) {
		int[][] base = monDes.permutAvant(blocs, ref);
		for (int i = 0; i < verif.length; i++) {
			for (int j = 0; j < verif[0].length; j++) {
				if (base[i][j] != verif[i][j]) {
					return false;
				}
				
			}
		}
		
		return true;
	}
	
	public static boolean testPermutArriere(int[][] blocs, int[][] verif, int[] ref) {
		int[][] base = monDes.permutArriere(blocs, ref);
		for (int i = 0; i < verif.length; i++) {
			for (int j = 0; j < verif[0].length; j++) {
				if (base[i][j] != verif[i][j]) {
					return false;
				}
				
			}
		}
		
		return true;
	}
	
	public static boolean testSepareEnSousblocs(int[] liste, int[][] base) {
		int[][] blocs = monDes.separeEnSousblocs(liste);
		for (int i = 0; i < blocs.length; i++) {
			for (int j = 0; j < blocs[0].length; j++) {
				if (base[i][j] != blocs[i][j]) {
					System.out.println(blocs[i][j] +" "+ base[i][j]+" "+i+" " +j);
					return false;
				}
				
			}
			
		}
		return true;
	}
	
	public static boolean testSoudeSousblocs(int[][] blocs, int[] liste) {
		int[] base = monDes.soudeSousblocs(blocs);
		for (int i = 0; i < base.length; i++) {
			if (base[i] != liste[i]) {
				return false;
			}
		}
		
		return true;
	}
	
	public static boolean testXOR(int[] a, int[]b, int[] liste) {
		int[] base = monDes.XOR(a,b);
		for (int i = 0; i < base.length; i++) {
			if (base[i] != liste[i]) {
				System.out.println(base[i]+" "+ liste[i] + " " + i);
				return false;
			}
		}
		
		return true;
	}

}


class Main{
	public static void main(String[] args) {
		System.out.println("Test pour StringToBit :");
		int[] pour0 = {
				0,0,1,1,0,0,0,0
		};System.out.print(LesTests.testStringToBit("0",pour0)+" ");
		int[] pour1 = {
				0,0,1,1,0,0,0,1
		};System.out.print(LesTests.testStringToBit("1",pour1)+" ");
		int[] pour2 = {
				0,0,1,1,0,0,1,0
		};System.out.print(LesTests.testStringToBit("2",pour2)+" ");
		int[] poura = {
				0,1,1,0,0,0,0,1
		};System.out.print(LesTests.testStringToBit("a",poura)+" ");
		
		System.out.println("\n\nTest pour BitToString :");
		System.out.print(LesTests.testBitToString(pour0,"0")+" "+LesTests.testBitToString(pour1,"1")+" "+LesTests.testBitToString(pour2,"2")+" "+LesTests.testBitToString(poura,"a"));
		
		System.out.print("\n\nTest pour SuiteBittoBloc :");
		int[] liste = {
				0,1,1,1,0,0,1,1,0,1,
				1,0,0,0,0,1,0,1,1,0,
				1,1,0,0,0,1,1,1,0,1,
				0,1,
				0,1,1,1,0,1,0,0,0,0,
				0,0,0,0,0,0,0,0,0,0,
				0,0,0,0,0,0,0,0,0,0,
				0,0
		};
		int[][] blocs = {{
			0,1,1,1,0,0,1,1,0,1,
			1,0,0,0,0,1,0,1,1,0,
			1,1,0,0,0,1,1,1,0,1,
			0,1},{
			0,1,1,1,0,1,0,0,0,0,
			0,0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,0,
			0,0
		}};System.out.println(LesTests.testSuiteBittoBloc(liste, blocs));
		
		System.out.println("\nTest pour PermutAvant :");
		int[][] liste2 = {{
				0,0,0,1,1
		}};
		int[][] blocs2 = {{
				0,1,0,0,1
		}};
		int[] ref = { 1,4,3,2,5 };
		System.out.println(LesTests.testPermutAvant(liste2, blocs2, ref));
		
		System.out.println("\nTest pour PermutArriere :");
		int[][] liste3 = {{
				0,0,0,1,1
		}};
		int[][] blocs3 = {{
				0,1,0,0,1
		}};
		int[] ref2 = { 1,4,3,2,5 };
		System.out.println(LesTests.testPermutArriere(blocs3, liste3, ref2));
		
		System.out.println("\nTest pour Separe en Sousblocs :");
		System.out.println(LesTests.testSepareEnSousblocs(liste, blocs));
		
		System.out.println("\nTest pour Soude en Blocs :");
		System.out.println(LesTests.testSoudeSousblocs(blocs, liste));
		
		System.out.println("\nTest pour XOR :");
		int[] a = {
				1,1,0,0
		};
		int[] b = {
				1,0,1,0
		};
		int[] c = {
				0,1,1,0
		};
		System.out.println(LesTests.testXOR(a,b,c));
		
		
		System.out.println();
		
		System.out.println("Experimentation complete");
		@SuppressWarnings("rawtypes")
		Des d = new Des();
		String mess = "qwertyuioplkjhgfdsazxcvbnmMNBVCXZASDFGHJKLPOIUYTREWQ 87/896131531/*-+0!@#$%^&*()xv.nZ.r[db.g[db.>";
		System.out.println("depart : "+mess);
		int[] cryptage = d.crypte(mess);
		String decryptage = d.decrypte(cryptage);
		System.out.println("retour : "+decryptage);
		System.out.println("Deux chaines identiques ? :"+mess.equals(b));
	
	}

}


