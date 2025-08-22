import '../models/workout.dart';

class WorkoutService {
  final workouts = <Workout>[];

  void addWorkout(Workout workout) {
    workouts.add(workout);
  }

  List<Workout> getWorkouts() => List.unmodifiable(workouts);
}
