package communicationCrypte;

public class Main {

	Des monDes;
	
	public boolean testStringToBit(String mess, int[] bit) {
		this.monDes = new Des();
		int[] tableau = monDes.stringToBit(mess); 
		return tableau.equals( bit );
	}
		
	
	
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

}
