package tp02.exo2;

public class Principale {
	public static void main(String[] args) {
		Cursus sandra = new Cursus("Sandra");
		Cursus amelie = new Cursus("Am¨¦lie");
		Prof michael = new Prof("Michael");
		Prof marc = new Prof("Marc");
		
		sandra.addObserver(michael);
		sandra.addObserver(marc);
		amelie.addObserver(marc);
		
		sandra.ajoute(new Module("IF26", "fil", 6, "?", "D"));
		sandra.ajoute(new Module("NF16", "branche", 4, "?", "B"));
		sandra.ajoute(new Stage("TN09", "stage", 30, "Orange", "C"));
		amelie.ajoute(new Module("IF11", "fil", 6, "?", "C"));
//		System.out.println(c.excellence());
//		c.triParCredit();
//		c.triParResultat();
		sandra.affiche();
	}
}
