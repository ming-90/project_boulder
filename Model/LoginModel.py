from pydantic import BaseModel

class LoginModel(BaseModel):
    id : str
    token: str