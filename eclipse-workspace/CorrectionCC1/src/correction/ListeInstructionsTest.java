package correction;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

	public class ListeInstructionsTest {

		ListeInstructions l;
		
		@Before
		public void setUp() throws Exception {
			l = new ListeInstructions();
		}

		@Test
		public void test() {
			l.add("POKE");
			l.add("PEEK");
			assertEquals(l.peekFirst(), "POKE");
		}
		
		@Test (expected=RuntimeException.class)
		public void test2() {
			l.add("PORK");
		}

		@Test
		public void testClear() {
			l.add("POKE");
			l.add("PEEK");
			l.add("CLEAR");
			l.add("PRINT");
			assertEquals(l.peekFirst(), "PRINT");
		}
	}

