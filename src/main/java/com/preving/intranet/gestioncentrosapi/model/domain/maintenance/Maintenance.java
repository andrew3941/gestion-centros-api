package com.preving.intranet.gestioncentrosapi.model.domain.maintenance;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.preving.intranet.gestioncentrosapi.model.domain.User;
import com.preving.intranet.gestioncentrosapi.model.domain.vendors.ExpenditurePeriod;
import com.preving.intranet.gestioncentrosapi.model.domain.vendors.Provider;


import javax.persistence.*;
import javax.persistence.Entity;
import java.io.Serializable;
import java.util.Date;
import java.util.List;


@Entity
@Table(schema = "GESTION_CENTROS", name = "MANTENIMIENTOS")
public class Maintenance implements Serializable {


    private int id;
    private MaintenanceTypes maintenanceTypes = new MaintenanceTypes();
    private Provider provider = new Provider();
    private String billNumber;
    private ExpenditurePeriod expenditurePeriod = new ExpenditurePeriod();
    private int amount;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Europe/Madrid")
    private Date date;
    private String observations;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Europe/Madrid")
    private Date created = new Date();
    private User createdBy = new User();
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Europe/Madrid")
    private Date modified;
    private User modifiedBy;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Europe/Madrid")
    private Date deleted;
    private User deletedBy;
    private List<MaintenanceByAttachement> maintenanceByAttachments;

    public Maintenance() {
    }


    public Maintenance(int id, MaintenanceTypes maintenanceTypes, Provider provider, String billNumber, ExpenditurePeriod expenditurePeriod, int amount, Date date, String observations, Date created, User createdBy, Date modified, User modifiedBy, Date deleted, User deletedBy) {
        this.id = id;
        this.maintenanceTypes = maintenanceTypes;
        this.provider = provider;
        this.billNumber = billNumber;
        this.expenditurePeriod = expenditurePeriod;
        this.amount = amount;
        this.date = date;
        this.observations = observations;
        this.created = created;
        this.createdBy = createdBy;
        this.modified = modified;
        this.modifiedBy = modifiedBy;
        this.deleted = deleted;
        this.deletedBy = deletedBy;
    }

    @Id
    @Column(name = "ID", nullable = false)
    @SequenceGenerator(name = "MANTENIMIENTOS_SEQ", sequenceName = "MANTENIMIENTOS_SEQ", schema = "GESTION_CENTROS", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MANTENIMIENTOS_SEQ")

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @ManyToOne
    @JoinColumn(name = "TIPO_ID")
    public MaintenanceTypes getMaintenanceTypes() {
        return maintenanceTypes;
    }

    public void setMaintenanceTypes(MaintenanceTypes maintenanceTypes) {
        this.maintenanceTypes = maintenanceTypes;
    }

    @ManyToOne
    @JoinColumn(name = "PROVEEDOR_ID", referencedColumnName = "ID")
    public Provider getProvider() {
        return provider;
    }

    public void setProvider(Provider provider) {
        this.provider = provider;
    }

    @Basic
    @Column(name = "REF_FACTURA")
    public String getBillNumber() {
        return billNumber;
    }

    public void setBillNumber(String billNumber) {
        this.billNumber = billNumber;
    }

    @ManyToOne
    @JoinColumn(name = "PERIODICIDAD_ID", referencedColumnName = "ID")
    public ExpenditurePeriod getExpenditurePeriod() {
        return expenditurePeriod;
    }

    public void setExpenditurePeriod(ExpenditurePeriod expenditurePeriod) {
        this.expenditurePeriod = expenditurePeriod;
    }

    @Basic
    @Column(name = "CUANTIA")
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Basic
    @Column(name = "FECHA")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Basic
    @Column(name = "OBSERVACIONES")
    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }

    @Basic
    @Column(name = "CREADO")
    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "CREADO_POR", referencedColumnName = "ID")
    public User getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(User createdBy) {
        this.createdBy = createdBy;
    }

    @Basic
    @Column(name = "MODIFICADO")
    public Date getModified() {
        return modified;
    }

    public void setModified(Date modified) {
        this.modified = modified;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "MODIFICADO_POR", referencedColumnName = "ID")
    public User getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(User modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    @Basic
    @Column(name = "BORRADO")
    public Date getDeleted() {
        return deleted;
    }

    public void setDeleted(Date deleted) {
        this.deleted = deleted;
    }

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "BORRADO_POR", referencedColumnName = "ID")
    public User getDeletedBy() {
        return deletedBy;
    }

    public void setDeletedBy(User deletedBy) {
        this.deletedBy = deletedBy;
    }

}

