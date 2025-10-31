package com.example.tennisservice.service;

import com.example.tennisservice.model.Team;
import com.example.tennisservice.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TeamService {

    private final TeamRepository teamRepository;

    @Autowired
    public TeamService(TeamRepository teamRepository) {
        this.teamRepository = teamRepository;
    }

    // Acquire all teams
    public List<Team> getAllTeams() {
        return teamRepository.findAll();
    }

    // Search team by id
    public Optional<Team> getTeamById(int id) {
        return teamRepository.findById(id);
    }


}