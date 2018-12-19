package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app")
public class AppController {


    @RequestMapping("/dashboard")
    public String userDashboard(){
        return "app/dashboard";
    }
}
