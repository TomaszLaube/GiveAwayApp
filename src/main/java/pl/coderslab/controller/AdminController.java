package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.CurrentUser;
import pl.coderslab.model.Role;
import pl.coderslab.model.User;
import pl.coderslab.service.RoleService;
import pl.coderslab.service.UserService;

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


    @RequestMapping("/dashboard")
    public String adminDashboard(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedAdmin = customUser.getUser();
        User fullAdmin = (User)userService.findById(loggedAdmin.getId());
        model.addAttribute("admin",fullAdmin);
        return "admin/dashboard";
    }

    @RequestMapping("/adminList")
    public String adminList(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedAdmin = customUser.getUser();
        User fullAdmin = (User)userService.findById(loggedAdmin.getId());
        Role adminRole = (Role)roleService.findByRole("ROLE_ADMIN");
        Set<Role> adminRoles = new HashSet<>();
        adminRoles.add(adminRole);
        List<User> admins = userService.findByRole(adminRoles);
        admins = admins.stream()
                .filter(s -> s.getId()!=fullAdmin.getId())
                .collect(Collectors.toList());

        model.addAttribute("admins",admins);
        return "admin/adminList";
    }

    @GetMapping("/addAdmin")
    public String addAdmin(Model model){
        model.addAttribute("admin", new User());
        return "admin/addAdmin";
    }

    @PostMapping("/addAdmin")
    public String addedAdmin(@ModelAttribute @Valid User admin, BindingResult result, Model model){
        User emailCheck = (User)userService.findByEmail(admin.getEmail());
        if(result.hasErrors()){
            model.addAttribute("admin",admin);
            return "app/addAdmin";
        } else if(emailCheck != null || !admin.getPassword().equals(admin.getCheckPassword())){
            if(emailCheck != null){
                model.addAttribute("emailExists", true);
            } if(!admin.getPassword().equals(admin.getCheckPassword())){
                model.addAttribute("incorrectPasswordCheck",true);
            }
            model.addAttribute("admin", admin);
            return "app/addAdmin";
        }
        else {
            userService.saveAdmin(admin);
            return "redirect:/admin/adminList";
        }
    }


    @RequestMapping("/modAccess/{adminId}")
    public String blockAdmin(@PathVariable Long adminId){
        User toChange = (User)userService.findById(adminId);
        if(toChange!=null){
            if(toChange.isEnabled()){
                toChange.setEnabled(false);
            } else{
                toChange.setEnabled(true);
            }
            userService.update(toChange);
            return "redirect:/admin/adminList";
        } else{
            return "redirect:/admin/403";
        }

    }

    @RequestMapping("/changeRole/{adminId}")
    public String changeRole(@PathVariable Long adminId){
        User toChange = (User)userService.findById(adminId);
        Set<Role> roles = toChange.getRoles();
        Role user = (Role)roleService.findByRole("ROLE_USER");
        Role admin = (Role)roleService.findByRole("ROLE_ADMIN");

        if(roles.size()>0 && toChange!=null){
            Set<Role> newRole = new HashSet<>();
            Role current = roles.iterator().next();
            if(current.getName().equals(admin.getName())){
                newRole.add(user);
                toChange.setRoles(newRole);
            }
            else if(current.getName().equals(user.getName())){
                newRole.add(admin);
                toChange.setRoles(newRole);
            }
            userService.update(toChange);
        }else {
            return "redirect:/403";
        }
        return "redirect:/admin/adminList";
    }

    @GetMapping("/modAdmin/{adminId}")
    public String modAdmin(@PathVariable Long adminId, Model model){
        User adminToMod = (User)userService.findById(adminId);
        if(adminToMod!=null){
            model.addAttribute("admin", adminToMod);
            return "admin/modAdmin";
        } else{
            return "redirect:/403";
        }
    }

    @PostMapping("/modAdmin/{adminId}")
    public String moddedAdmin(@ModelAttribute @Valid User admin, BindingResult result, Model model){
        User emailCheck = (User)userService.findByEmail(admin.getEmail());
        if(result.hasErrors()){
            model.addAttribute("admin",admin);
            return "admin/modAdmin";
        }else if(emailCheck!=null && emailCheck.getId()!=admin.getId()){
            model.addAttribute("user",admin);
            model.addAttribute("emailExists",true);
            return "admin/modAdmin";
        }else{
            userService.edit(admin);
            return "redirect:/admin/adminList";
        }
    }

    @PostMapping("/changePassword/{adminId}")
    public String changedPwd(@PathVariable Long adminId, @RequestParam String newPassword, @RequestParam String newPasswordCheck, Model model){
        User admin = (User)userService.findById(adminId);
        if(admin!=null){
            if(!newPassword.equals(newPasswordCheck)){
                model.addAttribute("admin",admin);
                model.addAttribute("incorrectNewPassword", true);
                return "admin/modAdmin";
            } else{
                admin.setPassword(newPassword);
                userService.changePassword(admin);
                return "redirect:/admin/adminList";
            }
        } else{
            return "redirect:/403";
        }
    }


    @GetMapping("/editAdmin")
    public String editAdmin(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedAdmin = customUser.getUser();
        User admin = (User)userService.findById(loggedAdmin.getId());

        model.addAttribute("admin",admin);
        return "admin/editAdmin";
    }

    @PostMapping("/editAdmin")
    public String editedAdmin(@ModelAttribute @Valid User admin, BindingResult result, Model model){
        User emailCheck = (User)userService.findByEmail(admin.getEmail());
        if(result.hasErrors()){
            model.addAttribute("admin",admin);
            return "admin/editAdmin";
        }else if(emailCheck!=null && emailCheck.getId()!=admin.getId()){
            model.addAttribute("user",admin);
            model.addAttribute("emailExists",true);
            return "admin/editAdmin";
        }else{
            userService.edit(admin);
            return "redirect:/admin/dashboard";
        }
    }

    @PostMapping("/changePassword")
    public String changePassword(@AuthenticationPrincipal CurrentUser customUser, Model model, @RequestParam String oldPassword, @RequestParam String newPassword, @RequestParam String newPasswordCheck){
        User loggedAdmin = customUser.getUser();
        User admin = (User) userService.findById(loggedAdmin.getId());
        if (!passwordEncoder.matches(oldPassword, admin.getPassword())) {
            model.addAttribute("admin", admin);
            model.addAttribute("incorrectOldPassword", true);
            return "admin/editAdmin";
        } else if (!newPassword.equals(newPasswordCheck)) {
            model.addAttribute("admin",admin);
            model.addAttribute("incorrectNewPassword", true);
            return "admin/editAdmin";
        } else {
            admin.setPassword(newPassword);
            userService.changePassword(admin);
            return "redirect:/admin/dashboard";
        }
    }
}
