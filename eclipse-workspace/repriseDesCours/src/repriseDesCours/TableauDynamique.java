package repriseDesCours;

import java.util.Vector;


public class TableauDynamique {

	public static char[] liste = {'a','b','c','d','e'};
	
	public static void main(String[] args) {
	

		Vector<Character> vector = new Vector<Character>();

	
		int ii = 500;
		
		for (int i=0;i<ii;i++) {
			vector.add(liste[(int)(Math.random()*liste.length)]);
			System.out.println(vector.size() + " - " + vector.capacity());
		}
		
		System.out.println(vector);
		
		int iii=300;
		
		for (int i=0; i<iii ; i++) {
			vector.remove(0);
			System.out.println(vector.size() + " - " + vector.capacity());
		
		}
	}

}
