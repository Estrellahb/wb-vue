package com.example.wb.service;

import com.example.wb.dao.AnimeDao;
import com.example.wb.pojo.Anime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AnimeService {
    @Autowired
    AnimeDao animeDao;
    public List<Anime> getAllAnime() {
        return animeDao.findAll();
    }
    public List<Anime> findAnimeByNameCn(String nameCn) {
        return animeDao.findByNameCnContain("%" + nameCn + "%");
    }

    public Optional<Anime> getAnimeById(Long id) {
        return animeDao.findById(id);
    }


    public void deleteAnime(Long id) {
        animeDao.deleteById(id);
    }

    public Anime addAnime(Anime anime) {return animeDao.save(anime);
    }
}
