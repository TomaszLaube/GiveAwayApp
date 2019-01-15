package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.UUID;

public interface UuidRepository extends JpaRepository<UUID, Long> {
    UUID findByRegUUID(java.util.UUID uuid);
    UUID findByPwdUUID(java.util.UUID uuid);
    UUID findByUserId(Long userId);

}
