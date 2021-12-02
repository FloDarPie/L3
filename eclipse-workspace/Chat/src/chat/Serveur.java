import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.MulticastSocket;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.concurrent.locks.ReentrantLock;

public class Server {

    private class Client {
        public Socket socket;
        public PrintWriter out;
        public BufferedReader in;
        
        public String name;
                
        Client(Socket s, String n){
            socket = s;
            try {
                out = new PrintWriter(socket.getOutputStream());
                in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            } catch (IOException error) { error.printStackTrace(); }
            name = n;
        }
    }

    // SOCKETS
    ServerSocket server = null;
    ArrayList<Client> clients = new ArrayList<Client>();
    
    int numberOfClients = 0;
    int clientCounter = 0;
    
    // MUTEX
    //ReentrantLock mutex = new ReentrantLock();
    
    // THREADS
    Thread connect = null;
    Thread send = null;
    Thread receive = null;
        
    final Scanner scanner = new Scanner(System.in);
    
    public Server() {
        // 1. definition du serveur
        try { server = new ServerSocket(55555); }
        catch(IOException error) { error.printStackTrace(); System.exit(-1); }
        System.out.println("Lancement du serveur!");
        
        // 2. connection des clients
        connect = new Thread(new Runnable() {
            @Override
            public void run() {
                while(true) {
                    try {
                        Socket socket = server.accept();
                        
                        Client client = new Client(socket, String.valueOf(clientCounter++));
                        clients.add(client);
                    } catch (IOException e) { e.printStackTrace(); }
                }
            }
        });
        connect.start();
        
        // 3. envoi de messages aux clients
        send = new Thread(new Runnable() {
            String message = "";
            @Override
            public void run() {
                while(true) {
                    message = scanner.nextLine();
                    System.out.println("pouet");
                    for (Client client : clients) {
                        client.out.println(message);
                        client.out.flush();
                    }
                }
            }
        });
        send.start();
        
        // 4. reception des message et envoi aux autres :
        receive = new Thread(new Runnable() {
            String message = "";
            @Override
            public void run() {
                while(true) {
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException e1) {
                        // TODO Auto-generated catch block
                        e1.printStackTrace();
                    }
                    for (Client client : clients) {
                        try {
                            message = client.in.readLine();
                            if(message != null) {
                                message = client.name + " : " + message;
                                
                                for (Client other_client : clients) {
                                    other_client.out.println(message);
                                    other_client.out.flush();
                                }
                                
                                System.out.println(message);
                            } else {
                                // supprimer le client!
                            }
                        } catch (IOException e) { e.printStackTrace(); }
                    }
                }
            }
        });
        receive.start();
    }
    
    public static void main(String[] args) {
        new Server();
    }
}
