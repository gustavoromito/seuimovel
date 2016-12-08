package DAO;

import Model.SaleType;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.util.List;

public class SaleTypeDAO extends CustomDAO<SaleType>{

    private static final String PARAMETER_KEY_NAME = "name";
    private final EntityManager manager;

    public SaleTypeDAO() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("PersistenceUnit");
        manager = factory.createEntityManager();
    }

    public SaleType get(String name) {
        TypedQuery<SaleType> typedQuery = manager.createQuery("SELECT s FROM SaleType s WHERE Name = :" + PARAMETER_KEY_NAME, SaleType.class);
        typedQuery.setParameter(PARAMETER_KEY_NAME, name);
        return typedQuery.getSingleResult();
    }

    @Override
    public List<SaleType> getAll() {
        TypedQuery<SaleType> query = manager.createQuery("SELECT s FROM SaleType s", SaleType.class);
        return query.getResultList();
    }

    public void add(String name) {
        manager.getTransaction().begin();
        SaleType saleType = new SaleType();
        saleType.setName(name);
        manager.persist(saleType);
        manager.getTransaction().commit();
    }

}
