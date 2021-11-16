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

public class Main {
	
	public static void main(String[] args) throws IOException { 
	/*
	 * Configuration des informations sur le serveur de communication
	 */
		
	System.out.println("Lancement socket");
		Socket echoSocket = null;
		PrintWriter out = null;
		BufferedReader in = null;
	//System.out.println(InetAddress.getByName("calm-tiger-56.loca.lt"));
	try{
		InetAddress serveur = InetAddress.getByName("tender-moose-2.loca.lt");
		System.out.println(serveur);
		echoSocket = new Socket("193.34.76.44", 4444) ;
		out = new PrintWriter(echoSocket.getOutputStream()) ;
		in = new BufferedReader(new InputStreamReader(echoSocket.getInputStream())) ;
		System.out.println("Socket lancé");
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
	
	BufferedReader stdn = new BufferedReader(
			new InputStreamReader(System.in)
			);
	String userInput;
	
	while ((userInput = stdn.readLine()) != null){
		out.println(userInput);
		System.out.println("echo :" + in.readLine());
	}

	out.close();
	in.close();
	stdn.close();
	echoSocket.close();
	
	
	}
}


