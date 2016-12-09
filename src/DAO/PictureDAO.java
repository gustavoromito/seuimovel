package DAO;

import Model.Picture;

import javax.persistence.TypedQuery;
import java.util.Calendar;
import java.util.List;

public class PictureDAO extends CustomDAO<Picture>{
    @Override
    public List<Picture> getAll() {
        TypedQuery<Picture> query = manager.createQuery("SELECT p FROM Picture p", Picture.class);
        return query.getResultList();
    }

    public void add(String path) {
        manager.getTransaction().begin();
        Picture picture = new Picture();
        picture.setPath(path);
        picture.setCreatedAt(Calendar.getInstance());
        manager.persist(picture);
        manager.getTransaction().commit();
    }
}
