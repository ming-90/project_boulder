from fastapi import APIRouter

router = APIRouter(prefix='/Main')

@router.get('/list')
def MainList():
    mainList = {
        "boulderList": [
            {
                "ClimbingCenterId": "1", 
                "ClimbingCenterName": "클럽 클라이밍", 
                "UsePrice": 20000, "UseTime": "10:00~17:00"
            }, 
            {
                "ClimbingCenterId": "1", 
                "ClimbingCenterName": "테스트 클라이밍", 
                "UsePrice": 20000, "UseTime": "10:00~17:00"
            }
        ],
        "result":{
            "code":"000",
            "message":"정상"
        }
    }
    return mainList 