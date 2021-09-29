package exercice1_ListeDinstruction;

import java.util.LinkedList;

public class ListeInstruction extends LinkedList<String>{
	
	
	String[] instructions = {"DIM", "PEEk", "POKE", "PRINT"} ;
	
	
	@Override
	public boolean add(String s) {
		
		String flag = "false";
		
		if(s=="CLEAR") {
			flag="clear";
		}
			
		else {
			for(String i : this.instructions) {
				if(i==s) 
					flag = "true";
			}
		}
		try {
			if (flag=="true" || flag == "Clear") {
				switch (flag) {
				case "Clear":
					this.instructions = null;
					break;
					
				default:
					super.add(s);
					break;
				}
			}
				
		} catch (Exception e) {
			return false;
		}

		
			
		
		return true;
		
	}

}
