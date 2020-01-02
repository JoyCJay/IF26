package tp02.exo2;

import java.util.Comparator;

public class ElementTriCredit implements Comparator<Element> {

	@Override
	public int compare(Element e1, Element e2) {
		return e1.getCredit() > e2.getCredit() ? 1 : -1;
	}

}
