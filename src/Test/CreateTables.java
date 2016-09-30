package Test;

import Model.ResidenceType;
import Model.SaleType;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class CreateTables {
    public static void main (String args[]) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("PersistenceUnit");
        EntityManager manager = factory.createEntityManager();

        manager.getTransaction().begin();

        SaleType s1 = new SaleType();
        s1.setName("Venda");
        manager.persist(s1);
        SaleType s2 = new SaleType();
        s2.setName("Aluguel");
        manager.persist(s2);

        ResidenceType r1 = new ResidenceType();
        r1.setName("Residencial");
        manager.persist(r1);
        ResidenceType r2 = new ResidenceType();
        r2.setName("Comercial");
        manager.persist(r2);
        ResidenceType r3 = new ResidenceType();
        r3.setName("Rural");
        manager.persist(r3);

        manager.getTransaction().commit();
    }
}