package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.comparators.LocationComparator;
import pl.coderslab.model.*;
import pl.coderslab.service.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/app")
@SessionAttributes({"newOffer"})
public class AppController {

    @Autowired
    UserService userService;

    @Autowired
    GoodsService goodsService;

    @Autowired
    ReceiverService receiverService;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Autowired
    GatheringService gatheringService;

    @Autowired
    LocationService locationService;

    @Autowired
    OfferService offerService;

    @RequestMapping("/dashboard")
    public String userDashboard(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedUser = customUser.getUser();
        User user = (User)userService.findById(loggedUser.getId());
        Set<Offer> offers = user.getOffers();
        Set<Gathering> gatherings = user.getGatherings();
        List<User> supportedOrgs = new ArrayList<>();

        Long bagsNum = 0L;
        Long gatheringsNum = 0L;

        for(Offer o: offers){
            bagsNum += o.getBagNum();
            supportedOrgs.add(o.getInstitution());
        }
        for(Gathering g: gatherings){
            gatheringsNum++;
        }
        supportedOrgs = supportedOrgs.stream()
                .distinct()
                .collect(Collectors.toList());

        model.addAttribute("supportedOrgsNum", supportedOrgs.size());
        model.addAttribute("bagsNum", bagsNum);
        model.addAttribute("gatheringsNum",gatheringsNum);
        model.addAttribute("user",user);
        return "app/dashboard";
    }


    @GetMapping("/createGiveAway")
    public String giveAwayForm(Model model){
        List<Goods> goods = goodsService.findAll();
        List<Receiver> receivers = receiverService.findAll();
        List<User> orgs = userService.findOrg(true);
        List<Location> activeCities = new ArrayList<>();
        for(User u: orgs){
            activeCities.add(u.getLocation());
        }
        if(activeCities.size()>0){
            activeCities =  activeCities.stream()
                    .distinct()
                    .collect(Collectors.toList());
            Collections.sort(activeCities, new LocationComparator());
        }

        model.addAttribute("locations", activeCities);
        model.addAttribute("goods",goods);
        model.addAttribute("receivers",receivers);
        model.addAttribute("offer",new Offer());
        return "app/giveAwayForm";
    }


    @PostMapping("/createGiveAway")
    public String giveAwayAdded(@ModelAttribute Offer offer, Model model, @AuthenticationPrincipal CurrentUser customUser, @RequestParam Long locationId){
        if(offer.getGoods().size()==0 || offer.getReceivers().size()==0){
            if(offer.getGoods().size()==0){
                model.addAttribute("emptyGoods",true);
            }
            if(offer.getReceivers().size()==0){
                model.addAttribute("emptyReceivers",true);
            }
            List<Goods> goods = goodsService.findAll();
            List<Receiver> receivers = receiverService.findAll();
            List<User> orgs = userService.findOrg(true);
            List<Location> activeCities = new ArrayList<>();
            for(User u: orgs){
                activeCities.add(u.getLocation());
            }
            if(activeCities.size()>0){
                activeCities =  activeCities.stream()
                        .distinct()
                        .collect(Collectors.toList());
                Collections.sort(activeCities, new LocationComparator());
            }
            Collections.sort(activeCities, new LocationComparator());
            model.addAttribute("locations", activeCities);
            model.addAttribute("goods",goods);
            model.addAttribute("receivers",receivers);
            model.addAttribute("offer",offer);
            return "app/giveAwayForm";
        }
        User loggedUser = customUser.getUser();
        User user = (User)userService.findById(loggedUser.getId());
        offer.setUser(user);
        Set<Goods> offerGoods = offer.getGoods();
        Set<Receiver> offerReceivers = offer.getReceivers();

        Location pickedCity = (Location)locationService.findById(locationId);
        List<User> organisations = userService.findOrgByLocation(pickedCity, true);
        List<User> filteredOrgs = new ArrayList<>();
        for(User o: organisations){
           Set<Goods> matchGoods = o.getOrgGoods();
           Set<Receiver> matchReceivers = o.getOrgReceivers();
           if(matchGoods.containsAll(offerGoods) && matchReceivers.containsAll(offerReceivers)){
               filteredOrgs.add(o);
           }
        }
        model.addAttribute("filteredOrgs",filteredOrgs);
        model.addAttribute("newOffer",offer);
        model.addAttribute("location",pickedCity);
        return "app/giveAwayForm2";
    }

    @PostMapping("/createGiveAwaySecond")
    public String pickedOrg(HttpSession session, @RequestParam Long orgId, Model model){
        User org = (User) userService.findById(orgId);
        Offer newOffer = (Offer) session.getAttribute("newOffer");
        newOffer.setInstitution(org);
        model.addAttribute("newOffer", newOffer);
        return "app/giveAwayForm3";
    }

