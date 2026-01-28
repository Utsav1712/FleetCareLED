import 'package:flutter/material.dart';

class AdverseDrivingScreen extends StatelessWidget {
  const AdverseDrivingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA6DF),
        title: const Text("Adverse Driving (USA)"),
        elevation: 0,
        leading: const BackButton(),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔹 INFO TEXT
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF6FF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Text(
                "If you have encountered unforeseen weather or server road & traffic conditions, describe the conditions in the remark below.",
                style: TextStyle(fontSize: 13),
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 CURRENT STATUS
            _tile(
              title: "Current Status",
              value: "Adverse Driving (USA)",
            ),

            const SizedBox(height: 10),

            // 🔹 DATE
            _tile(
              title: "Date",
              value: "Sunday, Oct 19th, 2025",
            ),

            const SizedBox(height: 10),

            // 🔹 TIME (REQUIRED)
            _tile(
              title: "Time",
              value: "Required",
              isRequired: true,
            ),

            const SizedBox(height: 10),

            // 🔹 ADD REMARK (REQUIRED)
            _tile(
              title: "Add Remark",
              value: "Required",
              isRequired: true,
            ),

            const SizedBox(height: 24),

            // 🔹 CLAIM BUTTON
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
                  Navigator.pop(context); // back to Edit Log
                },
                child: const Text("Claim"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 REUSABLE TILE
  Widget _tile({
    required String title,
    required String value,
    bool isRequired = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  fontSize: 12,
                  color: isRequired ? Colors.red : Colors.black54,
                ),
              ),
            ],
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
