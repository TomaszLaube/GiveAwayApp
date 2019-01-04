package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.model.*;
import pl.coderslab.service.*;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Scanner;

@Controller
//@RequestMapping("/admin")
public class AddinsController {
    @Autowired
    LocationService locationService;
    @Autowired
    RoleService roleService;
    @Autowired
    GoodsService goodsService;
    @Autowired
    ReceiverService receiverService;
    @Autowired
    UserService userService;

    @RequestMapping("/initializeDB")
    public String addCities(){
        List<Location> citiesCheck = locationService.findAll();
        List<Role> rolesCheck = roleService.findAll();
        List<Goods> goodsCheck = goodsService.findAll();
        List<Receiver> receiversCheck = receiverService.findAll();
        User adminCheck = (User)userService.findById(1L);

        if(citiesCheck.size()==0){
            File cities = new File("PolishCities.txt");
            try{
                Scanner input = new Scanner(cities);
                while(input.hasNextLine()){
                    Location location = new Location();
                    location.setName(input.nextLine());
                    locationService.save(location);
                }
            }catch(IOException e){
                e.printStackTrace();
            }
        }
        if(rolesCheck.size()==0){
            Role admin = new Role();
            admin.setName("ROLE_ADMIN");
            Role user = new Role();
            user.setName("ROLE_USER");
            Role org = new Role();
            org.setName("ROLE_ORG");
            roleService.save(admin);
            roleService.save(user);
            roleService.save(org);
        }
        if(goodsCheck.size()==0){
            Goods goodClothes = new Goods();
            goodClothes.setName("Ubrania ponownego użytku");
            Goods otherClothes = new Goods();
            otherClothes.setName("Ubrania do przeróbek");
            Goods toys = new Goods();
            toys.setName("Zabawki");
            Goods books = new Goods();
            books.setName("Książki");
            Goods other = new Goods();
            other.setName("Inne");

            goodsService.save(goodClothes);
            goodsService.save(otherClothes);
            goodsService.save(toys);
            goodsService.save(books);
            goodsService.save(other);
        }
        if(receiversCheck.size()==0){
         Receiver kids = new Receiver();
         Receiver mothers = new Receiver();
         Receiver homeless = new Receiver();
         Receiver disabled = new Receiver();
         Receiver elders = new Receiver();

         kids.setName("Dzieci");
         mothers.setName("Samotne matki");
         homeless.setName("Bezdomni");
         disabled.setName("Niepełnosprawni");
         elders.setName("Osoby starsze");

         receiverService.save(kids);
         receiverService.save(mothers);
         receiverService.save(homeless);
         receiverService.save(disabled);
         receiverService.save(elders);

        }
        if(adminCheck==null){
            User admin = new User();
            admin.setEmail("admin@admin.pl");
            admin.setPassword("admin");
            admin.setFirstName("Admin");
            admin.setLastName("Admin");
            userService.saveAdmin(admin);
        }
        return "redirect:/app/dashboard";
    }
}
