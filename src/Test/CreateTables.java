package Test;

public class CreateTables {
    public static void main (String args[]) {
        UserSeed.seed();
        PictureSeed.seed();
        SaleTypeSeed.seed();
        ResidenceTypeSeed.seed();
        ResidenceSeed.seed();
    }
}