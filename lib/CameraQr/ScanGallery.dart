import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart' as FF;

class QRScanScreen extends StatefulWidget {
  @override
  _QRScanScreenState createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  File? selectedImage;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  Future<void> _openImagePicker() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
        result = null;
      });
      controller?.pauseCamera();
      _scanQRCodeFromImage(selectedImage!.path);
    }
  }

  Future<void> _scanQRCodeFromImage(String imagePath) async {
    try {
      final image = FF.FirebaseVisionImage.fromFilePath(imagePath);
      final qrCodeDetector = FF.FirebaseVision.instance.barcodeDetector();
      final qrCodes = await qrCodeDetector.detectInImage(image);
      if (qrCodes.isNotEmpty) {
        setState(() {
          result = qrCodes.first as Barcode?;
        });
      } else {
        print('No QR codes found in the image.');
      }
    } catch (e) {
      print('Error scanning QR code from image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.6,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  if (result != null)
                    Text('Result: ${result!.code}')
                  else
                    if (selectedImage != null)
                      Image.file(selectedImage!)
                    else
                      Text(
                          'Scan a QR code or select an image from the gallery.'),
                  ElevatedButton(
                    onPressed: _openImagePicker,
                    child: Text('Select Image'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}