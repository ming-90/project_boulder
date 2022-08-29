from fastapi import APIRouter

from Model.Bourder.BourderModel import BourderModel
from Model.Bourder.BourderListModel import BourderListModel

router = APIRouter(prefix='/Main')

@router.get(
    '/list',
    response_model=BourderListModel
)
def MainList():
    
    bourder1 = BourderModel(
        climbingCenterId = "test",
        climbingCenterName = "test",
        usePrice = 20000,
        useTime = "10:00~18:00"
    )
    bourder2 = BourderModel(
        climbingCenterId = "test2",
        climbingCenterName = "test2",
        usePrice = 20000,
        useTime = "10:00~18:00"
    )

    bourderList = []
    bourderList.append(bourder1)
    bourderList.append(bourder2)

    return BourderListModel(bourderList = bourderList)
