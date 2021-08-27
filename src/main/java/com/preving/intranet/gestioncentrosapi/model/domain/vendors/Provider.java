package com.preving.intranet.gestioncentrosapi.model.domain.vendors;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.preving.intranet.gestioncentrosapi.model.domain.User;
import com.preving.intranet.gestioncentrosapi.model.domain.workCenters.WorkCenter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(schema = "GESTION_CENTROS", name = "PROVEEDORES")
@SqlResultSetMapping(
        name = "ProviderMapping",
        classes = {
                @ConstructorResult(
                        targetClass = Provider.class,
                        columns = {
                                @ColumnResult(name = "ID", type = Integer.class),
                                @ColumnResult(name = "DELEGACION_ID", type = Integer.class),
                                @ColumnResult(name = "NOMBRE", type = String.class),
                                @ColumnResult(name = "PROVEEDOR_CENTRALIZADO", type = String.class),
                                @ColumnResult(name = "CIF", type = String.class),
                                @ColumnResult(name = "TIPO_ID", type = Integer.class),
                                @ColumnResult(name = "AREA_ID", type = Integer.class),
                                @ColumnResult(name = "TIPO_EVALUACION_ID", type = Integer.class),
                                @ColumnResult(name = "FECHA_INICIO_SERVICIO", type = Date.class),
                                @ColumnResult(name = "FIN_INICIO_SERVICIO", type = Date.class),
                                @ColumnResult(name = "PERIODICADAD_GASTO_ID", type = Integer.class),

                        }
                )
        }
)

public class Provider implements Serializable {
    private int id;
    private WorkCenter workCenter = new WorkCenter();
    private String name;
    private boolean centralProvider;
    private String cif;
    private ProviderTypes providerTypes = new ProviderTypes();
    private ProviderArea providerArea = new ProviderArea();
    private ProviderEvaluationTypes evaluationTypes = new ProviderEvaluationTypes();
    private String email;
    private String direction;
    private String contactPerson;
    private String telephone;
    private String details;
    private String doc_Url;
    private String doc_name;
    private String doc_content_type;
    private ExpenditurePeriod expenditurePeriod = new ExpenditurePeriod();
    private Integer spending;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Europe/Madrid")
    private Date serviceStartDate = new Date();
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Europe/Madrid")
    private Date serviceEndDate = null;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Europe/Madrid")
    private Date serviceAlramDate = null;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Europe/Madrid")
    private Date created = new Date();
    private User createdBy;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Europe/Madrid")
    private Date modified;
    private User modifiedBy;

    public Provider() {
    }

    public Provider(int id, WorkCenter workCenter, String name, boolean centralProvider, String cif, ProviderTypes providerTypes, ProviderArea providerArea, ProviderEvaluationTypes evaluationTypes, String email, String direction, String contactPerson, String telephone, String details, String doc_Url, String doc_name, String doc_content_type, ExpenditurePeriod expenditurePeriod, Integer spending, Date serviceStartDate, Date serviceEndDate, Date serviceAlramDate, Date created, User createdBy, Date modified, User modifiedBy) {
        this.id = id;
        this.workCenter = workCenter;
        this.name = name;
        this.centralProvider = centralProvider;
        this.cif = cif;
        this.providerTypes = providerTypes;
        this.providerArea = providerArea;
        this.evaluationTypes = evaluationTypes;
        this.email = email;
        this.direction = direction;
        this.contactPerson = contactPerson;
        this.telephone = telephone;
        this.details = details;
        this.doc_Url = doc_Url;
        this.doc_name = doc_name;
        this.doc_content_type = doc_content_type;
        this.expenditurePeriod = expenditurePeriod;
        this.spending = spending;
        this.serviceStartDate = serviceStartDate;
        this.serviceEndDate = serviceEndDate;
        this.serviceAlramDate = serviceAlramDate;
        this.created = created;
        this.createdBy = createdBy;
        this.modified = modified;
        this.modifiedBy = modifiedBy;
    }

    @Id
    @Column(name = "ID", nullable = false)
    @SequenceGenerator(name = "PROVEEDORES_SEQ", sequenceName = "PROVEEDORES_SEQ", schema = "GESTION_CENTROS", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PROVEEDORES_SEQ")
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @JsonBackReference
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "DELEGACION_ID", referencedColumnName = "ID")
    public WorkCenter getWorkCenter() {
        return workCenter;
    }
    public void setWorkCenter(WorkCenter workCenter) {
        this.workCenter = workCenter;
    }

