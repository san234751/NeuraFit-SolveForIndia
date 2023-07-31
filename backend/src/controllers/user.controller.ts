import {Request , Response} from 'express'
import {User, UserModel} from '@models/user.model'
import {client} from '@configs/mongo'

const connection = async ()=>{
    const db = (await client.connect()).db("app");
    const collection = db.collection("users");
    return collection;
}

export default {
    get : async (req: Request,res: Response) => {
        try{
            const users = await connection();
            const usersDoc = await users.findOne({
                id: req.params.id
            });
            
            res.json({result: JSON.parse(JSON.stringify(usersDoc))}).status(200);
        } catch(err) {
            res.json({result: err}).status(500);
        }
    },
    post : async (req: Request,res: Response) => {
        
        const user = new UserModel(req.body);
        try{
            const collection = await connection();
            const result = await collection.insertOne(user);
            res.json({result: result}).status(200);
        } catch(err) {
            res.json({result: err}).status(500);
        }

    }
}
