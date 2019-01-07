package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Offer;

import java.util.List;

public interface OfferRepository extends JpaRepository<Offer, Long> {
    Offer findOfferById(Long id);
    List<Offer> findOffersByUserIdAndSentOrderByCreatedDesc(Long userId, boolean sent);


    long countOffersByUserId(Long userId);
    long countOffersByInstitutionId(Long institutionId);


}
