import 'package:flutter/material.dart';
import 'package:flutter_application_2/more.dart';
import 'package:flip_card/flip_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'About me'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color themeColor = const Color(0xff0f7791);

  void _changeTheme(bool isFront) {
    setState(() {
      themeColor = isFront
          ? const Color(0xff5acdd1)
          : const Color(0xff0f7791);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text(widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            )),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 500),
              style: TextStyle(
                color: themeColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              // text
             child: const Text( 'Introduction'),
            ),
            
            FlipCard(
              direction: FlipDirection.HORIZONTAL,
              onFlipDone: (isFront) {
                _changeTheme(isFront);
              },
              
              front: Container(
                padding: const EdgeInsets.all(20.0),
                height: screenHeight * 0.5,
                width: 300,
                decoration: BoxDecoration(
                  color: const Color(0xff0f7791),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(3, 5), // shadow position
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // First Text at the top
                    Text(
                      'Name: Muhammad Imran bin Roszaide\nAge: 20 years old\nEducation: University Technology MARA',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        height: 2,
                      ),
                    ),

                    SizedBox(height: 10), // spacer

                    Text(
                      'Tap to see me >>',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  ],
                ),
              ),

              back: Container(
                // home card
                // description
                margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                padding: const EdgeInsets.all(20.0),
                height: screenHeight * 0.5,
                width: 350,

                decoration: BoxDecoration(
                  color: const Color(0xff5acdd1),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(4, 7), // shadow position
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      'https://drive.google.com/uc?id=1LZlXWXX4O75XUyPUPTxAg3m3SfOVTJsV',
                      height: 280,
                    ),
                    const Text(
                      'me',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const More()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
              ),
              child: const Text(
                'more about me',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  

}
