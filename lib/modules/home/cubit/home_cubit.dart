import 'package:mega_trust_task/models/enums/enums.dart';
import 'package:mega_trust_task/models/launches/launch_data_model.dart';
import 'package:mega_trust_task/shared/network/services/launches/launch_services.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/launch_pad/launch_pad_model.dart';
import '../../../models/rockets/rocket_data_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  final LaunchServices _launchServices = LaunchServices();

  /// Get Upcoming launches
  bool isUpcomingLaunchLoading = false;
  List<LaunchModel> upcomingLaunchModel = [];
  void getUpcomingLaunches() async{
    try {
      emit(UpcomingLaunchesGetLoadingState());
      isUpcomingLaunchLoading = true;
      upcomingLaunchModel = await _launchServices.getLaunches(LaunchesType.upcoming);
      emit(UpcomingLaunchesGetSuccessState());
    } catch (e) {
      emit(UpcomingLaunchesGetErrorState());
      rethrow;
    } finally {
      isUpcomingLaunchLoading = false;
      emit(UpcomingLaunchesGetChangeState());
    }
  }

  /// Get Upcoming launches
  List<LaunchModel> pastLaunchModel = [];
  bool isPastLaunchLoading = false;
  void getPastLaunches() async{
    try {
      emit(PastLaunchesGetLoadingState());
      isPastLaunchLoading = true;
      pastLaunchModel = await _launchServices.getLaunches(LaunchesType.past);
      emit(PastLaunchesGetSuccessState());
    } catch (e) {
      emit(PastLaunchesGetErrorState());
      rethrow;
    } finally {
      isPastLaunchLoading = false;
      emit(UpcomingLaunchesGetChangeState());
    }
  }

  /// Get launch Pad by id
  LaunchPadModel launchPadModel = LaunchPadModel();
  bool isLaunchPadModelLoading = false;
  void getLaunchPad(String id) async{
    try {
      emit(LaunchPadGetLoadingState());
      isLaunchPadModelLoading = true;
      launchPadModel = await _launchServices.getLaunchPadById(id);
      emit(LaunchPadGetSuccessState());
    } catch (e) {
      emit(LaunchPadGetErrorState());
      rethrow;
    } finally {
      isLaunchPadModelLoading = false;
      emit(UpcomingLaunchesGetChangeState());
    }
  }

  /// Get rocket by id
  RocketDataModel rocketDataModel = RocketDataModel();
  bool isRocketDataModelLoading = false;
  void getRocketById(String id) async{
    try {
      emit(RocketGetLoadingState());
      isRocketDataModelLoading = true;
      rocketDataModel = await _launchServices.getRocketById(id);
      emit(RocketGetSuccessState());
    } catch (e) {
      emit(RocketGetErrorState());
      rethrow;
    } finally {
      isRocketDataModelLoading = false;
      emit(UpcomingLaunchesGetChangeState());
    }
  }
}
