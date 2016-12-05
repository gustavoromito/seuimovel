package DAO;

import Model.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Gustavo Romito on 04/12/16.
 */
public class ResidenceDAO {
    public List<Residence> findAll() {
        List<Residence> list = new ArrayList<Residence>();
        Residence residence = new Residence();
        residence.setAddress("Rua Padre Vicente Heckel, 204");
        list.add(residence);
        return list;
    }
}