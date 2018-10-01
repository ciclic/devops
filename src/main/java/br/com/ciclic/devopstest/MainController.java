package br.com.ciclic.devopstest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public final class MainController {

    @GetMapping
    public String hello(){
        String message = "Ciclic test";
        return message;
    }
}
