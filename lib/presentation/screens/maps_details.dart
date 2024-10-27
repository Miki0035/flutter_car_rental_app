import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/presentation/widgets/car_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapsDetailsScreen extends StatelessWidget {
  const MapsDetailsScreen({super.key, required this.car});
  final Car car;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options:
                const MapOptions(initialCenter: LatLng(51, -0.09), initialZoom: 13),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              )
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CarDetailsCard(
              car: car,
            ),
          ),
        ],
      ),
    );
  }
}
