package com.example.wb.dao;

import com.example.wb.pojo.Anime;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface AnimeDao extends JpaRepository<Anime, Long> {
    @Query("SELECT a FROM Anime a WHERE a.name_cn LIKE %:nameCn%")
    List<Anime> findByNameCnContain(@Param("nameCn") String nameCn);
}
