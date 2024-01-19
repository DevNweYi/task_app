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
            color: Colors.amber,
            child: Image.asset(
              "images/man.png",
              width: 150,
              height: 150,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Get Organized Your Life",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .merge(const TextStyle(fontWeight: FontWeight.bold))),
              Text(
                  "Tudy is a simple and effective to-do list and task manager app which helps you manage time.",
                  style: Theme.of(context).textTheme.bodyMedium!.merge(
                      const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black38))),
              ElevatedButton(onPressed: () {}, child: const Text("Get Started"))
            ],
          ),
        ],
      ),
    );
  }
}
