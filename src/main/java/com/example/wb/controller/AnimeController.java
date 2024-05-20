package com.example.wb.controller;


import com.example.wb.pojo.Anime;
import com.example.wb.service.AnimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/anime")
public class AnimeController {

    @Autowired
    private AnimeService animeService;

    @GetMapping
    public List<Anime> getAllAnime() {
        return animeService.getAllAnime();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Anime> getAnimeById(@PathVariable Long id) {
        Optional<Anime> anime = animeService.getAnimeById(id);
        return anime.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<Anime> createAnime(@RequestBody Anime anime) {
        Anime savedAnime = animeService.saveOrUpdateAnime(anime);
        return new ResponseEntity<>(savedAnime, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Anime> updateAnime(@PathVariable Long id, @RequestBody Anime anime) {
        if (!animeService.getAnimeById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        anime.setId(id);
        Anime updatedAnime = animeService.saveOrUpdateAnime(anime);
        return ResponseEntity.ok(updatedAnime);
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
