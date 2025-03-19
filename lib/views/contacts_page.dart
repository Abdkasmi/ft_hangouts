import '../header.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late Future<List<Contact>> _contacts;

  @override
  void initState() {
    super.initState();
    _refreshContacts();
  }

  void _refreshContacts() {
    setState(() {
      _contacts = DatabaseHelper.instance.readAllContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    'Contacts',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ))),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: FloatingActionButton.small(
                elevation: 0,
                shape: const CircleBorder(),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewContact())),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            )
          ]),
      body: FutureBuilder<List<Contact>>(
        future: _contacts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No contacts found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final contact = snapshot.data![index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditContact(contact: contact))),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 35, bottom: 5, top: 5),
                          child: Text(
                              '${contact.firstName} ${contact.lastName}',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const Divider(
                        color: Color.fromARGB(128, 66, 66, 66),
                        indent: 20,
                        endIndent: 20,
                        height: 0,
                      ),
                      // TextButton(
                      //   onPressed: () => Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => EditContact(contacts))),
                      //   child: Align(
                      //     alignment: Alignment.centerLeft,
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(left: 30),
                      //       child: Text(contact.firstName,
                      //           style: const TextStyle(
                      //               fontSize: 16,
                      //               color: Color.fromARGB(255, 2, 1, 1))),
                      //     ),
                      //   ),
                      // ),
                      const Divider(
                        color: Color.fromARGB(128, 66, 66, 66),
                        indent: 20,
                        endIndent: 20,
                        height: 0,
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
