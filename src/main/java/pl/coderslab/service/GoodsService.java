package pl.coderslab.service;

import java.util.List;

public interface GoodsService<G> {
    void save(G g);
    void edit(G g);
    void delete(G g);
    G findByName(String name);
    G findById(Long id);
    List<G> findAll();
}
