import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // 1. استيراد المكتبة هنا

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 2. دالة مخصصة لفتح الرابط بأمان
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.facebook.com/people/%D8%AA%D9%84%D8%A7%D9%88%D8%A7%D8%AA-%D9%85%D8%AC%D8%A7%D9%87%D8%AF-%D9%85%D9%87%D9%86%D8%AF-%D9%85%D9%82%D8%AF%D8%A7%D8%AF%D9%8A/61564031867130/?mibextid=ZbWKwL');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        extendBody: true,
        appBar: AppBar(
          title: const Text(
            "الملف الشخصي",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 110, 255, 14),
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 55, 57, 87),
        ),
        body: Center(
          child: Container(
            height: 550,
            width: 320,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 189, 189, 206),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SelectableText(
                  "phone number : 0778216522",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 110, 255, 14),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/image.jpg",
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 75),
                const Text(
                  "مجاهد  مهند مقدادي",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 0, 0, 0)
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Flutter Developer",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                
                // 3. تعديل الزر ليصبح قابلاً للضغط باستخدام InkWell
                InkWell(
                  onTap: _launchURL, // استدعاء دالة فتح الرابط عند الضغط
                  borderRadius: BorderRadius.circular(10), // لكي تظل تأثيرات الضغط دائرية متناسقة مع الحواف
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 110, 255, 14),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "تواصل معي",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}