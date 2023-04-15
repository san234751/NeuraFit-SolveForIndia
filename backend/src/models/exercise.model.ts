import mongoose,{ Schema, InferSchemaType, Types } from 'mongoose';

const muscleSchema = new Schema({
    name: {type: String, required: true},
    reps: {type: Types.Array<Number>, required: true},
});

const cardioSchema = new Schema({
    name: {type: String, required: true},
    duration: {type: Number, required: true},
});

const exercise = new Schema({
    type: {type: String, required: true},
    metadata: {type: (muscleSchema || cardioSchema), required:true},
})
 
export type Exercise = InferSchemaType<typeof exercise>;
