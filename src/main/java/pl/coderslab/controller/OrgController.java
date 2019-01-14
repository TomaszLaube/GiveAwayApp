package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.*;
import pl.coderslab.service.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/org")
public class OrgController {

    @Autowired
    UserService userService;

    @Autowired
    OfferService offerService;

    @Autowired
    LocationService locationService;

    @Autowired
    GoodsService goodsService;

    @Autowired
    ReceiverService receiverService;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @RequestMapping("/dashboard")
    public String orgDashboard(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedUser = customUser.getUser();
        User fullLoggedUser = (User)userService.findById(loggedUser.getId());

        long receivedNum = offerService.countByOrgAndSentAndReceived(loggedUser.getId(),true, true);
        long sentNum = offerService.countByOrgAndSentAndReceived(loggedUser.getId(), true, false);
        long newNum = offerService.countByOrgAndSentAndReceived(loggedUser.getId(), false, false);

        model.addAttribute("org", fullLoggedUser);
        model.addAttribute("receivedNum", receivedNum);
        model.addAttribute("sentNum", sentNum);
        model.addAttribute("newNum", newNum);
        return "org/dashboard";
    }

    @RequestMapping("/offerDetails/{offerId}")
    public String orgOfferDetails(@PathVariable Long offerId, @AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedUser = customUser.getUser();
        Offer offer = (Offer)offerService.findById(offerId);
        if(offer!=null && offer.getInstitution().getId() == loggedUser.getId()){
            if(offer.isOpened()==false){
                offer.setOpened(true);
                offerService.edit(offer);
            }
            model.addAttribute("offer", offer);
            model.addAttribute("user", loggedUser);
            return "org/offerDetails";
        } else {
            return "redirect:/403";
        }
    }

    @RequestMapping("/newOffers")
    public String newOrgOffers(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedUser = customUser.getUser();
        List<Offer> newOffers = offerService.findOrgOffers(loggedUser.getId(),false, false);

        model.addAttribute("newOffers", newOffers);
        return "org/newOffers";
    }

    @RequestMapping("/sentOffers")
    public String sentOrgOffers(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedUser = customUser.getUser();
        List<Offer> sentOffers = offerService.findOrgOffers(loggedUser.getId(), true, false);

        model.addAttribute("sentOffers", sentOffers);
        return "org/sentOffers";
    }

    @RequestMapping("/receivedOffers")
    public String receivedOrgOffers(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedUser = customUser.getUser();
        List<Offer> receivedOffers = offerService.findOrgOffers(loggedUser.getId(), true, true);

        model.addAttribute("receivedOffers", receivedOffers);
        return "org/receivedOffers";
    }

    @GetMapping("/updateAccount")
    public String updateOrg(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedUser = customUser.getUser();
        User loggedOrg = (User)userService.findById(loggedUser.getId());
        List<Goods> goods = goodsService.findAll();
        List<Receiver> receivers = receiverService.findAll();
        List<Location> locations = locationService.findAll();

        model.addAttribute("goods", goods);
        model.addAttribute("receivers", receivers);
        model.addAttribute("locations", locations);
        model.addAttribute("user", loggedOrg);
        return "org/updateOrg";
    }

    @PostMapping("/updateAccount")
    public String updatedOrg(@ModelAttribute @Valid User user, BindingResult result, Model model){
        User emailCheck = (User)userService.findByEmail(user.getEmail());
        if(result.hasErrors()){
            List<Goods> goods = goodsService.findAll();
            List<Receiver> receivers = receiverService.findAll();
            List<Location> locations = locationService.findAll();
            model.addAttribute("goods", goods);
            model.addAttribute("receivers", receivers);
            model.addAttribute("locations", locations);
            model.addAttribute("user", user);
            return "org/updateOrg";
        } else if(emailCheck != null && user.getId() != emailCheck.getId()){
            List<Goods> goods = goodsService.findAll();
            List<Receiver> receivers = receiverService.findAll();
            List<Location> locations = locationService.findAll();
            model.addAttribute("goods", goods);
            model.addAttribute("receivers", receivers);
            model.addAttribute("locations", locations);
            model.addAttribute("user", user);
            model.addAttribute("emailExists", true);
            return "org/updateOrg";
        } else if(user.getOrgGoods().size()==0 || user.getOrgReceivers().size()==0){
            if(user.getOrgGoods().size()==0){
                model.addAttribute("emptyGoods",true);
            }
            if(user.getOrgReceivers().size()==0){
                model.addAttribute("emptyReceivers",true);
            }
            List<Goods> goods = goodsService.findAll();
            List<Receiver> receivers = receiverService.findAll();
            List<Location> locations = locationService.findAll();
            model.addAttribute("goods", goods);
            model.addAttribute("receivers", receivers);
            model.addAttribute("locations", locations);
            model.addAttribute("user", user);
            return "org/updateOrg";
        }
        else{
            User mirroredUser = (User)userService.findById(user.getId());
            user.setRoles(mirroredUser.getRoles());
            userService.update(user);
            return "redirect:/org/dashboard";
        }
    }

    @PostMapping("/changePassword")
    public String changeOrgPassword(@RequestParam String oldPassword, @RequestParam String newPassword, @RequestParam String newPasswordCheck, Model model, @AuthenticationPrincipal CurrentUser customUser){
        User loggedUser = customUser.getUser();
        User loggedOrg = (User)userService.findById(loggedUser.getId());
        if(!passwordEncoder.matches(oldPassword, loggedOrg.getPassword())){
            List<Goods> goods = goodsService.findAll();
            List<Receiver> receivers = receiverService.findAll();
            List<Location> locations = locationService.findAll();
            model.addAttribute("goods", goods);
            model.addAttribute("receivers", receivers);
            model.addAttribute("locations", locations);
            model.addAttribute("user", loggedOrg);
            model.addAttribute("incorrectOldPassword", true);
            return "org/updateOrg";
        } else if(!newPassword.equals(newPasswordCheck)){
            List<Goods> goods = goodsService.findAll();
            List<Receiver> receivers = receiverService.findAll();
            List<Location> locations = locationService.findAll();
            model.addAttribute("goods", goods);
            model.addAttribute("receivers", receivers);
            model.addAttribute("locations", locations);
            model.addAttribute("user",loggedOrg);
            model.addAttribute("incorrectNewPassword", true);
            return "org/updateOrg";
        } else{
            loggedOrg.setPassword(newPassword);
            userService.changePassword(loggedOrg);
            return "redirect:/org/dashboard";
        }
    }

    @GetMapping("/updateOffer/{offerId}")
    public String updateOffer(@PathVariable Long offerId, @AuthenticationPrincipal CurrentUser customUser, Model model){
        Offer offer = (Offer)offerService.findById(offerId);
        User loggedUser = customUser.getUser();
        if(offer!=null && offer.isSent()==true && offer.isReceived()==false && offer.getInstitution().getId()==loggedUser.getId()){
            model.addAttribute("offer", offer);
            return "org/confirmReceived";
        } else{
            return "redirect:/403";
        }
    }

    @PostMapping("/updateOffer/{offerId}")
    public String updatedOffer(@PathVariable Long offerId, @RequestParam Long offerId2, Model model){
        if(offerId == offerId2){
            Offer offer = (Offer)offerService.findById(offerId);
            offer.setReceived(true);
            if(offer.isOpened()==false){
                offer.setOpened(true);
            }
            offerService.edit(offer);
            return "redirect:/org/sentOffers";
        } else {
            return "redirect:/403";
        }
    }

}
