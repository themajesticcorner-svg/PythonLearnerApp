from fastapi import APIRouter

router = APIRouter(prefix="/challenges", tags=["challenges"])
CHALLENGES = [
    {"id": 1, "title": "اطبع اسمك", "description": "اكتب برنامجاً يطبع اسمك.", "hint": "استخدم print().", "difficulty": "سهل"},
    {"id": 2, "title": "رقم زوجي أم فردي؟", "description": "تحقق هل الرقم 7 زوجي أم فردي.", "hint": "استخدم باقي القسمة %.", "difficulty": "سهل"},
    {"id": 3, "title": "مجموع الأرقام", "description": "احسب مجموع الأرقام من 1 إلى 10.", "hint": "جرّب sum و range.", "difficulty": "متوسط"},
]

@router.get("")
def list_challenges():
    return CHALLENGES
