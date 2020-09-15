import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wanandroid_flutter/model/articleEntity.dart';
import 'package:wanandroid_flutter/model/basePagedResponse.dart';
import 'package:wanandroid_flutter/service/httpServices.dart';
import 'package:wanandroid_flutter/web/webBrowser.dart';

/**
 * 首页tab
 */
class HomeArticles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeArticles();
  }
}

class _HomeArticles extends State<HomeArticles> {
  List<ArticleEntity> _datas = new List();
  int _index = 0;
  bool hasMore = false;
  ScrollController _scrollContro = new ScrollController();
  @override
  void initState() {
    fetchArticles();
    _scrollContro.addListener(() {
      if (hasMore &&
          _scrollContro.position.pixels ==
              _scrollContro.position.maxScrollExtent) {
        fetchArticles();
      }
    });
  }

  @override
  void dispose() {
    _scrollContro.dispose();
    super.dispose();
  }

  /// 获取文章列表
  void fetchArticles() {
    get("/article/list/${_index}/json").then((value) {
      var data = json.decode(value.toString());
      var entity = BasePagedResponse<ArticleEntity>.fromJson(
          data, ArticleEntity.funFromJson);

      setState(() {
        _datas.addAll(entity.data.datas);
        _index++;
        hasMore = entity.data.pageCount > entity.data.curPage;
      });
    });
  }

  Widget _buildListItemView(ArticleEntity article) {
    return new Container(
      padding: EdgeInsets.all(8),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              child: new Column(
                children: <Widget>[
                  new Text(
                    article.title,
                    style: new TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  new Row(
                    children: <Widget>[
                      new Text(
                        "作者: ${article.author}",
                        textAlign: TextAlign.left,
                        style: new TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              onTap: (){
                // 跳转到文章详情页
                Navigator.push(context, new MaterialPageRoute(builder: (_){
                  return new WebBrowser(
                    url: article.link,
                    title: article.title,
                  );
                }));
              },
            ),
          ),
          new GestureDetector(
            child: new Icon(
              Icons.favorite_border,
            ),
            onTap: (){
              Fluttertoast.showToast(msg: "tap tap ${article.title}");
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: _datas.length,
      itemBuilder: (context, index) {
        return _buildListItemView(_datas[index]);
      },
      controller: _scrollContro,
    ));
  }
}
