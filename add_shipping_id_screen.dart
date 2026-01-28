import 'package:flutter/material.dart';

class AddShippingIdScreen extends StatelessWidget {
  AddShippingIdScreen({super.key});

  // 🔹 Controller (MOST IMPORTANT)
  final TextEditingController _shippingIdController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA6DF),
        title: const Text("Add a Shipping ID"),
        leading: const BackButton(),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔹 INPUT
            _inputBox(),

            const SizedBox(height: 16),

            // 🔹 SUGGESTIONS
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF6FF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Suggestions",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10),
                  Text("Hello"),
                ],
              ),
            ),

            const Spacer(),

            // 🔹 SAVE BUTTON
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2AA6DF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  final shippingId =
                      _shippingIdController.text.trim();

                  // ❌ Empty check
                  if (shippingId.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter Shipping ID"),
                      ),
                    );
                    return;
                  }

                  // ✅ PASS DATA TO NEXT SCREEN
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ShippingInformationScreen(
                        shippingId: shippingId,
                      ),
                    ),
                  );
                },
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 INPUT BOX
  Widget _inputBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Add Shipping ID",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: _shippingIdController, // 🔴 CONNECTED
          decoration: InputDecoration(
            hintText: "Enter Shipping ID",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class ShippingInformationScreen extends StatelessWidget {
  final String shippingId;

  const ShippingInformationScreen({
    super.key,
    required this.shippingId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Shipping ID: $shippingId"),
    );
  }
}
