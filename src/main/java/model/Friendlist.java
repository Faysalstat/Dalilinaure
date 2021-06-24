package model;
// Generated Jul 16, 2020 2:10:18 PM by Hibernate Tools 4.3.1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "friendlist",
        catalog = "bahaushi_projectdb"
)
public class Friendlist implements java.io.Serializable {

    private Integer id;
    private Person personByFriendId2;
    private Person personByFriendId1;
    private String status;
    private String chatroom;

    public Friendlist() {
    }

    public Friendlist(Person personByFriendId2, Person personByFriendId1, String status, String chatroom) {
        this.personByFriendId2 = personByFriendId2;
        this.personByFriendId1 = personByFriendId1;
        this.status = status;
        this.chatroom = chatroom;
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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "FriendID2")
    public Person getPersonByFriendId2() {
        return this.personByFriendId2;
    }

    public void setPersonByFriendId2(Person personByFriendId2) {
        this.personByFriendId2 = personByFriendId2;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "FriendID1")
    public Person getPersonByFriendId1() {
        return this.personByFriendId1;
    }

    public void setPersonByFriendId1(Person personByFriendId1) {
        this.personByFriendId1 = personByFriendId1;
    }

    @Column(name = "status", length = 100)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "chatroom",length = 20)
    public String getChatroom() {
        return chatroom;
    }

    public void setChatroom(String chatroom) {
        this.chatroom = chatroom;
    }

}
