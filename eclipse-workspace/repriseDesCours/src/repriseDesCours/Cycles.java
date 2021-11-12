package repriseDesCours;



public class Cycles {	
	
	public static void main(String[] args) {
		
		String[] libellés = {"er","nd","ème"};
		int[] durées = {3,2,3};
		
		for (int i = 0; i<libellés.length;i++ ) {
			String s1 = String.format("Le %d%s cycle universitaire dure %d ans.", i+1,libellés[i],durées[i]);
			System.out.println(s1);
		}
		
	}
}
