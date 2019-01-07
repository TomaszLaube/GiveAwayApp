package pl.coderslab.service;

import java.util.List;

public interface OfferService<O> {
    void save(O o);
    void edit(O o);
    O findById(Long id);
    List<O> findAll();
    List<O> findUserOffers(Long userId, boolean sent);

    long countByUser(Long userId);
    long countByOrg(Long orgId);
}
