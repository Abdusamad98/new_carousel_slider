import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_carousel_slider/wrap_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> texts = [
    "Sho'rva",
    "Osh",
    "Manti",
    "Xonim",
    "Shashlik",
    "Somsa",
    "Qanaqadur ovqat",
    "Sho'rva",
    "Osh",
    "Manti",
    "Xonim",
    "Shashlik",
    "Somsa",
    "Qanaqadur ovqat",
  ];

  List<Color> colors = [
    Colors.tealAccent,
    Colors.white,
    Colors.red,
    Colors.yellow,
    Colors.amber,
    Colors.green,
    Colors.blueAccent,
    Colors.brown,
    Colors.lightGreen,
    Colors.pink,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap widget"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              spacing: 10,
              direction: Axis.horizontal,
              runSpacing: 10,
              children: List.generate(
                texts.length,
                (index) => WrapItem(text: texts[index]),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CarouselSlider(
                options: CarouselOptions(
                  //  autoPlay: true,
                  //   autoPlayInterval: Duration(seconds: 1),
                  height: 200.0,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  onScrolled: (value) {},
                  reverse: false,
                ),
                items: List.generate(
                  colors.length,
                  (index) => Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: colors[index]),
                    child: Image.asset("assets/boy.png"),
                  ),
                )),
            //SizedBox(height: 25, width: 25, child: CircularProgressIndicator()),
            //CupertinoActivityIndicator(radius: 25),
            TextButton(
                onPressed: () async {
                  _presentDatePicker();
                },
                child: Text("Alert dialog"))
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          )
        ],
      ),
    );
  }

  void _presentDatePicker() async {
    await showDatePicker(
      keyboardType: TextInputType.datetime,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
    ).then((pickedDate) {});
  }
}
