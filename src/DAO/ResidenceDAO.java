package DAO;

import Model.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.LinkedList;
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
                        "SELECT r FROM Residence r WHERE Price >= ? AND Price <= ? AND Country LIKE ?",
                        Residence.class);

        query.setParameter(1, filter.getPriceLower());
        query.setParameter(2, filter.getPriceBiggest());
        query.setParameter(3, filter.getCountry());

        return query.getResultList();
    }

    public void add(String address, double price, String country) {
        manager.getTransaction().begin();
        Residence residence = new Residence();
        residence.setAddress(address);
        residence.setPrice(price);
        residence.setCountry(country);
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