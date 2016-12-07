package DAO;

import Model.*;

import javax.persistence.*;
import java.util.List;

public class ResidenceDAO {

    private final EntityManager manager;

    public ResidenceDAO() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("PersistenceUnit");
        manager = factory.createEntityManager();
    }

    public List<Residence> findAll() {
        TypedQuery<Residence> query = manager.createQuery( "SELECT r FROM Residence r", Residence.class);
        return query.getResultList();
    }

    public List<Residence> get(ResidenceFilter filter) {
        TypedQuery<Residence> query = manager
                .createQuery(
                        "SELECT r FROM Residence r WHERE Price >= ? AND Price <= ? AND Country LIKE ? AND City = ?",
                        Residence.class);

        query.setParameter(1, filter.getPriceLower());
        query.setParameter(2, filter.getPriceBiggest());
        query.setParameter(3, filter.getCountry());
        query.setParameter(4, filter.getCity());

        return query.getResultList();
    }

    public void add(String address, double price, String country, String city) {
        manager.getTransaction().begin();
        Residence residence = new Residence();
        residence.setAddress(address);
        residence.setPrice(price);
        residence.setCountry(country);
        residence.setCity(city);
        manager.persist(residence);
        manager.getTransaction().commit();
    }

    public void removeAll() {
        manager.getTransaction().begin();
        List<Residence> residences = findAll();
        for (Residence residence : residences) {
            manager.remove(residence);
        }
        manager.getTransaction().commit();
    }
}