import 'package:car_rental_app/presentation/bloc/car_bloc.dart';
import 'package:car_rental_app/presentation/bloc/car_state.dart';
import 'package:car_rental_app/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose Your Car'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: BlocBuilder<CarBloc, CarState>(
          builder: (context, state) {
            if (state is CarsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CarsLoaded) {
              return ListView.builder(
                itemCount: state.cars.length,
                itemBuilder: (_, index) => CarCard(car: state.cars[index]),
              );
            } else if (state is CarsError) {
              return Center(
                child: Text('error : ${state.message}'),
              );
            }
            return Container();
          },
        ));
  }
}