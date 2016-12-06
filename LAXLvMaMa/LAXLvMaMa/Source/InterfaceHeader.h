//
//  InterfaceHeader.h
//  LAXLvMaMa
//
//  Created by 冰凉的枷锁 on 2016/10/11.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

#ifndef InterfaceHeader_h
#define InterfaceHeader_h

//城市列表
#define URL_STR_CITYLIST "http://api3g2.lvmama.com/api/router/rest.do?method=api.com.home.getStations&version=1.0.0&&format=json&&lvtukey=2c31d759bb2062d926e833b7ac4003ef"

//搜索
#define URL_STR_SEARCH "http://m.lvmama.com/bullet/index.php?s=/Api/getInfos&stationCode=SH&channelCode=SY&tagCodes=NSY_RMSS&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&lvsessionid=&firstChannel=IPHONE&secondChannel=APPSTORE&lvversion=7.7.2&osVersion=9.3.5&deviceName=iPhone6,2&netWorkType=46001&globalLatitude=&globalLongitude=&debug=false&format=json&clientTimestamp=1477395684&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD&lvtukey=b9774588a37e0491b7ae3e99c9e27b69"

//轮播图
#define URL_STR_MAIN_AUTOPLAY "http://m.lvmama.com/bullet/index.php?channelCode=NSY&format=json&s=/Api/getInfos&stationCode=SH&tagCodes=NSY_BANNER7"

////轮播图详情
#define URL_STR_MAIN_AUTOPLAY_DETAIL1 "http://api3g2.lvmama.com/api/router/rest.do?method=api.com.cmt.getCmtCommentList&version=1.0.0&productId=182910&placeIdType=PLACE&currentPage=1&pageSize=1&isELong=N&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&lvsessionid=&firstChannel=IPHONE&secondChannel=APPSTORE&lvversion=7.7.2&osVersion=9.3.5&deviceName=iPhone6,2&netWorkType=46001&globalLatitude=&globalLongitude=&debug=false&format=json&clientTimestamp=1477216069&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD&lvtukey=e2df66715f1cd9e70f7733a18a3afff5"
////详情网页
#define URL_STR_MAIN_AUTOPLAY_DETAIL2_HTML "http://zt1.lvmama.com/template4/index/1524?losc=111304&ict=1&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&lvsessionid=&firstChannel=IPHONE&secondChannel=APPSTORE&lvversion=7.7.2&osVersion=9.3.5&deviceName=iPhone6,2&netWorkType=46001&globalLatitude=&globalLongitude=&debug=false&format=json&clientTimestamp=1477205395&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD"
#define URL_STR_MAIN_AUTOPLAY_DETAIL3_HTML "http://m.lvmama.com/static/zt/4.0.0/1608/autumn/index.html?losc=111156&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&lvsessionid=&firstChannel=IPHONE&secondChannel=APPSTORE&lvversion=7.7.2&osVersion=9.3.5&deviceName=iPhone6,2&netWorkType=46001&globalLatitude=&globalLongitude=&debug=false&format=json&clientTimestamp=1477215898&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD"
#define URL_STR_MAIN_AUTOPLAY_DETAIL4_HTML "http://zt1.lvmama.com/template4/index/1686?losc=119538&ict=1&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&lvsessionid=&firstChannel=IPHONE&secondChannel=APPSTORE&lvversion=7.7.2&osVersion=9.3.5&deviceName=iPhone6,2&netWorkType=46001&globalLatitude=&globalLongitude=&debug=false&format=json&clientTimestamp=1477216113&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD"
#define URL_STR_MAIN_AUTOPLAY_DETAIL5_HTML "http://pic.lvmama.com/mobile/zhuanti/flightAutumn20160813/flightAutumn.html?losc=107977&ict=i&v=20160812&ztAppStatistics=1&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&lvsessionid=&firstChannel=IPHONE&secondChannel=APPSTORE&lvversion=7.7.2&osVersion=9.3.5&deviceName=iPhone6,2&netWorkType=46001&globalLatitude=&globalLongitude=&debug=false&format=json&clientTimestamp=1477216163&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD"
#define URL_STR_MAIN_AUTOPLAY_DETAIL6_HTML "http://m.lvmama.com/static/zt/4.0.0/1609/dianping10/index.html?udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&lvsessionid=&firstChannel=IPHONE&secondChannel=APPSTORE&lvversion=7.7.2&osVersion=9.3.5&deviceName=iPhone6,2&netWorkType=46001&globalLatitude=&globalLongitude=&debug=false&format=json&clientTimestamp=1477216191&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD"
#define URL_STR_MAIN_AUTOPLAY_DETAIL7_HTML "http://zt1.lvmama.com/template4/index/1690?udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&lvsessionid=&firstChannel=IPHONE&secondChannel=APPSTORE&lvversion=7.7.2&osVersion=9.3.5&deviceName=iPhone6,2&netWorkType=46001&globalLatitude=&globalLongitude=&debug=false&format=json&clientTimestamp=1477216226&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD"

