import java.util.Scanner;


public class ProgString1 {

	private static Scanner clavier = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		String s = clavier.nextLine();
		
		char c1 = s.charAt(0);
		char c2 = s.charAt(s.length()-1);
		
		System.out.println("En position 0 on a: "+c1);
		System.out.println("A la fin de la chaîne on a: "+c2);

	}

}
