const setupInput = require('./inputSanitizer');
const pool = require('./db'); // Import the database connection pool
const validation = require('./validation'); // Importing the validation functions
const md5 = require('md5');
const express = require('express');
const app = express();
const port = 3000; // Set your desired port



app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// Enable CORS
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});


app.get('/', (req, res) => {
  res.json({ message: 'Welcome to the Express API.' });
});

// Implement the signup endpoint
app.post('/signup', async (req, res) => {
  const { username, email, password, confirm_pass } = req.body;

  const name = setupInput(username);
  const userEmail = setupInput(email);
  const userPassword = md5(setupInput(password));
  const confirmPassword = md5(setupInput(confirm_pass));

  if (userPassword !== confirmPassword) {
    res.status(400).json({ message: 'Passwords do not match' });
    return;
  }
  const emailInUse = await validation.isUsed('email', userEmail, 'gotera_user_table');

  if (emailInUse) {
    res.status(400).json({ message: 'Email already in use yeaye' });
    return;
  }

  if (!validation.isEmail(userEmail)) {
    res.status(400).json({ message: 'Invalid email format' });
    return;
  }

  const sql = "INSERT INTO gotera_user_table(name, email,	password,	profile_picture, date_of_birth,	country, username) VALUES (?, ?, ?, ?, ?, ?, ?)";
  pool.query(sql, ["", userEmail, userPassword, "", "", "", name], (err, result) => {
    if (err) {
      console.error('Error executing SQL query:', err);
      res.status(500).json({ message: 'Internal server error.' });
      return;
    }

    res.status(201).json({ message: 'Account created' });
  });
});

// Add the login endpoint
app.post('/login', (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ message: 'Email and password are required fields.' });
  }

  const sanitizedEmail = setupInput(email);
  const sanitizedPassword = setupInput(password);

  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error getting database connection:', err);
      res.status(500).json({ message: 'Internal server error.' });
      return;
    }

    const sql = "SELECT email FROM gotera_user_table WHERE email = ? AND password = ?";
    connection.query(sql, [sanitizedEmail, sanitizedPassword], (err, result) => {
      connection.release(); // Release the connection

      if (err) {
        console.error('Error executing SQL query:', err);
        res.status(500).json({ message: 'Internal server error.' });
        return;
      }

      if (result.length > 0) {
        req.session.role = 'user'; // Set session data for the logged-in user
        req.session.email = sanitizedEmail;
        req.session.isloggedin = true;
        return res.json({ message: 'Logged In' });
      } else {
        return res.status(401).json({ message: 'Incorrect email or password.' });
      }
    });
  });
});

// Implement the getProductDetails() function
app.get('/getProductDetails', (req, res) => {
  if (req.query.image_url) {
    const imageUrl = req.query.image_url;
    pool.getConnection((err, connection) => {
      if (err) {
        console.error('Error getting database connection:', err);
        res.status(500).json({ message: 'Internal server error.' });
        return;
      }

      const sql = "SELECT * FROM gotera_product_table WHERE product_image_url = ?";
      connection.query(sql, [imageUrl], (err, result) => {
        connection.release(); // Release the connection

        if (err) {
          console.error('Error executing SQL query:', err);
          res.status(500).json({ message: 'Internal server error.' });
          return;
        }

        if (result.length === 0) {
          res.status(404).json({ message: 'Product not found.' });
        } else {
          res.json(result);
        }
      });
    });
  } else {
    res.status(400).json({ message: 'Image URL parameter is missing.' });
  }
});

// Implement the addToCheckout() function
app.get('/addToCheckout', (req, res) => {
  if (req.query.productIdss && req.query.quantitiess && req.query.productNamess && req.query.productPricess) {
    const email = req.session.email; // Get the email from the session
    pool.getConnection((err, connection) => {
      if (err) {
        console.error('Error getting database connection:', err);
        res.status(500).json({ message: 'Internal server error.' });
        return;
      }

      const sql = "SELECT id FROM gotera_user_table WHERE email = ?";
      connection.query(sql, [email], (err, result) => {
        if (err) {
          connection.release(); // Release the connection
          console.error('Error executing SQL query:', err);
          res.status(500).json({ message: 'Internal server error.' });
          return;
        }

        if (result.length === 0) {
          connection.release(); // Release the connection
          res.status(404).json({ message: 'User not found.' });
          return;
        }

        const user_id = result[0].id;
        const productIds = req.query.productIdss.split(",");
        const quantities = req.query.quantitiess.split(",");
        const prodnames = req.query.productNamess.split(",");
        const prices = req.query.productPricess.split(",");
        const status = 'pending';

        const insertSql = 'INSERT INTO gotera_checkout_products (user_id, product_id, product_name, quantity, total_price, status) VALUES (?, ?, ?, ?, ?, ?)';
        let insertCount = 0;

        for (let i = 0; i < productIds.length; i++) {
          const productId = parseInt(productIds[i]);
          const quantity = parseInt(quantities[i]);
          const productName = prodnames[i];
          const totalPrice = parseFloat(prices[i]) * quantity;

          connection.query(insertSql, [user_id, productId, productName, quantity, totalPrice, status], (err, result) => {
            insertCount++;

            if (err) {
              console.error('Error executing SQL query:', err);
              res.status(500).json({ message: 'Internal server error.' });
              return;
            }

            if (insertCount === productIds.length) {
              connection.release(); // Release the connection
              res.json({ data: 'true' });
            }
          });
        }
      });
    });
  } else {
    res.status(400).json({ message: 'Required parameters are missing.' });
  }
});

