import '../header.dart';


class NewContact extends StatefulWidget {
  const NewContact({super.key});

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  Contact contact = Contact(lastName: 'default', firstName: 'default', phoneNumber: 'default', email: 'default', nickname: 'default');
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
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
                  onPressed: () async {
                    contact = Contact(
                      lastName: lastNameController.text,
                      firstName: firstNameController.text,
                      phoneNumber: phoneNumberController.text,
                      email: emailController.text,
                      nickname: nicknameController.text,
                    );
                    await DatabaseHelper.instance.createContact(contact);
                    Navigator.pop(context);
                  },
                  ),
                  ),
        ]),
        body: SingleChildScrollView(
            child: Column(
            children: [
              createField('last name', lastNameController),
              createField('first name', firstNameController),
              createField('phone number', phoneNumberController),
              createField('e-mail address', emailController),
              createField('nickname', nicknameController),
              const Padding(padding: EdgeInsets.all(50),)
            ]
      ),
      ),
    );
    return vue;
  }
}
