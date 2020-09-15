
/// 基础实体类
class BaseResponse<T>{
  int errorCode;
  String errorMsg;
  T data;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  BaseResponse({
    this.errorCode,
    this.errorMsg,
    this.data,
  });

  BaseResponse copyWith({
    int errorCode,
    String errorMsg,
    T data,
  }) {
    return new BaseResponse(
      errorCode: errorCode ?? this.errorCode,
      errorMsg: errorMsg ?? this.errorMsg,
      data: data ?? this.data,
    );
  }



  @override
  String toString() {
    return 'BaseResponse{errorCode: $errorCode, errorMsg: $errorMsg, data: $data}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BaseResponse &&
          runtimeType == other.runtimeType &&
          errorCode == other.errorCode &&
          errorMsg == other.errorMsg &&
          data == other.data);

  @override
  int get hashCode => errorCode.hashCode ^ errorMsg.hashCode ^ data.hashCode;

  factory BaseResponse.fromJson(dynamic json, Function dataFromJson){
    return new BaseResponse<T>(
      errorCode: json["errorCode"],
      errorMsg: json["errorMsg"],
      data : dataFromJson(json["data"])
    );
  }
//</editor-fold>

}