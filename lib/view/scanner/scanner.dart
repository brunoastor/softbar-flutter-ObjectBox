import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'scanner_overlay.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:barcode/main.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Stack(
          children: [
            MobileScanner(
                controller: MobileScannerController(
                  detectionSpeed: DetectionSpeed.normal,
                  detectionTimeoutMs: 2000,
                ),
                startDelay: true,
                onDetect: _foundBarCode
            ),
            ScannerOverlay(overlayColour: Colors.black.withOpacity(0.5))
          ],
        )
    );
  }

  Future<void> _foundBarCode(BarcodeCapture barcode) async {
    final List<Barcode> codes = barcode.barcodes;
    for (final barcode in codes) {
      await objectbox.addProduto(barcode.rawValue.toString());
    }
    _playSound();
  }

  Future<void> _playSound() async {
    final player = AudioPlayer();
    await player.setSource(AssetSource('beep.mp3'));
    await player.resume();
  }
}