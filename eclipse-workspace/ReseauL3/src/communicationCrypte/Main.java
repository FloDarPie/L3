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

	static Des monDes = new Des();;
	
	public static boolean testStringToBit(String mess, int[] bit) {
		int[] tableau = monDes.stringToBit(mess); 
		return tableau.equals( bit );
	}

}


class Main{
	public static void main(String[] args) {
		int[] j = new int[1];
		j[0]=2;
		System.out.println(LesTests.testStringToBit("2",j));
	}

}


