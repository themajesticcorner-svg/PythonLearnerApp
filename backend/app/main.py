from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from .routes import lessons, challenges, progress

app = FastAPI(title="Python Learner API", version="1.0.0")
app.add_middleware(CORSMiddleware, allow_origins=["*"], allow_credentials=True, allow_methods=["*"], allow_headers=["*"])
app.include_router(lessons.router, prefix="/api")
app.include_router(challenges.router, prefix="/api")
app.include_router(progress.router, prefix="/api")

@app.get("/")
def health():
    return {"name": "Python Learner API", "status": "ok"}
