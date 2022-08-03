from fastapi import FastAPI
import uvicorn

from Controller import test, MainPage 

def create_app():
    app = FastAPI()
    app.include_router(MainPage.router)

    app.include_router(test.router)

    return app

app = create_app()
if __name__ == '__main__':
    uvicorn.run("main:app", host="172.30.58.20", port=8110, reload=True)