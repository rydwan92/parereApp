import Question from '../models/Question.js';

// GET /questions/random
export const getRandomQuestion = async (req, res) => {
    try {
        const count = await Question.countDocuments();
        const random = Math.floor(Math.random() * count);
        const question = await Question.findOne().skip(random);
        res.json(question);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

// POST /questions
export const createQuestion = async (req, res) => {
    const { text } = req.body;
    try {
        const question = new Question({ text, createdByUser: true });
        await question.save();
        res.status(201).json(question);
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
};

// PATCH /questions/:id/upvote
export const upvoteQuestion = async (req, res) => {
    try {
        const question = await Question.findByIdAndUpdate(
            req.params.id,
            { $inc: { upvotes: 1 } },
            { new: true }
        );
        res.json(question);
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
};