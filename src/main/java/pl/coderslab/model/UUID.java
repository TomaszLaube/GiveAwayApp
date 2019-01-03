package pl.coderslab.model;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.sql.Timestamp;

@Entity
@Table(name = "uuid")
public class UUID {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Type(type="org.hibernate.type.UUIDCharType")
    private java.util.UUID regUUID = java.util.UUID.randomUUID();

    @NotNull
    @Type(type="org.hibernate.type.UUIDCharType")
    private java.util.UUID pwdUUID = java.util.UUID.randomUUID();

    private Timestamp regExpiry;

    private Timestamp pwdExpiry;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public java.util.UUID getRegUUID() {
        return regUUID;
    }

    public void setRegUUID(java.util.UUID regUUID) {
        this.regUUID = regUUID;
    }

    public java.util.UUID getPwdUUID() {
        return pwdUUID;
    }

    public void setPwdUUID(java.util.UUID pwdUUID) {
        this.pwdUUID = pwdUUID;
    }

    public Timestamp getRegExpiry() {
        return regExpiry;
    }

    public void setRegExpiry(Timestamp regExpiry) {
        this.regExpiry = regExpiry;
    }

    public Timestamp getPwdExpiry() {
        return pwdExpiry;
    }

    public void setPwdExpiry(Timestamp pwdExpiry) {
        this.pwdExpiry = pwdExpiry;
    }
}
