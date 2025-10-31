package com.example.tennisservice.service;

import com.example.tennisservice.model.Player;
import com.example.tennisservice.repository.PlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PlayerService {

    private final PlayerRepository playerRepository;

    @Autowired
    public PlayerService(PlayerRepository playerRepository) {
        this.playerRepository = playerRepository;
    }

    public List<Player> getAllPlayers() {
        return playerRepository.findAll();
    }

    public Optional<Player> getPlayerById(int id) {
        return playerRepository.findById(id);
    }

    public int addPlayer(Player player) {
        return playerRepository.save(player);
    }

    // Update player
    public boolean updatePlayer(int id, Player player) {
        player.setPlayerId(id);
        int rows = playerRepository.update(player);
        return rows > 0;
    }

    // Delete player
    public boolean deletePlayer(int id) {
        int rows = playerRepository.deleteById(id);
        return rows > 0;
    }

    public List<Player> getPlayersWithPaginationAndSorting(int offset, int pageSize, String sortColumn, String order) {
        return playerRepository.findPlayersWithPaginationAndSorting(offset, pageSize, sortColumn, order);
    }
}