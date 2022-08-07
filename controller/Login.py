from fastapi import APIRouter, Header
from typing import Union
from pydantic import BaseModel

from Model.LoginModel import LoginModel

router = APIRouter(prefix='/Login')

class Item(BaseModel):
    name: str
    price: float


@router.post('/login')
def login(Model: LoginModel, Authorization: Union[str, None] = Header(default=None)):
    print(Authorization)
    return Model 
