import 'package:flutter/material.dart';
import 'package:task_app/home.dart';
import 'package:task_app/utils/colors.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/man.png",
              width: 200,
              height: 200,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Get Organized Your Life",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .merge(const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87))),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 50, right: 50),
                        child: Text(
                            "Tudy is a simple and effective to-do list and task manager app which helps you manage time.",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .merge(const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black38))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 30, left: 30, right: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const Home()),
                          (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: secondary,
                        fixedSize: Size(MediaQuery.of(context).size.width, 60)),
                    child: const Text("Get Started"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
