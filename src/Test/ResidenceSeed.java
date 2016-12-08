package Test;

import DAO.ResidenceDAO;

public class ResidenceSeed {
    public static void main (String args[]) {
        ResidenceDAO residenceDAO = new ResidenceDAO();
        residenceDAO.removeAll();
        residenceDAO.add("Rua Paula Rodrigues", 200.0, "Brasil", "São Paulo", 0, 5, 1, "Jardim Piratining");
        residenceDAO.add("Rua Rogerio Carvalho", 100.0, "Brasil", "Osasco", 1, 0, 5, "Bairro Massa");
        residenceDAO.add("Rua Antonio João", 150.0, "Angola", "Cidade", 5, 2, 1, "God of War");
        residenceDAO.add("Rua Bernini", 201.0, "Espanha", "Cidade", 2, 0, 2, "BairrOpa");
        residenceDAO.add("Rua Michelangelo", 10.5, "Australia", "Cidade", 3, 1, 0, "Teste");
    }
}