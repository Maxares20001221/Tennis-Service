package com.example.tennisservice.repository;

import com.example.tennisservice.model.Team;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@Repository
public class TeamRepository {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public TeamRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static class TeamRowMapper implements RowMapper<Team> {
        @Override
        public Team mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new Team(
                    rs.getInt("team_id"),
                    rs.getString("team_name"),
                    rs.getString("country")
            );
        }
    }

    public List<Team> findAll() {
        String sql = "SELECT * FROM teams";
        return jdbcTemplate.query(sql, new TeamRowMapper());
    }

    public Optional<Team> findById(int id) {
        String sql = "SELECT * FROM teams WHERE team_id = ?";
        List<Team> result = jdbcTemplate.query(sql, new TeamRowMapper(), id);
        return result.stream().findFirst();
    }
}