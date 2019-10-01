package tp02.exo2;

import java.util.Observable;
import java.util.Observer;

public class Prof implements Observer {
	
	private String nom;

	public Prof(String nom) {
		super();
		this.nom = nom;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	@Override
	public void update(Observable o, Object arg) {
		System.out.println("nom du prof: " + nom + " nom du cursus: " + arg);
	}

}
