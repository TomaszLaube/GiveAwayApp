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
import java.sql.Timestamp;
import java.util.*;
import java.util.UUID;
import java.util.stream.Collectors;

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

    @Autowired
    OfferService offerService;

    @Autowired
    GatheringService gatheringService;

    @Autowired
    UuidService uuidService;

    @RequestMapping("/")
    public String home(Model model){
        List<Offer> allOffers = offerService.findAll();
        List<Gathering> allGatherings = gatheringService.findAll();
        List<User> supportedOrgs = new ArrayList<>();
        List<User> allOrgs = userService.findOrg(true);
        List<Gathering> activeGatherings = new ArrayList<>();
        long bagNum = 0;
        for(Offer o: allOffers){
            bagNum += o.getBagNum();
            supportedOrgs.add(o.getInstitution());
        }
        supportedOrgs = supportedOrgs.stream()
                .distinct()
                .collect(Collectors.toList());

        Date date = new Date();
        for(Gathering g: allGatherings){
            if(g.getDate().after(date)){
                activeGatherings.add(g);
            }
        }
        model.addAttribute("activeGatherings", activeGatherings);
        model.addAttribute("orgNum", supportedOrgs.size());
        model.addAttribute("bagNum", bagNum);
        model.addAttribute("gatheringNum", allGatherings.size());
        model.addAttribute("allOrgs", allOrgs);
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
            pl.coderslab.model.UUID userUUID = new pl.coderslab.model.UUID();
            userUUID.setUser(user);
            uuidService.save(userUUID);
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
            List<Location> locations = locationService.findAll();
            List<Receiver> receivers = receiverService.findAll();
            List<Goods> goods = goodsService.findAll();
            model.addAttribute("receivers", receivers);
            model.addAttribute("goods",goods);
            model.addAttribute("locations",locations);
            model.addAttribute("user",user);
            return "home/registrationOrg";
        } else if(emailCheck != null || !user.getPassword().equals(user.getCheckPassword())){
            if(emailCheck != null){
                model.addAttribute("emailExists", true);
            } if(!user.getPassword().equals(user.getCheckPassword())){
                model.addAttribute("incorrectPasswordCheck",true);
            }
            List<Location> locations = locationService.findAll();
            List<Receiver> receivers = receiverService.findAll();
            List<Goods> goods = goodsService.findAll();
            model.addAttribute("receivers", receivers);
            model.addAttribute("goods",goods);
            model.addAttribute("locations",locations);
            model.addAttribute("user", user);
            return "home/registrationOrg";
        }
        else {
            userService.saveOrg(user);
            pl.coderslab.model.UUID userUUID = new pl.coderslab.model.UUID();
            userUUID.setUser(user);
            uuidService.save(userUUID);
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
            }else if(r.getName().equals((orgRole.getName()))){
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

    @RequestMapping("/support")
    public String support(Model model){
        List<Offer> allOffers = offerService.findAll();
        List<Gathering> allGatherings = gatheringService.findAll();
        List<User> supportedOrgs = new ArrayList<>();
        long bagNum = 0;
        for(Offer o: allOffers){
            bagNum += o.getBagNum();
            supportedOrgs.add(o.getInstitution());
        }
        supportedOrgs = supportedOrgs.stream()
                .distinct()
                .collect(Collectors.toList());

        model.addAttribute("orgNum", supportedOrgs.size());
        model.addAttribute("bagNum", bagNum);
        model.addAttribute("gatheringNum", allGatherings.size());
        return "home/support";
    }

    @RequestMapping("/about")
    public String about(){
        return "home/about";
    }

    @RequestMapping("/orgOverview")
    public String orgOverview(Model model){
        List<Gathering> allGatherings = gatheringService.findAll();
        List<User> allOrgs = userService.findOrg(true);
        List<Gathering> activeGatherings = new ArrayList<>();
        Date date = new Date();
        for(Gathering g: allGatherings){
            if(g.getDate().after(date)){
                activeGatherings.add(g);
            }
        }
        model.addAttribute("activeGatherings", activeGatherings);
        model.addAttribute("allOrgs", allOrgs);
        return "home/orgOverview";
    }

    @GetMapping("/contact")
    public String contact(){
        return "home/contact";
    }

    @PostMapping("/contactForm")
    public String contactForm(@RequestParam String email, @RequestParam String firstName, @RequestParam String lastName, @RequestParam String message, Model model){
        //email send placeholder
        return "home/messageSent";
    }

    @RequestMapping("/orgDetails/{orgId}")
    public String orgDetails(@PathVariable Long orgId, Model model){
        User org = (User)userService.findById(orgId);
        if(org!=null && org.isOrg()==true){
            List<Gathering> allGatherings = gatheringService.findAll();
            List<User> allOrgs = userService.findOrg(true);
            List<Gathering> activeGatherings = new ArrayList<>();
            Date date = new Date();
            for(Gathering g: allGatherings){
                if(g.getDate().after(date)){
                    activeGatherings.add(g);
                }
            }
            long receivedNum = offerService.countByOrgAndSentAndReceived(orgId,true, true);
            long sentNum = offerService.countByOrgAndSentAndReceived(orgId, true, false);
            long newNum = offerService.countByOrgAndSentAndReceived(orgId, false, false);
            model.addAttribute("receivedNum", receivedNum);
            model.addAttribute("sentNum", sentNum);
            model.addAttribute("newNum", newNum);
            model.addAttribute("activeGatherings", activeGatherings);
            model.addAttribute("allOrgs", allOrgs);
            model.addAttribute("org", org);
            return "home/orgDetails";
        } else{
            return "redirect:/403";
        }
    }

    @RequestMapping("/gatheringDetails/{gatheringId}")
    public String gatheringDetails(@PathVariable Long gatheringId, Model model){
        Gathering gathering = (Gathering) gatheringService.findById(gatheringId);
        Date date = new Date();
        if(gathering!=null && gathering.getDate().after(date)){
            List<Gathering> allGatherings = gatheringService.findAll();
            List<User> allOrgs = userService.findOrg(true);
            List<Gathering> activeGatherings = new ArrayList<>();
            for(Gathering g: allGatherings){
                if(g.getDate().after(date)){
                    activeGatherings.add(g);
                }
            }
            model.addAttribute("activeGatherings", activeGatherings);
            model.addAttribute("allOrgs", allOrgs);
            model.addAttribute("gathering", gathering);
            return "home/gatheringDetails";
        } else{
            return "redirect:/403";
        }
    }

    @GetMapping("/forgottenPassword")
    public String resetPwd(){
        return "home/resetPwd";
    }

    @PostMapping("/forgottenPassword")
    public String clearedPwd(@RequestParam String email, Model model){
        User byEmail = (User)userService.findByEmail(email);
        if(byEmail!=null){
            pl.coderslab.model.UUID userUUID = (pl.coderslab.model.UUID)uuidService.findByUserId(byEmail.getId());
            if(userUUID!=null){
                uuidService.edit(userUUID);
                //wysłanie maila
                return "home/pwdResetConfirm";
            } else {
                return "redirect:/403";
            }
        } else {
            model.addAttribute("userNotFound", true);
            return "home/resetPwd";
        }
    }

    @GetMapping("/newPwd/{pwdUuid}")
    public String newPwd(@PathVariable UUID pwdUuid){
        pl.coderslab.model.UUID userUUID = (pl.coderslab.model.UUID)uuidService.findByPwdUUID(pwdUuid);
        if(userUUID!=null){
            Date currentDate = new Date();
            if(userUUID.getPwdExpiry().after(new Timestamp(currentDate.getTime()))){
                return "home/newPwdForm";
            } else {
                return "home/pwdExpired";
            }
        } else {
            return "redirect:/403";
        }
    }
    @PostMapping("/newPwd/{pwdUuid}")
    public String setNewPwd(@PathVariable UUID pwdUuid, @RequestParam String newPassword, @RequestParam String passwordCheck, Model model){
        if(!newPassword.equals(passwordCheck)){
            model.addAttribute("wrongPwdCheck",true);
            return "home/newPwdForm";
        } else{
            pl.coderslab.model.UUID userUuid = (pl.coderslab.model.UUID)uuidService.findByPwdUUID(pwdUuid);
            User user = (User)userService.findById(userUuid.getUser().getId());
            user.setPassword(newPassword);
            userService.changePassword(user);
            return "home/newPwdConfirm";
        }
    }
}
