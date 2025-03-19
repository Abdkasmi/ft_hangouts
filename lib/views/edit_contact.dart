import '../header.dart';

class EditContact extends StatefulWidget {
  final Contact contact;

  const EditContact({super.key, required this.contact});

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
            title: const Text(
              'Contact',
              style: TextStyle(),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TextButton(
                  child: const Text('Save'),
                  onPressed: () {
                    // myContacts.add(contact);
                    Navigator.pop(context);
                  },
                ),
              )
            ]),
        body: SingleChildScrollView(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.all(50),
            )
          ]),
        ));
    return vue;
  }
}
