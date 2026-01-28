import 'package:flutter/material.dart';
import '../models/driver_state.dart';
import '../models/duty_status.dart';

class DriverProvider extends ChangeNotifier {
  DriverState _state = DriverState(
    status: DutyStatus.offDuty,
    note: "Pre-trip Inspection",
    lastUpdated: DateTime.now(),
  );

  DriverState get state => _state;

  void updateStatus(DutyStatus status, String note) {
    _state = DriverState(
      status: status,
      note: note,
      lastUpdated: DateTime.now(),
    );
    notifyListeners();
  }
}
