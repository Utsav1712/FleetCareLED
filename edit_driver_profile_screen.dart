import 'package:fleetcare_eld/screens/main_shell.dart';
import 'package:flutter/material.dart';

class EditDriverProfileScreen extends StatelessWidget {
  const EditDriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),

      // 🔹 APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA6DF),
        elevation: 0,
        title: const Text("Edit Driver Profile"),
        leading: const BackButton(),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 👤 PROFILE IMAGE
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage(
                        'assets/images/driver.png', // dummy image
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Color(0xFF2AA6DF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  "Upload Photo",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🔹 INPUT FIELDS
            _input("Driver Name"),
            _input("Driver Number"),
            _input("Truck Number"),
            _input("Aadhar Card Number"),
            _input("Driver License"),
            _input("Truck RC Book"),

            const SizedBox(height: 24),

            // 🔹 SAVE BUTTON
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2AA6DF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context); // save → back
                },
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),

      // 🔹 COMMON BOTTOM BAR
      bottomNavigationBar: const MainShell(),
    );
  }

  // 🔹 INPUT FIELD WIDGET
  Widget _input(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w500)),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter $label",
              filled: true,
              fillColor:const Color(0xFFF2F4F7),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
