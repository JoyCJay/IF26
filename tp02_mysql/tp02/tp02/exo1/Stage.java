package tp02.exo1;

public class Stage extends Element {
	
	private String entreprise;
	
	public Stage() {
		super();
		entreprise = "?";
	}
	
	public Stage(String sigle, String categorie, int credit, String entreprise, String resultat) {
		super(sigle, categorie, credit, resultat);
		this.entreprise = entreprise;
	}

	public String getEntreprise() {
		return entreprise;
	}

	public void setEntreprise(String entreprise) {
		this.entreprise = entreprise;
	}

	@Override
	public String toString() {
		return "Stage [sigle=" + super.getSigle()
			+ " categorie=" + super.getCategorie()
			+ " credit=" + super.getCredit()
			+ " resultat=" + super.getResultat()
			+ " entreprise=" + entreprise + "]";
	}

	public void affiche() {
		System.out.println(toString());
	}
}
