import express from 'express';
import {getUserProfile, loginUser, registerUser} from "../controllers/authController.js";

import authMiddleware from "../middleware/authMiddleware.js";

const router = express.Router();
// Endpointy publiczne
router.post('/register', registerUser);
router.post('/login', loginUser);

// Endpoint chroniony
router.get('/profile', authMiddleware, getUserProfile);


export default router;
