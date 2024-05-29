package com.example.wb.controller;


import com.example.wb.dao.AnimeDao;
import com.example.wb.pojo.Anime;
import com.example.wb.service.AnimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/anime")
public class AnimeController {

    @Autowired
    private AnimeService animeService;

    @GetMapping("/all")
    public ResponseEntity<List<Anime>> getAllAnime() {
        List<Anime> animeList = animeService.getAllAnime();
        return ResponseEntity.ok(animeList);
    }
    @GetMapping("/{id}")
    public ResponseEntity<Anime> getAnimeById(@PathVariable Long id) {
        Optional<Anime> anime = animeService.getAnimeById(id);
        if (anime.isPresent()) {
            return ResponseEntity.ok(anime.get());
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping("/add")
    public ResponseEntity<Anime> addAnime(@RequestBody Anime anime) {
        Anime addedAnime = animeService.addAnime(anime);
        return ResponseEntity.ok(addedAnime);
    }
    @GetMapping("/search")
    public List<Anime> search(@RequestParam String nameCn){
        return animeService.findAnimeByNameCn(nameCn);
    }



    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteAnime(@PathVariable Long id) {
        if (!animeService.getAnimeById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        animeService.deleteAnime(id);
        return ResponseEntity.noContent().build();
    }
}
