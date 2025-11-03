package RosesBlanches;
import java.util.Scanner;

public class RosesBlanches {
    public RosesBlanches(){
    }

       public static void main(String[] var0) {
      Scanner clavier = new Scanner(System.in);
      System.out.println("Combien avez-vous reçu d'argent (Frs) ? ");
      int montantInitial = clavier.nextInt();

    
      float LivresFournitures= (3*montantInitial)/4;
      float cafes= montantInitial;
      float FlashInfo = montantInitial;
      float BilletsMetro= montantInitial;
      float reste = montantInitial;
      System.out.println("Livre et Fournitures:"+LivresFournitures+" Frs.-");

      System.out.println("Vous pouvez ensuite acheter: "+800+" Frs.-");
      System.out.println(cafes+" cafés");
      System.out.println(FlashInfo+"numéros du Flah Informatique");
      System.out.println(BilletsMetro+"Billets de métro");
      System.out.println("Et il vous restera"+reste+" Frs.-");
      
      clavier.close();
   }

}
