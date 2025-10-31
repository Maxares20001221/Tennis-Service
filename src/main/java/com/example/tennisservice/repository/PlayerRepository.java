package com.example.tennisservice.repository;

import com.example.tennisservice.model.Player;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@Repository
public class PlayerRepository {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public PlayerRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Mapping the object from database field.
    private static class PlayerRowMapper implements RowMapper<Player> {
        @Override
        public Player mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new Player(
                    rs.getInt("player_id"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("gender"),
                    rs.getDate("birth_date") != null ? rs.getDate("birth_date").toLocalDate() : null,
                    rs.getDouble("height_cm"),
                    rs.getDouble("weight_kg"),
                    rs.getInt("career_titles"),
                    rs.getInt("career_wins"),
                    rs.getString("country"),
                    rs.getInt("ranking"),
                    rs.getObject("team_id") != null ? rs.getInt("team_id") : null
            );
        }
    }

    // Acquiring all players
    public List<Player> findAll() {
        String sql = "SELECT * FROM players";
        return jdbcTemplate.query(sql, new PlayerRowMapper());
    }

    // Search players by ID
    public Optional<Player> findById(int id) {
        String sql = "SELECT * FROM players WHERE player_id = ?";
        List<Player> players = jdbcTemplate.query(sql, new PlayerRowMapper(), id);
        return players.stream().findFirst();
    }

    // Add player
    public int save(Player player) {
        String sql = "INSERT INTO players (first_name, last_name, gender, birth_date, height_cm, weight_kg, career_titles, career_wins, country, ranking, team_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql,
                player.getFirstName(),
                player.getLastName(),
                player.getGender(),
                player.getBirthDate(),
                player.getHeightCm(),
                player.getWeightKg(),
                player.getCareerTitles(),
                player.getCareerWins(),
                player.getCountry(),
                player.getRanking(),
                player.getTeamId());
    }

    // Update player
    public int update(Player player) {
        String sql = "UPDATE players SET first_name=?, last_name=?, gender=?, birth_date=?, height_cm=?, weight_kg=?, career_titles=?, career_wins=?, country=?, ranking=?, team_id=? WHERE player_id=?";
        return jdbcTemplate.update(sql,
                player.getFirstName(),
                player.getLastName(),
                player.getGender(),
                player.getBirthDate(),
                player.getHeightCm(),
                player.getWeightKg(),
                player.getCareerTitles(),
                player.getCareerWins(),
                player.getCountry(),
                player.getRanking(),
                player.getTeamId(),
                player.getPlayerId());
    }

    // Delete player
    public int deleteById(int id) {
        String sql = "DELETE FROM players WHERE player_id = ?";
        return jdbcTemplate.update(sql, id);
    }

    public List<Player> findPlayersWithPaginationAndSorting(int offset, int pageSize, String sortColumn, String order) {
        String sql = String.format(
                "SELECT * FROM players ORDER BY %s %s LIMIT ? OFFSET ?", sortColumn, order
        );
        return jdbcTemplate.query(sql, new PlayerRowMapper(), pageSize, offset);
    }
}