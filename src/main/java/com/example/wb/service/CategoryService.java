package com.example.wb.service;

import com.example.wb.dao.CategoryDao;
import com.example.wb.pojo.Category;
import org.springframework.data.domain.Sort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    @Autowired
    CategoryDao categoryDao;

    public List <Category> list(){
        Sort sort = Sort.by(Sort.Direction.DESC, "id");
        return categoryDao.findAll(sort);
    }
    public Category get(int id){
        Category category= categoryDao.findById(id).orElse(null);
        return category;
    }


}
