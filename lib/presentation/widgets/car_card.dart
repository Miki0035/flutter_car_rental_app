import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/presentation/screens/car_details_screen.dart';
import 'package:car_rental_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) =>  CardDetailsScreen(car: car,)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color(0xffF3F3F3),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 10)
            ]),
        child: Column(
          children: [
            Image.asset(
              CImages.car,
              height: 120,
            ),
            Text(
              car.model,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(CImages.gps),
                        Text('${car.distance.toStringAsFixed(0)} km')
                      ],
                    ),
                    const SizedBox(width: 10,),
                    Row(
                      children: [
                        Image.asset(CImages.pump),
                        Text('${car.fuelCapacity.toStringAsFixed(0)}L')
                      ],
                    ),
                  ],
                ),
                Text('\$${car.pricePerHour.toStringAsFixed(2)}/hr',
                style: const TextStyle(fontSize: 16),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
