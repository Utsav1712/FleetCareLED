import 'package:flutter/material.dart';

class CreateInspectionPinScreen extends StatefulWidget {
  const CreateInspectionPinScreen({super.key});

  @override
  State<CreateInspectionPinScreen> createState() =>
      _CreateInspectionPinScreenState();
}

class _CreateInspectionPinScreenState
    extends State<CreateInspectionPinScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),

      // 🔹 APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA6DF),
        elevation: 0,
        title: const Text("Create Inspection PIN"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),

      // 🔹 BODY
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const Text(
              "Create a temporary PIN",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 6),
            const Text(
              "This PIN will be required to exit the Roadside Inspection screen.",
              style: TextStyle(color: Colors.black54, fontSize: 13),
            ),

            const SizedBox(height: 24),

            // 🔢 PIN INPUT BOXES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                (index) => _pinBox(_controllers[index]),
              ),
            ),

            const SizedBox(height: 18),

            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context); // skip PIN
                },
                child: const Text(
                  "Continue Without Lock",
                  style: TextStyle(color: Color(0xFF2AA6DF)),
                ),
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
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  // TODO: Save PIN logic later
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 SINGLE PIN BOX
  Widget _pinBox(TextEditingController controller) {
    return SizedBox(
      width: 60,
      child: TextField(
        controller: controller,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
