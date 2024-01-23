import 'package:flutter/material.dart';
import 'package:task_app/utils/colors.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _topContainer(MediaQuery.of(context).size.width),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Column(
                children: [
                  Container(child: _taskTitle(context)),
                  const SizedBox(height: 15,),
                  Expanded(child: Container(child: _taskList())),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: secondaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _taskList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "Task $index",
              style: Theme.of(context).textTheme.bodyLarge!.merge(
                  const TextStyle(
                      fontWeight: FontWeight.bold,color: Colors.black54)),
            ),
          );
        });
  }

  Widget _taskTitle(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "images/man.png",
          width: 50,
          height: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("8 Tasks",
                style: Theme.of(context).textTheme.bodyLarge!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey))),
            Text("Personal",
                style: Theme.of(context).textTheme.displaySmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.bold))),
          ],
        )
      ],
    );
  }

  Widget _topContainer(double screenWidth) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(screenWidth, 200))),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
      ),
    );
  }
}
