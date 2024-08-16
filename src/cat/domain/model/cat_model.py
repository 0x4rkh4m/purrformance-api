from pydantic import BaseModel, Field
from typing import List, Optional


class Cat(BaseModel):
    id: Optional[str] = Field(None, alias="_id")
    name: str
    age: str
    breed: str
    photo_url: str
    vaccinations_id_list: Optional[List[str]] = None
