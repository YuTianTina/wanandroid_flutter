
import 'dart:convert';

/// apkLink : ""
/// audit : 1
/// author : "鸿洋"
/// canEdit : false
/// chapterId : 408
/// chapterName : "鸿洋"
/// collect : false
/// courseId : 13
/// desc : ""
/// descMd : ""
/// envelopePic : ""
/// fresh : false
/// id : 15193
/// link : "https://mp.weixin.qq.com/s/Ylc5mPwMzWoK2CIthZy0Vw"
/// niceDate : "1天前"
/// niceShareDate : "17小时前"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1599667200000
/// realSuperChapterId : 407
/// selfVisible : 0
/// shareDate : 1599742119000
/// shareUser : ""
/// superChapterId : 408
/// superChapterName : "公众号"
/// tags : [{"name":"公众号","url":"/wxarticle/list/408/1"}]
/// title : "Android 同步屏障？阻塞唤醒？ Handler 中隐藏的秘密"
/// type : 0
/// userId : -1
/// visible : 1
/// zan : 0

class ArticleEntity {
  String _apkLink;
  int _audit;
  String _author;
  bool _canEdit;
  int _chapterId;
  String _chapterName;
  bool _collect;
  int _courseId;
  String _desc;
  String _descMd;
  String _envelopePic;
  bool _fresh;
  int _id;
  String _link;
  String _niceDate;
  String _niceShareDate;
  String _origin;
  String _prefix;
  String _projectLink;
  int _publishTime;
  int _realSuperChapterId;
  int _selfVisible;
  int _shareDate;
  String _shareUser;
  int _superChapterId;
  String _superChapterName;
  List<Tags> _tags;
  String _title;
  int _type;
  int _userId;
  int _visible;
  int _zan;

  String get apkLink => _apkLink;
  int get audit => _audit;
  String get author => _author;
  bool get canEdit => _canEdit;
  int get chapterId => _chapterId;
  String get chapterName => _chapterName;
  bool get collect => _collect;
  int get courseId => _courseId;
  String get desc => _desc;
  String get descMd => _descMd;
  String get envelopePic => _envelopePic;
  bool get fresh => _fresh;
  int get id => _id;
  String get link => _link;
  String get niceDate => _niceDate;
  String get niceShareDate => _niceShareDate;
  String get origin => _origin;
  String get prefix => _prefix;
  String get projectLink => _projectLink;
  int get publishTime => _publishTime;
  int get realSuperChapterId => _realSuperChapterId;
  int get selfVisible => _selfVisible;
  int get shareDate => _shareDate;
  String get shareUser => _shareUser;
  int get superChapterId => _superChapterId;
  String get superChapterName => _superChapterName;
  List<Tags> get tags => _tags;
  String get title => _title;
  int get type => _type;
  int get userId => _userId;
  int get visible => _visible;
  int get zan => _zan;

  ArticleEntity({
      String apkLink, 
      int audit, 
      String author, 
      bool canEdit, 
      int chapterId, 
      String chapterName, 
      bool collect, 
      int courseId, 
      String desc, 
      String descMd, 
      String envelopePic, 
      bool fresh, 
      int id, 
      String link, 
      String niceDate, 
      String niceShareDate, 
      String origin, 
      String prefix, 
      String projectLink, 
      int publishTime, 
      int realSuperChapterId, 
      int selfVisible, 
      int shareDate, 
      String shareUser, 
      int superChapterId, 
      String superChapterName, 
      List<Tags> tags, 
      String title, 
      int type, 
      int userId, 
      int visible, 
      int zan}){
    _apkLink = apkLink;
    _audit = audit;
    _author = author;
    _canEdit = canEdit;
    _chapterId = chapterId;
    _chapterName = chapterName;
    _collect = collect;
    _courseId = courseId;
    _desc = desc;
    _descMd = descMd;
    _envelopePic = envelopePic;
    _fresh = fresh;
    _id = id;
    _link = link;
    _niceDate = niceDate;
    _niceShareDate = niceShareDate;
    _origin = origin;
    _prefix = prefix;
    _projectLink = projectLink;
    _publishTime = publishTime;
    _realSuperChapterId = realSuperChapterId;
    _selfVisible = selfVisible;
    _shareDate = shareDate;
    _shareUser = shareUser;
    _superChapterId = superChapterId;
    _superChapterName = superChapterName;
    _tags = tags;
    _title = title;
    _type = type;
    _userId = userId;
    _visible = visible;
    _zan = zan;
}

