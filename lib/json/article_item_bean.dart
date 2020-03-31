import 'archive_item_bean.dart';

class ArticleItemBean extends Comparable{
  ///文章标题
  String articleName;

  ///创建日期
  String createTime;

  ///修改日期
  String lastModifiedTime;

  ///标签
  String tag;

  ///摘要
  String summary;

  ///图片地址
  String imageAddress;

  ///文章地址
  String articleAddress;


  ArticleItemBean({
    this.articleName,
    this.createTime,
    this.lastModifiedTime,
    this.tag,
    this.summary,
    this.imageAddress,
    this.articleAddress,
  });

  static ArticleItemBean fromMap(Map<String, dynamic> map) {
    ArticleItemBean bean = new ArticleItemBean();
    bean.articleName = map['articleName'];
    bean.createTime = map['createTime'];
    bean.lastModifiedTime = map['lastModifiedTime'];
    bean.tag = map['tag'];
    bean.summary = map['summary'];
    bean.imageAddress = map['imageAddress'];
    bean.articleAddress = map['articleAddress'];
    return bean;
  }


  static List<ArticleItemBean> fromMapList(dynamic mapList) {
    List<ArticleItemBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

  static ArticleItemBean fromYearBean(YearBean bean){
    return ArticleItemBean(
      articleAddress: bean.articleAddress,
      articleName: bean.articleName,
      createTime: bean.createTime,
      lastModifiedTime: bean.lastModifiedTime,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'articleName': articleName ?? '',
      'createTime': createTime ?? '',
      'lastModifiedTime': lastModifiedTime ?? '',
      'tag': tag ?? '',
      'summary': summary ?? '',
      'imageAddress': imageAddress ?? '',
      'articleAddress': articleAddress ?? ''
    };
  }

  @override
  int compareTo(other) {
    return DateTime.parse(createTime).isAfter(DateTime.parse(other.createTime)) ? -1 : 1;
  }




}
