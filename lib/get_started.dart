import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,
            child: Image.asset(
              "images/man.png",
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
                          style: Theme.of(context).textTheme.headlineSmall!.merge(
                              const TextStyle(fontWeight: FontWeight.bold))),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left: 50,right: 50),
                        child: Text(
                            "Tudy is a simple and effective to-do list and task manager app which helps you manage time.",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium!.merge(
                                const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black38))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: ElevatedButton(onPressed: () {}, child: const Text("Get Started")),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