  factory ArticleEntity.fromMap(Map<String, dynamic> map) {
    return new ArticleEntity(
      apkLink: map['_apkLink'] as String,
      audit: map['_audit'] as int,
      author: map['_author'] as String,
      canEdit: map['_canEdit'] as bool,
      chapterId: map['_chapterId'] as int,
      chapterName: map['_chapterName'] as String,
      collect: map['_collect'] as bool,
      courseId: map['_courseId'] as int,
      desc: map['_desc'] as String,
      descMd: map['_descMd'] as String,
      envelopePic: map['_envelopePic'] as String,
      fresh: map['_fresh'] as bool,
      id: map['_id'] as int,
      link: map['_link'] as String,
      niceDate: map['_niceDate'] as String,
      niceShareDate: map['_niceShareDate'] as String,
      origin: map['_origin'] as String,
      prefix: map['_prefix'] as String,
      projectLink: map['_projectLink'] as String,
      publishTime: map['_publishTime'] as int,
      realSuperChapterId: map['_realSuperChapterId'] as int,
      selfVisible: map['_selfVisible'] as int,
      shareDate: map['_shareDate'] as int,
      shareUser: map['_shareUser'] as String,
      superChapterId: map['_superChapterId'] as int,
      superChapterName: map['_superChapterName'] as String,
      tags: map['_tags'] as List<Tags>,
      title: map['_title'] as String,
      type: map['_type'] as int,
      userId: map['_userId'] as int,
      visible: map['_visible'] as int,
      zan: map['_zan'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      '_apkLink': this._apkLink,
      '_audit': this._audit,
      '_author': this._author,
      '_canEdit': this._canEdit,
      '_chapterId': this._chapterId,
      '_chapterName': this._chapterName,
      '_collect': this._collect,
      '_courseId': this._courseId,
      '_desc': this._desc,
      '_descMd': this._descMd,
      '_envelopePic': this._envelopePic,
      '_fresh': this._fresh,
      '_id': this._id,
      '_link': this._link,
      '_niceDate': this._niceDate,
      '_niceShareDate': this._niceShareDate,
      '_origin': this._origin,
      '_prefix': this._prefix,
      '_projectLink': this._projectLink,
      '_publishTime': this._publishTime,
      '_realSuperChapterId': this._realSuperChapterId,
      '_selfVisible': this._selfVisible,
      '_shareDate': this._shareDate,
      '_shareUser': this._shareUser,
      '_superChapterId': this._superChapterId,
      '_superChapterName': this._superChapterName,
      '_tags': this._tags,
      '_title': this._title,
      '_type': this._type,
      '_userId': this._userId,
      '_visible': this._visible,
      '_zan': this._zan,
    } as Map<String, dynamic>;
  }

  ArticleEntity.fromJson(dynamic json) {
    _apkLink = json["apkLink"];
    _audit = json["audit"];
    _author = json["author"];
    _canEdit = json["canEdit"];
    _chapterId = json["chapterId"];
    _chapterName = json["chapterName"];
    _collect = json["collect"];
    _courseId = json["courseId"];
    _desc = json["desc"];
    _descMd = json["descMd"];
    _envelopePic = json["envelopePic"];
    _fresh = json["fresh"];
    _id = json["id"];
    _link = json["link"];
    _niceDate = json["niceDate"];
    _niceShareDate = json["niceShareDate"];
    _origin = json["origin"];
    _prefix = json["prefix"];
    _projectLink = json["projectLink"];
    _publishTime = json["publishTime"];
    _realSuperChapterId = json["realSuperChapterId"];
    _selfVisible = json["selfVisible"];
    _shareDate = json["shareDate"];
    _shareUser = json["shareUser"];
    _superChapterId = json["superChapterId"];
    _superChapterName = json["superChapterName"];
    if (json["tags"] != null) {
      _tags = [];
      json["tags"].forEach((v) {
        _tags.add(Tags.fromJson(v));
      });
    }
    _title = json["title"];
    _type = json["type"];
    _userId = json["userId"];
    _visible = json["visible"];
    _zan = json["zan"];
  }

  static ArticleEntity funFromJson(dynamic json){
    return ArticleEntity.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["apkLink"] = _apkLink;
    map["audit"] = _audit;
    map["author"] = _author;
    map["canEdit"] = _canEdit;
    map["chapterId"] = _chapterId;
    map["chapterName"] = _chapterName;
    map["collect"] = _collect;
    map["courseId"] = _courseId;
    map["desc"] = _desc;
    map["descMd"] = _descMd;
    map["envelopePic"] = _envelopePic;
    map["fresh"] = _fresh;
    map["id"] = _id;
    map["link"] = _link;
    map["niceDate"] = _niceDate;
    map["niceShareDate"] = _niceShareDate;
    map["origin"] = _origin;
    map["prefix"] = _prefix;
    map["projectLink"] = _projectLink;
    map["publishTime"] = _publishTime;
    map["realSuperChapterId"] = _realSuperChapterId;
    map["selfVisible"] = _selfVisible;
    map["shareDate"] = _shareDate;
    map["shareUser"] = _shareUser;
    map["superChapterId"] = _superChapterId;
    map["superChapterName"] = _superChapterName;
    if (_tags != null) {
      map["tags"] = _tags.map((v) => v.toJson()).toList();
    }
    map["title"] = _title;
    map["type"] = _type;
    map["userId"] = _userId;
    map["visible"] = _visible;
    map["zan"] = _zan;
    return map;
  }

}

/// name : "公众号"
/// url : "/wxarticle/list/408/1"

class Tags {
  String _name;
  String _url;

  String get name => _name;
  String get url => _url;

  Tags({
      String name, 
      String url}){
    _name = name;
    _url = url;
}

  Tags.fromJson(dynamic json) {
    _name = json["name"];
    _url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["url"] = _url;
    return map;
  }

}