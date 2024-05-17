import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task_app/task_list.dart';
import 'package:task_app/utils/colors.dart';
import 'package:task_app/database/title/title_table.dart' as title_table;

import 'database/app_database.dart';

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
                          StreamBuilder(
                              stream: GetIt.instance
                                  .get<AppDatabase>()
                                  .taskDao
                                  .getTotalTaskByTitleName('Today'),
                              builder: ((context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text('Today you have ${snapshot.data} Tasks',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .merge(const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54)));
                                } else if (snapshot.hasError) {}
                                return CircularProgressIndicator();
                              })),
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
                StreamBuilder(
                    stream: GetIt.instance
                        .get<AppDatabase>()
                        .titleDao
                        .getAllTitleAndTotalTask(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: _titleDetailList(snapshot.data!),
                          ),
                        );
                      } else if (snapshot.hasError) {}
                      return CircularProgressIndicator();
                    })
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _titleDetailList(List<title_table.Title> lstTitle) {
    return ListView.builder(
        itemCount: lstTitle.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          title_table.Title title = lstTitle[index];
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            child: Container(
              height: 100,
              alignment: Alignment.center,
              child: InkWell(
                splashColor: Colors.amber,
                child: ListTile(
                  leading: Image.asset("assets/images/${title.imageName}"),
                  title: Text(
                    title.titleName!,
                    style: Theme.of(context).textTheme.titleLarge!.merge(
                        const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                  ),
                  subtitle: Text(
                    "${title.totalTask} Tasks",
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                        const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black38)),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => TaskList(
                                titleId: title.titleId!,
                              )));
                },
              ),
            ),
          );
        });
  }
}
