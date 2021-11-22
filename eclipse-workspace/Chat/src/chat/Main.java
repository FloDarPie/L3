package chat;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;
import java.nio.Buffer;
import java.util.Scanner;

public class Main {
	
	public static void main(String[] args) throws IOException { 
	/*
	 * Configuration des informations sur le serveur de communication
	 */
	String lien = "192.168.206.194";
	int port = 4444;
		
		
		
	System.out.println("Lancement socket");
	Socket echoSocket = null;
	final PrintWriter out = null;
	BufferedReader in = null;
	
	//System.out.println(InetAddress.getByName("calm-tiger-56.loca.lt"));
	try{
		//connexion
		echoSocket = new Socket(lien, port) ;
		out = new PrintWriter(echoSocket.getOutputStream()) ;
		in = new BufferedReader(new InputStreamReader(echoSocket.getInputStream())) ;
		System.out.println("Socket lancé");
		//discussion
		Scanner mess = new Scanner(System.in);
		Thread envoi = new Thread(new Runnable() {
			String msg;
			@Override
			public void run() {
				while(true) {
					msg = mess.nextLine();
					out.println(msg);
					out.flush();
				}
			}
			
		});
	}
	catch(UnknownHostException e){
		System.out.println("« Destination unknown »") ;
		System.exit(-1) ;
			}
	catch(IOException u){
		System.out.println(u);
		System.out.println("« now to investigate this IO issue »") ;
		System.exit(-1) ;
			}
	
	System.out.println("////////\nInitialisation du Chat :");
	
	BufferedReader stdn = new BufferedReader(
			new InputStreamReader(System.in)
			);
	String userInput;
	
	while ((userInput = stdn.readLine()) != null){
		out.println(userInput);
		System.out.println("inconnu :" + in.readLine());
	}

	out.close();
	in.close();
	stdn.close();
	echoSocket.close();
	
	
	}
}


