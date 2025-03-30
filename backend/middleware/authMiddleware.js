import User from "../models/userModel.js";

import jwt from "jsonwebtoken";

const authMiddleware = async (req, res, next) => {
    let token;

    // Sprawdzenie nagłówka Authorization (Bearer token)
    if (req.headers.authorization && req.headers.authorization.startsWith('Bearer')) {
        try {
            token = req.headers.authorization.split(' ')[1];

            // Dekodowanie JWT
            const decoded = jwt.verify(token, process.env.JWT_SECRET);

            // Znalezienie użytkownika po ID z tokenu i przypisanie do req.user (bez hasła!)
            req.user = await User.findById(decoded.userId).select('-passwordHash');

            next();
        } catch (error) {
            console.error(error);
            res.status(401).json({ message: 'Nieautoryzowany dostęp, token nieprawidłowy lub wygasł.' });
        }
    }

    if (!token) {
        res.status(401).json({ message: 'Brak tokenu, autoryzacja nie powiodła się.' });
    }
};

export default authMiddleware;
