-- Design a schema for Craigslist! Your schema should keep track of the following

-- - The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
-- - Users and preferred region
-- - Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
-- - Categories that each post belongs to


-- Table for regions
CREATE TABLE regions (
  region_id SERIAL PRIMARY KEY,
  region_name VARCHAR(255) NOT NULL
);

-- Table for users
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  preferred_region_id INT,
  FOREIGN KEY (preferred_region_id) REFERENCES regions(region_id)
);

-- Table for posts
CREATE TABLE posts (
  post_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  text TEXT,
  user_id INT,
  location VARCHAR(255),
  region_id INT,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

-- Table for categories
CREATE TABLE categories (
  category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(255) NOT NULL
);

-- Table for post-category relationship
CREATE TABLE post_categories (
  post_id INT,
  category_id INT,
  FOREIGN KEY (post_id) REFERENCES posts(post_id),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
