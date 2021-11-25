package chat;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;


public class CleAES {
	
	private KeyGenerator cleGen; 
	private SecretKey cleSecrete;
	
	public CleAES() {

		
	}
	
	public void genererCle() {
		try {cleGen = KeyGenerator.getInstance("AES");} catch (NoSuchAlgorithmException e) {System.out.println("L'AES existe pas"); e.printStackTrace();}
		SecureRandom alea = new SecureRandom();
		cleGen.init(256,alea);
		cleSecrete = cleGen.generateKey();
		String key = cleSecrete.getEncoded().toString();
		System.out.println(key);
		
	}
}
