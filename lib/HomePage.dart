import 'package:flutter/material.dart';
import 'package:qr_scan_1/CameraQr/CamScanner.dart';
import 'package:qr_scan_1/CameraQr/ScanGallery.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Scanner"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: null,
            ),
            ListTile(
              title: const Text("Rate Us"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Contact Us"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("More Info"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Share With.."),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                "Settings",
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(6, 43, 151, 1),
                  Color.fromRGBO(28, 78, 225, 1)
                ]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CamScanner(),
                      ));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60.0, vertical: 12),
                      child: Image.asset(
                        "assets/images/cemera.png",
                        scale: 8,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Scan With Camera",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(6, 43, 151, 1),
                  Color.fromRGBO(28, 78, 225, 1)
                ]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(

                        builder: (context) => QRScanScreen(),
                      ));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60.0, vertical: 12),
                      child: Image.asset(
                        "assets/images/noun-pict.png",
                        scale: 8,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Scan With gallery",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(6, 43, 151, 1),
                  Color.fromRGBO(28, 78, 225, 1)
                ]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60.0, vertical: 12),
                      child: Image.asset(
                        "assets/images/qrblack.png",
                        scale: 8,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Scan With QR Code",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
