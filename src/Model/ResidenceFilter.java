package Model;

public class ResidenceFilter {
    private double priceLower = 0;
    private double priceBiggest = Double.MAX_VALUE;
    private String country = "%%";
    private String city = "%%";

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
}
