package tp02.exo2;

public abstract class Element {
	private String sigle;
	private String categorie;
	private int credit;
	private String resultat;
	
	public Element() {
		super();
		sigle = "?";
		categorie = "?";
		credit = 0;
		resultat = "ABS";
	}

	public Element(String sigle, String categorie, int credit, String resultat) {
		super();
		this.sigle = sigle;
		this.categorie = categorie;
		this.credit = credit;
		this.resultat = resultat;
	}

	public String getSigle() {
		return sigle;
	}

	public void setSigle(String sigle) {
		this.sigle = sigle;
	}

	public String getCategorie() {
		return categorie;
	}

	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public String getResultat() {
		return resultat;
	}

	public void setResultat(String resultat) {
		this.resultat = resultat;
	}
	
	public int resultatToInt() {
		int sum = 0;
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
		return sum;
	}

	@Override
	public String toString() {
		return "Element [sigle=" + sigle + ", categorie=" + categorie + ", credit=" + credit + "]";
	}
	
	public void affiche() {
		System.out.println(toString());
	}
}
