CREATE USER 'allianceserver'@'%' IDENTIFIED BY 'CHANGE_ME';
CREATE DATABASE alliance_auth CHARACTER SET utf8mb4;
GRANT ALL PRIVILEGES ON alliance_auth . * TO 'allianceserver'@'%';
