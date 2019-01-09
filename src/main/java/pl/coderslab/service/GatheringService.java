package pl.coderslab.service;

import java.util.List;

public interface GatheringService<G> {
    void save(G g);
    void edit(G g);
    G findById(Long id);
    List<G> findAll();
    List<G> findUserGatherings(Long userId, boolean active);
    List<G> findAllUserGatherings(Long userId);
    long countByUser(Long userId);

}
