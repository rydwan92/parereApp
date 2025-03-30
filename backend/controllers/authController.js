import User from "../models/userModel.js";

import bcrypt from "bcryptjs";

import generateToken from "../utils/generateToken.js";

export async function registerUser(req, res) {
    const { email, password } = req.body;

    let user = await User.findOne({ email });
    if (user) return res.status(400).json({ message: 'Użytkownik już istnieje' });

    const salt = await bcrypt.genSalt(10);
    const passwordHash = await bcrypt.hash(password, salt);

    user = new User({ email, passwordHash });
    await user.save();

    res.status(201).json({ token: generateToken(user._id) });
}

export async function loginUser(req, res) {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    if (!user) return res.status(400).json({ message: 'Nieprawidłowe dane logowania' });

    const isMatch = await bcrypt.compare(password, user.passwordHash);
    if (!isMatch) return res.status(400).json({ message: 'Nieprawidłowe dane logowania' });

    res.json({ token: generateToken(user._id) });
}

export async function getUserProfile(req, res) {
    res.json({
        id: req.user._id,
        email: req.user.email,
        createdAt: req.user.createdAt,
    });
}