    @PostMapping("/createGiveAwayThird")
    public String deliveryData(HttpSession session, @ModelAttribute @Valid Offer newOffer, BindingResult result, Model model){
        if(result.hasErrors()){
            model.addAttribute("newOffer", newOffer);
            return "app/giveAwayForm3";
        }
        Offer sessionOffer = (Offer) session.getAttribute("newOffer");
        newOffer.setGoods(sessionOffer.getGoods());
        newOffer.setReceivers(sessionOffer.getReceivers());
        model.addAttribute("newOffer", newOffer);
        return "app/giveAwayForm4";
    }

    @PostMapping("/addGiveAway")
    public String confirmedGiveAway(HttpSession session){
        Offer sessionOffer = (Offer) session.getAttribute("newOffer");
        offerService.save(sessionOffer);
        return "app/giveAwayConfirm";
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

    @GetMapping("/addGathering")
    public String addGathering(Model model){
        List<Receiver> receivers = receiverService.findAll();
        List<Goods> goods = goodsService.findAll();

        model.addAttribute("receivers", receivers);
        model.addAttribute("goods", goods);
        model.addAttribute("gathering", new Gathering());
        return "app/gatheringForm";

    }

    @PostMapping("/addGathering")
    public String addedGathering(@ModelAttribute @Valid Gathering gathering, BindingResult result, Model model, @AuthenticationPrincipal CurrentUser customUser){
        if(result.hasErrors()){
            List<Receiver> receivers = receiverService.findAll();
            List<Goods> goods = goodsService.findAll();

            model.addAttribute("receivers", receivers);
            model.addAttribute("goods", goods);
            model.addAttribute("gathering", gathering);
            return "app/gatheringForm";
        }
        User loggedUser = customUser.getUser();
        User user = (User) userService.findById(loggedUser.getId());
        gathering.setUser(user);
        gatheringService.save(gathering);
        return "redirect:/app/dashboard";
    }

    @RequestMapping("/userOffers")
    public String userOffers(Model model, @AuthenticationPrincipal CurrentUser customUser){
        User loggedUser = customUser.getUser();
        User fullLoggedUser = (User)userService.findById(loggedUser.getId());

        List<Offer> newUserOffers = offerService.findUserOffers(fullLoggedUser.getId(),false);
        List<Offer> sentUserOffers = offerService.findUserOffers(fullLoggedUser.getId(),true);

        model.addAttribute("user",fullLoggedUser);
        model.addAttribute("newUserOffers",newUserOffers);
        model.addAttribute("sentUserOffers",sentUserOffers);

        return "app/userOffers";
    }

    @RequestMapping("/offerDetails/{offerId}")
    public String offerDetails(@PathVariable Long offerId, @AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedUser = customUser.getUser();
        Offer offer = (Offer)offerService.findById(offerId);
        if(offer!=null && offer.getUser().getId()==loggedUser.getId()){
            model.addAttribute("offer", offer);
            model.addAttribute("user", loggedUser);
            return "app/offerDetails";
        } else{
            return "redirect:/403";
        }


    }

    @RequestMapping("/sentOffer/{offerId}")
    public String sentOffer(@PathVariable Long offerId, Model model, @AuthenticationPrincipal CurrentUser customUser){
        User loggedUser = customUser.getUser();
        Offer offer = (Offer)offerService.findById(offerId);
        //SPRAWDZENIE DATY- wyslane przed przyjazdem kuriera??
        if(offer!=null && offer.getUser().getId()==loggedUser.getId()){
            offer.setSent(true);
            offerService.edit(offer);
            return "redirect:/app/userOffers";
        } else{
            return "redirect:/403";
        }

    }

    @RequestMapping("/userGatherings")
    public String userGatherings(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedUser = customUser.getUser();
        List<Gathering> userGatherings = gatheringService.findAllUserGatherings(loggedUser.getId());
        Date currentDate = new Date();
        for(Gathering g: userGatherings){
            if(g.getDate().before(currentDate)){
                g.setActive(false);
                gatheringService.edit(g);
            }
        }
        List<Gathering> activeGatherings = gatheringService.findUserGatherings(loggedUser.getId(), true);
        List<Gathering> inactiveGatherings = gatheringService.findUserGatherings(loggedUser.getId(), false);
        model.addAttribute("activeGatherings", activeGatherings);
        model.addAttribute("inactiveGatherings", inactiveGatherings);
        return "app/userGatherings";
    }

    @RequestMapping("/gatheringDetails/{gatheringId}")
    public String gatheringDetails(@PathVariable Long gatheringId, @AuthenticationPrincipal CurrentUser customUser, Model model){
        User loggedUser = customUser.getUser();
        Gathering gathering = (Gathering)gatheringService.findById(gatheringId);
        if(gathering!=null && gathering.getUser().getId()==loggedUser.getId()){
            model.addAttribute("gathering", gathering);
            return "app/gatheringDetails";
        } else{
            return "redirect:/403";
        }
    }

}
