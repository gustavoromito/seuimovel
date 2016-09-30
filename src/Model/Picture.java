package Model;

import javax.persistence.*;
import java.util.Calendar;

/**
 * Created by antonio on 29/09/16.
 */
@Entity
public class Picture {
    //Attributes (mapped into table columns)
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long Id;

    private String Path;

    @Temporal(TemporalType.DATE)
    private Calendar CreatedAt;

    //Getters and Setters
    public long getId() {
        return Id;
    }

    public void setCreatedAt(Calendar createdAt) {
        CreatedAt = createdAt;
    }

    public Calendar getCreatedAt() {
        return CreatedAt;
    }

    public void setPath(String path) {
        Path = path;
    }

    public String getPath() {
        return Path;
    }
}
