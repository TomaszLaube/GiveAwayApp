package pl.coderslab.service;


public interface UuidService<U> {
    void save(U u);
    void edit(U u);
    U findByRegUUID(java.util.UUID uuid);
    U findByPwdUUID(java.util.UUID uuid);
    U findByUserId(Long userId);
}
