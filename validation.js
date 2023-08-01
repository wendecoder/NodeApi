// This assumes you already have the database connection pool defined as 'pool' from the above API code.
const pool = require('./db'); // Import the database connection pool
// Function to check if a value is already used in a table
async function isUsed(field, value, table) {
    return new Promise((resolve, reject) => {
      const sql = `SELECT ${field} FROM ${table} WHERE ${field} = ?`;
      pool.query(sql, [value], (err, result) => {
        if (err) {
          console.error('Error executing SQL query:', err);
          reject(err);
          return;
        }
  
        if (result.length > 0) {
          resolve(true);
        } else {
          resolve(false);
        }
      });
    });
  }

  function isEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }
  
  // Function to fetch user data from the table based on a specific field and value
  async function fetchUser(field, value, table) {
    return new Promise((resolve, reject) => {
      const sql = `SELECT * FROM ${table} WHERE ${field} = ?`;
      pool.query(sql, [value], (err, result) => {
        if (err) {
          console.error('Error executing SQL query:', err);
          reject(err);
          return;
        }
  
        resolve(result);
      });
    });
  }
  
  // Function to display all records from a table
  async function displayTable(table) {
    return new Promise((resolve, reject) => {
      const query = `SELECT * FROM ${table}`;
      pool.query(query, (err, result) => {
        if (err) {
          console.error('Error executing SQL query:', err);
          reject(err);
          return;
        }
  
        resolve(result);
      });
    });
  }
  
  // Function to delete records from a table based on email
  async function deleteFromTable(table, email) {
    return new Promise((resolve, reject) => {
      const query = `DELETE FROM ${table} WHERE u_email = ?`;
      pool.query(query, [email], (err, result) => {
        if (err) {
          console.error('Error executing SQL query:', err);
          reject(err);
          return;
        }
  
        resolve(result);
      });
    });
  }
  
  // Function to delete records from another table based on email
  async function deleteFromOTable(table, email) {
    return new Promise((resolve, reject) => {
      const query = `DELETE FROM ${table} WHERE o_email = ?`;
      pool.query(query, [email], (err, result) => {
        if (err) {
          console.error('Error executing SQL query:', err);
          reject(err);
          return;
        }
  
        resolve(result);
      });
    });
  }
  
  module.exports = {
    isUsed,
    isEmail,
    fetchUser,
    displayTable,
    deleteFromTable,
    deleteFromOTable,
  };
  