package com.example.tennisservice.controller;

import com.example.tennisservice.model.Player;
import com.example.tennisservice.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v2/players")
public class PlayerControllerV2 {

    private final PlayerService playerService;

    @Autowired
    public PlayerControllerV2(PlayerService playerService) {
        this.playerService = playerService;
    }

    @GetMapping
    public List<Player> getPlayersV2(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(required = false) String fieldName,
            @RequestParam(defaultValue = "asc") String direction
    ) {
        int pageSize = 10;
        int offset = (page - 1) * pageSize;

        // 映射 fieldName 到数据库列
        String sortColumn = "player_id"; // 默认
        if ("age".equalsIgnoreCase(fieldName)) sortColumn = "birth_date"; // 按生日排序
        else if ("height".equalsIgnoreCase(fieldName)) sortColumn = "height_cm";
        else if ("careerTitles".equalsIgnoreCase(fieldName)) sortColumn = "career_titles";
        else if ("careerWins".equalsIgnoreCase(fieldName)) sortColumn = "career_wins";

        // asc / desc 检查
        String order = "desc".equalsIgnoreCase(direction) ? "DESC" : "ASC";

        return playerService.getPlayersWithPaginationAndSorting(offset, pageSize, sortColumn, order);
    }
}