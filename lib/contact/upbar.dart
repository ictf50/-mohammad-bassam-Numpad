import 'package:flutter/material.dart';

class ContactsBar extends StatelessWidget {
  const ContactsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 15,
      left: 15,
      top: 25,
      child: Row(
        children: const [
          Text(
            'Contacts',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Spacer(),
          Icon(Icons.grid_view_outlined, color: Colors.grey),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.table_rows_rounded,
          ),
        ],
      ),
    );
  }
}
