import 'package:fleetcare_eld/screens/home/inspection/create_inspection_pin_screen.dart';
import 'package:fleetcare_eld/screens/main_shell.dart';
import 'package:flutter/material.dart';
import 'adverse_driving_screen.dart';
import 'add_remark_screen.dart';
import 'adverse_driving_screen.dart';


class EditLogScreen extends StatelessWidget {
  const EditLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA6DF),
        title: const Text("Edit Log"),
        leading: const BackButton(),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.edit),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            _graphBox(),

            const SizedBox(height: 16),
InkWell(
  borderRadius: BorderRadius.circular(14),
  onTap: () async {
    final picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 12, minute: 0),
    );

    if (picked != null) {
      // later state me store kar sakti ho
    }
  },
  child: _Tile("Start time of edit", "12:00 AM"),
),

InkWell(
  borderRadius: BorderRadius.circular(14),
  onTap: () async {
    final picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 5, minute: 32),
    );
    if (picked != null) {}
  },
  child: _Tile("End time of edit", "05:32 AM"),
),



InkWell(
  borderRadius: BorderRadius.circular(14),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AdverseDrivingScreen(),
      ),
    );
  },
  child: _Tile("Add Remark", "Required", red: true),
),




            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2AA6DF),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            onPressed: () {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => _agreeDialog(context),
  );
},

              child: const Text("Save"),
            ),
          ],
        ),
      ),

  
    );
  }

  // -------- widgets --------

  Widget _graphBox() {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      alignment: Alignment.center,
      child: const Text("HOS Graph (Image/Widget here)"),
    );
  }

  Widget _TileWidget({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.red),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String label;
  final String value;
  final bool red;

  const _Tile(this.label, this.value, {this.red = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: red ? Colors.red : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _agreeDialog(BuildContext context) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.verified, size: 48, color: Color(0xFF2AA6DF)),
          const SizedBox(height: 12),

          const Text(
            "I hereby certify that my data entries\nare true and correct.",
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          const Text(
            "This will finalize your logs\nand cannot be undone.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2AA6DF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () {
               Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => const CreateInspectionPinScreen(),
  ),
);
// back
              },
              child: const Text("Certify and Submit"),
            ),
          ),

          const SizedBox(height: 8),

          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Not Ready - Cancel"),
          ),
        ],
      ),
    ),
  );
}
