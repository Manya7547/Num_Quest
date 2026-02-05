import 'package:flutter/material.dart';
import 'dart:math';
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
import 'analytics_engine.dart';

class LessonsPage extends StatefulWidget {
  @override
  _LessonsPageState createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage>
    with TickerProviderStateMixin {
  bool isEnglish = true;
  late AnimationController _bounceController;

  String t(String en, String es) => isEnglish ? en : es;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  static const List<List<Color>> cardGradients = [
    [Color(0xFF43E97B), Color(0xFF38F9D7)],
    [Color(0xFFFA709A), Color(0xFFFEE140)],
    [Color(0xFF667EEA), Color(0xFF764BA2)],
    [Color(0xFFFF6B6B), Color(0xFFFFE66D)],
    [Color(0xFF4FACFE), Color(0xFF00F2FE)],
    [Color(0xFFF093FB), Color(0xFFF5576C)],
    [Color(0xFF5EE7DF), Color(0xFFB490CA)],
    [Color(0xFFFFD26F), Color(0xFF3677FF)],
    [Color(0xFF11998E), Color(0xFF38EF7D)],
    [Color(0xFFFC466B), Color(0xFF3F5EFB)],
  ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AnalyticsEngine.logModuleNavigation('lessons');
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
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1A1A2E),
                  Color(0xFF16213E),
                  Color(0xFF0F3460),
                ],
              ),
            ),
          ),
          // Stars
          const _StarsBackground(),
          // Content
          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double screenWidth = constraints.maxWidth;
                      int crossAxisCount = 1;
                      double horizontalPadding = 16;

                      if (screenWidth >= 1200) {
                        crossAxisCount = 4;
                        horizontalPadding = 60;
                      } else if (screenWidth >= 900) {
                        crossAxisCount = 3;
                        horizontalPadding = 40;
                      } else if (screenWidth >= 600) {
                        crossAxisCount = 2;
                        horizontalPadding = 24;
                      }

                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding,
                            vertical: 16,
                          ),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 1.6,
                            ),
                            itemCount: lessons.length,
                            itemBuilder: (context, index) {
                              final lesson = lessons[index];
                              return _buildLessonCard(
                                index: index,
                                titleEn: lesson['title_en'] as String,
                                titleEs: lesson['title_es'] as String,
                                subtitleEn: lesson['subtitle_en'] as String,
                                subtitleEs: lesson['subtitle_es'] as String,
                                page: lesson['page'] as Widget,
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              children: [
                AnimatedBuilder(
                  animation: _bounceController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, -3 * _bounceController.value),
                      child: const Text(
                        '📚',
                        style: TextStyle(fontSize: 32),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t('LEARN & EXPLORE', 'APRENDE Y EXPLORA'),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 1.2,
                          shadows: [
                            Shadow(
                              color: Colors.black38,
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        t('Pick a topic to start learning!',
                            '¡Elige un tema para aprender!'),
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isEnglish = !isEnglish;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF667EEA).withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isEnglish ? '🇺🇸' : '🇪🇸',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      isEnglish ? 'EN' : 'ES',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonCard({
    required int index,
    required String titleEn,
    required String titleEs,
    required String subtitleEn,
    required String subtitleEs,
    required Widget page,
  }) {
    final colors = cardGradients[index % cardGradients.length];
    final title = isEnglish ? titleEn : titleEs;
    final subtitle = isEnglish ? subtitleEn : subtitleEs;

    return _HoverCard(
      colors: colors,
      title: title,
      subtitle: subtitle,
      buttonText: isEnglish ? 'START' : 'INICIAR',
      onTap: () {
        AnalyticsEngine.logContentSelection('lesson', titleEn);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

class _HoverCard extends StatefulWidget {
  final List<Color> colors;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onTap;

  const _HoverCard({
    required this.colors,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onTap,
  });

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: _isHovered
              ? (Matrix4.identity()..scale(1.03))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.colors,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: widget.colors[0].withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.buttonText,
                  style: TextStyle(
                    color: widget.colors[0],
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StarsBackground extends StatefulWidget {
  const _StarsBackground();

  @override
  State<_StarsBackground> createState() => _StarsBackgroundState();
}

class _StarsBackgroundState extends State<_StarsBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Star> _stars = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    // Generate stars
    for (int i = 0; i < 150; i++) {
      _stars.add(_Star(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size: _random.nextDouble() * 2.5 + 0.5,
        opacity: _random.nextDouble() * 0.6 + 0.4,
        twinkleSpeed: _random.nextDouble() * 2 + 1,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _StarsPainter(_stars, _controller.value),
          size: Size.infinite,
        );
      },
    );
  }
}

class _Star {
  final double x;
  final double y;
  final double size;
  final double opacity;
  final double twinkleSpeed;

  _Star({
    required this.x,
    required this.y,
    required this.size,
    required this.opacity,
    required this.twinkleSpeed,
  });
}

class _StarsPainter extends CustomPainter {
  final List<_Star> stars;
  final double animationValue;

  _StarsPainter(this.stars, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (final star in stars) {
      final twinkle = (sin(animationValue * pi * 2 * star.twinkleSpeed) + 1) / 2;
      final currentOpacity = star.opacity * (0.5 + twinkle * 0.5);

      final paint = Paint()
        ..color = Colors.white.withOpacity(currentOpacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(star.x * size.width, star.y * size.height),
        star.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _StarsPainter oldDelegate) => true;
}
