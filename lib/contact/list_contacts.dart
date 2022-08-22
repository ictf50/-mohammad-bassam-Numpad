import 'package:flutter/material.dart';

class ListContacts extends StatelessWidget {
   ListContacts({
    Key? key, required this.numbers,
  }) : super(key: key);
  Map<String,String> numbers ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 65),
      child: ListView(
          children: numbers.entries.map((e) => ListTile(
            leading: Container(
              width: 50,
              height: 50,
              child: Image.network('https://i.pravatar.cc/300'),
            ),
            title:  Text(
              e.value,
              style: const TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              e.key,
              style: const TextStyle(fontSize: 15),
            ),
            trailing: const Icon(Icons.phone,color: Colors.green,),
          ),
          ).toList()
      ),
    );
  }
}
