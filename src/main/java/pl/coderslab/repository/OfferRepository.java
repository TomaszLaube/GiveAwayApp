package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Offer;

import java.util.List;

public interface OfferRepository extends JpaRepository<Offer, Long> {
    Offer findOfferById(Long id);
    List<Offer> findOffersByUserIdAndSentOrderByCreatedDesc(Long userId, boolean sent);
    List<Offer> findOffersByInstitutionIdAndSentAndReceivedOrderByCreatedDesc(Long institutionId, boolean sent, boolean received);


    long countOffersByUserId(Long userId);
    long countOffersByInstitutionId(Long institutionId);
    long countOffersByInstitutionIdAndSent(Long institutionId, boolean sent);
    long countOffersByInstitutionIdAndSentAndReceivedOrderByCreatedDesc(Long institutionId, boolean sent, boolean received);


}
