import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionModel {
  CollectionModel({
    required this.TenantId,
    required this.TenantName,
    required this.OwnerId,
    required this.PropertyId,
    required this.PropertyName,
    required this.FloorId,
    required this.FloorNumber,
    required this.UnitId,
    required this.UnitNumber,
    required this.CollectionId,
    required this.DueId,
    required this.DueType,
    required this.DueAmount,
    required this.DueStartDate,
    required this.CollectionAmount,
    required this.CollectionDate,
    required this.CollectionMode,
    required this.Description,
    required this.AdjustFromDeposit,
  });

  String CollectionId;
  String TenantId;
  String TenantName;
  String? OwnerId;
  String PropertyId;
  String PropertyName;
  String FloorId;
  String FloorNumber;
  String UnitId;
  String UnitNumber;
  String DueId;
  String DueType;
  int DueAmount;
  DateTime? DueStartDate;
  int CollectionAmount;
  DateTime? CollectionDate;
  String CollectionMode;
  String Description;
  bool AdjustFromDeposit;

  // Helper function to create an empty tenant model
  static CollectionModel empty() => CollectionModel(
        TenantId: '',
        TenantName: '',
        OwnerId: '',
        PropertyId: '',
        PropertyName: '',
        FloorId: '',
        FloorNumber: '',
        UnitId: '',
        UnitNumber: '',
        CollectionId: '',
        DueId: '',
        DueType: '',
        DueAmount: 0,
        DueStartDate: null,
        CollectionAmount: 0,
        CollectionDate: null,
        CollectionMode: '',
        Description: '',
        AdjustFromDeposit: false,
      );

  // Convert the model to JSON structure to store the data in Firebase

  Map<String, dynamic> toJson() {
    return {
      "TenantId": TenantId,
      "TenantName": TenantName,
      "OwnerId": OwnerId,
      "PropertyId": PropertyId,
      "PropertyName": PropertyName,
      "FloorId": FloorId,
      "FloorNumber": FloorNumber,
      "UnitId": UnitId,
      "UnitNumber": UnitNumber,
      "DueId": DueId,
      "DueType": DueType,
      "DueAmount": DueAmount,
      "DueStartDate": DueStartDate,
      "CollectionAmount": CollectionAmount,
      "CollectionDate": CollectionDate,
      "CollectionMode": CollectionMode,
      "Description": Description,
      "AdjustFromDeposit": AdjustFromDeposit,
      "CollectionId": CollectionId,
    };
  }

  // Factory method to create a tenant from Firebase document snapshot
  factory CollectionModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return CollectionModel(
        CollectionId: document.id,
        TenantId: data['TenantId'] ?? '',
        TenantName: data['TenantName'] ?? '',
        OwnerId: data['OwnerId'],
        PropertyId: data['PropertyId'] ?? '',
        PropertyName: data['PropertyName'] ?? '',
        FloorId: data['FloorId'] ?? '',
        FloorNumber: data['FloorNumber'] ?? '',
        UnitId: data['UnitId'] ?? '',
        UnitNumber: data['UnitNumber'] ?? '',
        DueId: data['DueId'] ?? '',
        DueType: data['DueType'] ?? '',
        DueAmount: data['DueAmount'] ?? 0,
        DueStartDate: data['DueStartDate'] != null
            ? (data['DueStartDate'] as Timestamp).toDate()
            : null,
        CollectionAmount: data['CollectionAmount'] ?? 0,
        CollectionDate: data['CollectionDate'] != null
            ? (data['CollectionDate'] as Timestamp).toDate()
            : null,
        CollectionMode: data['CollectionMode'] ?? '',
        Description: data['Description'] ?? '',
        AdjustFromDeposit: data['AdjustFromDeposit'] ?? false,
      );
    } else {
      return CollectionModel.empty();
    }
  }
}
