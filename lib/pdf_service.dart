import 'package:download_pdf/collection_model.dart';
import 'package:download_pdf/sizes.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';

class PDFService {
  static Future<void> downloadPDF(final CollectionModel collection) async {
    final storagePermission = await Permission.storage.status;
    if (!storagePermission.isGranted) {
      await Permission.storage.request();
    }
    if (storagePermission.isGranted) {
      print("Storage permission granted");

      // taking user data and make pdf of it
      final doc = pw.Document();
      doc.addPage(pw.Page(build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            pw.Padding(
              padding: pw.EdgeInsets.symmetric(horizontal: 0.0),
              child: pw.Text(
                'Tenant Information',
                // style: pw.Theme.of(context).textTheme.headlineSmall,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            pw.Divider(),
            pw.SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            pw.Padding(
                padding: pw.EdgeInsets.all(10.0),
                child: pw.Row(children: [
                  pw.Expanded(flex: 3, child: pw.Text("Tenant Name: ")),
                  pw.Spacer(),
                  pw.Expanded(
                      flex: 5,
                      child:
                          pw.Row(children: [pw.Text(collection.TenantName)])),
                ])),
            pw.Padding(
                padding: pw.EdgeInsets.all(10.0),
                child: pw.Row(children: [
                  pw.Expanded(flex: 3, child: pw.Text("Property Name: ")),
                  pw.Spacer(),
                  pw.Expanded(
                      flex: 5,
                      child:
                          pw.Row(children: [pw.Text(collection.PropertyName)])),
                ])),
            pw.Padding(
                padding: pw.EdgeInsets.all(10.0),
                child: pw.Row(children: [
                  pw.Expanded(flex: 3, child: pw.Text("Floor: ")),
                  pw.Spacer(),
                  pw.Expanded(
                      flex: 5,
                      child:
                          pw.Row(children: [pw.Text(collection.FloorNumber)])),
                ])),
            pw.Padding(
                padding: pw.EdgeInsets.all(10.0),
                child: pw.Row(children: [
                  pw.Expanded(flex: 3, child: pw.Text("Unit: ")),
                  pw.Spacer(),
                  pw.Expanded(
                      flex: 5,
                      child:
                          pw.Row(children: [pw.Text(collection.UnitNumber)])),
                ])),
            pw.SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            pw.Padding(
              padding: pw.EdgeInsets.symmetric(horizontal: 0.0),
              child: pw.Text(
                'Due Information',
                // style: pw.Theme.of(context).textTheme.headlineSmall,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            pw.Divider(),
            pw.SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            pw.Padding(
                padding: pw.EdgeInsets.all(10.0),
                child: pw.Row(children: [
                  pw.Expanded(flex: 3, child: pw.Text("Due Type: ")),
                  pw.Spacer(),
                  pw.Expanded(
                      flex: 5,
                      child: pw.Row(children: [pw.Text(collection.DueType)])),
                ])),
            pw.Padding(
                padding: pw.EdgeInsets.all(10.0),
                child: pw.Row(children: [
                  pw.Expanded(flex: 3, child: pw.Text("Due Amount: ")),
                  pw.Spacer(),
                  pw.Expanded(
                      flex: 5,
                      child: pw.Row(children: [
                        pw.Text(collection.DueAmount.toString())
                      ])),
                ])),
            pw.Padding(
                padding: pw.EdgeInsets.all(10.0),
                child: pw.Row(children: [
                  pw.Expanded(flex: 3, child: pw.Text('Due Start:\nDate')),
                  pw.Spacer(),
                  pw.Expanded(
                      flex: 5,
                      child: pw.Row(children: [
                        pw.Text(DateFormat('dd-MM-yyyy')
                            .format(collection.DueStartDate!))
                      ])),
                ])),
            pw.SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            pw.Padding(
              padding: pw.EdgeInsets.symmetric(horizontal: 0.0),
              child: pw.Text(
                'Collection Information',
                // style: pw.Theme.of(context).textTheme.headlineSmall,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            pw.Divider(),
            pw.SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            pw.Padding(
                padding: pw.EdgeInsets.all(10.0),
                child: pw.Row(children: [
                  pw.Expanded(flex: 3, child: pw.Text('Collection:\nAmount')),
                  pw.Spacer(),
                  pw.Expanded(
                      flex: 5,
                      child: pw.Row(children: [
                        pw.Text(collection.CollectionAmount.toString())
                      ])),
                ])),
            pw.Padding(
                padding: pw.EdgeInsets.all(10.0),
                child: pw.Row(children: [
                  pw.Expanded(flex: 3, child: pw.Text('Collection:\nDate')),
                  pw.Spacer(),
                  pw.Expanded(
                      flex: 5,
                      child: pw.Row(children: [
                        pw.Text(DateFormat('dd-MM-yyyy')
                            .format(collection.CollectionDate!))
                      ])),
                ])),
            pw.Padding(
                padding: pw.EdgeInsets.all(10.0),
                child: pw.Row(children: [
                  pw.Expanded(
                      flex: 3, child: pw.Text('Collection:\nDescription')),
                  pw.Spacer(),
                  pw.Expanded(
                      flex: 5,
                      child:
                          pw.Row(children: [pw.Text(collection.Description)])),
                ])),
            // pw.Padding(
            //     padding: pw.EdgeInsets.all(10.0),
            //     child: pw.Row(children: [
            //       pw.Expanded(flex: 3, child: pw.Text()),
            //       pw.Spacer(),
            //       pw.Expanded(flex: 5, child: pw.Row(children: [pw.Text()])),
            //     ])),
            // pw.Padding(
            //     padding: pw.EdgeInsets.all(10.0),
            //     child: pw.Row(children: [
            //       pw.Expanded(flex: 3, child: pw.Text()),
            //       pw.Spacer(),
            //       pw.Expanded(flex: 5, child: pw.Row(children: [pw.Text()])),
            //     ])),
            pw.Padding(
                padding: pw.EdgeInsets.all(10.0),
                child: pw.Row(children: [
                  pw.Expanded(flex: 3, child: pw.Text('Used Desposit ?')),
                  pw.Spacer(),
                  pw.Expanded(
                      flex: 5,
                      child: pw.Row(children: [
                        pw.Text(collection.AdjustFromDeposit ? "Yes" : "No")
                      ])),
                ])),
            pw.Padding(
                padding: pw.EdgeInsets.all(10.0),
                child: pw.Row(children: [
                  pw.Expanded(flex: 3, child: pw.Text('Collection Mode:')),
                  pw.Spacer(),
                  pw.Expanded(
                      flex: 5,
                      child: pw.Row(
                          children: [pw.Text(collection.CollectionMode)])),
                ])),
            pw.SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
          ],
        );
      }));

      //save pdf to writeable storage
      final output = await getTemporaryDirectory();
      final file = File('${output.path}/example.pdf');
      await file.writeAsBytes(await doc.save());

      // open printer
      Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save(),
      );

      // // share pdf to other apps
      // await Printing.sharePdf(
      //     bytes: await doc.save(), filename: "OmNamaShivay.pdf");
    }
  }
}
