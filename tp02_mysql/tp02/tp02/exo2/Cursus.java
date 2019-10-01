package tp02.exo2;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Observable;
import java.util.Observer;
import java.util.Set;

public class Cursus extends Observable implements Jury {
	private String nom;
	ArrayList<Element> profil;
	Set<Observer> observers;

	public Cursus() {
		super();
		this.profil = new ArrayList<>();
		this.observers = new HashSet<>();
	}
	
	public Cursus(String nom) {
		super();
		this.nom = nom;
		this.profil = new ArrayList<>();
		this.observers = new HashSet<>();
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public void ajoute(Element e) {
		profil.add(e);
		setChanged();
		notifyObservers();
	}
	
	public void notifyObservers(){
		for(Observer o : observers) {
			o.update(this, nom);
		}
	}
	
	public void addObserver(Observer o) {
		observers.add(o);
	}
	
	@Override
	public String toString() {
		return "Cursus de " + nom + ":";
	}

	public void affiche() {
		System.out.println(toString());
		Iterator<Element> it = profil.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
	}

	@Override
	public int excellence() {
		int sum = 0;
		for(Element e : profil) {
			String resultat = e.getResultat();
			switch(resultat) {
				case "A":
					sum += 18;
					break;
				case "B":
					sum += 16;
					break;
				case "C":
					sum += 14;
					break;
				case "D":
					sum += 12;
					break;
				case "E":
					sum += 10;
					break;
				case "FX":
					sum += -2;
					break;
				case "F":
					sum += -5;
					break;
				default:
					break;
			}
		}
		return sum;
	}

	@Override
	public void triParCredit() {
		profil.sort(new ElementTriCredit());
	}

	@Override
	public void triParResultat() {
		profil.sort(new Comparator<Element>(){
			public int compare(Element e1, Element e2) {
				return e1.resultatToInt() > e2.resultatToInt() ? 1 : -1;
			}
		});
	}
}
