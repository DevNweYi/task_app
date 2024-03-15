import 'package:flutter/material.dart';
import 'package:task_app/utils/colors.dart';

class TaskEntry extends StatelessWidget {
  const TaskEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _topContainer(context,MediaQuery.of(context).size.width),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Column(
              children: [
                TextField(),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: secondary,
                      fixedSize: Size(MediaQuery.of(context).size.width, 60)),
                  child: const Text("Add"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _topContainer(BuildContext context,double screenWidth) {
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
            SizedBox(
              width: 20,
            ),
             Text("New Task",
                style: Theme.of(context).textTheme.titleSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87))),
          ],
        ),
      ),
    );
  }
}
