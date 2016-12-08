package Model;

import javax.persistence.*;
import java.util.Collection;
import java.util.LinkedList;

@Entity
public class User {
    //Attributes (mapped into table columns)
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long Id;

    private String Email;

    private String Password;

    private String Name;

    private String LastName;

    @OneToMany (mappedBy = "ResponsibleUser")
    private Collection<Residence> AdvertisedResidences = new LinkedList<Residence>();

    @ManyToMany
    private Collection<Residence> InterestingResidences = new LinkedList<Residence>();

    @ManyToMany
    private Collection<Residence> FavoriteResidences = new LinkedList<Residence>();

    //Getters and Setters
    public long getId() {
        return Id;
    }

    public void setEmail(String email) {
        this.Email = email;
    }

    public String getEmail() {
        return Email;
    }

    public void setPassword(String password) {
        this.Password = password;
    }

    public String getPassword() {
        return Password;
    }

    public void setName(String name) {
        this.Name = name;
    }

    public String getName() {
        return Name;
    }

    public void setLastName(String lastName) {
        this.LastName = lastName;
    }

    public String getLastName() {
        return LastName;
    }

    public void addAdvertisedResidence (Residence newResidence) {
        AdvertisedResidences.add(newResidence);
    }

    public Collection<Residence> getAdvertisedResidences() {
        return AdvertisedResidences;
    }

    public void addInterestingResidence (Residence newResidence) {
        AdvertisedResidences.add(newResidence);
    }

    public Collection<Residence> getInterestingResidences() {
        return InterestingResidences;
    }

    public void addFavoriteResidence (Residence newResidence) {
        FavoriteResidences.add(newResidence);
    }

    public Collection<Residence> getFavoriteResidences() {
        return FavoriteResidences;
    }
}