package pl.coderslab.service;

public interface RoleService<R> {
    R findByRole(String role);
}
