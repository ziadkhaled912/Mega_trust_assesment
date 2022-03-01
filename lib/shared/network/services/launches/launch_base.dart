import 'package:mega_trust_task/models/enums/enums.dart';
import 'package:mega_trust_task/models/launch_pad/launch_pad_model.dart';
import 'package:mega_trust_task/models/launches/launch_data_model.dart';
import 'package:mega_trust_task/models/rockets/rocket_data_model.dart';

abstract class LaunchBase {
  Future<List<LaunchModel>> getLaunches(LaunchesType type);

  Future<LaunchPadModel> getLaunchPadById(String id);

  Future<RocketDataModel> getRocketById(String id);
}
