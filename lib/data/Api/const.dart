/// todo api base
const baseApiUrl = "https://stor.testm.online/api";

/// todo share
String? token = '';

///todo end point
const String login = "/Admin-App/login";
const String current = "/Current-Orders";
const String canceled = "/Canceled-Orders";
const String incomplete = "/Incomplete-Orders";
const String delegate = "/All-Representative";
const String complete = "/Completed-Orders";

String orderDetails(int id) {
  return "/Order_Details/$id";
}

String acceptOrder(int id) {
  return "/Accept_Order/$id";
}
String language(String locale) {
  return "/Accept_Order/$locale";
}
