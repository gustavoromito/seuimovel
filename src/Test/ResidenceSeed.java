package Test;

import DAO.*;
import Model.Picture;
import Model.ResidenceType;
import Model.SaleType;
import Model.User;
import Utils.Utils;

import java.util.List;

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

        UserDAO userDao = new UserDAO();
        User userLuis = userDao.get("negao@ig.com");
        User userAntonio = userDao.get("tomcat@ig.com");
        User userRomito = userDao.get("roro@ig.com");

        PictureDAO pictureDAO = new PictureDAO();
        List<Picture> pictures = pictureDAO.getAll();
        residenceDAO.add(userLuis, sellSaleType, residentialType, 200.0, description, "Rua Paula Rodrigues", 126, "Jardim Piratininga", "São Paulo", "Brasil", 0, 5, 1, pictures.get(0));
        residenceDAO.add(userAntonio, sellSaleType, commercialType, 100.0, description, "Rua Rogerio Carvalho", 95, "Bairro Massa", "Osasco", "Brasil", 1, 0, 5, pictures.get(1));
        residenceDAO.add(userRomito, sellSaleType, ruralType, 150.0, description, "Rua Antonio João", 1000, "God of War", "Cidade", "Angola", 5, 2, 1, pictures.get(2));
        residenceDAO.add(userAntonio, rentSaleType, residentialType, 201.0, description, "Rua Bernini", 22, "BairrOpa", "Cidade", "Espanha", 2, 0, 2, pictures.get(3));
        residenceDAO.add(userRomito, rentSaleType, commercialType, 10.5, description, "Rua Michelangelo", 4545, "Teste", "Cidade", "Australia", 3, 1, 0, pictures.get(4));
    }
}