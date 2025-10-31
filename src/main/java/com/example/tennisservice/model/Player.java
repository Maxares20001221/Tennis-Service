package com.example.tennisservice.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.time.LocalDate;
import java.time.Period;

public class Player {
    private Integer playerId;
    private String firstName;
    private String lastName;
    private String gender;
    private LocalDate birthDate;
    private Double heightCm;
    private Double weightKg;
    private Integer careerTitles;
    private Integer careerWins;
    private String country;
    private Integer ranking;
    private Integer teamId; // 外键

    // Empty Constructor for reflection in Spring.
    public Player() {
    }

    public Player(Integer playerId, String firstName, String lastName, String gender, LocalDate birthDate,
                  Double heightCm, Double weightKg, Integer careerTitles, Integer careerWins,
                  String country, Integer ranking, Integer teamId) {
        this.playerId = playerId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.birthDate = birthDate;
        this.heightCm = heightCm;
        this.weightKg = weightKg;
        this.careerTitles = careerTitles;
        this.careerWins = careerWins;
        this.country = country;
        this.ranking = ranking;
        this.teamId = teamId;
    }

    // Getter & Setter
    public Integer getPlayerId() { return playerId; }
    public void setPlayerId(Integer playerId) { this.playerId = playerId; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public LocalDate getBirthDate() { return birthDate; }
    public void setBirthDate(LocalDate birthDate) { this.birthDate = birthDate; }

    public Double getHeightCm() { return heightCm; }
    public void setHeightCm(Double heightCm) { this.heightCm = heightCm; }

    public Double getWeightKg() { return weightKg; }
    public void setWeightKg(Double weightKg) { this.weightKg = weightKg; }

    public Integer getCareerTitles() { return careerTitles; }
    public void setCareerTitles(Integer careerTitles) { this.careerTitles = careerTitles; }

    public Integer getCareerWins() { return careerWins; }
    public void setCareerWins(Integer careerWins) { this.careerWins = careerWins; }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }

    public Integer getRanking() { return ranking; }
    public void setRanking(Integer ranking) { this.ranking = ranking; }

    public Integer getTeamId() { return teamId; }
    public void setTeamId(Integer teamId) { this.teamId = teamId; }

    @JsonProperty("age") // 让这个字段在JSON中自动出现
    public Integer getAge() {
        if (birthDate == null) return null;
        return Period.between(birthDate, LocalDate.now()).getYears();
    }
}