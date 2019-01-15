package pl.coderslab.model;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Email
    private String email;

    @NotBlank
    @Size(max = 30)
    private String firstName;

    @NotBlank
    @Size(max = 50)
    private String lastName;

    @NotBlank
    private String password;

    @Transient
    private String checkPassword;

    @NotBlank
    @Size(max = 50)
    private String name;

    @NotBlank
    private String description;

    @ManyToOne
    Location location;

    private boolean enabled = true;

    private boolean validated = true;

    private boolean org;


    @ManyToMany
    @LazyCollection(LazyCollectionOption.FALSE)
    Set<Role> roles = new HashSet<>();

    @OneToMany(mappedBy = "user")
    @LazyCollection(LazyCollectionOption.FALSE)
    Set<Offer> offers = new HashSet<>();

    @OneToMany(mappedBy = "user")
    @LazyCollection(LazyCollectionOption.FALSE)
    Set<Gathering> gatherings = new HashSet<>();

    @ManyToMany
    @LazyCollection(LazyCollectionOption.FALSE)
    Set<Goods> orgGoods = new HashSet<>();

    @ManyToMany
    @LazyCollection(LazyCollectionOption.FALSE)
    Set<Receiver> orgReceivers = new HashSet<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCheckPassword() {
        return checkPassword;
    }

    public void setCheckPassword(String checkPassword) {
        this.checkPassword = checkPassword;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public boolean isValidated() {
        return validated;
    }

    public void setValidated(boolean validated) {
        this.validated = validated;
    }

    public boolean isOrg() {
        return org;
    }

    public void setOrg(boolean org) {
        this.org = org;
    }


    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public Set<Offer> getOffers() {
        return offers;
    }

    public void setOffers(Set<Offer> offers) {
        this.offers = offers;
    }

    public Set<Gathering> getGatherings() {
        return gatherings;
    }

    public void setGatherings(Set<Gathering> gatherings) {
        this.gatherings = gatherings;
    }

    public Set<Goods> getOrgGoods() {
        return orgGoods;
    }

    public void setOrgGoods(Set<Goods> orgGoods) {
        this.orgGoods = orgGoods;
    }

    public Set<Receiver> getOrgReceivers() {
        return orgReceivers;
    }

    public void setOrgReceivers(Set<Receiver> orgReceivers) {
        this.orgReceivers = orgReceivers;
    }
}
