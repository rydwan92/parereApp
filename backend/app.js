const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const connectDB = require('./config/db');

dotenv.config();
connectDB();

const app = express();

app.use(cors());
app.use(express.json());

// Przykładowy route
app.get('/', (req, res) => {
    res.send('Backend aplikacji dla rodziców');
});

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
    console.log(`Serwer działa na porcie ${PORT}`);
});

const mongoose = require('mongoose');

const connectDB = async () => {
    try {
        await mongoose.connect(process.env.MONGO_URI);
        console.log('Połączono z bazą MongoDB');
    } catch (error) {
        console.error(error.message);
        process.exit(1);
    }
};

module.exports = connectDB;