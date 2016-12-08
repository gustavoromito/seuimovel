package Utils;

import javax.servlet.http.HttpServletRequest;

public class Utils {
    private static final double INVALID_DOUBLE_VALUE = -1;
    private static final int INVALID_INTEGER_VALUE = -1;

    public static double parseDouble(HttpServletRequest request, String key) {
        if (key == null) {
            return INVALID_DOUBLE_VALUE;
        }
        String parameter = request.getParameter(key);
        if (parameter == null || parameter.isEmpty()) {
            return INVALID_DOUBLE_VALUE;
        }
        return Double.parseDouble(parameter);
    }

    public static int parseInt(HttpServletRequest request, String key) {
        if (key == null) {
            return INVALID_INTEGER_VALUE;
        }
        String parameter = request.getParameter(key);
        if (parameter == null || parameter.isEmpty()) {
            return INVALID_INTEGER_VALUE;
        }
        return Integer.parseInt(parameter);
    }
}
