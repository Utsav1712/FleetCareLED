import 'package:flutter/material.dart';

class AddRemarkScreen extends StatelessWidget {
  const AddRemarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA6DF),
        title: const Text("Add Remark"),
        leading: const BackButton(),
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔹 Time (Required)
            _tile("Time", "Required", red: true),

            const SizedBox(height: 12),

            // 🔹 Add Remark (Required)
            _tile("Add Remark", "Required", red: true),

            const Spacer(),

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
                  Navigator.pop(context); // back to Edit Log
                },
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile(String title, String value, {bool red = false}) {
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
              Text(title,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(
                value,
                style: TextStyle(
                  fontSize: 12,
                  color: red ? Colors.red : Colors.black54,
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
