package DAO;

import Model.User;
import java.util.List;
import javax.persistence.TypedQuery;

public class UserDAO extends CustomDAO<User> {
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

    public void add(User user) {
        manager.getTransaction().begin();
        User newuser = new User();
        newuser.setName(user.getName());
        newuser.setLastName(user.getLastName());
        newuser.setPassword(user.getPassword());
        newuser.setEmail(user.getEmail());
        manager.persist(newuser);
        manager.getTransaction().commit();
    }

    public User login(User user) {
        TypedQuery<User> query = manager.createQuery("SELECT u FROM User u WHERE Email LIKE :email AND Password LIKE :password", User.class);
        query.setParameter("email", user.getEmail());
        query.setParameter("password", user.getPassword());

        List<User> resultList = query.getResultList();
        if(resultList == null || resultList.isEmpty()) {
            return null;
        }
        return query.getSingleResult();
    }
}
