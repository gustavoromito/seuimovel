package Test;

import DAO.ResidenceTypeDAO;
import Model.ResidenceType;

public class ResidenceTypeSeed {
    public static void main(String[] args) {
        seed();
    }

    static void seed() {
        ResidenceTypeDAO residenceTypeDAO = new ResidenceTypeDAO();
        residenceTypeDAO.removeAll();
        residenceTypeDAO.add(ResidenceType.TYPE_RESIDENTIAL);
        residenceTypeDAO.add(ResidenceType.TYPE_COMMERCIAL);
        residenceTypeDAO.add(ResidenceType.TYPE_RURAL);
    }
}
