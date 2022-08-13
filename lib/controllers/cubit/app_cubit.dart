import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/controllers/cubit/state_cubit.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitailState());
  static AppCubit get(context) => BlocProvider.of(context);
}
