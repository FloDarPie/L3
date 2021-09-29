package TP2;
import java.util.Stack;

public class ExpressionPostfixee {
	
	public String expr;
	
	public ExpressionPostfixee(String expr) {
		this.expr=expr;	
	}
	
	@SuppressWarnings("unused")
	public int evaluer() {
		
		Stack<Character> resultat = new Stack<Character>();
		
		String[] valeurs = {"1","2","3","4","5","6","7","8","9","0"};
		
		String add = "+";
		String sub = "-";
		String mul = "*";
		String div = "/";
		
		int chiffre = 0;
		
		for(Character chaar : expr.toCharArray()) {
			//identification de la valeurs
			int i = 0;
			while(valeurs[i] != chaar.toString()) 
				i++;
			chiffre = i;
			//
			
		}
			
		// gestion des parenthèses
		
		for(Character a : expr.toCharArray()) {
			int i =0;
			Character[] petitexpr = new Character[expr.length()];
			if(a == '(' || i !=0)
				i++;
		
			else if (a==')' && i!=0) {
				
			}
				
		}
			
		
		
				

		
		return 0;
	}

}
