import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;
  const WorkoutCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(workout.name),
        subtitle: Text('${workout.sets} Sätze x ${workout.reps} Wiederholungen'),
        trailing: Text('${workout.weight} kg'),
      ),
    );
  }
}
