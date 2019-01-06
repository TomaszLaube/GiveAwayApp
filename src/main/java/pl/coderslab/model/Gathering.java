package pl.coderslab.model;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "gatherings")
public class Gathering {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Size(max=100)
    private String street;

    @NotBlank
    @Size(max = 40)
    private String city;

    @NotBlank
    @Pattern(regexp = "^[0-9]{2}-[0-9]{3}$", message = "Kod pocztowy musi być w formacie XX-XXX")
    private String postalCode;

    @NotBlank
    @Size(min = 9, max = 9)
    @Pattern(regexp = "^[0-9]{9}$", message = "Numer telefonu musi się składać z 9 cyfr")
    private String telephone;

    @NotNull
    private Date date;

    @NotBlank
    private String description;

    private Timestamp created;

    @ManyToOne
    User user;

    @NotNull
    @ManyToMany(fetch = FetchType.EAGER)
    Set<Goods> goods = new HashSet<>();


    @NotNull
    @ManyToMany(fetch = FetchType.EAGER)
    Set<Receiver> receivers = new HashSet<>();

    private boolean active = true;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getCreated() {
        return created;
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<Goods> getGoods() {
        return goods;
    }

    public void setGoods(Set<Goods> goods) {
        this.goods = goods;
    }

    public Set<Receiver> getReceivers() {
        return receivers;
    }

    public void setReceivers(Set<Receiver> receivers) {
        this.receivers = receivers;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
