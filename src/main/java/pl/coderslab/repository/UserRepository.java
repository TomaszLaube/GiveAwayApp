package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.User;

import java.util.UUID;

public interface UserRepository extends JpaRepository<User,Long> {
    User findUserByEmailAndEnabledAndValidated(String email, boolean enabled, boolean validated);
    User findByEmail(String email);
    User findByUserUUID(UUID uuid);
    User findUserById(Long id);
}
