import 'package:mega_trust_task/models/launch_pad/launch_pad_model.dart';
import 'package:mega_trust_task/models/launches/launch_data_model.dart';
import 'package:mega_trust_task/models/rockets/rocket_data_model.dart';
import 'package:mega_trust_task/shared/network/services/launches/launch_base.dart';
import 'package:dio/dio.dart';
import '../../../../models/enums/enums.dart';
import '../../end_points.dart';
import '../../remote/dio_helper.dart';

class LaunchServices implements LaunchBase {
  @override
  Future<List<LaunchModel>> getLaunches(LaunchesType type) async {
    try {
      List<LaunchModel> model = []; // create object
      Response response =
          await DioHelper.getData(url: generateLaunchUrl(type)); // get data
      if (response.statusCode == 200) {
        // check the status
        List list;
        list = response.data;
        model = List.generate(
            list.length, (index) => LaunchModel.fromJson(response.data[index]));
        return model;
      } else {
        throw Exception('error'); // throw exception on error
      }
    } catch (e) {
      rethrow;
    }
  }

  String generateLaunchUrl(LaunchesType type) {
    switch (type) {
      case LaunchesType.upcoming:
        return EndPoints.upcomingLaunches;
      case LaunchesType.past:
        return EndPoints.pastLaunches;
    }
  }

  @override
  Future<LaunchPadModel> getLaunchPadById(String id) async {
    try {
      LaunchPadModel model = LaunchPadModel(); // create object
      Response response = await DioHelper.getData(
        url: "${EndPoints.launchPad}/$id",
      ); // get data
      if (response.statusCode == 200) {
        // check the status
        model = LaunchPadModel.fromJson(response.data);
        return model;
      } else {
        throw Exception('error'); // throw exception on error
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RocketDataModel> getRocketById(String id) async{
    try {
      RocketDataModel model = RocketDataModel(); // create object
      Response response = await DioHelper.getData(
        url: "${EndPoints.rocket}/$id",
      ); // get data
      if (response.statusCode == 200) {
        // check the status
        model = RocketDataModel.fromJson(response.data);
        return model;
      } else {
        throw Exception('error'); // throw exception on error
      }
    } catch (e) {
      rethrow;
    }
  }
}
