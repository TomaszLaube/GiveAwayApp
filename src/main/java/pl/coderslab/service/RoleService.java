package pl.coderslab.service;

import java.util.List;

public interface RoleService<R> {
    R findByRole(String role);
    void save(R r);
    List<R> findAll();
}
