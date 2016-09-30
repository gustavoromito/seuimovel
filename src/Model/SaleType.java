package Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by antonio on 29/09/16.
 */
@Entity
public class SaleType {
    //Attributes (mapped to table columns)
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long Id;

    private String Name;

    //Getters and Setters
    public long getId() {
        return Id;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getName() {
        return Name;
    }
}