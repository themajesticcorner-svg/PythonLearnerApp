import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiUrl = String.fromEnvironment('API_URL', defaultValue: 'http://10.0.2.2:8000/api');

void main() => runApp(const PythonLearnerApp());

class PythonLearnerApp extends StatelessWidget {
  const PythonLearnerApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Python Learner',
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff6750a4), brightness: Brightness.light), useMaterial3: true, fontFamily: ' sans'),
    home: const HomeScreen(),
  );
}

class HomeScreen extends StatefulWidget { const HomeScreen({super.key}); @override State<HomeScreen> createState() => _HomeScreenState(); }
class _HomeScreenState extends State<HomeScreen> {
  int tab = 0;
  final pages = const [LessonsPage(), ChallengesPage(), ProgressPage()];
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('🐍 Python Learner', style: TextStyle(fontWeight: FontWeight.bold)), centerTitle: false),
    body: pages[tab],
    bottomNavigationBar: NavigationBar(selectedIndex: tab, onDestinationSelected: (i) => setState(() => tab = i), destinations: const [NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'الدروس'), NavigationDestination(icon: Icon(Icons.emoji_events_outlined), selectedIcon: Icon(Icons.emoji_events), label: 'التحديات'), NavigationDestination(icon: Icon(Icons.insights_outlined), selectedIcon: Icon(Icons.insights), label: 'تقدمي')]),
  );
}

class LessonsPage extends StatefulWidget { const LessonsPage({super.key}); @override State<LessonsPage> createState() => _LessonsPageState(); }
class _LessonsPageState extends State<LessonsPage> {
  Future<List<dynamic>> load() async { final response = await http.get(Uri.parse('$apiUrl/lessons')); if (response.statusCode != 200) throw Exception('تعذر الاتصال'); return jsonDecode(response.body); }
  @override Widget build(BuildContext context) => FutureBuilder<List<dynamic>>(future: load(), builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
    if (snapshot.hasError) return const Center(child: Text('شغّل الخادم ثم أعد المحاولة'));
    final lessons = snapshot.data!;
    return ListView(padding: const EdgeInsets.all(16), children: [const Text('ابدأ رحلتك البرمجية', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)), const SizedBox(height: 8), const Text('دروس قصيرة، أمثلة عملية، وتحديات ممتعة.'), const SizedBox(height: 20), ...lessons.map((lesson) => Card(margin: const EdgeInsets.only(bottom: 12), child: ListTile(contentPadding: const EdgeInsets.all(16), leading: CircleAvatar(child: Text('${lesson['id']}')), title: Text(lesson['title'], style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('${lesson['description']}\n⏱ ${lesson['duration']} دقيقة  •  ${lesson['level']}'), isThreeLine: true, trailing: const Icon(Icons.arrow_forward_ios, size: 16), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LessonPage(lesson: lesson))))) ]);
  });
}

class LessonPage extends StatelessWidget { final dynamic lesson; const LessonPage({super.key, required this.lesson}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(lesson['title'])), body: ListView(padding: const EdgeInsets.all(20), children: [Text(lesson['description'], style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), const SizedBox(height: 20), Text(lesson['content'], style: const TextStyle(fontSize: 18, height: 1.6)), const SizedBox(height: 20), Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(12)), child: Text(lesson['code'], style: const TextStyle(color: Colors.greenAccent, fontFamily: 'monospace', fontSize: 16))), const SizedBox(height: 28), FilledButton.icon(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('أحسنت! تم إنهاء الدرس 🎉'))), icon: const Icon(Icons.check), label: const Text('إنهاء الدرس'))])); }

class ChallengesPage extends StatelessWidget { const ChallengesPage({super.key}); @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(16), children: [const Text('تحديات اليوم', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)), const SizedBox(height: 16), ...['اطبع اسمك', 'رقم زوجي أم فردي؟', 'مجموع الأرقام'].asMap().entries.map((e) => Card(child: ListTile(leading: const Icon(Icons.code), title: Text(e.value), subtitle: Text('المستوى ${e.key + 1} • أكسب 20 نقطة'), trailing: const Icon(Icons.lock_open))))]); }
class ProgressPage extends StatelessWidget { const ProgressPage({super.key}); @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(20), children: [const Text('تقدمك', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)), const SizedBox(height: 24), Card(child: Padding(padding: const EdgeInsets.all(20), child: Column(children: [const Icon(Icons.local_fire_department, color: Colors.orange, size: 48), const Text('سلسلة يومين', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), const SizedBox(height: 16), LinearProgressIndicator(value: .25, minHeight: 10), const SizedBox(height: 10), const Text('درس واحد من أربعة مكتمل')]))) ]); }
