package Test;

import DAO.ResidenceDAO;
import DAO.ResidenceTypeDAO;
import DAO.SaleTypeDAO;
import Model.ResidenceType;
import Model.SaleType;
import Utils.Utils;

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

        String description = Utils.LOREM_IPSUM_DESCRIPTION;

        residenceDAO.add(sellSaleType, residentialType, 200.0, description, "Rua Paula Rodrigues", 126, "Jardim Piratininga", "São Paulo", "Brasil", 0, 5, 1);
        residenceDAO.add(sellSaleType, commercialType, 100.0, description, "Rua Rogerio Carvalho", 95, "Bairro Massa", "Osasco", "Brasil", 1, 0, 5);
        residenceDAO.add(sellSaleType, ruralType, 150.0, description, "Rua Antonio João", 1000, "God of War", "Cidade", "Angola", 5, 2, 1);
        residenceDAO.add(rentSaleType, residentialType, 201.0, description, "Rua Bernini", 22, "BairrOpa", "Cidade", "Espanha", 2, 0, 2);
        residenceDAO.add(rentSaleType, commercialType, 10.5, description, "Rua Michelangelo", 4545, "Teste", "Cidade", "Australia", 3, 1, 0);
    }
}