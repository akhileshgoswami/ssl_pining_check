  * Create assets/certification folder put the "<fileName>.cer to convert <FileName>.pem"
  * just right click and reName ecxtension .cer to pem 
  * By Akhilesh Goswami
   check out this video
    https://youtu.be/7ZrpFIZ5J1Y

    add in pubspec.yaml
    add this line 
  assets:
    - assets/certification/<FileName>.pem

  *  Expamle 

  import 'package:http/http.dart' as http;

  http.Client client;

  @override
  void onInit() async {
    client = await SSLPining().getSSLPinningClient();

    super.onInit();
  }

Calling Api throw client
final http.Response response = await client.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization': 'Token ' +
                await prefs.getString(Constants.token, isEncrypted: true)
          },
          body: json.encode(data));
