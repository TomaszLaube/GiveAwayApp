package pl.coderslab.service;

import pl.coderslab.model.Location;

import java.util.List;
import java.util.UUID;

public interface UserService<U> {
    void saveUser(U u);
    void saveAdmin(U u);
    void saveOrg(U u);
    void update(U u);
    void edit(U u);
    void changePassword(U u);
    U findById(Long id);
    void delete(U u);
    U findByEmailEnabledValidated(String email, boolean enabled, boolean validated);
    U findByEmail(String email);
    List<U> findOrgByLocation(Location location, boolean org);
    List<U> findOrg(boolean org);
}
