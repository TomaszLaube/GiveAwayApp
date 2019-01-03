package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Location;

public interface LocationRepository extends JpaRepository<Location,Long> {
    Location findLocationById(Long id);
}
