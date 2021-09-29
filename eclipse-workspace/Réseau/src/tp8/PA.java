package tp8;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class PA {
	public static void main(String[] args) {
		ServerSocket server;
		Socket client;
		@SuppressWarnings("unused")
		BufferedReader in;
		PrintWriter out;
		
		try{
			server = new ServerSocket(4444);
			client = server.accept();
			in = new BufferedReader( new InputStreamReader( client.getInputStream() ) );
			out = new PrintWriter( client.getOutputStream(), true);
			out.write( "pineapple\n");

			
			System.out.println("aha!!");
		}
		catch(IOException i){
			System.out.println("Impossible d'écouter sur le port 4444: serait-il occupé?");
		}
	}
}
