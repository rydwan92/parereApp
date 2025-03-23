import express from 'express';
import {
    getRandomQuestion,
    createQuestion,
    upvoteQuestion,
} from '../controllers/questionController.js';

const router = express.Router();

router.get('/random', getRandomQuestion);
router.post('/', createQuestion);
router.patch('/:id/upvote', upvoteQuestion);

export default router;