import 'package:download_pdf/collection_model.dart';
import 'package:download_pdf/pdf_service.dart';
import 'package:flutter/material.dart';

class UI extends StatefulWidget {
  const UI({super.key});

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  @override
  Widget build(BuildContext context) {
    CollectionModel collectionModel = new CollectionModel(
        TenantId: "1",
        TenantName: "Nandan Magdum",
        OwnerId: "101",
        PropertyId: "011",
        PropertyName: "Manganga House",
        FloorId: "1",
        FloorNumber: "1",
        UnitId: "A01",
        UnitNumber: "A02",
        CollectionId: "01101",
        DueId: "ashdo",
        DueType: "paisdfjos",
        DueAmount: 1000,
        DueStartDate: DateTime.now(),
        CollectionAmount: 7000,
        CollectionDate: DateTime.now(),
        CollectionMode: "online",
        Description: "Student from GCEK",
        AdjustFromDeposit: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter to PDF"),
      ),
      body: const Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await PDFService.downloadPDF(collectionModel);
          },
          child: const Icon(Icons.download)),
    );
  }
}
