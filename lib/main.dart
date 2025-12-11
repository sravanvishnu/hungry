import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'recipe_service.dart';

void main() {
  runApp(const PantryChefApp());
}

class PantryChefApp extends StatelessWidget {
  const PantryChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantry Chef',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F0F0F), // Ultra dark grey
        primaryColor: const Color(0xFFD4AF37), // Metallic Gold
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD4AF37),
          secondary: Color(0xFFE0E0E0),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Serif',
            fontWeight: FontWeight.w300,
            letterSpacing: 1.2,
          ),
        ),
      ),
      home: const ClassySearchScreen(),
    );
  }
}

class ClassySearchScreen extends StatefulWidget {
  const ClassySearchScreen({super.key});

  @override
  State<ClassySearchScreen> createState() => _ClassySearchScreenState();
}

class _ClassySearchScreenState extends State<ClassySearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final RecipeService _service = RecipeService();

  String? _result;
  bool _isLoading = false;
  bool _hasSearched = false; // Tracks if we should move UI up

  void _cook() async {
    if (_controller.text.isEmpty) return;

    setState(() {
      _isLoading = true;
      _hasSearched = true; // Trigger UI shift
      _result = null;
    });

    final recipe = await _service.generateRecipe(_controller.text);

    setState(() {
      _result = recipe;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine where the search bar sits (Center vs Top)
    final double topPadding = _hasSearched
        ? 60
        : MediaQuery.of(context).size.height * 0.35;

    return Scaffold(
      body: Stack(
        children: [
          // Background subtle gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.5,
                  colors: [Color(0xFF1A1A1A), Color(0xFF000000)],
                ),
              ),
            ),
          ),

          // Main Scrollable Content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Animated spacing that moves elements up
                AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOutCubic,
                  height: topPadding,
                ),

                // 1. The Title / Question
                const Icon(
                  Icons.restaurant_menu,
                  color: Color(0xFFD4AF37),
                  size: 40,
                ).animate().fadeIn(duration: 800.ms),
                const SizedBox(height: 20),

                Text(
                  _hasSearched
                      ? "The Chef's Recommendation"
                      : "What is in your pantry today?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: _hasSearched ? 22 : 28,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ).animate().fadeIn().slideY(begin: 0.1, end: 0),

                const SizedBox(height: 30),

                // 2. The Input "Pill"
                Container(
                  width: 600, // Max width for web/desktop elegance
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "e.g., 3 eggs, spinach, leftover pasta...",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          icon: _isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Color(0xFFD4AF37),
                                  ),
                                )
                              : const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Color(0xFFD4AF37),
                                ),
                          onPressed: _cook,
                        ),
                      ),
                    ),
                    onSubmitted: (_) => _cook(),
                  ),
                ),

                // 3. The Result (Fades in below)
                if (_result != null) ...[
                  const SizedBox(height: 40),
                  Container(
                        width: 700,
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.05),
                          ),
                        ),
                        child: MarkdownBody(
                          data: _result!,
                          styleSheet: MarkdownStyleSheet(
                            h1: const TextStyle(
                              color: Color(0xFFD4AF37),
                              fontSize: 26,
                              fontFamily: 'Serif',
                            ),
                            h2: const TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            p: const TextStyle(
                              fontSize: 16,
                              height: 1.6,
                              color: Colors.white70,
                            ),
                            listBullet: const TextStyle(
                              color: Color(0xFFD4AF37),
                            ),
                            strong: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 800.ms)
                      .slideY(begin: 0.1, end: 0),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
