.class public Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;
.super Ljava/lang/Object;
.source "IMSDK_Interface.java"

# interfaces
.implements Lcom/baidu/location/BDLocationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/androidim/api/IMSDK_Interface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BoyaaLocationListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;


# direct methods
.method public constructor <init>(Lcom/boyaa/androidim/api/IMSDK_Interface;)V
    .locals 0

    .prologue
    .line 257
    iput-object p1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceiveLocation(Lcom/baidu/location/BDLocation;)V
    .locals 8
    .param p1, "location"    # Lcom/baidu/location/BDLocation;

    .prologue
    const-wide/16 v6, 0x0

    .line 262
    new-instance v1, Ljava/lang/StringBuffer;

    const/16 v2, 0x100

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 264
    .local v1, "sb":Ljava/lang/StringBuffer;
    iget-object v2, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getLatitude()D

    move-result-wide v3

    iput-wide v3, v2, Lcom/boyaa/androidim/api/IMSDK_Interface;->dLatitude:D

    .line 265
    iget-object v2, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getLongitude()D

    move-result-wide v3

    iput-wide v3, v2, Lcom/boyaa/androidim/api/IMSDK_Interface;->dLontitude:D

    .line 268
    iget-object v2, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    iget-wide v2, v2, Lcom/boyaa/androidim/api/IMSDK_Interface;->dLatitude:D

    iget-object v4, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    iget-wide v4, v4, Lcom/boyaa/androidim/api/IMSDK_Interface;->dLontitude:D

    invoke-static {v2, v3, v4, v5}, Lcom/boyaa/androidim/utils/PositionUtil;->gcj_To_Gps84(DD)Lcom/boyaa/androidim/utils/Gps;

    move-result-object v0

    .line 270
    .local v0, "m_gps":Lcom/boyaa/androidim/utils/Gps;
    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    iget-wide v2, v2, Lcom/boyaa/androidim/api/IMSDK_Interface;->dLatitude:D

    cmpl-double v2, v2, v6

    if-lez v2, :cond_0

    iget-object v2, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    iget-wide v2, v2, Lcom/boyaa/androidim/api/IMSDK_Interface;->dLontitude:D

    cmpl-double v2, v2, v6

    if-lez v2, :cond_0

    .line 272
    iget-object v2, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/boyaa/androidim/utils/Gps;->getWgLat()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/boyaa/androidim/utils/Gps;->getWgLon()D

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/boyaa/androidim/api/IMSDK_Interface;->locationValue:Ljava/lang/String;

    .line 273
    iget-object v2, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    iget-object v3, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    iget-object v3, v3, Lcom/boyaa/androidim/api/IMSDK_Interface;->locationValue:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/boyaa/androidim/api/IMSDK_Interface;->saveUserLocation(Ljava/lang/String;)V

    .line 282
    :cond_0
    const-string v2, "\n gps 84:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 283
    iget-object v2, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$BoyaaLocationListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    iget-object v2, v2, Lcom/boyaa/androidim/api/IMSDK_Interface;->locationValue:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 285
    const-string v2, "time : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 286
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getTime()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 287
    const-string v2, "\nerror code : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 288
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getLocType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 289
    const-string v2, "\nlatitude : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 290
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getLatitude()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuffer;->append(D)Ljava/lang/StringBuffer;

    .line 291
    const-string v2, "\nlontitude : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 292
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getLongitude()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuffer;->append(D)Ljava/lang/StringBuffer;

    .line 293
    const-string v2, "\nradius : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 294
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getRadius()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(F)Ljava/lang/StringBuffer;

    .line 295
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getLocType()I

    move-result v2

    const/16 v3, 0x3d

    if-ne v2, v3, :cond_2

    .line 296
    const-string v2, "\nspeed : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 297
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getSpeed()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(F)Ljava/lang/StringBuffer;

    .line 298
    const-string v2, "\nsatellite : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 299
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getSatelliteNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 300
    const-string v2, "\nheight : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 301
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getAltitude()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuffer;->append(D)Ljava/lang/StringBuffer;

    .line 302
    const-string v2, "\ndirection : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 303
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getDirection()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(F)Ljava/lang/StringBuffer;

    .line 304
    const-string v2, "\naddr : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 305
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getAddrStr()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 306
    const-string v2, "\ndescribe : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 307
    const-string v2, "gps\u5b9a\u4f4d\u6210\u529f"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 331
    :cond_1
    :goto_0
    const-string v2, "BaiduLocationApiDem"

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    return-void

    .line 309
    :cond_2
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getLocType()I

    move-result v2

    const/16 v3, 0xa1

    if-ne v2, v3, :cond_3

    .line 310
    const-string v2, "\naddr : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 311
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getAddrStr()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 313
    const-string v2, "\noperationers : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 314
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getOperators()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 315
    const-string v2, "\ndescribe : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 316
    const-string v2, "\u7f51\u7edc\u5b9a\u4f4d\u6210\u529f"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 317
    :cond_3
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getLocType()I

    move-result v2

    const/16 v3, 0x42

    if-ne v2, v3, :cond_4

    .line 318
    const-string v2, "\ndescribe : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 319
    const-string v2, "\u79bb\u7ebf\u5b9a\u4f4d\u6210\u529f\uff0c\u79bb\u7ebf\u5b9a\u4f4d\u7ed3\u679c\u4e5f\u662f\u6709\u6548\u7684"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 320
    :cond_4
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getLocType()I

    move-result v2

    const/16 v3, 0xa7

    if-ne v2, v3, :cond_5

    .line 321
    const-string v2, "\ndescribe : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 322
    const-string v2, "\u670d\u52a1\u7aef\u7f51\u7edc\u5b9a\u4f4d\u5931\u8d25\uff0c\u53ef\u4ee5\u53cd\u9988IMEI\u53f7\u548c\u5927\u4f53\u5b9a\u4f4d\u65f6\u95f4\u5230loc-bugs@baidu.com\uff0c\u4f1a\u6709\u4eba\u8ffd\u67e5\u539f\u56e0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 323
    :cond_5
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getLocType()I

    move-result v2

    const/16 v3, 0x3f

    if-ne v2, v3, :cond_6

    .line 324
    const-string v2, "\ndescribe : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 325
    const-string v2, "\u7f51\u7edc\u4e0d\u540c\u5bfc\u81f4\u5b9a\u4f4d\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u662f\u5426\u901a\u7545"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 326
    :cond_6
    invoke-virtual {p1}, Lcom/baidu/location/BDLocation;->getLocType()I

    move-result v2

    const/16 v3, 0x3e

    if-ne v2, v3, :cond_1

    .line 327
    const-string v2, "\ndescribe : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 328
    const-string v2, "\u65e0\u6cd5\u83b7\u53d6\u6709\u6548\u5b9a\u4f4d\u4f9d\u636e\u5bfc\u81f4\u5b9a\u4f4d\u5931\u8d25\uff0c\u4e00\u822c\u662f\u7531\u4e8e\u624b\u673a\u7684\u539f\u56e0\uff0c\u5904\u4e8e\u98de\u884c\u6a21\u5f0f\u4e0b\u4e00\u822c\u4f1a\u9020\u6210\u8fd9\u79cd\u7ed3\u679c\uff0c\u53ef\u4ee5\u8bd5\u7740\u91cd\u542f\u624b\u673a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0
.end method
