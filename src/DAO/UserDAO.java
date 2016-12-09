package DAO;

import Model.User;

import javax.persistence.TypedQuery;
import java.util.List;

public class UserDAO extends CustomDAO<User>{
    @Override
    public List<User> getAll() {
        TypedQuery<User> query = manager.createQuery("SELECT u FROM User u", User.class);
        return query.getResultList();
    }

    public void add(String email, String lastName, String name, String password) {
        manager.getTransaction().begin();
        User user = new User();
        user.setEmail(email);
        user.setLastName(lastName);
        user.setName(name);
        user.setPassword(password);
        manager.persist(user);
        manager.getTransaction().commit();
    }

    public User get(String emaill) {
        TypedQuery<User> query = manager.createQuery("SELECT u FROM User u WHERE Email LIKE ?", User.class);
        query.setParameter(1, emaill);
        return query.getSingleResult();
    }
}
