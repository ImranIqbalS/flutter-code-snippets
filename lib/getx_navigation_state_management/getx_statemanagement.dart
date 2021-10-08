import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

class GetXState extends StatelessWidget {
  const GetXState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetXStateManagement(),
    );
  }
}

class GetXStateManagement extends StatelessWidget {
  GetXStateManagement({Key? key}) : super(key: key);
  final MyController c = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "Books",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.amber,
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: IconButton(
                    onPressed: () => c.increment(),
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Obx(
                  () => Text(
                    "${c.books.toString()}",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: IconButton(
                    onPressed: () => c.decrement(),
                    icon: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Pens",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.amber,
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: IconButton(
                    onPressed: () => c.incrementPens(),
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Obx(
                  () => Text(
                    "${c.pens.toString()}",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: IconButton(
                    onPressed: () => c.decrementPens(),
                    icon: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Container(
                  width: 150,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue.shade900,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () => Get.to(
                      () => TotalPage(),
                    ),
                    child: Text(
                      "Total",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyController extends GetxController {
  var books = 0.obs;
  var pens = 0.obs;
  int get sum => books.value + pens.value;
  increment() {
    books.value++;
  }

  decrement() {
    if (books.value <= 0) {
      Get.snackbar(
        "title",
        "message",
        icon: Icon(Icons.alarm),
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 3),
      );
    } else {
      books.value--;
    }
  }

  incrementPens() {
    pens.value++;
  }

  decrementPens() {
    if (pens.value <= 0) {
      Get.snackbar(
        "title",
        "message",
        icon: Icon(Icons.alarm),
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 3),
      );
    } else {
      pens.value--;
    }
  }
}

class TotalPage extends StatelessWidget {
  TotalPage({Key? key}) : super(key: key);
  final MyController c = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total item",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() => Text("${c.sum.toString()}")),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () => Get.to(
                  () => GetXStateManagement(),
                ),
                child: Text(
                  "Go back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
