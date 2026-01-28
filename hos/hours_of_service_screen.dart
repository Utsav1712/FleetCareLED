import 'package:fleetcare_eld/screens/main_shell.dart';
import 'package:flutter/material.dart';
import 'daily_log_screen.dart';
import 'edit_log_screen.dart';

class HoursOfServiceScreen extends StatelessWidget {
  const HoursOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA6DF),
        title: const Text("Hours of Service"),
        leading: const BackButton(),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.settings),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔴 Return to Rest Mode
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.refresh, color: Colors.red, size: 18),
                  SizedBox(width: 6),
                  Text("Return to Rest Mode",
                      style: TextStyle(color: Colors.red)),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // 🔵 Off Duty Card
          InkWell(
  borderRadius: BorderRadius.circular(16),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const EditLogScreen(),
      ),
    );
  },
  child: Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFFEAF6FF),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: const [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.power_settings_new,
            color: Color(0xFF2AA6DF),
          ),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Off Duty",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              "01:07",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    ),
  ),
),


            const SizedBox(height: 16),

            // ⏱ Time Boxes
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: const [
                _TimeBox("08:00", "Until Break"),
                _TimeBox("11:00", "Drive"),
                _TimeBox("14:00", "Total Shift"),
                _TimeBox("70:00", "Cycle"),
              ],
            ),

            const SizedBox(height: 16),

            // 🇺🇸 USA Property
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF6FF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("USA Property (8/70)",
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  Text("70:00h / 70h",
                      style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // 🔘 Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2AA6DF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DailyLogScreen(),
                        ),
                      );
                    },
                    child: const Text("Logbook"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Search Client"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // 📜 Certified list
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: const [
                  _CertRow("Today", "00:00 hours", "Uncertified"),
                  _CertRow("Sat, Oct 18", "00:00 hours", "Uncertified"),
                  _CertRow("Fri, Oct 17", "00:00 hours", "Uncertified"),
                  _CertRow("Thu, Oct 16", "00:00 hours", "Certified"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeBox extends StatelessWidget {
  final String time;
  final String label;
  const _TimeBox(this.time, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF2FBF6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundColor: Color(0xFFE0F2E9),
            child:
                Icon(Icons.access_time, size: 16, color: Colors.green),
          ),
          const SizedBox(height: 10),
          Text(time,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          Text(label,
              style:
                  const TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      ),
    );
  }
}

class _CertRow extends StatelessWidget {
  final String day, time, status;
  const _CertRow(this.day, this.time, this.status);

  @override
  Widget build(BuildContext context) {
    final isGreen = status == "Certified";

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const EditLogScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(day,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(
                  time,
                  style: const TextStyle(
                      fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  status,
                  style: TextStyle(
                    color: isGreen
                        ? const Color.fromARGB(255, 97, 197, 100)
                        : Colors.red,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.chevron_right,
                    size: 18, color: Colors.black38),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

