package exercice1_ListeDinstruction;

import java.util.LinkedList;

import org.junit.Before;
import org.junit.Test;

public class ListeInstructionTest {
	
	LinkedList<String> t;
	
	@Before
	public void setUp() throws Exception {
		t = new LinkedList<String>();
	}

	@Test
	public void test() {
		t.add("Clear");
		System.out.println(t);
		t.add("CLEAR");
		System.out.println(t);
		t.add("DIM");
		System.out.println(t);
		t.add("PEEK");
		System.out.println(t);
		t.add("POKE");
		System.out.println(t);
		t.add("PRINT");
		System.out.println(t);
		t.add("flute");
		System.out.println(t);
		t.add("CLEAR");
		System.out.println(t);
	
	
	}

}
