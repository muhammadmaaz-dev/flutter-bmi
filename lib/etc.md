import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFEB1555),
          surface: Color(0xFF1D1E33),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 60, 
            fontWeight: FontWeight.w900,
            height: 0.9,
          ),
          displayMedium: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
          bodyLarge: TextStyle(
            fontSize: 20,
            color: Color(0xFF8D8E98),
            height: 1.5,
          ),
          labelLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // BMI Text
              Text(
                'BMI',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
              
              // Calculator Text
              Text(
                'Calculator',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: const Color(0xFF8D8E98),
                    ),
              ),
              
              const Spacer(),
              
              // Welcome Message
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome to BMI Calculator, ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: 'your personal',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    TextSpan(
                      text: '\ntool for tracking your Body Mass Index (BMI)',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: '\nand monitoring your health.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              
              const Spacer(flex: 2),
              
              // START Button
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'START',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}