package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.model.Offer;
import pl.coderslab.repository.OfferRepository;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class OfferServiceImpl implements OfferService<Offer> {

    @Autowired
    OfferRepository offerRepository;

    @Override
    public void save(Offer o) {
        Date date = new Date();
        o.setCreated(new Timestamp(date.getTime()));
        offerRepository.save(o);
    }

    @Override
    public void edit(Offer o) {
        offerRepository.save(o);
    }

    @Override
    public Offer findById(Long id) {
        return offerRepository.findOfferById(id);
    }

    @Override
    public List<Offer> findAll() {
        return offerRepository.findAll();
    }

    @Override
    public List<Offer> findUserOffers(Long userId, boolean sent) {
        return offerRepository.findOffersByUserIdAndSentOrderByCreatedDesc(userId,sent);
    }

    @Override
    public long countByUser(Long userId) {
        return offerRepository.countOffersByUserId(userId);
    }

    @Override
    public long countByOrg(Long orgId) {
        return offerRepository.countOffersByInstitutionId(orgId);
    }
}
