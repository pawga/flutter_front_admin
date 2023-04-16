
import 'dart:io';

class DevHttpOverrides extends HttpOverrides {

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)
      {
        if (host.isNotEmpty && host == 'localhost')
        {
          return true;
        }
        else
        {  return false;  }
      };
  }
}