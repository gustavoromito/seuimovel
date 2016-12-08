package DAO;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

public abstract class CustomDAO<T> {

    final EntityManager manager;

    CustomDAO(){
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("PersistenceUnit");
        manager = factory.createEntityManager();
    }

    public void removeAll() {
        manager.getTransaction().begin();
        List<T> things = getAll();
        for (T thing : things) {
            manager.remove(thing);
        }
        manager.getTransaction().commit();
    }

    public abstract List<T> getAll();
}
