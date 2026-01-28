import 'package:flutter/material.dart';

class DutyStatusScreen extends StatefulWidget {
  const DutyStatusScreen({super.key});

  @override
  State<DutyStatusScreen> createState() => _DutyStatusScreenState();
}

class _DutyStatusScreenState extends State<DutyStatusScreen> {
  int selectedStatus = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7FC),

      // 🔹 APP BAR
      appBar: AppBar(
        title: const Text("Duty Status"),
        backgroundColor: const Color(0xFF2AA6DF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _statusTile(
              index: 0,
              title: "Off Duty",
              icon: Icons.power_settings_new,
            ),
            _statusTile(
              index: 1,
              title: "On Duty",
              icon: Icons.work_outline,
            ),
            _statusTile(
              index: 2,
              title: "Sleeper Berth",
              icon: Icons.bedtime_outlined,
            ),

            const SizedBox(height: 12),

            // 🔹 INFO NOTE
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(Icons.info_outline, size: 18, color: Colors.grey),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "You haven't selected a vehicle so you can't mark yourself as driving.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            // 🔹 ADD REMARK + LOCATION
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: const BorderSide(color: Color(0xFF2AA6DF)),
                    ),
                    onPressed: () {},
                    child: const Text("Add Remark"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: const BorderSide(color: Color(0xFF2AA6DF)),
                    ),
                    onPressed: () {},
                    child: const Text("Location"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

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
                  Navigator.pop(context); // back to HoS
                },
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 STATUS TILE
  Widget _statusTile({
    required int index,
    required String title,
    required IconData icon,
  }) {
    final bool isSelected = selectedStatus == index;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected ? const Color(0xFF2AA6DF) : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              isSelected ? const Color(0xFF2AA6DF) : Colors.grey.shade200,
          child: Icon(
            icon,
            color: isSelected ? Colors.white : Colors.grey,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: Radio<int>(
          value: index,
          groupValue: selectedStatus,
          onChanged: (val) {
            setState(() => selectedStatus = val!);
          },
          activeColor: const Color(0xFF2AA6DF),
        ),
        onTap: () {
          setState(() => selectedStatus = index);
        },
      ),
    );
  }
}
