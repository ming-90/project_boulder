from pydantic import BaseModel
from typing import List, Optional
from Model.Bourder.BourderModel import BourderModel

class BourderListModel(BaseModel):
    bourderList : Optional[List[BourderModel]] = None