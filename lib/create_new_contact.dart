import 'header.dart';


class NewContact extends StatefulWidget {
  const NewContact({super.key});

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  @override
  Contact contact = Contact();

  Padding createField(String field, TextEditingController input) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 15, right: 25),
      child: TextFormField(
        controller: input,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: field,
      ),
      ), 
    );
  }

  @override
  Widget build(BuildContext context) {
    final vue = Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton(
                  child: const Text('Save'),
                  onPressed: () {
                    myContacts.add(contact);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactsPage()));
                  },
                  ),
          )
        ]
        ),
      body: SingleChildScrollView(
            child: Column(
            children: [
              createField('last name', contact.lastName),
              createField('first name', contact.firstName),
              createField('phone number', contact.phoneNumber),
              createField('e-mail address', contact.email),
              createField('pseudo', contact.pseudo),
              const Padding(padding: EdgeInsets.all(50),)
            ]
      ),
      )
    );
    return vue;
  }
}
