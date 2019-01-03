package pl.coderslab.model;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "offers")
public class Offer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Min(value = 1)
    private Long bagNum;

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

    @NotNull
    private Time time;

    @NotBlank
    private String additionalInstructions;

    @NotNull
    private Timestamp created;

    private boolean sent = false;

    @NotNull
    @ManyToMany(fetch = FetchType.EAGER)
    Set<Goods> goods = new HashSet<>();


    @NotNull
    @ManyToMany(fetch = FetchType.EAGER)
    Set<Receiver> receivers = new HashSet<>();

    @ManyToOne
    User institution;

    @ManyToOne
    User user;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getBagNum() {
        return bagNum;
    }

    public void setBagNum(Long bagNum) {
        this.bagNum = bagNum;
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

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public String getAdditionalInstructions() {
        return additionalInstructions;
    }

    public void setAdditionalInstructions(String additionalInstructions) {
        this.additionalInstructions = additionalInstructions;
    }

    public Timestamp getCreated() {
        return created;
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }

    public boolean isSent() {
        return sent;
    }

    public void setSent(boolean sent) {
        this.sent = sent;
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

    public User getInstitution() {
        return institution;
    }

    public void setInstitution(User institution) {
        this.institution = institution;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
