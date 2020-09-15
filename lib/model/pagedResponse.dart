import 'package:flutter/cupertino.dart';

/// 分页实体类
///
/// @since 2020/9/11 2:16 PM
class PagedResponse <T>{
  int _curPage;
  List<T> _datas;
  int _offset;
  bool _over;
  int _pageCount;
  int _size;
  int _total;

  int get curPage => _curPage;
  List<T> get datas => _datas;
  int get offset => _offset;
  bool get over => _over;
  int get pageCount => _pageCount;
  int get size => _size;
  int get total => _total;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  PagedResponse({
    @required int curPage,
    @required List<T> datas,
    @required int offset,
    @required bool over,
    @required int pageCount,
    @required int size,
    @required int total,
  })  : _curPage = curPage,
        _datas = datas,
        _offset = offset,
        _over = over,
        _pageCount = pageCount,
        _size = size,
        _total = total;

  PagedResponse copyWith({
    int curPage,
    List<T> datas,
    int offset,
    bool over,
    int pageCount,
    int size,
    int total,
  }) {
    return new PagedResponse(
      curPage: curPage ?? this._curPage,
      datas: datas ?? this._datas,
      offset: offset ?? this._offset,
      over: over ?? this._over,
      pageCount: pageCount ?? this._pageCount,
      size: size ?? this._size,
      total: total ?? this._total,
    );
  }

  @override
  String toString() {
    return 'PagedResponse{_curPage: $_curPage, _datas: $_datas, _offset: $_offset, _over: $_over, _pageCount: $_pageCount, _size: $_size, _total: $_total}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PagedResponse &&
          runtimeType == other.runtimeType &&
          _curPage == other._curPage &&
          _datas == other._datas &&
          _offset == other._offset &&
          _over == other._over &&
          _pageCount == other._pageCount &&
          _size == other._size &&
          _total == other._total);

  @override
  int get hashCode =>
      _curPage.hashCode ^
      _datas.hashCode ^
      _offset.hashCode ^
      _over.hashCode ^
      _pageCount.hashCode ^
      _size.hashCode ^
      _total.hashCode;

  factory PagedResponse.fromMap(Map<String, dynamic> map) {
    return new PagedResponse(
      curPage: map['_curPage'] as int,
      datas: map['_datas'] as List<T>,
      offset: map['_offset'] as int,
      over: map['_over'] as bool,
      pageCount: map['_pageCount'] as int,
      size: map['_size'] as int,
      total: map['_total'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      '_curPage': this._curPage,
      '_datas': this._datas,
      '_offset': this._offset,
      '_over': this._over,
      '_pageCount': this._pageCount,
      '_size': this._size,
      '_total': this._total,
    } as Map<String, dynamic>;
  }

  static PagedResponse<T> fromJson<T>(dynamic json, Function fromJson){
    final items = json["datas"].cast<Map<String, dynamic>>();
    return new PagedResponse<T>(
        curPage: json["curPage"],
        datas: new List<T>.from(items.map((e) => fromJson(e))),
        offset: json['offset'],
        over: json["over"],
        pageCount: json["pageCount"],
        size: json["size"],
        total: json["total"]
    );
  }

//</editor-fold>

}