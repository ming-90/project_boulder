from fastapi import APIRouter, Header, Response, status
from typing import Union
from pydantic import BaseModel

from Model.Login.LoginModel import LoginModel
from Model.result import Result

router = APIRouter(prefix='/Login')

@router.post(
    '/login',
    response_model=Result,
    status_code=200
)
def login(
        response: Response,
        Model: LoginModel, 
        Authorization: Union[str, None] = Header(default=None),
    ):
    
    if(Authorization == ""):
        response.status_code = status.HTTP_401_UNAUTHORIZED
        return Result(message="인증 오류")
    return Result(message="정상적으로 로그인이 되었습니다")

@router.post(
    '/signin',
    response_model=Result,
    status_code=200
)
def signIn(
        response: Response,
        Model: LoginModel
    ):
    return Result(message="정상적으로 회원가입 되었습니다")