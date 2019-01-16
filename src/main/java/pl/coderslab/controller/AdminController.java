package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.addins.MailSender;
import pl.coderslab.model.*;
import pl.coderslab.service.*;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.validation.Valid;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    UserService userService;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Autowired
    RoleService roleService;

    @Autowired
    LocationService locationService;

    @Autowired
    GoodsService goodsService;

    @Autowired
    ReceiverService receiverService;

    @Autowired
    OfferService offerService;

    @Autowired
    UuidService uuidService;


    @RequestMapping("/dashboard")
    public String adminDashboard(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User loggedAdmin = customUser.getUser();
        User fullAdmin = (User) userService.findById(loggedAdmin.getId());
        model.addAttribute("admin", fullAdmin);
        return "admin/dashboard";
    }

    @RequestMapping("/adminList")
    public String adminList(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User loggedAdmin = customUser.getUser();
        User fullAdmin = (User) userService.findById(loggedAdmin.getId());
        Role adminRole = (Role) roleService.findByRole("ROLE_ADMIN");
        Set<Role> adminRoles = new HashSet<>();
        adminRoles.add(adminRole);
        List<User> admins = userService.findByRole(adminRoles);
        admins = admins.stream()
                .filter(s -> s.getId() != fullAdmin.getId())
                .collect(Collectors.toList());

        model.addAttribute("admins", admins);
        return "admin/adminList";
    }

    @GetMapping("/addAdmin")
    public String addAdmin(Model model) {
        model.addAttribute("admin", new User());
        return "admin/addAdmin";
    }

    @PostMapping("/addAdmin")
    public String addedAdmin(@ModelAttribute @Valid User admin, BindingResult result, Model model) {
        User emailCheck = (User) userService.findByEmail(admin.getEmail());
        if (result.hasErrors()) {
            model.addAttribute("admin", admin);
            return "app/addAdmin";
        } else if (emailCheck != null || !admin.getPassword().equals(admin.getCheckPassword())) {
            if (emailCheck != null) {
                model.addAttribute("emailExists", true);
            }
            if (!admin.getPassword().equals(admin.getCheckPassword())) {
                model.addAttribute("incorrectPasswordCheck", true);
            }
            model.addAttribute("admin", admin);
            return "app/addAdmin";
        } else {
            userService.saveAdmin(admin);
            UUID userUUID = new UUID();
            userUUID.setUser(admin);
            uuidService.save(userUUID);
            return "redirect:/admin/adminList";
        }
    }


    @RequestMapping("/modAccess/{userId}")
    public String blockAdmin(@PathVariable Long userId, @AuthenticationPrincipal CurrentUser customUser) {
        User toChange = (User) userService.findById(userId);
        User loggedAdmin = customUser.getUser();
        Role adminRole = (Role) roleService.findByRole("ROLE_ADMIN");
        Role userRole = (Role) roleService.findByRole("ROLE_USER");
        if (toChange != null && toChange.getId() == loggedAdmin.getId()) {
            return "redirect:/admin/403";
        } else if (toChange != null) {
            if (toChange.isEnabled()) {
                toChange.setEnabled(false);
                try{
                    MailSender.blockUser(toChange.getEmail());
                } catch (AddressException e){
                    e.printStackTrace();
                } catch (MessagingException e){
                    e.printStackTrace();
                }
            } else {
                toChange.setEnabled(true);
            }
            userService.update(toChange);
            if (toChange.getRoles().iterator().next().getName().equals(adminRole.getName())) {
                return "redirect:/admin/adminList";
            } else if (toChange.getRoles().iterator().next().getName().equals(userRole.getName())) {
                return "redirect:/admin/userList";
            } else {
                return "redirect:/admin/orgList";
            }

        } else {
            return "redirect:/admin/403";
        }
    }

    @RequestMapping("/changeRole/{userId}")
    public String changeRole(@PathVariable Long userId) {
        User toChange = (User) userService.findById(userId);
        Set<Role> roles = toChange.getRoles();
        Role userRole = (Role) roleService.findByRole("ROLE_USER");
        Role adminRole = (Role) roleService.findByRole("ROLE_ADMIN");

        if (roles.size() > 0 && toChange != null) {
            Set<Role> newRole = new HashSet<>();
            Role current = roles.iterator().next();
            if (current.getName().equals(adminRole.getName())) {
                newRole.add(userRole);
                toChange.setRoles(newRole);
                userService.update(toChange);
                return "redirect:/admin/adminList";
            } else if (current.getName().equals(userRole.getName())) {
                newRole.add(adminRole);
                toChange.setRoles(newRole);
                userService.update(toChange);
                return "redirect:/admin/userList";
            }
            return "redirect:/403";
        } else {
            return "redirect:/403";
        }

    }

    @GetMapping("/modAccount/{userId}")
    public String modAdmin(@PathVariable Long userId, Model model) {
        User userToMod = (User) userService.findById(userId);
        if (userToMod != null) {
            if (userToMod.isOrg() == true) {
                List<Location> locations = locationService.findAll();
                List<Receiver> receivers = receiverService.findAll();
                List<Goods> goods = goodsService.findAll();
                model.addAttribute("receivers", receivers);
                model.addAttribute("goods", goods);
                model.addAttribute("locations", locations);
                model.addAttribute("org", userToMod);
                return "admin/modOrg";
            } else {
                model.addAttribute("user", userToMod);
                return "admin/modAccount";
            }
        } else {
            return "redirect:/403";
        }
    }

    @PostMapping("/modAccount/{userId}")
    public String moddedAdmin(@ModelAttribute @Valid User user, BindingResult result, Model model) {
        User emailCheck = (User) userService.findByEmail(user.getEmail());
        if (result.hasErrors()) {
            model.addAttribute("user", user);
            return "admin/modAccount";
        } else if (emailCheck != null && emailCheck.getId() != user.getId()) {
            model.addAttribute("user", user);
            model.addAttribute("emailExists", true);
            return "admin/modAccount";
        } else {
            userService.edit(user);
            Role userRole = (Role) roleService.findByRole("ROLE_USER");
            if (user.getRoles().iterator().next().getName().equals(userRole.getName())) {
                return "redirect:/admin/userList";
            } else {
                return "redirect:/admin/adminList";
            }
        }
    }

    @PostMapping("/modOrg/{orgId}")
    public String moddedOrg(@ModelAttribute @Valid User org, BindingResult result, Model model) {
        User emailCheck = (User) userService.findByEmail(org.getEmail());
        if (result.hasErrors()) {
            List<Location> locations = locationService.findAll();
            List<Receiver> receivers = receiverService.findAll();
            List<Goods> goods = goodsService.findAll();
            model.addAttribute("receivers", receivers);
            model.addAttribute("goods", goods);
            model.addAttribute("locations", locations);
            model.addAttribute("org", org);
            return "admin/modOrg";
        } else if (emailCheck != null && emailCheck.getId() != org.getId()) {
            List<Location> locations = locationService.findAll();
            List<Receiver> receivers = receiverService.findAll();
            List<Goods> goods = goodsService.findAll();
            model.addAttribute("receivers", receivers);
            model.addAttribute("goods", goods);
            model.addAttribute("locations", locations);
            model.addAttribute("org", org);
            model.addAttribute("emailExists", true);
            return "admin/modOrg";
        } else if (org.getOrgReceivers().size() == 0 || org.getOrgGoods().size() == 0) {
            if (org.getOrgGoods().size() == 0) {
                model.addAttribute("emptyGoods", true);
            }
            if (org.getOrgReceivers().size() == 0) {
                model.addAttribute("emptyReceivers", true);
            }
            List<Location> locations = locationService.findAll();
            List<Receiver> receivers = receiverService.findAll();
            List<Goods> goods = goodsService.findAll();
            model.addAttribute("receivers", receivers);
            model.addAttribute("goods", goods);
            model.addAttribute("locations", locations);
            model.addAttribute("org", org);
            return "admin/modOrg";
        } else {
            User tempOrg = (User) userService.findById(org.getId());
            org.setRoles(tempOrg.getRoles());
            userService.update(org);
            return "redirect:/admin/orgList";
        }
    }

    @PostMapping("/changePassword/{userId}")
    public String changedPwd(@PathVariable Long userId, @RequestParam String newPassword, @RequestParam String newPasswordCheck, Model model) {
        User user = (User) userService.findById(userId);
        if (user != null && user.isOrg() == false) {
            if (!newPassword.equals(newPasswordCheck)) {
                model.addAttribute("user", user);
                model.addAttribute("incorrectNewPassword", true);
                return "admin/modAccount";
            } else {
                user.setPassword(newPassword);
                userService.changePassword(user);
                Role userRole = (Role) roleService.findByRole("ROLE_USER");
                if (user.getRoles().iterator().next().getName().equals(userRole.getName())) {
                    return "redirect:/admin/userList";
                } else {
                    return "redirect:/admin/adminList";
                }
            }
        } else {
            return "redirect:/403";
        }
    }


    @GetMapping("/editAdmin")
    public String editAdmin(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User loggedAdmin = customUser.getUser();
        User admin = (User) userService.findById(loggedAdmin.getId());

        model.addAttribute("admin", admin);
        return "admin/editAdmin";
    }

    @PostMapping("/editAdmin")
    public String editedAdmin(@ModelAttribute @Valid User admin, BindingResult result, Model model) {
        User emailCheck = (User) userService.findByEmail(admin.getEmail());
        if (result.hasErrors()) {
            model.addAttribute("admin", admin);
            return "admin/editAdmin";
        } else if (emailCheck != null && emailCheck.getId() != admin.getId()) {
            model.addAttribute("user", admin);
            model.addAttribute("emailExists", true);
            return "admin/editAdmin";
        } else {
            userService.edit(admin);
            return "redirect:/admin/dashboard";
        }
    }

    @PostMapping("/changePassword")
    public String changePassword(@AuthenticationPrincipal CurrentUser customUser, Model model, @RequestParam String oldPassword, @RequestParam String newPassword, @RequestParam String newPasswordCheck) {
        User loggedAdmin = customUser.getUser();
        User admin = (User) userService.findById(loggedAdmin.getId());
        if (!passwordEncoder.matches(oldPassword, admin.getPassword())) {
            model.addAttribute("admin", admin);
            model.addAttribute("incorrectOldPassword", true);
            return "admin/editAdmin";
        } else if (!newPassword.equals(newPasswordCheck)) {
            model.addAttribute("admin", admin);
            model.addAttribute("incorrectNewPassword", true);
            return "admin/editAdmin";
        } else {
            admin.setPassword(newPassword);
            userService.changePassword(admin);
            return "redirect:/admin/dashboard";
        }
    }

    @RequestMapping("/orgList")
    public String orgList(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        List<User> orgs = userService.findOrg(true);
        model.addAttribute("orgs", orgs);
        return "admin/orgList";
    }


    @GetMapping("/addOrg")
    public String addOrg(Model model) {
        List<Location> locations = locationService.findAll();
        List<Receiver> receivers = receiverService.findAll();
        List<Goods> goods = goodsService.findAll();
        model.addAttribute("receivers", receivers);
        model.addAttribute("goods", goods);
        model.addAttribute("locations", locations);
        model.addAttribute("org", new User());
        return "admin/addOrg";
    }

    @PostMapping("/addOrg")
    public String addedOrg(@ModelAttribute @Valid User org, BindingResult result, Model model) {
        User emailCheck = (User) userService.findByEmail(org.getEmail());
        if (result.hasErrors()) {
            List<Location> locations = locationService.findAll();
            List<Receiver> receivers = receiverService.findAll();
            List<Goods> goods = goodsService.findAll();
            model.addAttribute("receivers", receivers);
            model.addAttribute("goods", goods);
            model.addAttribute("locations", locations);
            model.addAttribute("org", org);
            return "admin/addOrg";
        } else if (emailCheck != null || !org.getPassword().equals(org.getCheckPassword()) || org.getOrgReceivers().size() == 0 || org.getOrgGoods().size() == 0) {
            if (emailCheck != null) {
                model.addAttribute("emailExists", true);
            }
            if (!org.getPassword().equals(org.getCheckPassword())) {
                model.addAttribute("incorrectPasswordCheck", true);
            }
            if (org.getOrgGoods().size() == 0) {
                model.addAttribute("emptyGoods", true);
            }
            if (org.getOrgReceivers().size() == 0) {
                model.addAttribute("emptyReceivers", true);
            }
            List<Location> locations = locationService.findAll();
            List<Receiver> receivers = receiverService.findAll();
            List<Goods> goods = goodsService.findAll();
            model.addAttribute("receivers", receivers);
            model.addAttribute("goods", goods);
            model.addAttribute("locations", locations);
            model.addAttribute("org", org);
            return "admin/addOrg";
        }  else {
            userService.saveOrgByAdmin(org);
            UUID userUUID = new UUID();
            userUUID.setUser(org);
            uuidService.save(userUUID);
            return "redirect:/admin/orgList";
        }
    }


    @PostMapping("/changeOrgPassword/{orgId}")
    public String changeOrgPassword(@PathVariable Long orgId, Model model, @RequestParam String newPassword, @RequestParam String newPasswordCheck) {
        User org = (User) userService.findById(orgId);
        if (org != null && org.isOrg() == true) {
            if (!newPassword.equals(newPasswordCheck)) {
                model.addAttribute("org", org);
                model.addAttribute("incorrectNewPassword", true);
                return "admin/modAdmin";
            } else {
                org.setPassword(newPassword);
                userService.changePassword(org);
                return "redirect:/admin/orgList";
            }
        } else {
            return "redirect:/403";
        }
    }

    @RequestMapping("/orgDetails/{orgId}")
    public String orgDetails(@PathVariable Long orgId, Model model) {
        User org = (User) userService.findById(orgId);
        if (org != null && org.isOrg() == true) {
            model.addAttribute("org", org);
            return "admin/orgDetails";
        } else {
            return "redirect:/403";
        }
    }

    @GetMapping("/addUser")
    public String addUser(Model model) {
        model.addAttribute("user", new User());
        return "admin/addUser";
    }

    @PostMapping("/addUser")
    public String addedUser(@ModelAttribute @Valid User user, BindingResult result, Model model) {
        User emailCheck = (User) userService.findByEmail(user.getEmail());
        if (result.hasErrors()) {
            model.addAttribute("user", user);
            return "admin/addUser";
        } else if (emailCheck != null || !user.getPassword().equals(user.getCheckPassword())) {
            if (emailCheck != null) {
                model.addAttribute("emailExists", true);
            }
            if (!user.getPassword().equals(user.getCheckPassword())) {
                model.addAttribute("incorrectPasswordCheck", true);
            }
            model.addAttribute("user", user);
            return "admin/addUser";
        } else {
            userService.saveUserByAdmin(user);
            UUID userUUID = new UUID();
            userUUID.setUser(user);
            uuidService.save(userUUID);
            return "home/registrationComplete";
        }
    }

    @RequestMapping("/userList")
    public String userList(Model model) {
        Role userRole = (Role) roleService.findByRole("ROLE_USER");
        Set<Role> userRoles = new HashSet<>();
        userRoles.add(userRole);
        List<User> users = userService.findByRole(userRoles);
        model.addAttribute("users", users);
        return "admin/userList";
    }

    @RequestMapping("/userPage/{userId}")
    public String userPage(@PathVariable Long userId, @AuthenticationPrincipal CurrentUser customUser, Model model) {
        User user = (User) userService.findById(userId);
        User loggedUser = customUser.getUser();
        if (user != null && user.getId() != loggedUser.getId() && user.isOrg() == false) {
            model.addAttribute("user", user);
            return "admin/userPage";
        } else {
            return "redirect:/403";
        }
    }

    @RequestMapping("/offerDetails/{offerId}")
    public String userOffer(@PathVariable Long offerId, Model model) {
        Offer offer = (Offer) offerService.findById(offerId);
        if (offer != null) {
            model.addAttribute("offer", offer);
            return "admin/userOffer";
        } else {
            return "redirect:/403";
        }

    }

}
