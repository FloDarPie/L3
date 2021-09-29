package tp8;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;

public class P2 {
	
	public static void main(String[] args) {
			InetAddress addr;
			try{
				addr = InetAddress.getByName("127.0.1.1");
				if(addr.isReachable(1000)) 
					System.out.println("Node 127.0.1.1 is reachable!!");
			}catch(UnknownHostException e){
				e.printStackTrace();
			}catch(IOException i){
				i.printStackTrace();
				}
	}
}
