
import 'package:dio/dio.dart';
/// 网络基础

/// @author yutiantian email: yutiantina@gmail.com
/// @since 2020/9/11 3:02 PM
class BaseHttp{
  Dio dio;

  static BaseHttp _instance;
  static _getInstance(){
    if(null == _instance){
      _instance = BaseHttp._();
    }
    return _instance;
  }

  // ignore: missing_return
  factory BaseHttp.getInstance(){
    return _getInstance();
  }
  // 内部构造函数
  BaseHttp._(){
    dio = new Dio();
    dio.options
      ..baseUrl = "https://www.wanandroid.com/"
      ..connectTimeout = 5 * 1000
      ..receiveTimeout = 3 * 1000
    ;
  }
}

class JsonTransform extends DefaultTransformer{

}

Future get(String url, {formData}) async {
  try{
    Response response;
    Dio dio = BaseHttp.getInstance().dio;
    response = await dio.get(
        url,
        queryParameters: formData
    );
    if(response.statusCode == 200){
      return response;
    }else{
      throw Exception("网络错误");
    }
  }on DioError catch(e){
    print(e.message);
  } on Exception catch(e){
    print(e);
  }
}