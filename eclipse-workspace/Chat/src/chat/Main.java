package chat;

import javax.crypto.spec.IvParameterSpec;

public class Main {

	public static void main(String[] args) {
		//$ ip -br -c a (sur le pc serveur)
		Client client = new Client("192.168.23.194",55555);
		/*
		CleAES key = new CleAES();
		key.genererCle();
		String mes = "essai";
		String cripter = null;
		String decripter = null;
		try {cripter = key.crypatage(mes);} catch (Exception e) {e.printStackTrace();	}
		System.out.println(mes);
		System.out.println(cripter);
		try {decripter = key.decrypatage(cripter);} catch (Exception e) {e.printStackTrace();	}
		System.out.println(decripter);*/
	}
}
	

