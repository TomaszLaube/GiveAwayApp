package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.*;
import pl.coderslab.service.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Set;
import java.util.UUID;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    UserService userService;

    @Autowired
    RoleService roleService;

    @Autowired
    LocationService locationService;

    @Autowired
    ReceiverService receiverService;

    @Autowired
    GoodsService goodsService;

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
            userService.saveUser(user);
            return "home/registrationComplete";
        }
    }

    @GetMapping("/registerOrganisation")
    public String registerOrganisation(Model model){
        List<Location> locations = locationService.findAll();
        List<Receiver> receivers = receiverService.findAll();
        List<Goods> goods = goodsService.findAll();
        model.addAttribute("receivers", receivers);
        model.addAttribute("goods",goods);
        model.addAttribute("locations",locations);
        model.addAttribute("user", new User());
        return "home/registrationOrg";
    }

    @PostMapping("/registerOrganisation")
    public String registeredOrganisation(@ModelAttribute @Valid User user, BindingResult result, Model model){
        User emailCheck = (User)userService.findByEmail(user.getEmail());
        if(result.hasErrors()){
            model.addAttribute("user",user);
            return "home/registrationOrg";
        } else if(emailCheck != null || !user.getPassword().equals(user.getCheckPassword())){
            if(emailCheck != null){
                model.addAttribute("emailExists", true);
            } if(!user.getPassword().equals(user.getCheckPassword())){
                model.addAttribute("incorrectPasswordCheck",true);
            }
            model.addAttribute("user", user);
            return "home/registrationOrg";
        }
        else {
            userService.saveOrg(user);
            return "home/registrationComplete";
        }
    }


    @RequestMapping("/activateAccount/{uuid}")
    public String activateAccount(@PathVariable UUID uuid){
        /*User user = (User)userService.findByUUID(uuid);
        User temp = (User)userService.findByEmail("banshee888@op.pl");
        if(user != null){
            user.setValidated(true);
            userService.update(user);
            return "home/activationComplete";
        }*/
        return "redirect:/403";
    }
    @RequestMapping("/loginSuccess")
    public String loginRedirect(@AuthenticationPrincipal CurrentUser customUser){
        boolean isAdmin = false;
        boolean isUser = false;
        boolean isOrg = false;
        User currentUser = customUser.getUser();
        Set<Role> userRoles = currentUser.getRoles();
        Role adminRole = (Role)roleService.findByRole("ROLE_ADMIN");
        Role userRole = (Role)roleService.findByRole("ROLE_USER");
        Role orgRole = (Role)roleService.findByRole("ROLE_ORG");
        for(Role r: userRoles){
            if(r.getName().equals(adminRole.getName())){
                isAdmin = true;
                break;
            }else if(r.getName().equals(userRole.getName())){
                isUser = true;
                break;
            }else if(r.getName().equals((userRole.getName()))){
                isOrg = true;
                break;
            }
        }
        if(isAdmin){
            return "redirect:/admin/dashboard";
        } else if(isUser){
            return "redirect:/app/dashboard";
        } else if(isOrg){
            return "redirect:/org/dashboard";
        } else {
            return "redirect:/403";
        }
    }
}
