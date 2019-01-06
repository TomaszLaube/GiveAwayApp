package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Offer;

public interface OfferRepository extends JpaRepository<Offer, Long> {
    Offer findOfferById(Long id);

}
