import 'package:flutter/material.dart';
import 'lessons/even_number_info_page.dart';
import 'lessons/odd_number_info_page.dart';
import 'lessons/prime_number_info_page.dart';
import 'lessons/composite_number_info_page.dart';
import 'lessons/triangular_number_info_page.dart';
import 'lessons/perfect_number_info_page.dart';
import 'lessons/square_number_info_page.dart';
import 'lessons/fibonacci_number_info_page.dart';
import 'lessons/factors_info_page.dart';
import 'lessons/cube_number_info_page.dart';
import 'lessons/modulo_info_page.dart';
import 'analytics_engine.dart';

class LessonsPage extends StatelessWidget {
  final List<Map<String, dynamic>> lessons = [
    {'title': 'Even Numbers', 'page': EvenNumberInfoPage()},
    {'title': 'Odd Numbers', 'page': OddNumberInfoPage()},
    {'title': 'Prime Numbers', 'page': PrimeNumberInfoPage()},
    {'title': 'Composite Numbers', 'page': CompositeNumberInfoPage()},
    {'title': 'Triangular Numbers', 'page': TriangularNumberInfoPage()},
    {'title': 'Perfect Numbers', 'page': PerfectNumberInfoPage()},
    {'title': 'Square Numbers', 'page': SquareNumberInfoPage()},
    {'title': 'Fibonacci Numbers', 'page': FibonacciNumberInfoPage()},
    {'title': 'Factors', 'page': FactorsInfoPage()},
    {'title': 'Cube Numbers', 'page': CubeNumberInfoPage()},
  ];

  @override
  Widget build(BuildContext context) {
    // Log module navigation when lessons page is accessed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AnalyticsEngine.logModuleNavigation('lessons');
       print('A Lesson in modules is logged');
    });

    final List<Map<String, dynamic>> lessons = [
      {
        'title_en': 'Even Numbers',
        'title_es': 'Números Pares',
        'subtitle_en': 'Numbers that pair up!',
        'subtitle_es': '¡Números que se emparejan!',
        'page': EvenNumberInfoPage(),
      },
      {
        'title_en': 'Odd Numbers',
        'title_es': 'Números Impares',
        'subtitle_en': 'One always left over!',
        'subtitle_es': '¡Siempre sobra uno!',
        'page': OddNumberInfoPage(),
      },
      {
        'title_en': 'Prime Numbers',
        'title_es': 'Números Primos',
        'subtitle_en': 'Special & unique!',
        'subtitle_es': '¡Especiales y únicos!',
        'page': PrimeNumberInfoPage(),
      },
      {
        'title_en': 'Composite Numbers',
        'title_es': 'Números Compuestos',
        'subtitle_en': 'Made of primes!',
        'subtitle_es': '¡Hechos de primos!',
        'page': CompositeNumberInfoPage(),
      },
      {
        'title_en': 'Triangular Numbers',
        'title_es': 'Números Triangulares',
        'subtitle_en': 'Stack them up!',
        'subtitle_es': '¡Apílalos!',
        'page': TriangularNumberInfoPage(),
      },
      {
        'title_en': 'Perfect Numbers',
        'title_es': 'Números Perfectos',
        'subtitle_en': 'Rare & magical!',
        'subtitle_es': '¡Raros y mágicos!',
        'page': PerfectNumberInfoPage(),
      },
      {
        'title_en': 'Square Numbers',
        'title_es': 'Números Cuadrados',
        'subtitle_en': 'Make perfect squares!',
        'subtitle_es': '¡Cuadrados perfectos!',
        'page': SquareNumberInfoPage(),
      },
      {
        'title_en': 'Fibonacci Numbers',
        'title_es': 'Números Fibonacci',
        'subtitle_en': 'Nature\'s pattern!',
        'subtitle_es': '¡Patrón de la naturaleza!',
        'page': FibonacciNumberInfoPage(),
      },
      {
        'title_en': 'Factors',
        'title_es': 'Factores',
        'subtitle_en': 'Building blocks!',
        'subtitle_es': '¡Bloques de construcción!',
        'page': FactorsInfoPage(),
      },
      {
        'title_en': 'Cube Numbers',
        'title_es': 'Números Cúbicos',
        'subtitle_en': '3D number magic!',
        'subtitle_es': '¡Magia numérica 3D!',
        'page': CubeNumberInfoPage(),
      },
      {
        'title_en': 'Modulo',
        'title_es': 'Módulo',
        'subtitle_en': 'Find the leftover!',
        'subtitle_es': '¡Encuentra el residuo!',
        'page': ModuloInfoPage(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('LESSON PLAN'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/lesson_page.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            int crossAxisCount = 1;
            double horizontalPadding = 20;

            if (screenWidth >= 1200) {
              crossAxisCount = 4;
              horizontalPadding = 100;
            } else if (screenWidth >= 800) {
              crossAxisCount = 3;
              horizontalPadding = 60;
            } else if (screenWidth >= 600) {
              crossAxisCount = 2;
              horizontalPadding = 40;
            } else {
              crossAxisCount = 1;
              horizontalPadding = 20;
            }

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: 50),
                child: GridView.count(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: lessons.map((lesson) {
                    return LessonButton(
                      title: lesson['title_en'],
                      onPressed: () {
                        String lessonType = AnalyticsEngine.getLessonTypeFromContext(lesson['title_en']);
                        AnalyticsEngine.logContentSelection('lesson', lesson['title_en']);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => lesson['page']),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class LessonButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  LessonButton({required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth < 400 ? 18 : 24;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.cyan.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: 'Arial',
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}