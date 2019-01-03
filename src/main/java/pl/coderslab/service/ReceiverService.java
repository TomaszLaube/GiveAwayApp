package pl.coderslab.service;

import java.util.List;

public interface ReceiverService<R> {
    void save(R r);
    R findById(Long id);
    List<R> findAll();
}
