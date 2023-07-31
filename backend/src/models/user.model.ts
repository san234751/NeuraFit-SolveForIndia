import mongoose,{ Schema, InferSchemaType } from 'mongoose';



export type User = InferSchemaType<typeof schema>;
export const UserModel = mongoose.model('User', schema);
