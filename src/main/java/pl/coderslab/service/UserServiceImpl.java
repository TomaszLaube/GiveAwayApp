package pl.coderslab.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.coderslab.addins.MailSender;
import pl.coderslab.model.Location;
import pl.coderslab.model.Role;
import pl.coderslab.model.User;
import pl.coderslab.repository.RoleRepository;
import pl.coderslab.repository.UserRepository;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Set;
import java.util.UUID;

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
    public void saveUser(User user) {
        Role userRole = roleRepository.findByName("ROLE_USER");
        Set<Role> userRoles = user.getRoles();
        userRoles.add(userRole);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setName("N/A");
        user.setDescription("N/A");
        user.setOrg(false);
        userRepository.save(user);
        /*try{
            MailSender.activateAccount(user.getEmail(),user.getFirstName(),user.getLastName(),user.getUserUUID());
        }catch(AddressException e){
            e.printStackTrace();
        }catch(MessagingException e){
            e.printStackTrace();
        }*/
    }

    @Override
    public void saveAdmin(User user) {
        Role userRole = roleRepository.findByName("ROLE_ADMIN");
        Set<Role> userRoles = user.getRoles();
        userRoles.add(userRole);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setName("N/A");
        user.setDescription("N/A");
        user.setOrg(false);
        user.setValidated(true);
        userRepository.save(user);
    }

    @Override
    public void saveOrg(User user) {
        Role userRole = roleRepository.findByName("ROLE_ORG");
        Set<Role> userRoles = user.getRoles();
        userRoles.add(userRole);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setFirstName("N/A");
        user.setLastName("N/A");
        user.setOrg(true);
        userRepository.save(user);
        /*try{
            MailSender.activateAccount(user.getEmail(),user.getFirstName(),user.getLastName(),user.getUserUUID());
        }catch(AddressException e){
            e.printStackTrace();
        }catch(MessagingException e){
            e.printStackTrace();
        }*/
    }

    @Override
    public void update(User user) {
        userRepository.save(user); // do aktywacji
    }

    @Override
    public void edit(User user) { //do edycji danych
        User temp = userRepository.findUserById(user.getId());
        user.setRoles(temp.getRoles());
        user.setGatherings(temp.getGatherings());
        user.setOffers(temp.getOffers());
        userRepository.save(user);
    }


    @Override
    public void changePassword(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }

    @Override
    public User findById(Long id) {
        return userRepository.findUserById(id);
    }

    @Override
    public void delete(User user) {

    }

    @Override
    public User findByEmailEnabledValidated(String email, boolean enabled, boolean validated) {
        return userRepository.findUserByEmailAndEnabledAndValidated(email, true, true);
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public List<User> findOrgByLocation(Location location, boolean org) {
        return userRepository.findByLocationAndOrg(location,org);
    }

    @Override
    public List<User> findOrg(boolean org) {
        return userRepository.findByOrg(org);
    }


}
