package chat;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Scanner;

public class Client {
	
	
	Boolean conditionArret(String message) {
		return message.toLowerCase().equals("bye");
	};
	
	Boolean baliseFin = true;
	Thread recevoir = null;
	Thread envoyer = null;
	Socket echoSocket = null;
	PrintWriter out  = null;
	BufferedReader in = null;
	final Scanner scanner = new Scanner(System.in);
	
	
	public void Quit() {
		System.out.println("#############################\n"
				+ "La connexion est fermée, au revoir.");
		System.exit(0) ;
	}
	
	/*
	 * Configuration des informations sur le serveur de communication
	 */
	public Client(String lien,	int port) {
		try {
	         //info serv
			System.out.println("Recherche du serveur");
	         echoSocket = new Socket(lien,port);
	         
	         //connexion
	         System.out.println("Lancement socket");
	         out = new PrintWriter(echoSocket.getOutputStream());
	         in = new BufferedReader(new InputStreamReader(echoSocket.getInputStream()));
	         
	         //discussion
	         System.out.println(
	        		    "#############################"
	         		+ "\n -- Initialisation du Chat --"
	         		+ "\n (quitter avec 'bye' )");
	         envoyer = new Thread(new Runnable() {
	             String message;
	              @Override
	              public void run() {
	                while(baliseFin){
	                	message = scanner.nextLine();
	                	out.println(message);
	                	out.flush();
	                if (conditionArret(message)) {
	                	Quit();}
	                }
	                
	             }
	         });
	         envoyer.start();
	   
	        recevoir = new Thread(new Runnable() {
	            String message;
	            @Override
	            public void run() {
	               try {
	            	 message = in.readLine();
	                 while(message!=null){
	                    System.out.println(message);
	                    if(conditionArret(message)) {
	                    	Quit();
	                    }
	                    message = in.readLine();
	                 }
	                 System.out.println("Serveur déconnecté");
	                 //recevoir.close();
	                 Quit();
	               } catch (IOException e) {
	                   e.printStackTrace();
	             }
	            }
	        });
	        recevoir.start();
	        /*
	        envoyer.join();
	        recevoir.join();
*/
	        
		}
		catch(UnknownHostException e){
			System.out.println("« Destination unknown »") ;
			System.exit(-1) ;
				}
		catch(SocketException e) {
			System.out.println("Fermeture du serveur");
		}
		catch(IOException u){
			System.out.println("« Le serveur est actuellement fermé »") ;
			System.out.println(u);
			System.exit(-1) ;
				} 
		/*
		catch (InterruptedException e) {
			System.out.println(e);
			System.out.println("Pas de fusion possible");
			System.exit(-1) ;
		}*/

	  }
}
	

