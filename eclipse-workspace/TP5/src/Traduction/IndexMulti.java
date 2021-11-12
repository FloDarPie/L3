package Traduction;

import java.util.HashSet;
import java.util.Set;

public class IndexMulti {
	
	public HashSet<Chose> petits;
	public HashSet<Chose> jaunes;
	public HashSet<Chose> grands;
	public HashSet<Chose> carrés;
	
	public IndexMulti() {
		this.petits=new HashSet<Chose>();
		this.jaunes=new HashSet<Chose>();
		this.grands=new HashSet<Chose>();
		this.carrés=new HashSet<Chose>();
		
	}
	
	public void indexer(Chose s) {
		if(s.taille.equals(Chose.Taille.Grand))
			this.grands.add(s);
		else
			this.petits.add(s);
		if(s.couleur.equals(Chose.Couleur.jaune))
			this.jaunes.add(s);
		if(s.forme.equals(Chose.Forme.Carre))
			this.carrés.add(s);

	}
	

	
	public static void main(String[] args){
		IndexMulti im= new IndexMulti();
		
		im.indexer(new Chose("point", Chose.Taille.Petit, Chose.Forme.Rond, Chose.Couleur.Noir));
        im.indexer(new Chose("petit pois", Chose.Taille.Petit, Chose.Forme.Rond, Chose.Couleur.Vert));
        im.indexer(new Chose("soleil", Chose.Taille.Grand, Chose.Forme.Rond, Chose.Couleur.jaune));
        im.indexer(new Chose("pre", Chose.Taille.Grand, Chose.Forme.Carre, Chose.Couleur.Vert));
        im.indexer(new Chose("post-it", Chose.Taille.Petit, Chose.Forme.Carre, Chose.Couleur.jaune));
        im.indexer(new Chose("pneu", Chose.Taille.Grand, Chose.Forme.Rond, Chose.Couleur.Noir));
        
        Set<Chose> set1 = new HashSet<Chose>(im.petits) ;
        Set<Chose> set2 = new HashSet<Chose>(im.jaunes);

        set1.retainAll(set2);
        
        System.out.println(set1);
        
        Set<Chose> set3 = new HashSet<Chose>(im.grands) ;
        Set<Chose> set4 = new HashSet<Chose>(im.carrés);

        set3.removeAll(set4);
        
        System.out.println(set3);
   
	}
	
}
