package com.asterisk.config;

import com.asterisk.config.dao.Customer;
import com.asterisk.config.dao.CustomerRespo;
import com.datastax.driver.core.utils.UUIDs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@SpringBootApplication
@RestController
public class ConfigCenterApplication implements CommandLineRunner {


    private final CustomerRespo customerRespo;

    @GetMapping("/save")
    public ResponseEntity save() {
        customerRespo.deleteAll();
        return ResponseEntity.ok().build();
    }


    @Autowired
    public ConfigCenterApplication(CustomerRespo customerRespo) {
        this.customerRespo = customerRespo;
    }


    public static void main(String[] args) {
        SpringApplication.run(ConfigCenterApplication.class, args);
    }

    @Override
    public void run(String... strings) throws Exception {


    }
}
