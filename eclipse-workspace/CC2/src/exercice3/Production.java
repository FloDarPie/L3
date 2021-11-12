package exercice3;

public class Production implements Comparable<Integer>{
	
	String pays;
	Integer superficie;
	
	public Production(String s, Integer i) {
		this.pays=s;
		this.superficie=i;
	}
	
	/*
	public int compareTo(Production p) {
		return this.superficie-p.superficie;
	}
	*/

	@Override
	public int compareTo(Integer arg0) {
		return this.superficie-arg0;
	}
	
}
