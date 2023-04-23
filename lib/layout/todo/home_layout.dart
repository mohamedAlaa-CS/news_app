import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:flutter_application_1/modulse/archive/archive.dart';
//import 'package:flutter_application_1/modulse/done/done.dart';
import 'package:sqflite/sqflite.dart';

import '../../modulse/archive/archive.dart';
import '../../modulse/done/done.dart';
import '../../modulse/tasks/tasks.dart';

//import '../../modulse/tasks/tasks.dart';

class home_layout extends StatefulWidget {
  const home_layout({super.key});

  @override
  State<home_layout> createState() => _home_layoutState();
}

// 1.creat database
// 2.creat table
// 3. open database
// 4. insert to database
// 5. get from database
// 6. update in database
// 7. delete from database
class _home_layoutState extends State<home_layout> {
  int currentindex = 0;
  late Database database;
  List<Widget> screans = [tasks_screen(), Done_screen(), archive_screen()];
  List<String> titles = ['Tasks', 'Done', 'Archive'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    creatDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[currentindex])),
      body: screans[currentindex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  creaDatabase();
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentindex,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline),
              label: 'Done',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.archive),
              label: 'Archive',
            ),
          ]),
    );
  }

  Future<String> getName() async {
    return 'ahmed ';
  }

  void creatDatabase() async {
    // WidgetsFlutterBinding.ensureInitialized();

    database = await openDatabase('todo.db');
    onCreat:
    (database, version) {
      version:
      1;
      return database.excute(
          'CREAT TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)');
    };
    onOpen:
    (database) {
      print("database crezted");
    };
    print('the database is creat');
  }

  // void creaDatabase() async {
  // database = await openDatabase('todo.db');

  //   version:
  //   1;

  //   onCreate:
  //   (database, version) {
  //     // id int
  //     // title string
  //     // date string
  //     // time string
  //     // status string
  //     print('database created');
  //     return database
  //         .execute(
  //             'CREAT TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
  //         .then((value) {
  //       print('database created');
  //     }).catchError((error) {
  //       print('error when creating table${error.toString()}');
  //     });
  //   };
  //   onOpen:
  //   (database) {
  //     print('database OPEN');
  //   };
  // }

  // void insertToDatabase() {
  //   database.transaction((txn) async {
  //     await txn
  //         .rawInsert(
  //       'INSERT INTO tasks(title,date,time, status) VALUES ("new tasks","20-10","2:30","new")',
  //     )
  //         .then((value) {
  //       print('$value insert succesfull');
  //     }).catchError((error) {
  //       print('Error when inserting table${error.toString()}');
  //     });
  //     return null;
  //   });
  // }
}
