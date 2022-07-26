from fastapi import APIRouter

router = APIRouter()

@router.get('/aaa')
def main():
    return "asdf"