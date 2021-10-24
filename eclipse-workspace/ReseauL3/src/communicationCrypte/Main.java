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
	static Des monDes = new Des();;
	
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
		System.out.print(LesTests.testBitToString(pour0,"0")+" ");
		System.out.print(LesTests.testBitToString(pour1,"1")+" ");
		System.out.print(LesTests.testBitToString(pour2,"2")+" ");
		System.out.print(LesTests.testBitToString(poura,"a")+"\n");
		
		
		
		@SuppressWarnings("rawtypes")
		Des d = new Des();
		int[] a = d.crypte("salut");
		d.decrypte(a);
		
	
	}

}


