package Model;

import javax.persistence.*;

/**
 * Created by antonio on 29/09/16.
 */
@Entity
public class ResidenceType {
    public static final String TYPE_RESIDENTIAL = "Residencial";
    public static final String TYPE_COMMERCIAL = "Comercial";
    public static final String TYPE_RURAL = "Rural";
    //Attributes (mapped to table columns)
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long Id;
    @Column(unique = true)
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