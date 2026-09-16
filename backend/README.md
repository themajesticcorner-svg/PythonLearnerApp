# Python Learner API

## تشغيل محلي

```bash
cd backend
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\\Scripts\\activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```

الواجهة التفاعلية متاحة على `http://127.0.0.1:8000/docs`.
