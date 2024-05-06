import 'header.dart';


class EditContact extends StatefulWidget {
  final Contact contact = Contact();

  EditContact({super.key, contact});


  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {

  Padding editField(String field, TextEditingController input) {
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
        title: const Text('Contact', style: TextStyle(),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton(
                  child: const Text('Save'),
                  onPressed: () {
                    // myContacts.add(contact);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactsPage()));
                  },
                  ),
          )
        ]
      ),
      body: SingleChildScrollView(
            child: Column(
            children: [
              editField(widget.contact.lastName.text, widget.contact.lastName),
              editField(widget.contact.firstName.text, widget.contact.firstName),
              editField(widget.contact.phoneNumber.text, widget.contact.phoneNumber),
              editField(widget.contact.email.text, widget.contact.email),
              editField(widget.contact.pseudo.text, widget.contact.pseudo),
              const Padding(padding: EdgeInsets.all(50),)
            ]
      ),
      )
    );
    return vue;
  }
}