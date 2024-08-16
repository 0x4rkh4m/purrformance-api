from pydantic import BaseModel
from typing import List, Optional


class Cat(BaseModel):
    name: str
    age: str
    breed: str
    photo_url: str
    vaccinations_id_list: Optional[List[str]] = None