// Implement the deleteFromCart() function
app.get('/deleteFromCart', (req, res) => {
  if (req.query.product_id) {
    const email = req.session.email; // Get the email from the session
    pool.getConnection((err, connection) => {
      if (err) {
        console.error('Error getting database connection:', err);
        res.status(500).json({ message: 'Internal server error.' });
        return;
      }

      const findUserSql = "SELECT id FROM gotera_user_table WHERE email = ?";
      connection.query(findUserSql, [email], (err, result) => {
        if (err) {
          connection.release(); // Release the connection
          console.error('Error executing SQL query:', err);
          res.status(500).json({ message: 'Internal server error.' });
          return;
        }

        if (result.length === 0) {
          connection.release(); // Release the connection
          res.status(404).json({ message: 'User not found.' });
          return;
        }

        const user_id = result[0].id;
        const product_id = req.query.product_id;

        const deleteSql = "DELETE FROM gotera_user_carted_product WHERE carted_product_id = ? AND user_id = ?";
        connection.query(deleteSql, [product_id, user_id], (err, result) => {
          connection.release(); // Release the connection

          if (err) {
            console.error('Error executing SQL query:', err);
            res.status(500).json({ message: 'Internal server error.' });
            return;
          }

          res.json({ data: 'true' });
        });
      });
    });
  } else {
    res.status(400).json({ message: 'Required parameters are missing.' });
  }
});

// Implement the addTocart() function
app.get('/addTocart', (req, res) => {
  if (req.session.email && req.query.product_id) {
    const email = req.session.email;
    pool.getConnection((err, connection) => {
      if (err) {
        console.error('Error getting database connection:', err);
        res.status(500).json({ message: 'Internal server error.' });
        return;
      }

      const findUserSql = "SELECT id FROM gotera_user_table WHERE email = ?";
      connection.query(findUserSql, [email], (err, result) => {
        if (err) {
          connection.release(); // Release the connection
          console.error('Error executing SQL query:', err);
          res.status(500).json({ message: 'Internal server error.' });
          return;
        }

        if (result.length === 0) {
          connection.release(); // Release the connection
          res.status(404).json({ message: 'User not found.' });
          return;
        }

        const user_id = result[0].id;
        const product_id = req.query.product_id;

        const insertSql = "INSERT INTO gotera_user_carted_product (user_id, carted_product_id) VALUES (?, ?)";
        connection.query(insertSql, [user_id, product_id], (err, result) => {
          connection.release(); // Release the connection

          if (err) {
            console.error('Error executing SQL query:', err);
            res.status(500).json({ message: 'Internal server error.' });
            return;
          }

          res.json({ data: 'true' });
        });
      });
    });
  } else {
    res.status(400).json({ message: 'Required parameters are missing.' });
  }
});

// Implement the getCheckoutProducts() function
app.get('/checkoutProducts', (req, res) => {
  if (req.session.email) {
    const email = req.session.email;
    pool.getConnection((err, connection) => {
      if (err) {
        console.error('Error getting database connection:', err);
        res.status(500).json({ message: 'Internal server error.' });
        return;
      }

      const findUserSql = "SELECT id FROM gotera_user_table WHERE email = ?";
      connection.query(findUserSql, [email], (err, result) => {
        if (err) {
          connection.release(); // Release the connection
          console.error('Error executing SQL query:', err);
          res.status(500).json({ message: 'Internal server error.' });
          return;
        }

        if (result.length === 0) {
          connection.release(); // Release the connection
          res.status(404).json({ message: 'User not found.' });
          return;
        }

        const user_id = result[0].id;
        const sql = "SELECT * FROM gotera_checkout_products WHERE user_id = ? AND status = 'pending'";
        connection.query(sql, [user_id], (err, result) => {
          connection.release(); // Release the connection

          if (err) {
            console.error('Error executing SQL query:', err);
            res.status(500).json({ message: 'Internal server error.' });
            return;
          }

          res.json(result);
        });
      });
    });
  } else {
    res.status(400).json({ message: 'Email parameter is missing.' });
  }
});

