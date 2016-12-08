package Test;

public class CreateTables {
    public static void main (String args[]) {
        SaleTypeSeed.seed();
        ResidenceTypeSeed.seed();
        ResidenceSeed.seed();
    }
}