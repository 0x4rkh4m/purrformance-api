from pydantic import BaseModel
from datetime import date


class Vaccination(BaseModel):
    type: str
    date_administered: date
    cat_vaccinated_id: str
