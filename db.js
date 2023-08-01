// db.js
const mysql = require('mysql');
const dbConfig = {
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'edfet_',
};

// Create a database connection pool
const pool = mysql.createPool(dbConfig);

module.exports = pool;
