import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class FileAChainageLineaireTest {

	FileAChainageLineaire t;
	
	@Before
	public void setUp() throws Exception {
		t = new FileAChainageLineaire();
	}

	@Test
	public void test1() {
		
		assertTrue(t.estVide());
		t.enfiler(2);
		assertFalse(t.estVide());
		assertEquals(t.tete.valeur,2);
		t.defiler();
		assertTrue(t.estVide());
	}
	
	@Test (expected = ExceptionFileVide.class)
	public void test2() throws ExceptionFileVide{
		t.premier();
	}
	
	@Test (expected = ExceptionFileVide.class)
	public void test3() throws ExceptionFileVide {
		t.defiler();
	}
	
	@Test
	public void test4() {
		
		t.enfiler("a");
		t.enfiler("b");
		t.enfiler("c");
		
		assertEquals(t.tete.valeur , "a");
		t.defiler();
		assertEquals(t.tete.valeur , "b");
		//t.defiler();
		//assertEquals(t.tete.valeur , "c");
		//assertTrue(t.estVide());
	}
}
