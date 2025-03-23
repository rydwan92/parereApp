import express from 'express';
import mongoose from 'mongoose';
import cors from 'cors';
import dotenv from 'dotenv';
import questionRoutes from './routes/questionRoutes.js';

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

// API routes
app.use('/questions', questionRoutes);

// DB + Server
mongoose.connect(process.env.MONGO_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
}).then(() => {
    console.log('✅ Connected to MongoDB');
    app.listen(process.env.PORT, () => {
        console.log(`🚀 Server running on http://localhost:${process.env.PORT}`);
    });
}).catch((err) => {
    console.error('❌ MongoDB connection error:', err.message);
});