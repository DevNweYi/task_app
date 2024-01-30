import 'package:flutter/material.dart';
import 'package:task_app/task_list.dart';
import 'package:task_app/utils/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(MediaQuery.of(context).size.width,
                        (MediaQuery.of(context).size.height / 2) - 150))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello Ender",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .merge(const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87))),
                          const SizedBox(
                            height: 8,
                          ),
                          Text("Today you have 8 Tasks",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .merge(const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54))),
                        ],
                      ),
                      Image.asset(
                        "assets/images/man.png",
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: _titleDetailList(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _titleDetailList() {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            child: Container(
              height: 100,
              alignment: Alignment.center,
              child: ListTile(
                leading: Image.asset("assets/images/man.png"),
                title: Text(
                  "Title",
                  style: Theme.of(context).textTheme.headlineSmall!.merge(
                      const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black87)),
                ),
                subtitle: Text(
                  "$index Tasks",
                  style: Theme.of(context).textTheme.titleMedium!.merge(
                      const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black38)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const TaskList()));
                },
              ),
            ),
          );
        });
  }
}
