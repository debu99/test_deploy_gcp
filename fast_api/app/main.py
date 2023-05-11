import uvicorn
from fastapi import FastAPI
import os


abspath = os.path.abspath(__file__)
dname = os.path.dirname(abspath)
os.chdir(dname)


from api.hello import hello

app = FastAPI(
    title="Some API",
    version=1.0,
)

print(hello())


@app.get("/hello_world", status_code=201)
def hello_world():
    message = "hello from everyone"
    return message
