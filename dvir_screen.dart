import 'package:fleetcare_eld/screens/main_shell.dart';
import 'package:flutter/material.dart';

class DVIRScreen extends StatelessWidget {
  const DVIRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA6DF),
        title: const Text("DVIRs"),
        leading: const BackButton(),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFFEAF6FF),
            child: Icon(Icons.assignment, size: 36, color: Color(0xFF2AA6DF)),
          ),
          const SizedBox(height: 16),
          const Text(
            "No DVIRs Available",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          const Text(
            "Tap the button below to create a DVIR.",
            style: TextStyle(color: Colors.black54, fontSize: 12),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2AA6DF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  // NEXT STEP: Create DVIR screen later
                },
                child: const Text("Create DVIR"),
              ),
            ),
          ),
        ],
      ),

    );     

  }
}
