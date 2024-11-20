require("dotenv").config(); 
var fs = require("fs");
var playersData = JSON.parse(fs.readFileSync("../raw_data/players.json", "utf8"));
var teamsData = JSON.parse(fs.readFileSync("../raw_data/teams.json", "utf8"));
var gamesData = JSON.parse(fs.readFileSync("../raw_data/games.json", "utf8"));

const Pool = require("pg").Pool;
const clientPassword = process.env.DBPassword;

// Connection string:
const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "basketball",
  password: clientPassword,
  port: 5432,
});

// Add players to the table
const addPlayers = () => {
  playersData.forEach((player) => {
    pool.query(
      `INSERT INTO app.players (id, name, poster) VALUES ($1, $2, $3)`,
      [player.id, player.name, player.poster],
      (error, results) => {
        if (error) {
          throw error;
        } else {
          console.log(results);
        }
      }
    );
  });
};

// Add teams to the table
const addTeams = () => {
  teamsData.forEach((team) => {
    pool.query(
      `INSERT INTO app.teams (id, name) VALUES ($1, $2)`,
      [team.id, team.name],
      (error, results) => {
        if (error) {
          throw error;
        } else {
          console.log(results);
        }
      }
    );
  });
};

// Add games to the table
const addGames = function () {
  gamesData.forEach((game) => {
    pool.query(
      'INSERT INTO app.games (id, date, "homeTeam", "awayTeam") VALUES ($1, $2, $3, $4)',
      [game.id, game.date, game.homeTeam.id, game.awayTeam.id],
      (error, results) => {
        if (error) {
          throw error;
        } else {
          console.log(results);
        }
      }
    );
  });
};

// Adding all the shots taken to the database
const gameShots = function () {
  let counter = 0;
  // Home team:
  gamesData.forEach((game) => {
    game.homeTeam.players.forEach((player) => {
      player.shots.forEach((shot) => {
        counter++;
        pool.query(
          `INSERT INTO app.app_shots (id, player_id, game_id, "isMake", "locationX", "locationY", date) VALUES ($1, $2, $3, $4, $5, $6, $7)`,
          [
            counter,
            player.id,
            game.id,
            shot.isMake,
            shot.locationX,
            shot.locationY,
            game.date,
          ],
          (error, results) => {
            if (error) {
              throw error;
            } else {
              console.log(results);
            }
          }
        );
      });
    });
  });
  // Away team:
  gamesData.forEach((game) => {
    game.awayTeam.players.forEach((player) => {
      player.shots.forEach((shot) => {
        counter++;
        pool.query(
          `INSERT INTO app.app_shots (id, player_id, game_id, "isMake", "locationX", "locationY", date) VALUES ($1, $2, $3, $4, $5, $6, $7)`,
          [
            counter,
            player.id,
            game.id,
            shot.isMake,
            shot.locationX,
            shot.locationY,
            game.date,
          ],
          (error, results) => {
            if (error) {
              throw error;
            } else {
              console.log(results);
            }
          }
        );
      });
    });
  });
};

// Adding the box score to the database
const boxScore = () => {
  let counter = 0;
  // Home team:
  gamesData.forEach((game) => {
    game.homeTeam.players.forEach((player) => {
      counter++;
      pool.query(
        `INSERT INTO app.app_player (id, date,"isStarter", game_id, player_id, player_name, minutes, points, assists, "offensiveRebounds", "defensiveRebounds", steals, blocks, turnovers, "defensiveFouls", "offensiveFouls", "freeThrowsMade", "freeThrowsAttempted", "twoPointersMade", "twoPointersAttempted", "threePointersMade", "threePointersAttempted", poster) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23)`,
        [
          counter,
          game.date,
          player.isStarter,
          game.id,
          player.id,
          playersData.find(person => person.id === player.id).name,
          player.minutes,
          player.points,
          player.assists,
          player.offensiveRebounds,
          player.defensiveRebounds,
          player.steals,
          player.blocks,
          player.turnovers,
          player.defensiveFouls,
          player.offensiveFouls,
          player.freeThrowsMade,
          player.freeThrowsAttempted,
          player.twoPointersMade,
          player.twoPointersAttempted,
          player.threePointersMade,
          player.threePointersAttempted,
          playersData.find(person => person.id === player.id).poster,
        ],
        (error, results) => {
          if (error) {
            throw error;
          } else {
            console.log(results);
          }
        }
      );
    });
  });
  // Away team:
  gamesData.forEach((game) => {
    game.awayTeam.players.forEach((player) => {
      counter++;
      pool.query(
        `INSERT INTO app.app_player (id, date,"isStarter", game_id, player_id, player_name, minutes, points, assists, "offensiveRebounds", "defensiveRebounds", steals, blocks, turnovers, "defensiveFouls", "offensiveFouls", "freeThrowsMade", "freeThrowsAttempted", "twoPointersMade", "twoPointersAttempted", "threePointersMade", "threePointersAttempted", poster) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23)`,
        [
          counter,
          game.date,
          player.isStarter,
          game.id,
          player.id,
          playersData.find(person => person.id === player.id).name,
          player.minutes,
          player.points,
          player.assists,
          player.offensiveRebounds,
          player.defensiveRebounds,
          player.steals,
          player.blocks,
          player.turnovers,
          player.defensiveFouls,
          player.offensiveFouls,
          player.freeThrowsMade,
          player.freeThrowsAttempted,
          player.twoPointersMade,
          player.twoPointersAttempted,
          player.threePointersMade,
          player.threePointersAttempted,
          playersData.find(person => person.id === player.id).poster,
        ],
        (error, results) => {
          if (error) {
            throw error;
          } else {
            console.log(results);
          }
        }
      );});
  });
};

// Return all the players
const returnPlayers = function () {
  pool.query(`SELECT * FROM app.players`, (error, results) => {
    if (error) {
      throw error;
    } else {
      console.log(results);
    }
  });
};