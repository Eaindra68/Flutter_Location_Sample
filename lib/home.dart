import 'package:flutter/material.dart';
import 'package:flutter_location_sample/location_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  String? lat, long, country, adminArea;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Flutter Location Sample'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location Info:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text(
              'Latitude: ${lat ?? 'Loading ...'}',
              style: getStyle(),
            ),
            const SizedBox(height: 20),
            Text(
              'Longitude: ${long ?? 'Loading ...'}',
              style: getStyle(),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle getStyle({double size = 20}) =>
      TextStyle(fontSize: size, fontWeight: FontWeight.w400);

  void getLocation() async {
    final service = LocationService();
    final locationData = await service.getLocation();

    setState(() {
      lat = locationData?.latitude!.toStringAsFixed(2);
      long = locationData?.longitude!.toStringAsFixed(2);
    });
  }
}
