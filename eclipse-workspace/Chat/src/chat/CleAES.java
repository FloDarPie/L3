package chat;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;


public class CleAES {
	
	private KeyGenerator cleGen; 
	private SecretKey cleSecrete;
	
	
	public void genererCle() {
		try {cleGen = KeyGenerator.getInstance("AES");} catch (NoSuchAlgorithmException e) {System.out.println("L'AES existe pas"); e.printStackTrace();}
		SecureRandom alea = new SecureRandom();
		cleGen.init(256,alea);
		cleSecrete = cleGen.generateKey();
		String key = cleSecrete.getEncoded().toString();
		System.out.println(key);
	}
	
	public static IvParameterSpec generateIv() {
		byte[] initialVector = new byte[16];
		new SecureRandom().nextBytes(initialVector);
		return new IvParameterSpec(initialVector);
		
	}
	
	public String crypatage(String algo, String mes, IvParameterSpec initialVector) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException{
		Cipher cipher = Cipher.getInstance(algo);
		cipher.init(Cipher.ENCRYPT_MODE, this.cleSecrete, initialVector);
		byte[] cipherText = cipher.doFinal(mes.getBytes());
		return Base64.getEncoder().encodeToString(cipherText);
	}
	

	public String decrypatage(String algo, String mesCode,IvParameterSpec initialVector) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException{
		Cipher cipher = Cipher.getInstance(algo);
		cipher.init(Cipher.DECRYPT_MODE, this.cleSecrete, initialVector);
		byte[] mesDecrypte = cipher.doFinal(Base64.getDecoder().decode(mesCode));
		return new String(mesDecrypte);
	}
	
}
