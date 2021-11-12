package Hachage;

import static org.junit.Assert.*;


import org.junit.Before;
import org.junit.Test;

class TableHachageTest {

	TableHachage<String, String> table;
	
	@Before
	public void setUp() throws Exception {
		table = new TableHachage<String, String>();
		table.insererCouple("USB", "Universal Serial Bus");
		table.insererCouple("BIOS", "Basic Input Output System");
		table.insererCouple("IP", "Internet Protocol");
		table.insererCouple("BYTE", "storage unit for data");
		table.insererCouple("PC", "Personal Computer");
		table.insererCouple("MAC", "Media Access Control");
		table.insererCouple("ROM", "Read Only Memory ");
		table.insererCouple("CPU", "Central Processing unit");
	}

	@Test
	public void test() {
		
		System.out.println("Hello World");
		
		assertTrue(table.testerCle("BIOS"));
		assertTrue(table.testerCle("PC"));

		table.recupererValeur("BIOS");
		table.recupererValeur("PC");

	}
	
	@Test
	public void testMauvaisCouple() { 
		System.out.println("Hello World");
		
		assertFalse(table.testerCle("PCI")); 
		assertFalse(table.testerCle("PDF"));
	}

	@Test 
	public void testCleIntrouvable() { 
		System.out.println("Hello World");
		
		assertFalse(table.testerCle("WYSIWYG")); 

	}

	@Test (expected = ExceptionCleIntrouvable.class)
	public void testSupprimer() throws ExceptionCleIntrouvable { 
		System.out.println("Hello World");
		
		table.supprimerCouple("BYTE");
		table.testerCle("BYTE"); // --> ExceptionCleIntrouvable : OK !

	}

}
