import 'package:flutter/material.dart';
import '../contact/icons.dart';

class DialPage extends StatefulWidget {
  const DialPage({Key? key}) : super(key: key);

  @override
  State<DialPage> createState() => _DialPageState();
}

class _DialPageState extends State<DialPage> {
  Map<String, String> n0 = {
    '1': ' ',
    '2': 'ABC',
    '3': 'DEF',
  };
  Map<String, String> n1 = {
    '4': 'GHI',
    '5': 'JKL',
    '6': 'MNO',
  };
  Map<String, String> n2 = {
    '7': 'PQRS',
    '8': 'TUV',
    '9': 'WXYZ',
  };
  Map<String, String> n3 = {
    '*': ' ',
    '0': '+',
    '#': ' ',
  };

  String numbersData = '';
  List<String> numbers=[];
  List<String> names=[];
  Map<String,String> contacts = {};
  final TextEditingController controllerName=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            numbersData,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          AddToContacts(context),
          Container(
            padding: const EdgeInsets.only(top: 45),
            child: Column(
              children: [
                myChildrenColumn(n0),
                myChildrenColumn(n1),
                myChildrenColumn(n2),
                myChildrenColumn(n3),
              ],
            ),
          ),
          BottomRowIcons(context),
        ],
      ),
    );
  }

  Padding BottomRowIcons(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 35, right: 35, bottom: 40, top: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ContactsPage(
                        numbers: contacts,
                      )),
                );
              },
              icon: const Icon(Icons.groups_outlined)),
          Container(
            decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.circular(18)),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.phone),
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: () {
                numbersData =
                    numbersData.substring(0, numbersData.length - 1);
                setState(() {});
              },
              icon: const Icon(Icons.backspace_outlined))
        ],
      ),
    );
  }

  TextButton AddToContacts(BuildContext context) {
    return TextButton(
      onPressed: () {
        final alertAddName = AlertDialog(
          title: const Text('Add name '),
          content: SizedBox(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Divider(
                  color: Colors.black,
                  height: 5,
                ),
                TextField(
                  controller: controllerName,
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context,controllerName);
                    numbers.add(numbersData);
                    names.add(controllerName.text);
                    contacts=Map.fromIterables(numbers,names);
                    numbersData = numbersData.substring(numbersData.length);
                    controllerName.text=controllerName.text.substring(controllerName.text.length);
                    setState(() {});
                  },
                  child: SizedBox(
                    width: 65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text('Save'),
                        Icon(Icons.save),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return alertAddName;
            });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.add,
            color: Colors.green,
          ),
          Text(
            '  Add to contacts',
            style: TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }

  TextButton numRow({required String num, required String letters}) {
    return TextButton(
        onPressed: () {
          numbersData += num;
          setState(() {});
        },
        child: Column(
          children: [
            Text(
              num,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              letters,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ));
  }

  Padding myChildrenColumn(Map numbersRows) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: numbersRows.entries
              .map((e) => numRow(num: e.key, letters: e.value))
              .toList()),
    );
  }
}
