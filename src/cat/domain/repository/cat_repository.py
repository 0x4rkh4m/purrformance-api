from abc import ABC, abstractmethod
from typing import List, Optional

from src.cat.domain.model.cat_model import Cat


class CatRepository(ABC):
    @abstractmethod
    async def create(self, cat: Cat) -> Cat:
        pass

    @abstractmethod
    async def get_by_id(self, cat_id: str) -> Optional[Cat]:
        pass

    @abstractmethod
    async def list_all(self) -> List[Cat]:
        pass

    @abstractmethod
    async def update(self, cat: Cat) -> Cat:
        pass

    @abstractmethod
    async def delete(self, cat_id: str) -> None:
        pass
