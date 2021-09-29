package correction;

import java.util.Arrays;
import java.util.LinkedList;

@SuppressWarnings("serial")
public class ListeInstructions extends LinkedList<String> {

	public static String[] instructions = { "DIM", "PEEK", "POKE", "PRINT" };
	
	@Override
	public boolean add(String s) {
		if (s.equals("CLEAR")) {
			this.clear();
			return false;
		}
		if (Arrays.binarySearch(instructions, s) < 0) {
			throw new RuntimeException("Instruction invalide !");
		}
		//otherwise
		super.add(s);
		return true;
	}
}
