import 'package:company_task/features/internet_connectivity/cubits/internet_check_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity _connectivity = Connectivity();

  ConnectivityCubit() : super(ConnectivityInitial()) {
    _checkInitialConnectivity();
    _connectivity.onConnectivityChanged.listen((results) {
      if (results.contains(ConnectivityResult.none)) {
        emit(ConnectivityDisconnected());
      } else {
        emit(ConnectivityConnected());
      }
    });
  }

  void _checkInitialConnectivity() async {
    var results = await _connectivity.checkConnectivity();
    if (results.contains(ConnectivityResult.none)) {
      emit(ConnectivityDisconnected());
    } else {
      emit(ConnectivityConnected());
    }
  }
}
