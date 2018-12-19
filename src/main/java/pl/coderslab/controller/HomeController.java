package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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
import java.util.Set;
import java.util.UUID;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    UserService userService;

    @Autowired
    RoleService roleService;

    @RequestMapping("/")
    public String home(){
        return "home/homepage";
    }
    @GetMapping("/register")
    public String registerUser(Model model){
        model.addAttribute("user", new User());
        return "home/registration";
    }
    @PostMapping("/register")
    public String registeredUser(@ModelAttribute @Valid User user, BindingResult result, Model model){
        User emailCheck = (User)userService.findByEmail(user.getEmail());
        if(result.hasErrors()){
            model.addAttribute("user",user);
            return "home/registration";
        } else if(emailCheck != null || !user.getPassword().equals(user.getCheckPassword())){
            if(emailCheck != null){
                model.addAttribute("emailExists", true);
            } if(!user.getPassword().equals(user.getCheckPassword())){
                model.addAttribute("incorrectPasswordCheck",true);
            }
            model.addAttribute("user", user);
            return "home/registration";
        }
        else {
            userService.save(user);
            return "home/registrationComplete";
        }


    }
    @RequestMapping("/activateAccount/{uuid}")
    public String activateAccount(@PathVariable UUID uuid){
        User user = (User)userService.findByUUID(uuid);
        User temp = (User)userService.findByEmail("banshee888@op.pl");
        if(user != null){
            user.setValidated(true);
            userService.update(user);
            return "home/activationComplete";
        }
        return "redirect:/403";
    }
    @RequestMapping("/loginSuccess")
    public String loginRedirect(@AuthenticationPrincipal CurrentUser customUser){
        boolean isAdmin = false;
        boolean isUser = false;
        User currentUser = customUser.getUser();
        Set<Role> userRoles = currentUser.getRoles();
        Role adminRole = (Role)roleService.findByRole("ROLE_ADMIN");
        Role userRole = (Role)roleService.findByRole("ROLE_USER");
        for(Role r: userRoles){
            if(r.getName().equals(adminRole.getName())){
                isAdmin = true;
                break;
            }else if(r.getName().equals(userRole.getName())){
                isUser = true;
                break;
            }
        }
        if(isAdmin){
            return "redirect:/admin/dashboard";
        } else if(isUser){
            return "redirect:/app/dashboard";
        } else {
            return "redirect:/403";
        }
    }
}
