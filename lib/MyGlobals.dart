class MyGlobals {
  // Declare your public variable here
  bool log_account = false;
  int total_amount =0;

  // Singleton pattern
  static final MyGlobals _singleton = MyGlobals._internal();

  factory MyGlobals() {
    return _singleton;
  }

  MyGlobals._internal();
}
