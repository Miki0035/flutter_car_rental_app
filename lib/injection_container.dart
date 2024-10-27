import 'package:car_rental_app/data/datasources/firebase_car_datasource.dart';
import 'package:car_rental_app/data/repositories/car_repository_implementation.dart';
import 'package:car_rental_app/domain/repositories/car_repository.dart';
import 'package:car_rental_app/domain/usecases/get_cars.dart';
import 'package:car_rental_app/presentation/bloc/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void init() {
  try {
    // used to inject firebase firestore api
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);

    // used to inject data source car
    getIt.registerLazySingleton<FirebaseCarDatasource>(
        () => FirebaseCarDatasource(firestore: getIt<FirebaseFirestore>()));

    // used to inject car repository data
    getIt.registerLazySingleton<CarRepository>(
        () => CarRepositoryImplementation(getIt<FirebaseCarDatasource>()));

    // used to inject car uses case get cars
    getIt.registerLazySingleton<GetCars>(() => GetCars(getIt<CarRepository>()));

    // used to inject Car Bloc
    getIt.registerFactory<CarBloc>(() => CarBloc(getCars: getIt<GetCars>()));

  } catch (e) {
    rethrow;
  }
}
