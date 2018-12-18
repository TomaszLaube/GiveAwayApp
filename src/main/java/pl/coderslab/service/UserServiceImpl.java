package pl.coderslab.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.coderslab.model.User;
import pl.coderslab.repository.RoleRepository;
import pl.coderslab.repository.UserRepository;

import javax.transaction.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService<User> {


    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder passwordEncoder){
        this.passwordEncoder = passwordEncoder;
        this.roleRepository = roleRepository;
        this.userRepository = userRepository;
    }

    @Override
    public void save(User user) {
        userRepository.save(user);
    }

    @Override
    public void update(User user) {

    }

    @Override
    public User findById(Long id) {
        return null;
    }

    @Override
    public void delete(User user) {

    }

    @Override
    public User findByEmailEnabledValidated(String email, boolean enabled, boolean validated) {
        return userRepository.findUserByEmailAndEnabledAndValidated(email, true, true);
    }
}
