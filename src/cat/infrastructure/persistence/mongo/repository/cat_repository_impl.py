from motor.motor_asyncio import AsyncIOMotorDatabase
from typing import List, Optional
from bson.objectid import ObjectId

from domain.model.cat_model import Cat
from domain.repository.cat_repository import CatRepository


class CatRepositoryImpl(CatRepository):
    def __init__(self, db: AsyncIOMotorDatabase):
        self._collection = db["cats"]

    async def create(self, cat: Cat) -> Cat:
        result = await self._collection.insert_one(cat.model_dump)
        cat.id = str(result.inserted_id)
        return cat

    async def get_by_id(self, cat_id: str) -> Optional[Cat]:
        document = await self._collection.find_one({"_id": ObjectId(cat_id)})
        if document:
            return Cat(**document)
        return None

    async def list_all(self) -> List[Cat]:
        cats = []
        async for document in self._collection.find():
            cats.append(Cat(**document))
        return cats

    async def update(self, cat: Cat) -> Cat:
        await self._collection.update_one(
            {"_id": ObjectId(cat.id)}, {"$set": cat.model_dump}
        )
        return cat

    async def delete(self, cat_id: str) -> None:
        await self._collection.delete_one({"_id": ObjectId(cat_id)})
