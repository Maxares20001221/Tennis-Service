package com.example.tennisservice.model;

public class Team {

    private Integer teamId;
    private String teamName;
    private String country;

    // Empty Constructor for reflection in Spring.
    public Team() {}

    public Team(Integer teamId, String teamName, String country) {
        this.teamId = teamId;
        this.teamName = teamName;
        this.country = country;
    }

    // Getters & Setters
    public Integer getTeamId() {return teamId;}

    public void setTeamId(Integer teamId) {this.teamId = teamId;}

    public String getTeamName() {return teamName;}

    public void setTeamName(String teamName) {this.teamName = teamName;}

    public String getCountry() {return country;}

    public void setCountry(String country) {this.country = country;}

}
