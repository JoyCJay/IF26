package tp02.exo2;

public class Module extends Element {
	
	private String parcours;
	
	public Module() {
		super();
		parcours = "?";
	}

	public Module(String sigle, String categorie, int credit, String parcours, String resultat) {
		super(sigle, categorie, credit, resultat);
		this.parcours = parcours;
	}

	public String getParcours() {
		return parcours;
	}

	public void setParcours(String parcours) {
		this.parcours = parcours;
	}
	

	@Override
	public String toString() {
		return "Module [sigle=" + super.getSigle()
			+" categorie=" +super.getCategorie()
			+ " credit=" + super.getCredit()
			+ " resultat=" + super.getResultat()
			+ " parcours=" + parcours + "]";
	}

	public void affiche() {
		System.out.println(toString());
	}
}
