package Test;

import DAO.SaleTypeDAO;
import Model.SaleType;

class SaleTypeSeed {

    public static void main(String[] args) {
        seed();
    }

    static void seed() {
        SaleTypeDAO saleTypeDAO = new SaleTypeDAO();
        saleTypeDAO.removeAll();
        saleTypeDAO.add(SaleType.SELL_TYPE);
        saleTypeDAO.add(SaleType.RENT_TYPE);
    }
}
