package exercice2;

import org.junit.Before;
import org.junit.Test;

public class TableBijectiveTest {

	TableBijective<String, Integer> tbfr;
	
	@Before
	public void setUp() throws Exception {
		tbfr = new TableBijective<String, Integer>();
	}

	
	@Test 
	public void testAjouter() throws ExceptionCoupleExistant {
		tbfr.ajouter(null, 12345678);
	}

	
	@Test 
	public void testAjouterALaPelle() throws ExceptionCoupleExistant {
		tbfr.ajouter(" ", 0);
		tbfr.ajouter("!", 235);
		tbfr.ajouter("1", 16);
		tbfr.ajouter("F", 1247);
		tbfr.ajouter("q", 12345);
		
		
		
	}
	
	@Test (expected = ExceptionCoupleExistant.class)
	public void testAjouterErreur() throws ExceptionCoupleExistant {
		tbfr.ajouter(null, 12345678);
		tbfr.ajouter(null, 12345678);  //--> renvoie erreur
		
	}

}
