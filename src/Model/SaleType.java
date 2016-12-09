package Model;

import javax.persistence.*;

/**
 * Created by antonio on 29/09/16.
 */
@Entity
public class SaleType {
    public static final String SELL_TYPE = "Venda";
    public static final String RENT_TYPE = "Aluguel";
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