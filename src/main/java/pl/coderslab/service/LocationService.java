package pl.coderslab.service;

import java.util.List;

public interface LocationService<L> {
    void save(L l);
    void delete(L l);
    L findById(Long id);
    List<L> findAll();
}
