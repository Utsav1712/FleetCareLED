import 'package:flutter/material.dart';

class SelectNoteScreen extends StatelessWidget {
  const SelectNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = [
      "Custom Entry",
      "Pre-Trip Inspection",
      "Pre-Trip Unloading",
      "Pre-Trip Loading",
      "Brake Check",
      "Break",
      "Fuel",
      "Fuel & Pre-Trip",
      "Road Inspection",
      "Post-Trip Inspection",
      "Unloading",
      "Loading",
      "Load Securement Checking",
      "Trailer Pickup",
      "Trailer Drop",
      "Check Out",
      "Truck Wash",
      "Truck Repair",
      "Hookup And Pickup Trailer",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Note"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search Note",
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index]),
                  onTap: () {
                    Navigator.pop(context, notes[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Confirm"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