    @Basic
    @Column(name = "NOMBRE")
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "PROVEEDOR_CENTRALIZADO")
    public boolean isCentralProvider() {
        return centralProvider;
    }
    public void setCentralProvider(boolean centralProvider) {
        this.centralProvider = centralProvider;
    }

    @Basic
    @Column(name = "CIF")
    public String getCif() {
        return cif;
    }
    public void setCif(String cif) {
        this.cif = cif;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "TIPO_ID", referencedColumnName = "ID")
    public ProviderTypes getProviderTypes() {
        return providerTypes;
    }
    public void setProviderTypes(ProviderTypes providerTypes) {
        this.providerTypes = providerTypes;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "AREA_ID", referencedColumnName = "ID")
    public ProviderArea getProviderArea() {
        return providerArea;
    }
    public void setProviderArea(ProviderArea providerArea) {
        this.providerArea = providerArea;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "TIPO_EVALUACION_ID", referencedColumnName = "ID")
    public ProviderEvaluationTypes getEvaluationTypes() {
        return evaluationTypes;
    }
    public void setEvaluationTypes(ProviderEvaluationTypes evaluationTypes) {
        this.evaluationTypes = evaluationTypes;
    }

    @Basic
    @Column(name = "EMAIL")
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "DIRECCION")
    public String getDirection() {
        return direction;
    }
    public void setDirection(String direction) {
        this.direction = direction;
    }

    @Basic
    @Column(name = "PERSONA_CONTACTO")
    public String getContactPerson() {
        return contactPerson;
    }
    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    @Basic
    @Column(name = "TELEFONO")
    public String getTelephone() {
        return telephone;
    }
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    @Basic
    @Column(name = "DETALLES")
    public String getDetails() {
        return details;
    }
    public void setDetails(String details) {
        this.details = details;
    }

    @Basic
    @Column(name = "DOC_URL")
    public String getDoc_Url() {
        return doc_Url;
    }
    public void setDoc_Url(String doc_Url) {
        this.doc_Url = doc_Url;
    }

    @Basic
    @Column(name = "DOC_NOMBRE")
    public String getDoc_name() {
        return doc_name;
    }
    public void setDoc_name(String doc_name) {
        this.doc_name = doc_name;
    }

    @Basic
    @Column(name = "DOC_CONTENT_TYPE")
    public String getDoc_content_type() {
        return doc_content_type;
    }
    public void setDoc_content_type(String doc_content_type) {
        this.doc_content_type = doc_content_type;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "PERIODICIDAD_GASTO_ID", referencedColumnName = "ID")
    public ExpenditurePeriod getExpenduture() {
        return expenditurePeriod;
    }
    public void setExpenduture(ExpenditurePeriod expenditurePeriod) {
        this.expenditurePeriod = expenditurePeriod;
    }

    @Basic
    @Column(name = "GASTO")
    public Integer getSpending() {
        return spending;
    }
    public void setSpending(Integer spending) {
        this.spending = spending;
    }

    @Basic
    @Column(name = "FECHA_INICIO_SERVICIO")
    public Date getServiceStartDate() {
        return serviceStartDate;
    }
    public void setServiceStartDate(Date serviceStartDate) {
        this.serviceStartDate = serviceStartDate;
    }

    @Basic
    @Column(name = "FECHA_FIN_SERVICIO")
    public Date getServiceEndDate() {
        return serviceEndDate;
    }
    public void setServiceEndDate(Date serviceEndDate) {
        this.serviceEndDate = serviceEndDate;
    }

    @Basic
    @Column(name = "FECHA_ALARMA_SERVICIO")
    public Date getServiceAlramDate() {
        return serviceAlramDate;
    }
    public void setServiceAlramDate(Date serviceAlramDate) {
        this.serviceAlramDate = serviceAlramDate;
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

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "MODIFICADO_POR", referencedColumnName = "ID")
    public User getModifiedBy() {
        return modifiedBy;
    }
    public void setModifiedBy(User modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

}
