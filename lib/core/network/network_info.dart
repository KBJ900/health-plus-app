import 'package:connectivity_plus/connectivity_plus.dart';

// For checking internet connectivity
abstract class NetworkInfoI {
  Future<bool> isConnected();

  Future<ConnectivityResult> get connectivityResult;

  Stream<ConnectivityResult> get onConnectivityChanged;
}

class NetworkInfo implements NetworkInfoI {
  Connectivity connectivity;

  NetworkInfo(this.connectivity) {
    connectivity = this.connectivity;
  }

  ///checks internet is connected or not
  ///returns [true] if internet is connected
  ///else it will return [false]
  @override
  Future<bool> isConnected() async {
      final result = await connectivity.checkConnectivity();
      if (result != ConnectivityResult.none) {
        return true;
      }
    return false;
  }

  // to check type of internet connectivity
  // @override
  // Future<ConnectivityResult> get connectivityResult async {
  //   return connectivity.checkConnectivity();
  // }
  @override
  Future<ConnectivityResult> get connectivityResult async {
    List<ConnectivityResult> results = await connectivity.checkConnectivity();
    // Assuming you want to return the first result in the list
    return results.isNotEmpty ? results[0] : ConnectivityResult.none;
  }

  //check the type on internet connection on changed of internet connection
  // @override
  // Stream<ConnectivityResult> get onConnectivityChanged =>
  //     connectivity.onConnectivityChanged;
  @override
  Stream<ConnectivityResult> get onConnectivityChanged async* {
    await for (List<ConnectivityResult> result in connectivity.onConnectivityChanged) {
      for (ConnectivityResult connectivityResult in result) {
        yield connectivityResult;
      }
    }
  }

}
