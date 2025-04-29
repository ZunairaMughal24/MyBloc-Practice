import 'dart:async';

import 'package:firebase_bloc/Connectivity/bloc/InternetEvents.dart';
import 'package:firebase_bloc/Connectivity/bloc/InternetStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetBloc extends Bloc<InternetEvents, InternetStates> {
  StreamSubscription? _connectivitySubscription;
  InternetBloc() : super(InitialState()) {
    Connectivity connectivity = Connectivity();
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
    _connectivitySubscription = connectivity.onConnectivityChanged.listen((result) {
      // ignore: unrelated_type_equality_checks
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        add(
          InternetGainedEvent(),
        );
      } else {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
