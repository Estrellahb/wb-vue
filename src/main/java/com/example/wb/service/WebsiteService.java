package com.example.wb.service;

import com.example.wb.dao.WebsiteDao;
import com.example.wb.pojo.Website;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WebsiteService {
    @Autowired
    WebsiteDao websiteDao;
    public List<Website> getAllWebsites(){
        return websiteDao.findAll();
    }
}
