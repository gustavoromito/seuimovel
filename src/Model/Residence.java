package Model;

import javax.persistence.*;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.Locale;
import java.util.List;

/**
 * Created by antonio on 29/09/16.
 */
@Entity
public class Residence {
    private static final String PLEASE_MESSAGE = "Por favor, ";
    private static final String PLEASE_MESSAGE_INSERT = PLEASE_MESSAGE + "insira ";
    //Attributes (mapped into table columns)
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long Id;

    private double Latitude;

    private double Longitude;

    private String Address;

    private int Number;

    private double Price;

    private String ZipCode;

    private String Neighborhood;

    private int Suites;

    private String City;

    private String Country;

    @Temporal(TemporalType.DATE)
    private Calendar Created;

    private boolean Highlight;

    @Column(length = 10000000)
    private String Description;

    private double SquareFootage;

    private int Bathrooms;

    private double LotSize;

    private int Beds;

    private int CarSpots;

    @ManyToOne
    private User ResponsibleUser;

    @OneToMany
    private List<Picture> ResidencePictures = new LinkedList<Picture>();

    @OneToOne
    private ResidenceType Type;

    @OneToOne
    private SaleType SaleType;

    //Getters and Setters

    public long getId() {
        return Id;
    }

    public void setHighlight(boolean highlight) {
        Highlight = highlight;
    }

    public boolean isHighlighted() {
        return Highlight;
    }

    public void setCreated(Calendar created) {
        Created = created;
    }

    public Calendar getCreated() {
        return Created;
    }

    public void setLatitude(double latitude) {
        Latitude = latitude;
    }

    public double getLatitude() {
        return Latitude;
    }

    public void setLongitude(double longitude) {
        Longitude = longitude;
    }

    public double getLongitude() {
        return Longitude;
    }

    public void setPrice(double price) {
        Price = price;
    }

    public double getPrice() {
        return Price;
    }

    public void setLotSize(double lotSize) {
        LotSize = lotSize;
    }

    public double getLotSize() {
        return LotSize;
    }

    public void setSquareFootage(double squareFootage) {
        SquareFootage = squareFootage;
    }

    public double getSquareFootage() {
        return SquareFootage;
    }

    public void setNumber(int number) {
        Number = number;
    }

    public int getNumber() {
        return Number;
    }

    public void setBathrooms(int bathrooms) {
        Bathrooms = bathrooms;
    }

    public int getBathrooms() {
        return Bathrooms;
    }

    public void setBeds(int beds) {
        Beds = beds;
    }

    public int getBeds() {
        return Beds;
    }

    public void setSuites(int suites) {
        Suites = suites;
    }

    public int getSuites() {
        return Suites;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getAddress() {
        return Address;
    }

    public void setCity(String city) {
        City = city;
    }

    public String getCity() {
        return City;
    }

    public void setCountry(String country) {
        Country = country;
    }

    public String getCountry() {
        return Country;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getDescription() {
        return Description;
    }

    public void setNeighborhood(String neighborhood) {
        Neighborhood = neighborhood;
    }

    public String getNeighborhood() {
        return Neighborhood;
    }

    public void setCarSpots(int carSpots) {
        CarSpots = carSpots;
    }

    public int getCarSpots() {
        return CarSpots;
    }

    public void setZipCode(String zipCode) {
        ZipCode = zipCode;
    }

    public String getZipCode() {
        return ZipCode;
    }

    public User getResponsibleUser() {
        if (ResponsibleUser == null) {
            User responseUser = new User();
            responseUser.setEmail("");
            return responseUser;
        }
        return ResponsibleUser;
    }

    public void addPicture (Picture pic) {
        ResidencePictures.add(pic);
    }

    public List<Picture> getResidencePictures() {
        return ResidencePictures;
    }

    public void setType(Model.ResidenceType type) {
        Type = type;
    }

    public String getType() {
        return Type.getName();
    }

    public void setSaleType(Model.SaleType saleType) {
        SaleType = saleType;
    }

    public String getSaleType() {
        return SaleType.getName();
    }

    public String getAddressFull() {
        return getAddress() + ", " + getNumber() + " - " + getNeighborhood() + ", " + getCity() + " - " + getCountry();
    }

    public String getFormattedPrice() {
        DecimalFormat formatoDois = new DecimalFormat("##,###,###,##0.00", new DecimalFormatSymbols(new Locale("pt", "BR")));
        formatoDois.setMinimumFractionDigits(2);
        formatoDois.setParseBigDecimal(true);
        return "R$ " + formatoDois.format(this.getPrice());
    }

    public void setResponsibleUser(User responsibleUser) {
        ResponsibleUser = responsibleUser;
    }

    public Picture getPicture(int i) {
        List<Picture> residencePictures = getResidencePictures();
        if(residencePictures == null || i >= residencePictures.size()) {
            Picture picture = new Picture();
            picture.setPath("");
            return picture;
        }
        return residencePictures.get(i);
    }

    public Validation isValid() {
        Validation validation = new Validation();
        String message = null;

        double price = getPrice();
        if (price <= 0) {
            message = PLEASE_MESSAGE_INSERT + "um preço maior que zero.";
        } else if(getSaleType() == null){
            message = PLEASE_MESSAGE + "escolha se seu imóvel é para Venda ou Aluguel.";
        } else if (getType() == null) {
            message = PLEASE_MESSAGE + "escolha o tipo do seu imóvel.";
        } else if (getAddress() == null) {
            message = PLEASE_MESSAGE_INSERT + "a Rua.";
        } else if (getNeighborhood() == null) {
            message = PLEASE_MESSAGE_INSERT + "o Bairro.";
        } else if (getCity() == null) {
            message = PLEASE_MESSAGE_INSERT + "a Cidade.";
        } else if (getCountry() == null) {
            message = PLEASE_MESSAGE_INSERT + "o País.";
        } else if (getNumber() <= 0) {
            message = PLEASE_MESSAGE_INSERT + "o Número.";
        } else if (getDescription() == null) {
            message = PLEASE_MESSAGE_INSERT + "a Descrição";
        } else if (getBeds() <= 0) {
            message = PLEASE_MESSAGE_INSERT + "a quantidade de quartos.";
        } else if (getBathrooms() <= 0) {
            message = PLEASE_MESSAGE_INSERT + "o número de banheiros.";
        } else if (getResidencePictures().size() == 0) {
            message = PLEASE_MESSAGE_INSERT + "ao menos uma imagem.";
        }

        validation.setIsValid(message == null);
        validation.setMessage(message);
        return validation;
    }


}