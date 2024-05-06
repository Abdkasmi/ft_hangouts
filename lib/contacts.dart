import 'package:flutter/material.dart';
import 'header.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              'Contacts', 
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)
              ,)
            )
          ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: FloatingActionButton.small(
              elevation: 0,
              shape: const CircleBorder(),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NewContact())),
              child: const Icon(Icons.add, color: Colors.black,),
            ),
          )
        ]
      ),
      body:
          Column(
          children: [
            for (var contact in myContacts) GestureDetector(
                child: Column(
                  children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 35, bottom: 5, top: 5),
                          child: Text('A', 
                              style: TextStyle(fontSize: 11, color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold),),),),
                    const Divider(color: Color.fromARGB(128, 66, 66, 66), indent: 20, endIndent: 20, height: 0,),
                    TextButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditContact())) ,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(contact.firstName.text,
                              style: const TextStyle(fontSize: 16,
                                color: Color.fromARGB(255, 2, 1, 1)),),),),),
                    const Divider(color: Color.fromARGB(128, 66, 66, 66), indent: 20, endIndent: 20, height: 0,),
                    
                  ],
                ),
              ),
            ],
            ),
    );
  }
}