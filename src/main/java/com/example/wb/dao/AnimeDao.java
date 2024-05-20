package com.example.wb.dao;

import com.example.wb.pojo.Anime;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AnimeDao extends JpaRepository <Anime, Long>{
}
