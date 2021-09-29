package planificationVol.tour_de_contrôle;

import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;

public class Vol extends TimerTask{

	public static Random rng = new Random(); 
	
	String id;
	Integer carburant;
	private Timer consommeCarburant = new Timer();
	
	public Vol() {
		StringBuilder idb = new StringBuilder();
		idb.append((char)('A'+rng.nextInt(26))); 
		idb.append((char)('A'+rng.nextInt(26)));
		idb.append(99+rng.nextInt(900));
		this.id = idb.toString(); 
		this.carburant  = 4+rng.nextInt(5);
		//System.out.printf("Le vol %s est en approche. Carburant restant : %d\n", this.id, this.carburant);
		consommeCarburant.scheduleAtFixedRate(this, 1000, 1000);
	}
	
	@Override
	public void run() {
		this.carburant -= 1;
		if (this.carburant == 0) this.crasher();
		
	}

	public void crasher() {
		this.consommeCarburant.cancel();
		System.err.printf("Le vol %s s'est crashé !\n",this.id);
		//Arrêt de la simulation
		System.exit(-1);
	}
	
	public void atterrir() {
		this.consommeCarburant.cancel();
		//System.out.printf("Le vol %s a atterri\n", this.id);
	}
	
	public String toString() {
		return this.id+":"+this.carburant;
	}
	
}
