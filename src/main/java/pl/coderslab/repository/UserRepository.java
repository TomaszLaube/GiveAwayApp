package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Location;
import pl.coderslab.model.User;

import java.util.List;
import java.util.UUID;

public interface UserRepository extends JpaRepository<User,Long> {
    User findUserByEmailAndEnabledAndValidated(String email, boolean enabled, boolean validated);
    User findByEmail(String email);
    User findUserById(Long id);
    List<User> findByLocationAndOrg(Location location, boolean org);
    List<User> findByOrg(boolean org);
}
