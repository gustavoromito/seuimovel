package DAO;

import Model.*;

import javax.persistence.*;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

public class ResidenceDAO {

    private static final String PARAMETER_KEY_BED = "bed";
    private static final String PARAMETER_KEY_PRICE_LOWER = "priceLower";
    private static final String PARAMETER_KEY_PRICE_BIGGEST = "priceBiggest";
    private static final String PARAMETER_KEY_COUNTRY = "country";
    private static final String PARAMETER_KEY_CITY = "city";
    private static final String PARAMETER_KEY_BATHROOMS = "bathrooms";
    private static final String PARAMETER_KEY_CAR_SPOTS = "carSpots";
    private static final String PARAMETER_KEY_SUITES = "suites";
    private static final String PARAMETER_KEY_NEIGHBORHOOD = "neighborhood";
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
        String queryExpression = "SELECT r FROM Residence r WHERE " +
                "Price >= :" + PARAMETER_KEY_PRICE_LOWER +
                " AND Price <= :" + PARAMETER_KEY_PRICE_BIGGEST +
                " AND Country LIKE :" + PARAMETER_KEY_COUNTRY +
                " AND City LIKE :" + PARAMETER_KEY_CITY +
                " AND Neighborhood LIKE :" + PARAMETER_KEY_NEIGHBORHOOD;

        List<String> expressions = new LinkedList<>();
        addExpression(expressions, filter.getBedsCount(), "AND Beds = :" + PARAMETER_KEY_BED);
        addExpression(expressions, filter.getBathroomsCount(), "AND Bathrooms = :" + PARAMETER_KEY_BATHROOMS);
        addExpression(expressions, filter.getSuitesCount(), "AND Suites = :" + PARAMETER_KEY_SUITES);
        addExpression(expressions, filter.getCarSpotsCount(), "AND CarSpots = :" + PARAMETER_KEY_CAR_SPOTS);
        for (String expression : expressions) {
            queryExpression += " " + expression;
        }

        TypedQuery<Residence> query = manager.createQuery( queryExpression, Residence.class);
        Set<Parameter<?>> parameters = query.getParameters();
        for (Parameter parameter : parameters) {
            switch (parameter.getName()){
                case PARAMETER_KEY_PRICE_LOWER:
                    query.setParameter(PARAMETER_KEY_PRICE_LOWER, filter.getPriceLower());
                    break;
                case PARAMETER_KEY_PRICE_BIGGEST:
                    query.setParameter(PARAMETER_KEY_PRICE_BIGGEST, filter.getPriceBiggest());
                    break;
                case PARAMETER_KEY_COUNTRY:
                    query.setParameter(PARAMETER_KEY_COUNTRY, filter.getCountry());
                    break;
                case PARAMETER_KEY_CITY:
                    query.setParameter(PARAMETER_KEY_CITY, filter.getCity());
                    break;
                case PARAMETER_KEY_NEIGHBORHOOD:
                    query.setParameter(PARAMETER_KEY_NEIGHBORHOOD, filter.getNeighborhood());
                    break;
                case PARAMETER_KEY_BATHROOMS:
                    query.setParameter(PARAMETER_KEY_BATHROOMS, filter.getBathroomsCount());
                    break;
                case PARAMETER_KEY_SUITES:
                    query.setParameter(PARAMETER_KEY_SUITES, filter.getSuitesCount());
                    break;
                case PARAMETER_KEY_BED:
                    query.setParameter(PARAMETER_KEY_BED, filter.getBedsCount());
                    break;
            }
        }
        return query.getResultList();
    }

    private void addExpression(List<String> expressions, int value, String expression) {
        if (value != ResidenceFilter.INVALID_INT_VALUE) {
            expressions.add(expression);
        }
    }

    public void add(String address, double price, String country, String city, int bathroomsCount, int suitesCount, int bedsCount, String neighborhood) {
        manager.getTransaction().begin();
        Residence residence = new Residence();
        residence.setAddress(address);
        residence.setPrice(price);
        residence.setCountry(country);
        residence.setCity(city);
        residence.setBathrooms(bathroomsCount);
        residence.setSuites(suitesCount);
        residence.setBeds(bedsCount);
        residence.setNeighborhood(neighborhood);
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

    public Residence findById(long residence_id) {
        String queryExpression = "SELECT r FROM Residence r WHERE Id = ?";
        TypedQuery<Residence> query = manager.createQuery( queryExpression, Residence.class);
        query.setParameter(1, residence_id);
        List<Residence> resultList = query.getResultList();
        if (resultList.size() == 0) return null;
        return query.getSingleResult();
    }
}