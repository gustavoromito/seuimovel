package DAO;

import Model.ResidenceType;

import javax.persistence.TypedQuery;
import java.util.List;

public class ResidenceTypeDAO extends CustomDAO<ResidenceType>{

    private static final String PARAMETER_KEY_NAME = "name";

    public ResidenceTypeDAO() {
        super();
    }

    @Override
    public List<ResidenceType> getAll() {
        TypedQuery<ResidenceType> query = manager.createQuery("SELECT r FROM ResidenceType r", ResidenceType.class);
        return query.getResultList();
    }

    public void add(String name) {
        manager.getTransaction().begin();
        ResidenceType residenceType = new ResidenceType();
        residenceType.setName(name);
        manager.persist(residenceType);
        manager.getTransaction().commit();
    }

    public ResidenceType get(String name) {
        TypedQuery<ResidenceType> query = manager.createQuery("SELECT r FROM ResidenceType r WHERE Name = :" + PARAMETER_KEY_NAME, ResidenceType.class);
        query.setParameter(PARAMETER_KEY_NAME, name);
        return query.getSingleResult();
    }
}
