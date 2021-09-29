package planificationVol.tour_de_contrôle;

import java.util.Queue;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentLinkedDeque;

public class TourContrôle {

	public static final int DELAI_REPONSE_TOUR_MS = 4000;
	public static final int INTERVALLE_MS = 1000;
	
	public Queue<Vol> fileAttente = new ConcurrentLinkedDeque<Vol>();
	
	public TourContrôle() {
		
		Timer avionsTimer = new Timer();
		avionsTimer.scheduleAtFixedRate(new NouvelAvion(this), 0, TourContrôle.INTERVALLE_MS);
		
		Timer tourTimer = new Timer();
		tourTimer.scheduleAtFixedRate(new DécisionTour(this), TourContrôle.DELAI_REPONSE_TOUR_MS, TourContrôle.INTERVALLE_MS);
	}

	public class NouvelAvion extends TimerTask {

		TourContrôle tour;
		
		public NouvelAvion(TourContrôle tc) {
			this.tour = tc;
		}
		
		@Override
		public void run() {
			this.tour.fileAttente.add(new Vol());
		}
	}
	
	public class DécisionTour extends TimerTask {

		TourContrôle tour;
		
		public DécisionTour(TourContrôle tc) {
			this.tour = tc;
		}
		
		@Override
		public void run() {
			System.out.println(this.tour);
			Vol v = this.tour.fileAttente.peek();
			v.atterrir();
			this.tour.fileAttente.remove();
		}	
	}

	public String toString() {
		return this.fileAttente.toString();
	}
	
	public static void main(String args[]) {
		new TourContrôle();
	}
	
	
}
