from fastapi import FastAPI
import requests

app = FastAPI()

@app.get("/query")
def query_prolog():
    response = requests.get("http://localhost:8000/prolog_query")
    return {"prolog_response": response.text}
