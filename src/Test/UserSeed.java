package Test;

import DAO.UserDAO;

public class UserSeed {
    public static void main (String args[]) {
        seed();
    }

    static void seed() {
        UserDAO userDAO = new UserDAO();
        userDAO.removeAll();

        String[] emails = {"negao@ig.com", "tomcat@ig.com", "roro@ig.com"};
        String[] lastNames = {"Silva", "Mateus", "Romito"};
        String[] names = {"Luis", "Antonio", "Gustavo"};
        String[] passwords = {"123456", "123456", "123456"};

        for(int i = 0; i < emails.length; i ++) {
            String email = emails[i%emails.length];
            String lastName = lastNames[i%lastNames.length];
            String name = names[i%names.length];
            String password = passwords[i%passwords.length];
            userDAO.add(email, lastName, name, password);
        }
    }
}