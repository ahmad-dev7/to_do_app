import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:to_do/Services/task_services.dart';
import 'package:to_do/pages/home_page.dart';

class GetUserName extends StatelessWidget {
  const GetUserName({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/silver-cloth-abstract-background.jpg'),
            fit: BoxFit.fill,
            opacity: 0.1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
                color: Color(0xff313638),
              ),
            ),
            const SizedBox(height: 90),
            shadowContainer(
              child: TextField(
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'Please enter your name',
                  filled: true,
                  fillColor: Colors.grey[100],
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 70),
            shadowContainer(
              child: MaterialButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty) {
                    userInfo.put('name', nameController.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'Please enter your name',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                },
                color: Colors.blue.shade100,
                minWidth: double.maxFinite,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Color(0xff313638), fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget shadowContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          // Bottom right
          BoxShadow(
            offset: const Offset(15, 15),
            blurRadius: 15,
            spreadRadius: 1,
            color: Colors.grey.shade500,
          ),
          const BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 15,
            spreadRadius: 1,
            color: Colors.white,
          ),
        ],
      ),
      child: child,
    ).animate().slideX();
  }
}
