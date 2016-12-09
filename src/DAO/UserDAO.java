package DAO;

import Model.*;
import javax.persistence.*;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
/**
 * Created by antonio on 08/12/16.
 */
public class UserDAO {
    private final EntityManager manager;

    public UserDAO() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("PersistenceUnit");
        manager = factory.createEntityManager();
    }

    public void add (User user) {
        manager.getTransaction().begin();
        User newuser = new User();
        newuser.setName(user.getName());
        newuser.setLastName(user.getLastName());
        newuser.setPassword(user.getPassword());
        newuser.setEmail(user.getEmail());
        manager.persist(newuser);
        manager.getTransaction().commit();
    }
}
