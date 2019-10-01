package tp02.exo1;

public class Principale {
	public static void main(String[] args) {
		Cursus c = new Cursus();
		c.ajoute(new Module("IF26", "fil", 6, "?", "D"));
		c.ajoute(new Module("NF16", "branche", 4, "?", "B"));
		c.ajoute(new Stage("TN09", "stage", 30, "Orange", "C"));
//		System.out.println(c.excellence());
//		c.triParCredit();
//		c.triParResultat();
		c.affiche();
	}
}
