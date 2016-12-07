package Test;

import DAO.ResidenceDAO;

public class ResidenceSeed {
    public static void main (String args[]) {
        ResidenceDAO residenceDAO = new ResidenceDAO();
        residenceDAO.removeAll();
        residenceDAO.add("Rua Paula Rodrigues", 200.0, "Brasil");
        residenceDAO.add("Rua Bernini", 201.0, "França");
    }
}