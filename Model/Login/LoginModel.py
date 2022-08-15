from pydantic import BaseModel

class LoginModel(BaseModel):
    id : str
    pwd : str
    token: str