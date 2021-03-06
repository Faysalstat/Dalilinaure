package model;
// Generated Jul 16, 2020 2:10:18 PM by Hibernate Tools 4.3.1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * User generated by hbm2java
 */
@Entity
@Table(name = "user",
         catalog = "bahaushi_projectdb",
         uniqueConstraints = @UniqueConstraint(columnNames = "username")
)
public class User implements java.io.Serializable {

    private Integer id;
    private String username;
    private String email;
    private String contact;
    private String subtype;
    private Date dos;
    private Date dojoin;
    private String status;
    private String password;
    private String userrole;

    public User() {
    }

    public User(String username) {
        this.username = username;
    }

    public User(String username, String email, String contact, String subtype, Date dos, Date dojoin, String status, String password, String userrole) {
        this.username = username;
        this.email = email;
        this.contact = contact;
        this.subtype = subtype;
        this.dos = dos;
        this.dojoin = dojoin;
        this.status = status;
        this.password = password;
        this.userrole = userrole;

    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "id", unique = true, nullable = false)
    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "username", unique = true, nullable = false, length = 100)
    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column(name = "email", length = 100)
    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "contact", length = 100)
    public String getContact() {
        return this.contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    @Column(name = "subtype", length = 100)
    public String getSubtype() {
        return this.subtype;
    }

    public void setSubtype(String subtype) {
        this.subtype = subtype;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "dos", length = 10)
    public Date getDos() {
        return this.dos;
    }

    public void setDos(Date dos) {
        this.dos = dos;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "dojoin", length = 10)
    public Date getDojoin() {
        return this.dojoin;
    }

    public void setDojoin(Date dojoin) {
        this.dojoin = dojoin;
    }

    @Column(name = "status", length = 20)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "password")
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserrole() {
        return userrole;
    }

    public void setUserrole(String userrole) {
        this.userrole = userrole;
    }
    

}