// MARK: -

////景点门票详情
#define URL_STR_MAIN_COLLECTIONVIEWOne_DETAIL_1 "http://m.lvmama.com/bullet/index.php?debug=false&format=json&page=1&pageSize=%d&s=/AutoRecommended/autoRecommended&stationId=1&subType=TICKET&type=TICKET&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid"

//周边游详情
#define URL_STR_MAIN_COLLECTIONVIEWOne_DETAIL_2 "http://m.lvmama.com/bullet/index.php?s=/Api/getInfos&stationCode=SH&channelCode=ZBY&tagCodes=TOP_DEST,TOP_BRANDED_HOTEL&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&lvsessionid=&firstChannel=IPHONE&secondChannel=APPSTORE&lvversion=7.7.2&osVersion=9.3.5&deviceName=iPhone6,2&netWorkType=46001&globalLatitude=&globalLongitude=&debug=false&format=json&clientTimestamp=1477015303&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD&lvtukey=4b2535e954c271391d192b31e3c48132"

//国内游详情 轮播图
#define URL_STR_MAIN_COLLECTIONVIEWOne_DETAIL_4_AUTOPLAY "http://m.lvmama.com/bullet/index.php?s=/Api/getInfos&stationCode=SH&channelCode=GNY&tagCodes=XL_BANNER&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&lvsessionid=&firstChannel=IPHONE&secondChannel=APPSTORE&lvversion=7.7.2&osVersion=9.3.5&deviceName=iPhone6,2&netWorkType=46001&globalLatitude=&globalLongitude=&debug=false&format=json&clientTimestamp=1477223590&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD&lvtukey=481b80bdb5c8bf07564fc7bc3233b98f"

//国内游详情 人气热销
#define URL_STR_MAIN_COLLECTIONVIEWOne_DETAIL_4_HOTSALE "http://m.lvmama.com/bullet/index.php?s=/Api/getInfos&stationCode=SH&channelCode=GNY&tagCodes=RQRM&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&lvsessionid=&firstChannel=IPHONE&secondChannel=APPSTORE&lvversion=7.7.2&osVersion=9.3.5&deviceName=iPhone6,2&netWorkType=46001&globalLatitude=&globalLongitude=&debug=false&format=json&clientTimestamp=1477223590&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD&lvtukey=dd4a7f3f6641f7b6c4d47bef8e52edfc"

//国内游详情 表格内容
#define URL_STR_MAIN_COLLECTIONVIEWOne_DETAIL_4_TABLE "http://m.lvmama.com/bullet/index.php?s=/Api/getInfos&stationCode=SH&channelCode=GNY&tagCodes=JXGT,JXZZY&page=1&pageSize=6&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&lvsessionid=&firstChannel=IPHONE&secondChannel=APPSTORE&lvversion=7.7.2&osVersion=9.3.5&deviceName=iPhone6,2&netWorkType=46001&globalLatitude=&globalLongitude=&debug=false&format=json&clientTimestamp=1477223590&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD&lvtukey=f756ef6efe9b4035fbf18620a5589e92"

//出境游 轮播图
#define URL_STR_MAIN_COLLECTIONVIEWOne_DETAIL_5_AUTOPLAY "http://m.lvmama.com/bullet/index.php?s=/Api/getInfos&stationCode=SH&channelCode=CJY&tagCodes=CJY_BANNER&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&lvsessionid=&firstChannel=IPHONE&secondChannel=APPSTORE&lvversion=7.7.2&osVersion=9.3.5&deviceName=iPhone6,2&netWorkType=46001&globalLatitude=&globalLongitude=&debug=false&format=json&clientTimestamp=1477223914&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD&lvtukey=70a7d6e2140c32aa76ed46b4c17e1e61"

//出境游 collectionView内容
#define URL_STR_MAIN_COLLECTIONVIEWOne_DETAIL_5_MENU "http://m.lvmama.com/bullet/index.php?s=/Api/getInfos&stationCode=SH&channelCode=CJY&tagCodes=CJY_PD&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&lvsessionid=&firstChannel=IPHONE&secondChannel=APPSTORE&lvversion=7.7.2&osVersion=9.3.5&deviceName=iPhone6,2&netWorkType=46001&globalLatitude=&globalLongitude=&debug=false&format=json&clientTimestamp=1477223915&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD&lvtukey=4ddaf64e7a8efaaa638e1719f0ecd6f8"

