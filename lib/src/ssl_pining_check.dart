import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:http/io_client.dart';

class SSLPiningCheck {
  String certificateFilePath;
  SSLPiningCheck({required this.certificateFilePath});

  //assets/certification/client.pem
  Future<SecurityContext> get globalContext async {
    final ByteData sslCert;
    try {
      sslCert = await rootBundle.load(certificateFilePath);
    } catch (e) {
      throw Exception([
        '''Provide .pem file path  like this ->  
  assets:
    - assets/certification/<FileName>.pem '''
      ]);
    }

    SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
    securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
    return securityContext;
  }

  Future<http.Client> getSSLPiningClient() async {
    HttpClient client = HttpClient(context: await globalContext);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
    IOClient ioClient = IOClient(client);
    return ioClient;
  }
}
