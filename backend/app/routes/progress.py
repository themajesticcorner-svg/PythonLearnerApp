from fastapi import APIRouter
from pydantic import BaseModel, Field

router = APIRouter(prefix="/progress", tags=["progress"])

class ProgressUpdate(BaseModel):
    user_id: str = "guest"
    lesson_id: int = Field(gt=0)

@router.get("/{user_id}")
def get_progress(user_id: str):
    return {"user_id": user_id, "completed_lessons": [1], "points": 40, "streak": 2}

@router.post("/complete")
def complete_lesson(update: ProgressUpdate):
    return {"success": True, "lesson_id": update.lesson_id, "message": "تم حفظ تقدمك"}
