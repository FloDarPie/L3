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
import javax.crypto.spec.SecretKeySpec;


public class CleAES {
	
	private KeyGenerator cleGen; 
	private SecretKey cleSecrete;
	private IvParameterSpec initialVector;
	private String algo= "AES/CBC/PKCS5Padding";
	
	public void setKey(String cleSecrete) {
		byte[] decodedKey = Base64.getDecoder().decode(cleSecrete);
		SecretKey originalKey = new SecretKeySpec(decodedKey, 0, decodedKey.length, "AES");
		this.cleSecrete = originalKey;
	}
	public void setIv(String initialVector) {
		byte[] vector = new byte[16];
		initialVector = initialVector.substring(1, initialVector.length()-1);
		initialVector.split(initialVector);
		
		this.initialVector = new IvParameterSpec(vector);
	}
	
	
	public void genererCle() {
		//construction de la clé
		try {cleGen = KeyGenerator.getInstance("AES");} catch (NoSuchAlgorithmException e) {System.out.println("L'AES existe pas"); e.printStackTrace();}
		SecureRandom alea = new SecureRandom();
		cleGen.init(256,alea);
		cleSecrete = cleGen.generateKey();
		
		//generation de l'initial vector
		byte[] initialVector = new byte[16];
		new SecureRandom().nextBytes(initialVector);
		this.initialVector = new IvParameterSpec(initialVector);
		
		
		String key = cleSecrete.getEncoded().toString();
		System.out.println(key);
	}
	
	/*
	public IvParameterSpec generateIv() {
		byte[] initialVector = new byte[16];
		new SecureRandom().nextBytes(initialVector);
		return new IvParameterSpec(initialVector);
		
	}
	*/
	public String crypatage(String mes) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException{
		Cipher cipher = Cipher.getInstance(this.algo);
		cipher.init(Cipher.ENCRYPT_MODE, this.cleSecrete, this.initialVector);
		byte[] cipherText = cipher.doFinal(mes.getBytes());
		return Base64.getEncoder().encodeToString(cipherText);
	}
	

	public String decrypatage(String mesCode) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException{
		Cipher cipher = Cipher.getInstance(this.algo);
		cipher.init(Cipher.DECRYPT_MODE, this.cleSecrete, this.initialVector);
		byte[] mesDecrypte = cipher.doFinal(Base64.getDecoder().decode(mesCode));
		return new String(mesDecrypte);
	}
	

}
