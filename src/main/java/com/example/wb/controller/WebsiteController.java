package com.example.wb.controller;

import com.example.wb.pojo.Website;
import com.example.wb.service.WebsiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@RestController
@RequestMapping("/api/website")
public class WebsiteController {
    @Autowired
    private WebsiteService websiteService;

    @GetMapping
    public List<Website> getAllWebsites(){
        return websiteService.getAllWebsites();
    }
}
