import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wanandroid_flutter/model/articleEntity.dart';
import 'package:wanandroid_flutter/model/basePagedResponse.dart';
import 'package:wanandroid_flutter/service/httpServices.dart';
import 'package:wanandroid_flutter/utils/eventBus.dart';

/// 首页tab
class HomeArticles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeArticles();
  }
}

class _HomeArticles extends State<HomeArticles> {
  // 文章列表
  List<ArticleEntity> _datas = new List();
  // 页面当前页表索引
  int _index = 0;
  // 是否存在下一页
  bool hasMore = false;
  // 滚动控制
  ScrollController _scrollContro = new ScrollController();
  // 点击是否喜欢
  // key 为 文章id
  Map<int, bool> _star = Map();

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
    EventBus.getInstance().register(Events.webEvent, (arg) {print(arg);});
  }

  @override
  void dispose() {
    _scrollContro.dispose();
    EventBus.getInstance().unregister(Events.webEvent);
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
              onTap: () async {
                // 跳转到文章详情页
                // var result = await Navigator.push(context, new MaterialPageRoute(builder: (_){
                //   return new WebBrowser(
                //     url: article.link,
                //     title: article.title,
                //   );
                // }));

                // 命名路由跳转方式
                var result = await Navigator.pushNamed(
                    context,
                    "webBrowser",
                    arguments: {"title": article.title, "url" : article.link}
                );

                Fluttertoast.showToast(msg: result);
              },
            ),
          ),
          new GestureDetector(
            child: new Icon(
              (_star.containsKey(article.id) && _star[article.id]) ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onTap: (){
              setState(() {
                _star[article.id] = !(_star.containsKey(article.id) && _star[article.id]);
              });
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
        body: ListView.separated(
      itemCount: _datas.length,
      itemBuilder: (context, index) {
        return _buildListItemView(_datas[index]);
      },
      controller: _scrollContro,
      separatorBuilder: (context, index){
        return Divider(
          color: Colors.grey,
          height: 0.5,
          indent: 16,
          endIndent: 16,
        );
      },
    ));
  }
}