// Edit Profile Endpoint
app.post('/editprofile', (req, res) => {
  if (req.session.email) {
    const email = req.session.email;
    const name = req.body.name || null;
    const password = req.body.password || null;
    const dateOfBirth = req.body.date_of_birth || null;
    const country = req.body.country || null;
    const username = req.body.username || null;

    // Fetch the user with the given email
    pool.getConnection((err, connection) => {
      if (err) {
        console.error('Error getting database connection:', err);
        res.status(500).json({ message: 'Internal server error.' });
        return;
      }

      const findUserSql = "SELECT * FROM gotera_user_table WHERE email = ?";
      connection.query(findUserSql, [email], (err, result) => {
        if (err) {
          connection.release(); // Release the connection
          console.error('Error executing SQL query:', err);
          res.status(500).json({ message: 'Internal server error.' });
          return;
        }

        if (result.length === 0) {
          connection.release(); // Release the connection
          res.status(404).json({ message: 'User not found.' });
          return;
        }

        // Update the user fields if provided
        const user_id = result[0].id;
        let updateFields = "";
        const updateValues = [];

        if (name) {
          updateFields += "name = ?, ";
          updateValues.push(name);
        }

        if (password) {
          updateFields += "password = ?, ";
          updateValues.push(password);
        }

        if (dateOfBirth) {
          updateFields += "date_of_birth = ?, ";
          updateValues.push(dateOfBirth);
        }

        if (country) {
          updateFields += "country = ?, ";
          updateValues.push(country);
        }

        if (username) {
          updateFields += "username = ?, ";
          updateValues.push(username);
        }

        // Remove trailing comma and space from the updateFields string
        updateFields = updateFields.slice(0, -2);

        // If no fields are provided for update, return an error
        if (updateValues.length === 0) {
          res.status(400).json({ message: 'No fields provided for update.' });
          return;
        }

        // Update the user data in the database
        const updateSql = "UPDATE gotera_user_table SET " + updateFields + " WHERE id = ?";
        updateValues.push(user_id);

        connection.query(updateSql, updateValues, (err, result) => {
          connection.release(); // Release the connection

          if (err) {
            console.error('Error executing SQL query:', err);
            res.status(500).json({ message: 'Internal server error.' });
            return;
          }

          res.json({ message: 'Profile updated successfully.' });
        });
      });
    });
  } else {
    res.status(400).json({ message: 'Invalid request. Email parameter is missing.' });
  }
});

// Profile Endpoint
app.get('/profile', (req, res) => {
  if (req.session.email) {
    const email = req.session.email;

    // Fetch the user with the given email
    pool.getConnection((err, connection) => {
      if (err) {
        console.error('Error getting database connection:', err);
        res.status(500).json({ message: 'Internal server error.' });
        return;
      }

      const findUserSql = "SELECT * FROM gotera_user_table WHERE email = ?";
      connection.query(findUserSql, [email], (err, result) => {
        connection.release(); // Release the connection

        if (err) {
          console.error('Error executing SQL query:', err);
          res.status(500).json({ message: 'Internal server error.' });
          return;
        }

        if (result.length === 0) {
          res.status(404).json({ message: 'User not found.' });
          return;
        }

        const user = result[0];
        res.json(user);
      });
    });
  } else {
    res.status(400).json({ message: 'Invalid request. Email parameter is missing.' });
  }
});

// Implement the getProducts() function
app.get('/products', (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error getting database connection:', err);
      res.status(500).json({ message: 'Internal server error.' });
      return;
    }

    const sql = "SELECT * FROM gotera_product_table";
    connection.query(sql, (err, result) => {
      connection.release(); // Release the connection

      if (err) {
        console.error('Error executing SQL query:', err);
        res.status(500).json({ message: 'Internal server error.' });
        return;
      }

      res.json(result);
    });
  });
});

// Implement the getCartedProducts() function
app.get('/carted_products', (req, res) => {
  if (req.session.email) {
    const email = req.session.email;
    pool.getConnection((err, connection) => {
      if (err) {
        console.error('Error getting database connection:', err);
        res.status(500).json({ message: 'Internal server error.' });
        return;
      }

      const findUserSql = "SELECT id FROM gotera_user_table WHERE email = ?";
      connection.query(findUserSql, [email], (err, result) => {
        if (err) {
          connection.release(); // Release the connection
          console.error('Error executing SQL query:', err);
          res.status(500).json({ message: 'Internal server error.' });
          return;
        }

        if (result.length === 0) {
          connection.release(); // Release the connection
          res.status(404).json({ message: 'User not found.' });
          return;
        }

        const user_id = result[0].id;
        const sql = "SELECT p.product_id, p.product_name, p.product_image_url, p.product_price, p.quantity " +
                    "FROM gotera_user_carted_product uc " +
                    "INNER JOIN gotera_product_table p ON uc.carted_product_id = p.product_id " +
                    "WHERE uc.user_id = ?";
        connection.query(sql, [user_id], (err, result) => {
          connection.release(); // Release the connection

          if (err) {
            console.error('Error executing SQL query:', err);
            res.status(500).json({ message: 'Internal server error.' });
            return;
          }

          res.json(result);
        });
      });
    });
  } else {
    res.status(400).json({ message: 'Email parameter is missing.' });
  }
});

// Handle all other routes (404 Not Found)
app.use((req, res, next) => {
  res.status(404).json({ message: 'Route not found.' });
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
