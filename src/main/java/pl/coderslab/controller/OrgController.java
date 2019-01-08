package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.model.CurrentUser;
import pl.coderslab.model.Offer;
import pl.coderslab.model.User;
import pl.coderslab.service.OfferService;
import pl.coderslab.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/org")
public class OrgController {

    @Autowired
    UserService userService;

    @Autowired
    OfferService offerService;

    @RequestMapping("/dashboard")
    public String orgDashboard(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedUser = customUser.getUser();
        User fullLoggedUser = (User)userService.findById(loggedUser.getId());
        List<Offer> sentOffers = offerService.findOrgOffers(loggedUser.getId(),true, false);
        List<Offer> newOffers = offerService.findOrgOffers(loggedUser.getId(),false, false);
        List<Offer> receivedOffers = offerService.findOrgOffers(loggedUser.getId(),true, true);


        model.addAttribute("org", fullLoggedUser);
        return "org/dashboard";
    }
}
