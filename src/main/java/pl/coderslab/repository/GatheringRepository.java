package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Gathering;

public interface GatheringRepository extends JpaRepository<Gathering,Long> {
    Gathering findGatheringById(Long id);

    long countGatheringsByUserId(Long userId);
}
