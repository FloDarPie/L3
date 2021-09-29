package TP2;
import java.util.Stack;

public class Expression {
	public String expr;
	
	public Expression(String a) {
		this.expr=a;
	}
	
	public boolean estCorrecte() {
		
		Stack<Character> pile = new Stack<Character>();
		
		try {
			for (Character e : expr.toCharArray()) 
				if (e == '(' || e== '{' || e== '[')  
					pile.push(e);
				else if ( e == ')' || e== '}' || e== ']') 
					pile.pop();
				
			
		} catch(Exception e) {
			return false;
		}
		

		return pile.empty();
	}

}
