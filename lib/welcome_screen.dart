import 'package:flash_chat_app/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'chat-screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  static late AnimationController controller;

  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    // animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: animation.value,
          appBar: AppBar(
            title: Center(
              child: Text(
                'WELCOME',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                    letterSpacing: 3),
              ),
            ),
            backgroundColor: Color(0xFFDC8B36),
          ),
          body: Center(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('images/logo.png'),
                        height: 60,
                      ),
                    ),
                    TyperAnimatedTextKit(
                      text: ['Flash Chat'],
                      textStyle: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RawMaterialButton(
                      child: Text('Log_In'),
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Colors.white),
                      onPressed: () {
                        Navigator.pushNamed(context, LogInScreen.id);
                      },
                      fillColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      constraints: BoxConstraints.tight(
                        Size(300, 60),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RawMaterialButton(
                      // child: FadeAnimatedTextKit(text:[
                      //   'Register '],
                      //   textStyle: TextStyle(
                      //       fontWeight: FontWeight.w800,
                      //       fontSize: 20,
                      //       color: Colors.white),
                      // ),
                      child: AnimatedTextKit(
                          isRepeatingAnimation: true,
                          animatedTexts: [
                            WavyAnimatedText(
                              'Register',
                              speed: Duration(milliseconds: 600),
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            // FadeAnimatedText(
                            //   'Register',
                            //   fadeInEnd: 0.5,
                            //   fadeOutBegin: 0.8,
                            //   duration: Duration(milliseconds: 5),
                            // ),
                          ]),
                      onPressed: () {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                      fillColor: Colors.cyan,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      constraints: BoxConstraints.tight(Size(300, 60)),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
