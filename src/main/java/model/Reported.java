package model;
// Generated Aug 2, 2020 3:49:36 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Reported generated by hbm2java
 */
@Entity
@Table(name="reported"
    ,catalog="bahaushi_projectdb"
)
public class Reported  implements java.io.Serializable {


     private Integer id;
     private Person personByReportedby;
     private Person personByReported;
     private Integer checked;

    public Reported() {
    }

    public Reported(Person personByReportedby, Person personByReported,Integer checked) {
       this.personByReportedby = personByReportedby;
       this.personByReported = personByReported;
       this.checked = checked;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="reportedby")
    public Person getPersonByReportedby() {
        return this.personByReportedby;
    }
    
    public void setPersonByReportedby(Person personByReportedby) {
        this.personByReportedby = personByReportedby;
    }

@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="reported")
    public Person getPersonByReported() {
        return this.personByReported;
    }
    
    public void setPersonByReported(Person personByReported) {
        this.personByReported = personByReported;
    }

    
    
    @Column(name="checked")
    public Integer getChecked() {
        return this.checked;
    }
    
    public void setChecked(Integer checked) {
        this.checked = checked;
    }




}


