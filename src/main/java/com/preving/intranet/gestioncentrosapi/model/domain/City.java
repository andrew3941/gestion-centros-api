package com.preving.intranet.gestioncentrosapi.model.domain;


import javax.persistence.Entity;
import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(schema = "VIG_SALUD", name ="LOCALIDADES")
public class City implements Serializable {

    private int id;
    private String name;
    private Province province = new Province();


    @Id
    @Column(name = "LOC_ID", nullable = false, precision = 0)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() { return id; }
    public void setId(int id) { this.id = id;  }

    @Basic
    @Column(name = "LOC_NOMBRE", length = 100)
    public String getName() { return name;  }
    public void setName(String name) { this.name = name;  }

    //create the relationship between PROVINCIAS and LOCALIDADES tables join the columns of each tables
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "LOC_PRV_COD", referencedColumnName = "PRV_COD", nullable = false)
    public Province getProvince() {  return province; }
    public void setProvince(Province province) { this.province = province;  }

    //create a class constructor for dependency injection
    public City() {
    }


    public City(int id, String name, Province province) {
        this.id = id;
        this.name = name;
        this.province = province;
    }

    public City(int id, int province, String name) {
        this.id = id;
        this.province.setId(province);
        this.name = name;
    }
  
}
