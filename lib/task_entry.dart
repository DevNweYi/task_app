import 'package:flutter/material.dart';
import 'package:task_app/utils/colors.dart';

class TaskEntry extends StatelessWidget {
  const TaskEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _topContainer(context, MediaQuery.of(context).size.width),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 70, bottom: 10),
            child: Column(
              children: [
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 1)),
                        hintText: 'Enter a new task',
                        labelText: 'New Task')),
                const SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: secondary,
                        padding: EdgeInsets.only(
                            top: 20, left: 40, right: 40, bottom: 20)
                        // fixedSize: Size(MediaQuery.of(context).size.width, 60)
                        ),
                    child: const Text("Add"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _topContainer(BuildContext context, double screenWidth) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(screenWidth, 200))),
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            Expanded(
              child: Align(
                child: Text("New Task",
                    style: Theme.of(context).textTheme.titleLarge!.merge(
                        const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87))),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
      ),
    );
  }
}
