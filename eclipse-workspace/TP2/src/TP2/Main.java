package TP2;

public class Main {

	public static void main(String[] args) {
		
		Expression a = new Expression("(((a+b)*c)+(a+d)*e)/(2*a)");
		Expression b = new Expression("((a+b)"); 
		Expression c = new Expression("(a+b)*c)");
		Expression d = new Expression("(a+b))*(c ");
		
		System.out.println(a.estCorrecte());
		System.out.println(b.estCorrecte());
		System.out.println(c.estCorrecte());
		System.out.println(d.estCorrecte());
		System.out.println();
		
		Expression aa = new Expression("e<-sommet(empiler(empiler(dépiler(empiler(pile_vide(),a)),b),c))\n");
		Expression bb = new Expression("(define (smallest L A)\n" + 
				"(cond ( (null? L) A)\n" + 
				"( (< (car L) A) (smallest (cdr L)(car L)))\n" + 
				"(else (smallest (cdr L) A ))\n" + 
				")\n" + 
				")\n");
		
		System.out.println(aa.estCorrecte());
		System.out.println(bb.estCorrecte());
		System.out.println();
		
		Expression aaa = new Expression("L[len(L)//2-1],L[len(l)//2]");
		Expression bbb = new Expression("$(’form div’).filter(’span .actif’).each(function() {\n" + 
				"$(this).bind(’click’, function() {\n" + 
				"$(this).prop(’disabled’, true);\n" + 
				"});\n" + 
				"});\n");
		
		System.out.println(aaa.estCorrecte());
		System.out.println(bbb.estCorrecte());
	
	}

}
