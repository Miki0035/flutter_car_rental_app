import 'package:car_rental_app/data/datasources/firebase_car_datasource.dart';
import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/domain/repositories/car_repository.dart';

class CarRepositoryImplementation implements CarRepository {
  final FirebaseCarDatasource datasource;

  CarRepositoryImplementation(this.datasource);

  @override
  Future<List<Car>> fetchCars() {
    return datasource.getCars();
  }
}
