package pl.coderslab.service;

import java.util.UUID;

public interface UserService<U> {
    void save(U u);
    void update(U u);
    void edit(U u);
    void changePassword(U u);
    U findById(Long id);
    void delete(U u);
    U findByEmailEnabledValidated(String email, boolean enabled, boolean validated);
    U findByEmail(String email);
    U findByUUID(UUID uuid);
}
