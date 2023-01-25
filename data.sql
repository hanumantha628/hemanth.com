// Import the necessary modules
const express = require('express');
const mysql = require('mysql');

// Create a connection to the database
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'mydb'
});

// Connect to the database
connection.connect();

// Create an express app
const app = express();

// Handle a post request to the '/signup' endpoint
app.post('/signup', (req, res) => {
    // Get the data from the request body
    const { name, email, password } = req.body;

    // Hash the password
    const hashedPassword = hashPassword(password);

    // Insert the data into the database
    const query = `INSERT INTO users (name, email, password) VALUES ('${name}', '${email}', '${hashedPassword}')`;
    connection.query(query, (error, results) => {
        if (error) {
            console.log(error);
            res.status(500).send({ error: 'An error occurred while saving the data.' });
        } else {
            res.send({ message: 'Data saved successfully.' });
        }
    });
});

// Start the server
app.listen(3000, () => {
    console.log('Server started on port 3000');
});
