import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import authRoutes from "./routes/authRoutes.js";
import connectDB from "./config/db.js";

dotenv.config();

// Inicjalizacja połączenia z MongoDB
connectDB();

const app = express();

// Middleware do parsowania JSON
app.use(express.json());

// Middleware obsługujący CORS (umożliwia integrację frontend-backend)
app.use(cors({
    origin: '*' // Na produkcji zmień na adres frontendu
}));

// Endpointy aplikacji (zgodne z przyjętą strukturą)
app.use('/api/auth', authRoutes);

// Podstawowy endpoint (health check aplikacji)
app.get('/', (req, res) => {
    res.send('API Aplikacja dla Rodziców działa poprawnie 🚀');
});

export default app;