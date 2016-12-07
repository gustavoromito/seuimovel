package Test;

import DAO.ResidenceDAO;

public class ResidenceSeed {
    public static void main (String args[]) {
        ResidenceDAO residenceDAO = new ResidenceDAO();
        residenceDAO.removeAll();
        residenceDAO.add("Rua Paula Rodrigues", 200.0, "Brasil", "São Paulo");
        residenceDAO.add("Rua Rogerio Carvalho", 100.0, "Brasil", "Osasco");
        residenceDAO.add("Rua Antonio João", 150.0, "Angola", "Cidade");
        residenceDAO.add("Rua Bernini", 201.0, "França", "Cidade");
        residenceDAO.add("Rua Michelangelo", 10.5, "Australia", "Cidade");
    }
}