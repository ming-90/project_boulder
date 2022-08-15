from fastapi import FastAPI
import uvicorn

from Controller import Login, Main 

def create_app():
    app = FastAPI()
    app.include_router(Main.router)
    app.include_router(Login.router)

    return app

app = create_app()
if __name__ == '__main__':
    uvicorn.run("main:app", host="0.0.0.0", port=8110, reload=True)