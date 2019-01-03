package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.*;
import pl.coderslab.service.GoodsService;
import pl.coderslab.service.ReceiverService;
import pl.coderslab.service.UserService;

import javax.validation.Valid;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/app")
public class AppController {

    @Autowired
    UserService userService;

    @Autowired
    GoodsService goodsService;

    @Autowired
    ReceiverService receiverService;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @RequestMapping("/dashboard")
    public String userDashboard(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedUser = customUser.getUser();
        User user = (User)userService.findById(loggedUser.getId());
        Set<Offer> offers = user.getOffers();
        Set<Gathering> gatherings = user.getGatherings();

        Long bagsNum = 0L;
        Long offersNum = 0L;
        Long gatheringsNum = 0L;

        for(Offer o: offers){
            bagsNum += o.getBagNum();
            offersNum++;
        }
        for(Gathering g: gatherings){
            gatheringsNum++;
        }

        model.addAttribute("bagsNum", bagsNum);
        model.addAttribute("offersNum", offersNum);
        model.addAttribute("gatheringsNum",gatheringsNum);

        return "app/dashboard";
    }


    @GetMapping("/createGiveAway")
    public String giveAwayForm(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedUser = customUser.getUser();
        User user = (User)userService.findById(loggedUser.getId());
        List<Goods> goods = goodsService.findAll();
        List<Receiver> receivers = receiverService.findAll();

        model.addAttribute("goods",goods);
        model.addAttribute("user",user);
        model.addAttribute("receivers",receivers);
        model.addAttribute("offer",new Offer());
        //return "app/giveAwayForm";
        return "app/testForm";
    }

    //PostMapping Placeholder

    @PostMapping("/createGiveAway")
    public String giveAwayAdded(@ModelAttribute @Valid Offer offer, BindingResult result, Model model){
        if(result.hasErrors()){
            return "redirect:/app/createGiveAway";
        }
        else{
            return "app/dashboard";
        }
    }

    @GetMapping("/editUser")
    public String editUser(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedUser = customUser.getUser();
        User user = (User)userService.findById(loggedUser.getId());

        model.addAttribute("user",user);
        return "app/editUser";
    }

    @PostMapping("/editUser")
    public String editedUser(@ModelAttribute @Valid User user, BindingResult result, Model model){
        User emailCheck = (User)userService.findByEmail(user.getEmail());
        if(result.hasErrors()){
            return"redirect:/app/editUser";
        }else if(emailCheck!=null && emailCheck.getId()!=user.getId()){
            model.addAttribute("user",user);
            model.addAttribute("emailExists",true);
            return"app/editUser";
        }else{
            userService.edit(user);
            return "redirect:/app/dashboard";
        }
    }

    @PostMapping("/changePassword")
    public String changePassword(@AuthenticationPrincipal CurrentUser customUser, Model model, @RequestParam String oldPassword, @RequestParam String newPassword, @RequestParam String newPasswordCheck){
        User loggedUser = customUser.getUser();
        User user = (User) userService.findById(loggedUser.getId());
        if (!passwordEncoder.matches(oldPassword, user.getPassword())) {
            model.addAttribute("user", user);
            model.addAttribute("incorrectOldPassword", true);
            return "app/editUser";
        } else if (!newPassword.equals(newPasswordCheck)) {
            model.addAttribute("user",user);
            model.addAttribute("incorrectNewPassword", true);
            return "app/editUser";
        } else {
            user.setPassword(newPassword);
            userService.changePassword(user);
            return "redirect:/app/dashboard";
        }
    }

}
