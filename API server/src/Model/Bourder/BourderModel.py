from pydantic import BaseModel


class BourderModel(BaseModel):
    climbingCenterId : str
    climbingCenterName : str
    usePrice: int
    useTime: str