//出境游 当季热门等
#define URL_STR_MAIN_COLLECTIONVIEWOne_DETAIL_5_HOT "http://m.lvmama.com/bullet/index.php?s=/Api/getInfos&stationCode=SH&channelCode=CJY&tagCodes=CJY_PDSS&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&lvsessionid=&firstChannel=IPHONE&secondChannel=APPSTORE&lvversion=7.7.2&osVersion=9.3.5&deviceName=iPhone6,2&netWorkType=46001&globalLatitude=&globalLongitude=&debug=false&format=json&clientTimestamp=1477223915&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD&lvtukey=3b06c0ee3e03c65139e741912f92d76b"

//出境游 精选自助游
#define URL_STR_MAIN_COLLECTIONVIEWOne_DETAIL_5_SELFSERVICE "http://m.lvmama.com/bullet/index.php?clientTimestamp=1477223915&debug=false&deviceName=iPhone6%2C2&firstChannel=IPHONE&format=json&globalLatitude=&globalLongitude=&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD&lvsessionid=&lvtukey=1718f7059927c687f1ab8e90497346a2&lvversion=7.7.2&netWorkType=46001&osVersion=9.3.5&page=1&pageSize=6&s=/AutoRecommended/autoRecommended&secondChannel=APPSTORE&stationId=9&subType=LOCAL&type=ABROAD&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid"

//出境游 精选跟团游
#define URL_STR_MAIN_COLLECTIONVIEWOne_DETAIL_5_FOLLOWGROUP "http://m.lvmama.com/bullet/index.php?clientTimestamp=1477223915&debug=false&deviceName=iPhone6%2C2&firstChannel=IPHONE&format=json&globalLatitude=&globalLongitude=&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD&lvsessionid=&lvtukey=a450da1eb8792e14dcbbc3ea9b9ab65b&lvversion=7.7.2&netWorkType=46001&osVersion=9.3.5&page=1&pageSize=6&s=/AutoRecommended/autoRecommended&secondChannel=APPSTORE&stationId=9&subType=GROUP&type=ABROAD&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid"

// MARK: -

//热门推荐 和 手机专享
#define URL_STR_MAIN_HOTANDPHONE "http://m.lvmama.com/bullet/index.php?channelCode=NSY&clientTimestamp=1476014372&debug=false&format=json&s=/Api/getInfos&stationCode=SH&tagCodes=RMTJ_BIG%2CRMTJ_SMALL%2CRMTJ_LIST%2CRMTJ_2L&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid"

//限时抢购
#define URL_STR_MAIN_LIMITTIME "http://api3g2.lvmama.com/api/router/rest.do?method=api.com.groupbuy.getIndexSeckillList&version=1.0.0&page=1&pageSize=10&stationName=%E4%B8%8A%E6%B5%B7&stationCode=SH&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&lvsessionid=&firstChannel=IPHONE&secondChannel=APPSTORE&lvversion=7.7.2&osVersion=9.3.5&deviceName=iPhone6,2&netWorkType=46001&globalLatitude=&globalLongitude=&debug=false&format=json&clientTimestamp=1476014613&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD&lvtukey=d561189b303be1eeecd54a6e02b443f6"
//"http://api3g2.lvmama.com/api/router/rest.do?method=api.com.groupbuy.getIndexSeckillList&version=1.0.0&page=1&pageSize=10&format=json&lvtukey=d561189b303be1eeecd54a6e02b443f6"

////限时抢购 详情
#define URL_STR_MAIN_LIMITTIME_DETAIL "http://api3g2.lvmama.com/api/router/rest.do?method=api.com.groupbuy.getGroupbuyOrSecKillDetail&version=2.0.0&productId=%@&suppGoodsId=%@&branchType=%@&fromPlaceId=79"

// MARK: -

//主页表格  分类
#define URL_STR_MAIN_TYPE "http://m.lvmama.com/bullet/index.php?channelCode=NSY&clientTimestamp=1476016794&debug=false&deviceName=iPhone6%2C2&firstChannel=IPHONE&format=json&globalLatitude=&globalLongitude=&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD&lvsessionid=&lvtukey=46e0bf78f7315ae8287ce58b082026f6&lvversion=7.7.2&netWorkType=46001&osVersion=9.3.5&s=/Api/getInfos&secondChannel=APPSTORE&stationCode=SH&tagCodes=NSY_JDMPFL%2CNSY_ZBYFL%2CNSY_GNYFL%2CNSY_CJYFL&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid"

//分类内容
#define URL_STR_MAIN_TABLE "http://m.lvmama.com/bullet/index.php?format=json&s=/Api/getInfos&stationCode=SH&page=1&pageSize=%d&channelCode=%@&tagCodes=%@"

