package com.example.wb.dao;

import com.example.wb.pojo.Website;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface WebsiteDao extends JpaRepository<Website, Long> {
    List<Website> findByCategory(String category);
}
