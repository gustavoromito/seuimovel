package Utils;

import javax.servlet.http.HttpServletRequest;
import java.text.NumberFormat;

public class Utils {
    public static final double INVALID_DOUBLE_VALUE = -1;
    public static final int INVALID_INTEGER_VALUE = -1;
    public static final String LOREM_IPSUM_DESCRIPTION = "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum";

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

    public static String parseMoney(double money) {
        NumberFormat formatter = NumberFormat.getCurrencyInstance();
        String moneyString = formatter.format(money);

        if (moneyString.endsWith(".00")) {
            int centsIndex = moneyString.lastIndexOf(".00");
            if (centsIndex != -1) {
                moneyString = moneyString.substring(1, centsIndex);
            }
        }
        return moneyString;
    }
}
