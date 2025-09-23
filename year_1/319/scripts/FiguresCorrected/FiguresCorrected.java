package FiguresCorrected;

class FiguresCorrected {
	public static void main(String[] args) {
            // 1.
            for (int i = 1; i <= 9; i=i+1) { 
                System.out.print(i);
			}
             
             System.out.println("\n");
             
             // 2.
             for (int j = 1 ; j <= 9; j=j+1) { 
            	 for (int i = 1; i <= 9; i=i+1) {
             
                     System.out.print(i);
                 }
                 System.out.println();
             }
             System.out.println();
             
             // 3.
             for (int j = 1; j <= 9; j=j+1) {
            	 for (int i = 1; i <= j; i=i+1) { 
                     System.out.print(i);
            	 }
            	 System.out.println();
             }
             System.out.println();
         
             // 4.
             for (int j = 1; j <= 9; j=j+1) {
            	 for (int i = 1; i <= (9-j); i=i+1) {
                     	System.out.print(" ");
                 }
            	 for (int i = 1; i <= j; i=i+1) { 
            		 System.out.print(i);
            	 }
            	 System.out.println();
         }
             System.out.println();
    }
}
             