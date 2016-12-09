package Model;

public class Validation {
    private boolean isValid;
    private String message;

    public void setIsValid(boolean isValid) {
        this.isValid = isValid;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isValid() {
        return isValid;
    }

    public String getMessage() {
        return message;
    }
}
