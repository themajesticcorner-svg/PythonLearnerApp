# 🐍 Python Learner App

منصة تعليمية موبايل متكاملة لتعليم لغة البرمجة Python بطريقة تفاعلية وممتعة.

## 📱 الميزات الرئيسية

- 📚 **دروس تفاعلية** - شروحات واضحة مع أمثلة عملية
- 💻 **محرر أكواد مدمج** - كتابة وتنفيذ الأكواد مباشرة
- 🎮 **تحديات برمجية** - مسائل عملية لتطبيق المهارات
- 📊 **نظام التقدم** - تتبع إنجازاتك وتطورك
- 🏆 **شهادات** - احصل على شهادات عند إكمال المستويات
- 🌙 **واجهة سهلة الاستخدام** - تصميم حديث وسلس

## 🛠️ المتطلبات التقنية

### Backend
- Python 3.8+
- Flask/FastAPI
- SQLite/PostgreSQL
- Virtual Environment

### Frontend
- Flutter 3.0+
- Dart
- Mobile SDK (iOS/Android)

## 📁 هيكل المشروع

```
PythonLearnerApp/
├── backend/                    # Python API
│   ├── app/
│   │   ├── __init__.py
│   │   ├── main.py
│   │   ├── models.py
│   │   ├── database.py
│   │   └── routes/
│   │       ├── lessons.py
│   │       ├── challenges.py
│   │       ├── code_executor.py
│   │       └── users.py
│   ├── requirements.txt
│   ├── .env.example
│   └── README.md
│
├── frontend/                   # Flutter App
│   ├── lib/
│   │   ├── main.dart
│   │   ├── screens/
│   │   │   ├── home_screen.dart
│   │   │   ├── lessons_screen.dart
│   │   │   ├── code_editor_screen.dart
│   │   │   ├── challenges_screen.dart
│   │   │   └── progress_screen.dart
│   │   ├── widgets/
│   │   ├── models/
│   │   ├── services/
│   │   └── utils/
│   ├── pubspec.yaml
│   ├── README.md
│   └── ...
│
└── README.md
```

## 🚀 البدء السريع

### 1️⃣ استنساخ المستودع
```bash
git clone https://github.com/themajesticcorner-svg/PythonLearnerApp.git
cd PythonLearnerApp
```

### 2️⃣ إعداد Backend
```bash
cd backend
python -m venv venv
source venv/bin/activate  # على Windows: venv\Scripts\activate
pip install -r requirements.txt
python main.py
```

### 3️⃣ إعداد Frontend
```bash
cd frontend
flutter pub get
flutter run
```

## 📚 المحتوى التعليمي

### المستويات المخطط لها:
1. **المستوى الأول** - أساسيات Python
   - متغيرات وأنواع البيانات
   - العمليات الحسابية
   - الدوال المدمجة

2. **المستوى الثاني** - التحكم بسير البرنامج
   - الشروط (if/else)
   - الحلقات (for/while)
   - المنطق البرمجي

3. **المستوى الثالث** - البيانات والقوائم
   - القوائم (Lists)
   - المعاجم (Dictionaries)
   - معالجة البيانات

4. **المستوى الرابع** - الدوال والوحدات
   - تعريف الدوال
   - المعاملات والقيم المرجعة
   - الوحدات والمكتبات

## 👥 المستخدمون المستهدفون

- 👨‍🎓 الطلاب والمبتدئين
- 👩‍💻 أي شخص يريد تعلم Python
- 🎯 المهتمين بتطوير المهارات البرمجية

## 📝 الترخيص

هذا المشروع مرخص تحت MIT License

## 🤝 المساهمة

نرحب بمساهماتك! يرجى فتح Issue أو Pull Request

---

**تم إنشاؤه بـ ❤️ لتعليم البرمجة**