/*
//主页景点门票 精选
#define URL_STR_MAIN_TABLE_1_1 "http://m.lvmama.com/bullet/index.php?channelCode=NSY&format=json&page=1&pageSize=%d&s=/Api/getInfos&stationCode=SH&tagCodes=NSY_JDMP"

//主页景点门票 博物展览
#define URL_STR_MAIN_TABLE_1_2 "http://m.lvmama.com/bullet/index.php?channelCode=NSYFL&format=json&page=1&pageSize=%d&s=/Api/getInfos&stationCode=SH&tagCodes=NSYFL_JDMP3"

//主页景点门票 动植物园
#define URL_STR_MAIN_TABLE_1_3 "http://m.lvmama.com/bullet/index.php?channelCode=NSYFL&format=json&page=1&pageSize=%d&s=/Api/getInfos&stationCode=SH&tagCodes=NSYFL_JDMP2"

//主页景点门票 主题乐园
#define URL_STR_MAIN_TABLE_1_4 "http://m.lvmama.com/bullet/index.php?channelCode=NSYFL&format=json&page=1&pageSize=%d&s=/Api/getInfos&stationCode=SH&tagCodes=NSYFL_JDMP1"

//主页周边游
#define URL_STR_MAIN_TABLE_2 "http://m.lvmama.com/bullet/index.php?channelCode=NSY&format=json&page=1&pageSize=%d&s=/Api/getInfos&stationCode=SH&tagCodes=NSY_ZBY"

"http://m.lvmama.com/bullet/index.php?channelCode=NSYFL&format=json&page=1&pageSize=10&s=/Api/getInfos&stationCode=SH&tagCodes=NSYFL_ZBY2"

//主页国内游
#define URL_STR_MAIN_TABLE_3 "http://m.lvmama.com/bullet/index.php?channelCode=NSY&format=json&page=1&pageSize=%d&s=/Api/getInfos&stationCode=SH&tagCodes=NSY_GNY"

//主页出境游
#define URL_STR_MAIN_TABLE_4 "http://m.lvmama.com/bullet/index.php?channelCode=NSY&format=json&page=1&pageSize=%d&s=/Api/getInfos&stationCode=SH&tagCodes=NSY_CJY"
*/

////主页表格  详情
#define URL_STR_MAIN_TABLE_1_1_DETAIL "http://api3g2.lvmama.com/api/router/rest.do?method=api.com.ticket.product.getDetails&version=1.0.0&productId=%@&udid=4c73e6ee-ac84-4df1-bcc8-fc987803caab-uuid&format=json&clientTimestamp=1477400928&lvidfa=42891FB7-06EE-42FA-82FC-22994B0041AD&lvtukey=1a3c1e619966190c2b5a8addd9831a8d"

// MARK: -

//周爆款
#define URL_STR_SPECIALSALE_ONE "http://api3g2.lvmama.com/api/router/rest.do?method=api.com.groupbuy.getWeekHotCollections&version=1.0.0&page=%d&pageSize=7&format=json&lvtukey=9b1c155851f9fc641b6e028dfd2e970b"

//限时抢
#define URL_STR_SPECIALSALE_TWO "http://api3g2.lvmama.com/api/router/rest.do?method=api.com.groupbuy.getWeekHotCollections&version=1.0.0&page=%d&pageSize=7&format=json&lvtukey=9b1c155851f9fc641b6e028dfd2e970b"

//清仓价
#define URL_STR_SPECIALSALE_THREE "http://api3g2.lvmama.com/api/router/rest.do?method=api.com.groupbuy.getGroupbuyListByProductMark&version=1.0.0&page=%d&pageSize=7&format=json&lvtukey=aa9c874fef3c7767c24c2f5daea675c1"

//详情与限时同

// MARK: -

//国外
#define URL_STR_DESTINATION_ONE "http://m.lvmama.com/bullet/index.php?s=/Api/getInfos&stationCode=SH&channelCode=MDD&tagCodes=MDD_GW&page=1&pageSize=%d&format=json&lvtukey=586a317af5df2e91152c94267e22b5b7"

//国内
#define URL_STR_DESTINATION_TWO "http://m.lvmama.com/bullet/index.php?s=/Api/getInfos&stationCode=SH&channelCode=MDD&tagCodes=MDD_GN&page=1&pageSize=%d&format=json&lvtukey=ca4df41a118cb84cb3265c55d4086795"

//主题
#define URL_STR_DESTINATION_THREE "http://m.lvmama.com/bullet/index.php?s=/Api/getInfos&stationCode=SH&channelCode=MDD&tagCodes=MDD_ZT&page=1&pageSize=%d&format=json&lvtukey=9af6fdef20097ac9584f6c225ebd77b8"

//详情网页
#define URL_STR_DESTINATION_DETAIL "http://m.lvmama.com/dest/"

#endif /* InterfaceHeader_h */
