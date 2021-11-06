const String backendUrl =
    "https://api.thai2d3d.com/api"; //"https://apinew.thai2d3d.com/api"; //"http://192.168.1.4:81/api"; //"https://api.thai2d3d.com/api" ;//"https://apinew.thai2d3d.com/api"; //"http://148.72.246.131:200/api"; //  //"https://app.thai2d3d.com/api";
//"https://apinew.thai2d3d.com/api";//"http://34.87.13.202/api";//"http://192.168.1.11:82/api";//"http://192.168.99.21/2D3D/api";//
//const String homeUrl ="http://www.myanmarpos.com";
//const String backendUrl ="http://mghl.yoyopon.com";
//const String backendUrl ="http://eapitrial.yoyopon.com";
//const String backendUrlWithoutHttp ="eapitrial.yoyopon.com";
//const String backendUrl ="http://192.168.1.108/EpissApi";
//const String backendUrlWithoutHttp ="eapi.yoyopon.com";
const String Token = "";
const String version = "1.2.1";

Future<Map<String, String>> getHeaders() async {
  //timezone
  try {
    var headers = <String, String>{
      "content-type": "application/json",
      "Access-Control-Allow-Origin": "*",
      'Access-Control-Allow-Credentials': 'true',
      "Access-Control-Allow-Methods": "GET, POST, PATCH, PUT, DELETE, OPTIONS",
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "apikey": "5b927b5a7f672",
      "app": "App",
      "version": version,
      "language": "en",
      // "Authorization": sysData.token == "" ? "" : "Bearer " + sysData.token,
    };
    return headers;
  } catch (ex) {
    var headers = <String, String>{
      "content-type": "application/json",
      "Access-Control-Allow-Origin": "*",
      'Access-Control-Allow-Credentials': 'true',
      "Access-Control-Allow-Methods": "GET, POST, PATCH, PUT, DELETE, OPTIONS",
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "apikey": "5b927b5a7f672",
      "app": "App",
      "version": version,
      "language": "my",
      "Authorization": "",
    };
    return headers;
  }
}

Future<Map<String, String>> getHeadersWithOutToken() async {
  //timezone
  try {
    var headers = <String, String>{
      "content-type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET, POST, PATCH, PUT, DELETE, OPTIONS",
      "Access-Control-Allow-Headers": "Origin, Content-Type, X-Auth-Token",
    };
    return headers;
  } catch (ex) {
    var headers = <String, String>{
      "content-type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET, POST, PATCH, PUT, DELETE, OPTIONS",
      "Access-Control-Allow-Headers": "Origin, Content-Type, X-Auth-Token",
    };
    return headers;
  }
}
