import mongoose from 'mongoose';

const questionSchema = new mongoose.Schema({
    text: {
        type: String,
        required: true,
    },
    createdByUser: {
        type: Boolean,
        default: false,
    },
    upvotes: {
        type: Number,
        default: 0,
    },
}, { timestamps: true });

const Question = mongoose.model('Question', questionSchema);
export default Question;