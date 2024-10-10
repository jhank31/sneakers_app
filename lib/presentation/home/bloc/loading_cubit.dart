import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingCubit extends Cubit<int> {
  int _loadingCount = 0;

  LoadingCubit() : super(0);

  void startLoading() {
    _loadingCount++;
    emit(_loadingCount);  
  }

  void finishLoading() {
    _loadingCount--;
    if (_loadingCount < 0) {
      _loadingCount = 0;
    }
    emit(_loadingCount);
  }

 
}