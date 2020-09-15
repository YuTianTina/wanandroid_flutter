import 'package:wanandroid_flutter/model/pagedResponse.dart';

/// data : {"curPage":1,"datas":[],"offset":0,"over":false,"pageCount":460,"size":20,"total":9182}
/// errorCode : 0
/// errorMsg : ""

class BasePagedResponse<T> {
  PagedResponse<T> _data;
  int _errorCode;
  String _errorMsg;

  PagedResponse<T> get data => _data;
  int get errorCode => _errorCode;
  String get errorMsg => _errorMsg;

  BasePagedResponse({
    PagedResponse<T> data,
      int errorCode, 
      String errorMsg}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  factory BasePagedResponse.fromJson(dynamic json, Function dataFromJson){
    return new BasePagedResponse<T>(
        errorCode: json["errorCode"],
        errorMsg: json["errorMsg"],
        data : PagedResponse.fromJson(json["data"], dataFromJson)
    );
  }

}