from pymongo import MongoClient

client = MongoClient('mongodb+srv://qa:academy@cluster0.jgjaes8.mongodb.net/RocklovDB?retryWrites=true&w=majority')

db = client['RocklovDB']

def remove_user_by_email(user_email):
    users = db['users']
    users.delete_many({'email': user_email})