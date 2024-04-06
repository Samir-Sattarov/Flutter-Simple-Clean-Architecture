import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Stream<InternetConnectionStatus>  get connectionStream;
}

class NetworkInfoImpl implements NetworkInfo {
  late InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();

  @override
  Stream<InternetConnectionStatus> get connectionStream => connectionChecker.onStatusChange;
}
