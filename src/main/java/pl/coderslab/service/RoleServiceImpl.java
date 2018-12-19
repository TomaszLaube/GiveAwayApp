package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.model.Role;
import pl.coderslab.repository.RoleRepository;

import javax.transaction.Transactional;

@Service
@Transactional
public class RoleServiceImpl implements RoleService<Role> {

    @Autowired
    RoleRepository roleRepository;

    @Override
    public Role findByRole(String role) {
        return roleRepository.findByName(role);
    }
}
