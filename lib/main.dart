import 'package:flutter/material.dart';

class Contact {
  String name;
  String email;

  Contact(this.name, this.email);
}

class ContactsList {
  List<Contact> contacts;

  ContactsList() : contacts = List<Contact>.empty(growable: true);

  void addContact(Contact newContact) {
    contacts.add(newContact);
  }

  void removeContact(Contact contactToRemove) {
    contacts.remove(contactToRemove);
  }

  List<Contact> searchContacts(String query) {
    return contacts
        .where((contact) =>
            contact.name.toLowerCase().contains(query.toLowerCase()) ||
            contact.email.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void editContact(Contact oldContact, Contact updatedContact) {
    int index = contacts.indexOf(oldContact);
    if (index != -1) {
      contacts[index] = updatedContact;
    }
  }
}

class ContactsPage extends StatefulWidget {
  final ContactsList contactsList;

  ContactsPage({required this.contactsList});

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: ListView(
        children: [
          for (Contact contact in widget.contactsList.contacts)
            ListTile(
              leading: CircleAvatar(
                child: Text(
                  contact.name[0].toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.blue, // Cor de fundo do círculo
              ),
              title: Text(contact.name),
              subtitle: Text(contact.email),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adiciona um novo contato
          Contact newContact =
              Contact("Novo Contato", "novo.contato@example.com");
          setState(() {
            widget.contactsList.addContact(newContact);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  // Criando uma instância de ContactsList e adicionando os contatos
  ContactsList contactsList = ContactsList()
    ..contacts.addAll([
      Contact("Romain Hoogmoed", "main.hoogmoed@example.com"),
      Contact("Emilie Olsen", "emille.olsen@example.com"),
      Contact("Téo Lefevre", "teo.lefevre@example.com"),
      Contact("Nicole Cruz", "nicole.cruz@example.com"),
      Contact("Ramna Peixoto", "ramna.peixoto@example.com"),
      Contact("José Ortiz", "jose.ortiz@example.com"),
      Contact("Alma Christensen", "alma.christensen@example.com"),
      Contact("Sergio Hill", "sergio.hill@example.com"),
      Contact("Malo González", "malo.gonzalez@example.com"),
    ]);

  runApp(MaterialApp(home: ContactsPage(contactsList: contactsList)));
}
