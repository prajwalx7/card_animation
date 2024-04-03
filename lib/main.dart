import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Flex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _clickedIndex = 0;
  final List<String> _assetImages = [
    'asset/images/1.jpeg',
    'asset/images/2.jpeg',
    'asset/images/3.jpeg',
    'asset/images/4.jpeg',
    'asset/images/5.jpeg',
    'asset/images/6.jpeg',
    'asset/images/7.jpeg',
    'asset/images/8.jpeg',
    'asset/images/9.jpeg',
    'asset/images/10.jpeg',
    'asset/images/11.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffFFCDEA),
              Color(0xff836FFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
            // Color(0xff7469B6),
            // Color(0xffB784B7),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 220),
          child: SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: _assetImages.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _clickedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.linear,
                    width: _clickedIndex == index ? 500.0 : 70.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                          ),
                        ]),
                    margin: const EdgeInsets.all(10.0),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: Image.asset(
                            _assetImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
