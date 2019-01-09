package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Gathering;

import java.util.List;

public interface GatheringRepository extends JpaRepository<Gathering,Long> {
    Gathering findGatheringById(Long id);
    List<Gathering> findByUserIdAndActiveOrderByDateDesc(Long userId, boolean active);
    List<Gathering> findByUserId(Long userId);

    long countGatheringsByUserId(Long userId);
}
