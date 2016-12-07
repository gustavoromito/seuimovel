package Model;

public class ResidenceFilter {
    public static final int INVALID_INT_VALUE = -1;
    public static final String WHATEVER = "%%";

    private double priceLower = 0;
    private double priceBiggest = Double.MAX_VALUE;
    private String country = WHATEVER;
    private String city = WHATEVER;
    private String neighborhood = WHATEVER;
    private int bedsCount = INVALID_INT_VALUE;
    private int bathroomsCount = INVALID_INT_VALUE;
    private int suitesCount = INVALID_INT_VALUE;
    private int carSpotsCount = INVALID_INT_VALUE;

    public void setPrice(double priceLower, double priceBiggest) {
        this.priceLower = priceLower;
        this.priceBiggest = priceBiggest;
    }

    public double getPriceLower() {
        return priceLower;
    }

    public double getPriceBiggest() {
        return priceBiggest;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCity() {
        return city;
    }

    public int getBedsCount() {
        return bedsCount;
    }

    public int getBathroomsCount() {
        return bathroomsCount;
    }

    public int getSuitesCount() {
        return suitesCount;
    }

    public int getCarSpotsCount() {
        return carSpotsCount;
    }

    public String getNeighborhood() {
        return neighborhood;
    }

    public void setNeighborhood(String neighborhood) {
        this.neighborhood = neighborhood;
    }

    public void setBedsCount(int bedsCount) {
        this.bedsCount = bedsCount;
    }

    public void setBathroomsCount(int bathroomsCount) {
        this.bathroomsCount = bathroomsCount;
    }

    public void setSuitesCount(int suitesCount) {
        this.suitesCount = suitesCount;
    }

    public void setCarSpotsCount(int carSpotsCount) {
        this.carSpotsCount = carSpotsCount;
    }
}
