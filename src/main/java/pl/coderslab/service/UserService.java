package pl.coderslab.service;

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
}
