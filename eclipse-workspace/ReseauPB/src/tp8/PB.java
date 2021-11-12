package tp8;

import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;

public class PB {
	@SuppressWarnings("unused")
	public static void main(String[] args) {
		InetAddress addr;
		Socket client;
		try{
			client = new Socket("localhost", 4444);
		}catch(UnknownHostException e){
			e.printStackTrace();
		}catch(IOException ioe){
			System.out.println("erreur");
		}
	}
}
