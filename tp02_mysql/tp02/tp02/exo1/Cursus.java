package tp02.exo1;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;

public class Cursus implements Jury {
	ArrayList<Element> profil;

	public Cursus() {
		super();
		this.profil = new ArrayList<>();
	}
	
	public void ajoute(Element e) {
		profil.add(e);
	}
	
	@Override
	public String toString() {
		return "Cursus [profil=" + profil + "]";
	}

	public void affiche() {
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
