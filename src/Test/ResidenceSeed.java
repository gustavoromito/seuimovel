package Test;

import DAO.ResidenceDAO;
import DAO.ResidenceTypeDAO;
import DAO.SaleTypeDAO;
import Model.ResidenceType;
import Model.SaleType;

public class ResidenceSeed {
    public static void main (String args[]) {
        seed();
    }

    static void seed() {
        ResidenceDAO residenceDAO = new ResidenceDAO();
        residenceDAO.removeAll();

        SaleTypeDAO saleTypeDAO = new SaleTypeDAO();
        SaleType sellSaleType = saleTypeDAO.get(SaleType.SELL_TYPE);
        SaleType rentSaleType = saleTypeDAO.get(SaleType.RENT_TYPE);

        ResidenceTypeDAO residenceTypeDAO = new ResidenceTypeDAO();
        ResidenceType residentialType = residenceTypeDAO.get(ResidenceType.TYPE_RESIDENTIAL);
        ResidenceType commercialType = residenceTypeDAO.get(ResidenceType.TYPE_COMMERCIAL);
        ResidenceType ruralType = residenceTypeDAO.get(ResidenceType.TYPE_RURAL);

        residenceDAO.add(sellSaleType, residentialType, "Rua Paula Rodrigues", 200.0, "Brasil", "São Paulo", 0, 5, 1, "Jardim Piratining");
        residenceDAO.add(sellSaleType, commercialType, "Rua Rogerio Carvalho", 100.0, "Brasil", "Osasco", 1, 0, 5, "Bairro Massa");
        residenceDAO.add(sellSaleType, ruralType, "Rua Antonio João", 150.0, "Angola", "Cidade", 5, 2, 1, "God of War");
        residenceDAO.add(rentSaleType, residentialType, "Rua Bernini", 201.0, "Espanha", "Cidade", 2, 0, 2, "BairrOpa");
        residenceDAO.add(rentSaleType, commercialType, "Rua Michelangelo", 10.5, "Australia", "Cidade", 3, 1, 0, "Teste");
    }
}