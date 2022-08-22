import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/contact/bottom_buttons.dart';
import 'package:untitled/contact/upbar.dart';
import 'list_contacts.dart';
class ContactsPage extends StatelessWidget {
  ContactsPage({Key? key, required this.numbers}) : super(key: key);

  Map<String,String> numbers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            const ContactsBar(),
            ListContacts(numbers: numbers),
            const BottomButton(),
          ],
        ),
      ),
    );
  }
}
