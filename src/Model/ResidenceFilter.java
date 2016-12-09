package Model;

public class ResidenceFilter {
    public static final int INVALID_INT_VALUE = -1;
    private static final String WHATEVER = "%%";
    private static final double PRICE_LOWER_DEFAULT = 0;
    private static final double PRICE_BIGGEST_DEFAULT = Double.MAX_VALUE;

    private double priceLower = PRICE_LOWER_DEFAULT;
    private double priceBiggest = PRICE_BIGGEST_DEFAULT;
    private String country = WHATEVER;
    private String city = WHATEVER;
    private String neighborhood = WHATEVER;
    private String address = WHATEVER;
    private int bedsCount = INVALID_INT_VALUE;
    private int bathroomsCount = INVALID_INT_VALUE;
    private int suitesCount = INVALID_INT_VALUE;
    private int carSpotsCount = INVALID_INT_VALUE;
    private int saleTypeId;
    private int residenceTypeId;

    public void setPrice(double priceLower, double priceBiggest) {
        if (priceLower == INVALID_INT_VALUE) {
            priceLower = 0;
        }
        if (priceBiggest == INVALID_INT_VALUE) {
            priceBiggest = PRICE_BIGGEST_DEFAULT;
        }
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
        return getStringLike(country);
    }

    public void setCountry(String country) {
        if (country == null || country.isEmpty()) {
            country = WHATEVER;
        }
        this.country = country;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCity() {
        return getStringLike(city);
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
        return getStringLike(neighborhood);
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

    public void setSaleTypeId(int saleTypeId) {
        this.saleTypeId = saleTypeId;
    }

    public int getSaleTypeId() {
        return saleTypeId;
    }

    public void setResidenceTypeId(int residenceTypeId) {
        this.residenceTypeId = residenceTypeId;
    }

    public int getResidenceTypeId() {
        return residenceTypeId;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return getStringLike(address);
    }

    private String getStringLike(String text) {
        if(text == null || text.isEmpty()) {
            return WHATEVER;
        }
        return text + "%";
    }
}
