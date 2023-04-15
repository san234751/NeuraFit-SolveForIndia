import mongoose,{ Schema, InferSchemaType } from 'mongoose';
import {Exercise} from '@models/exercise.model'

const schema = new Schema({
  user_id: {type: String, required: true},
  datetime: {type: String, required: true},
  exercises: {type: Array<Exercise>, required: true},
});

export type Session = InferSchemaType<typeof schema>;
export const SessionModel = mongoose.model('Session', schema);