import 'package:flutter/material.dart';
import 'package:fleetcare_eld/screens/home/dvir/dvir_screen.dart';
import 'package:fleetcare_eld/screens/home/forms/forms_screen.dart';
import 'package:fleetcare_eld/screens/home/fueling/fueling_screen.dart';
import 'package:fleetcare_eld/screens/home/hos/hours_of_service_screen.dart';
import 'package:fleetcare_eld/screens/home/routes/routes_screen.dart';
import 'package:fleetcare_eld/models/duty_status.dart';
import 'package:fleetcare_eld/screens/home/hos/select_note_screen.dart';
import 'package:provider/provider.dart';
import '../../providers/driver_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showQuickActions = false;
  int currentIndex = 0;

  // ✅ REAL STATE
  String vehicleNumber = "01";
  List<String> trailers = [];

  // controllers
  final TextEditingController vehicleController = TextEditingController();
  final TextEditingController trailerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔵 APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AA6DF),
        title:
            const Text("Home Screen", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            setState(() {
              showQuickActions = !showQuickActions;
            });
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications, color: Colors.red),
          ),
        ],
      ),

      // 🔵 BODY
      body: Stack(
        children: [
          Column(
            children: [
              // USER + VEHICLE
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.person, size: 18),
                        SizedBox(width: 6),
                        Text("user",
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),

                    // 🚚 VEHICLE CLICK
                    InkWell(
                      onTap: () => _openChangeEquipment(context),
                      child: Row(
                        children: [
                          const Icon(Icons.local_shipping),
                          const SizedBox(width: 4),
                          Text(vehicleNumber),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // ⏱ TIMER
              SizedBox(
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      height: 180,
                      child: CircularProgressIndicator(
                        value: 0.75,
                        strokeWidth: 10,
                        color: Colors.grey.shade700,
                        backgroundColor: Colors.grey.shade200,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("14:00",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                        const Text("REMAINING"),
                        const SizedBox(height: 6),
                        Consumer<DriverProvider>(
                          builder: (context, driver, _) {
                            return InkWell(
                              onTap: () => _openChangeStatus(context),
                              child: Chip(
                                label: Text(
                                  driver.state.status.name.toUpperCase(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                backgroundColor: _statusColor(driver.state.status),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // ⭕ CIRCLES
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                padding: const EdgeInsets.all(24),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: const [
                  _CircleInfo("8:00", "BREAK", Colors.amber),
                  _CircleInfo("11:00", "DRIVING", Colors.green),
                  _CircleInfo("14:00", "SHIFT", Colors.black),
                  _CircleInfo("70:00", "CYCLE", Colors.blue),
                ],
              ),
            ],
          ),

          // DIM
          if (showQuickActions)
            Positioned.fill(
              child: GestureDetector(
                onTap: () => setState(() => showQuickActions = false),
                child: Container(color: Colors.black.withOpacity(0.25)),
              ),
            ),

          // LEFT PANEL
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: showQuickActions ? 0 : -280,
            top: 0,
            bottom: 0,
            child: Container(
              width: 280,
              color: const Color(0xFF1F1F1F),
              child: SafeArea(
                child: ListView(
                  padding: const EdgeInsets.all(12),
                  children: [
                    _tile(Icons.timer, "HoS", () {
                      setState(() => showQuickActions = false);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const HoursOfServiceScreen()));
                    }),
                    _tile(Icons.assignment, "DVIR", () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const DVIRScreen()));
                    }),
                    _tile(Icons.alt_route, "Routes", () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const RoutesScreen()));
                    }),
                    _tile(Icons.description, "Forms", () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const FormsScreen()));
                    }),
                    _tile(Icons.local_gas_station, "Fueling", () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const FuelingScreen()));
                    }),
                    _tile(Icons.folder, "Document", () {
                    }),
                    _tile(Icons.local_shipping, "Verticle", () {
                    
                    }),
                    _tile(Icons.swap_horiz, "Driving", () {
                    }),
                    _tile(Icons.settings, "Settings", () {
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // 🔵 BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2AA6DF),
        unselectedItemColor: Colors.grey,
        onTap: (i) => setState(() => currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "Inbox"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  void _close() => setState(() => showQuickActions = false);

  Color _statusColor(DutyStatus status) {
    switch (status) {
      case DutyStatus.offDuty:
        return Colors.red;
      case DutyStatus.sleeper:
        return Colors.blue;
      case DutyStatus.onDuty:
        return Colors.green;
      case DutyStatus.driving:
        return Colors.grey;
      case DutyStatus.yard:
        return Colors.orange;
      case DutyStatus.personal:
        return Colors.purple;
    }
  }

  Widget _tile(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  // 🔽 CHANGE EQUIPMENT
  void _openChangeEquipment(BuildContext context) {
    vehicleController.text = vehicleNumber;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
              16, 20, 16, MediaQuery.of(context).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Change Equipment",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

              const SizedBox(height: 20),

              TextField(controller: vehicleController, decoration: const InputDecoration(labelText: "Vehicle")),

              TextField(
                controller: trailerController,
                decoration: const InputDecoration(labelText: "Trailer"),
              ),

              TextButton(
                onPressed: () {
                  if (trailerController.text.isNotEmpty) {
                    setState(() {
                      trailers.add(trailerController.text);
                      trailerController.clear();
                    });
                  }
                },
                child: const Text("Add Trailer"),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      vehicleNumber = vehicleController.text;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Save"),
                ),
              ),

              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
            ],
          ),
        );
      },
    );
  }

  // 🔽 OPEN CHANGE STATUS
  void _openChangeStatus(BuildContext context) {
    String selectedNote = "Pre-trip Inspection";
    DutyStatus pendingStatus = context.read<DriverProvider>().state.status;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // TITLE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Change Status",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),

                    const SizedBox(height: 12),

                    // STATUS GRID
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        _statusTile("OFF", "OFF DUTY", Colors.red, DutyStatus.offDuty, pendingStatus, (status) {
                          setModalState(() => pendingStatus = status);
                        }),
                        _statusTile("SB", "SLEEPER", Colors.blue, DutyStatus.sleeper, pendingStatus, (status) {
                          setModalState(() => pendingStatus = status);
                        }),
                        _statusTile("ON", "ON DUTY", Colors.green, DutyStatus.onDuty, pendingStatus, (status) {
                          setModalState(() => pendingStatus = status);
                        }),
                        _statusTile("D", "DRIVING", Colors.grey, DutyStatus.driving, pendingStatus, (status) {
                          setModalState(() => pendingStatus = status);
                        }),
                        _statusTile("Y", "YARD", Colors.orange, DutyStatus.yard, pendingStatus, (status) {
                          setModalState(() => pendingStatus = status);
                        }),
                        _statusTile("P", "PERSONAL", Colors.purple, DutyStatus.personal, pendingStatus, (status) {
                          setModalState(() => pendingStatus = status);
                        }),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // ADD NOTE
                    ListTile(
                      title: const Text("Add Note"),
                      subtitle: Text(selectedNote),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () async {
                        final note = await Navigator.push<String>(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SelectNoteScreen(),
                          ),
                        );

                        if (note != null) {
                          setModalState(() => selectedNote = note);
                        }
                      },
                    ),

                    const SizedBox(height: 12),

                    // UPDATE
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<DriverProvider>().updateStatus(pendingStatus, selectedNote);
                          Navigator.pop(context);
                        },
                        child: const Text("Update"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // 🔽 STATUS TILE
  Widget _statusTile(
    String short,
    String label,
    Color color,
    DutyStatus status,
    DutyStatus selectedStatus,
    Function(DutyStatus) onSelect,
  ) {
    final bool isSelected = selectedStatus == status;

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () => onSelect(status),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.15) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: isSelected ? color : Colors.grey.shade300,
              child: Text(
                short,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isSelected ? color : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------- CIRCLE ---------- */

class _CircleInfo extends StatelessWidget {
  final String time;
  final String label;
  final Color color;

  const _CircleInfo(this.time, this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 6),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(time,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(label),
          ],
        ),
      ),
    );
  }
}
