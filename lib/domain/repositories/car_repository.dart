import 'package:car_rental_app/data/models/car.dart';

/// Interfaces to connect to firebase store and what they look like
/// They are implemented in the data/repositories

abstract class CarRepository {
  Future<List<Car>> fetchCars();
  
}