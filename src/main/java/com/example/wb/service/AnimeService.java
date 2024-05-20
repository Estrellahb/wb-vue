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

    public Optional<Anime> getAnimeById(Long id) {
        return animeDao.findById(id);
    }

    public Anime saveOrUpdateAnime(Anime anime) {
        return animeDao.save(anime);
    }

    public void deleteAnime(Long id) {
        animeDao.deleteById(id);
    }
}
