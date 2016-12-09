package Test;

import DAO.PictureDAO;

public class PictureSeed {
    public static void main(String args[]) {
        seed();
    }

    static void seed() {
        PictureDAO pictureDAO = new PictureDAO();
        String[] picturePaths = {
                "http://img.olx.com.br/images/62/623507000300111.jpg",
                "http://www.achoumudou.com.br/fotos/223539_2.jpg",
                "http://imovelbook.com/midias/imoveis/14431861957082.JPG",
                "http://estatico.cyrela.com.br/Files/Imagens/Imoveis/282/Imovel/apartamento-andalus-by-cyrela-alameda-principal-002.jpg",
                "http://multimidia.lopes.com.br/91/6986/lancamento-modern-morumbi-fachada-4_NewRelease.jpg"
        };
        for (String picturePath : picturePaths) {
            pictureDAO.add(picturePath);
        }
    }
}
