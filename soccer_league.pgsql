-- Design a schema for a simple sports league. Your schema should keep track of

-- - All of the teams in the league
-- - All of the goals scored by every player for each game
-- - All of the players in the league and their corresponding teams
-- - All of the referees who have been part of each game
-- - All of the matches played between teams
-- - All of the start and end dates for season that a league has
-- - The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).

-- Table: teams
CREATE TABLE teams (
  team_id SERIAL PRIMARY KEY,
  team_name VARCHAR(255) NOT NULL
);

-- Table: players
CREATE TABLE players (
  player_id SERIAL PRIMARY KEY,
  player_name VARCHAR(255) NOT NULL,
  team_id INT REFERENCES teams(team_id)
);

-- Table: goals
CREATE TABLE goals (
  goal_id SERIAL PRIMARY KEY,
  player_id INT REFERENCES players(player_id),
  game_id INT REFERENCES games(game_id),
  goal_time TIMESTAMP NOT NULL
);

-- Table: referees
CREATE TABLE referees (
  referee_id SERIAL PRIMARY KEY,
  referee_name VARCHAR(255) NOT NULL
);

-- Table: games
CREATE TABLE games (
  game_id SERIAL PRIMARY KEY,
  home_team_id INT REFERENCES teams(team_id),
  away_team_id INT REFERENCES teams(team_id),
  referee_id INT REFERENCES referees(referee_id),
  game_date DATE NOT NULL
);

-- Table: seasons
CREATE TABLE seasons (
  season_id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

-- Table: matches
CREATE TABLE matches (
  match_id SERIAL PRIMARY KEY,
  home_team_id INT REFERENCES teams(team_id),
  away_team_id INT REFERENCES teams(team_id),
  season_id INT REFERENCES seasons(season_id),
  match_date DATE NOT NULL
);

-- Table: standings (optional, can be derived from other tables)
CREATE VIEW standings AS
SELECT
  t.team_id,
  t.team_name,
  COUNT(g.goal_id) AS goals_scored
FROM
  teams t
LEFT JOIN
  players p ON t.team_id = p.team_id
LEFT JOIN
  goals g ON p.player_id = g.player_id
GROUP BY
  t.team_id,
  t.team_name
ORDER BY
  goals_scored DESC;
