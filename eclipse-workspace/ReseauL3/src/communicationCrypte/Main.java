package communicationCrypte;

import java.util.Arrays;

public class Main {

	public static void main(String[] args) {
		
		System.out.println(16/8);
		
		
		Des d = new Des();
		String mess = "Message.secret";
		int[] messCrypte = d.crypte(mess);
		System.out.println("crypatage :" +messCrypte.toString());
		
		String messDeCrypte = d.decrypte(messCrypte);
		System.out.println("decrypatage :" + messDeCrypte);
		System.out.println();
		String mess2 = "Message@secret";
		int[] messCrypte2 = d.crypte(mess2);
		System.out.println("crypatage :" +messCrypte2.toString());
		
		String messDeCrypte2 = d.decrypte(messCrypte2);
		System.out.println("decrypatage :" + messDeCrypte2);

	
	
	}

}
