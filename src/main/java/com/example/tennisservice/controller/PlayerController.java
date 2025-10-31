package com.example.tennisservice.controller;

import com.example.tennisservice.model.Player;
import com.example.tennisservice.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.*;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/v1/players")
public class PlayerController {

    private final PlayerService playerService;

    @Autowired
    public PlayerController(PlayerService playerService) {
        this.playerService = playerService;
    }

    @GetMapping
    public List<Object> getAllPlayers(@RequestParam(defaultValue = "true") boolean isAdmin) {
        List<Player> players = playerService.getAllPlayers();

        return players.stream().map(p -> {
            if (isAdmin) {
                // 管理员：返回所有信息
                return p;
            } else {
                // 普通用户：只显示 firstName（+ age）
                Map<String, Object> result = new HashMap<>();
                result.put("firstName", p.getFirstName());
                result.put("age", p.getAge());
                return result;
            }
        }).collect(Collectors.toList());
    }

    @GetMapping("/{id}")
    public Object getPlayerById(@PathVariable int id,
                                @RequestParam(defaultValue = "false") boolean isAdmin) {
        Optional<Player> playerOpt = playerService.getPlayerById(id);
        if (!playerOpt.isPresent()) {
            return ResponseEntity.notFound().build();
        }
        Player p = playerOpt.get();

        if (isAdmin) {
            return p;
        } else {
            Map<String, Object> result = new HashMap<>();
            result.put("firstName", p.getFirstName());
            result.put("age", p.getAge());
            return result;
        }
    }

    // Add Players
    @PostMapping
    public ResponseEntity<String> addPlayer(@RequestBody Player player) {
        int result = playerService.addPlayer(player);
        if (result > 0) {
            return ResponseEntity.ok("Player added successfully!");
        } else {
            return ResponseEntity.badRequest().body("Failed to add player.");
        }
    }

    // Update players
    @PutMapping("/{id}")
    public ResponseEntity<String> updatePlayer(@PathVariable int id, @RequestBody Player player) {
        boolean updated = playerService.updatePlayer(id, player);
        if (updated) {
            return ResponseEntity.ok("Player updated successfully!");
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // Delete players
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deletePlayer(@PathVariable int id) {
        boolean deleted = playerService.deletePlayer(id);
        if (deleted) {
            return ResponseEntity.ok("Player deleted successfully!");
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}