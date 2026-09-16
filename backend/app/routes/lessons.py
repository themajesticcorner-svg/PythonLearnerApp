from fastapi import APIRouter

router = APIRouter(prefix="/lessons", tags=["lessons"])

LESSONS = [
    {"id": 1, "title": "مرحباً Python", "description": "تعرف على Python واكتب أول برنامج لك.", "level": "مبتدئ", "duration": 10, "content": "Python لغة بسيطة وقوية. استخدم print لطباعة النصوص.", "code": "print('مرحباً بالعالم!')"},
    {"id": 2, "title": "المتغيرات", "description": "خزّن المعلومات واستخدمها في برامجك.", "level": "مبتدئ", "duration": 15, "content": "المتغير اسم يشير إلى قيمة، مثل name = 'Ali'.", "code": "name = 'Python'\nprint(name)"},
    {"id": 3, "title": "الشروط", "description": "اجعل برنامجك يتخذ قرارات.", "level": "مبتدئ", "duration": 20, "content": "استخدم if لتنفيذ كود عند تحقق شرط.", "code": "age = 18\nif age >= 18:\n    print('يمكنك البدء!')"},
    {"id": 4, "title": "الحلقات", "description": "كرر التعليمات بذكاء.", "level": "متوسط", "duration": 20, "content": "تساعدك for على تكرار العمليات على مجموعة قيم.", "code": "for number in range(1, 4):\n    print(number)"},
]

@router.get("")
def list_lessons():
    return LESSONS

@router.get("/{lesson_id}")
def get_lesson(lesson_id: int):
    return next((lesson for lesson in LESSONS if lesson["id"] == lesson_id), None)
