import 'package:sqflite/sqflite.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // late Database _database;
  //
  // void createDataBase() async {
  //   _database = await openDatabase(
  //     'ShoppingCart.db',
  //     version: 1,
  //     onCreate: (database, version) {
  //       print('database created');
  //       database
  //           .execute(
  //               'CREATE TABLE items(id INTEGER PRIMARY KEY, image TEXT, name TEXT, price TEXT, color INTEGER, colorName TEXT, count TEXT, status TEXT)')
  //           .then((value) {
  //         print('table created');
  //       }).catchError((error) {
  //         print('Error when creating table ${error.toString()}');
  //       });
  //     },
  //     onOpen: (database) {
  //       print('database opened');
  //     },
  //   );
  // }

  // void insertToDataBase({
  //   required String image,
  //   required String name,
  //   required String price,
  //   required int color,
  //   required String colorName,
  //   required String count,
  //   required String status,
  // }) {
  //   _database.transaction((txn) {
  //     txn
  //         .rawInsert(
  //             'INSERT INTO items(title, time, date, status) VALUES("$image", "$name", "$price", $color, "$colorName", "$count", "$status")')
  //         .then((value) {
  //       print('$value inserted successfully');
  //     })
  //         .catchError((error) {
  //       print('Error when inserting new record ${error.toString()}');
  //     });
  //   });
  // }
}

abstract class BaseViewModelInputs {
  void start();

  void dispose();
}

abstract class BaseViewModelOutputs {}
