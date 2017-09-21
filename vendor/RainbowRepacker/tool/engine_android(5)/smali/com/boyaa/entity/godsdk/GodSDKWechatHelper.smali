.class public Lcom/boyaa/entity/godsdk/GodSDKWechatHelper;
.super Ljava/lang/Object;
.source "GodSDKWechatHelper.java"


# static fields
.field public static final PMODE:Ljava/lang/String; = "431"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isSupportSendToFriendsCirCle()Z
    .locals 7

    .prologue
    .line 75
    const/4 v1, 0x0

    .line 77
    .local v1, "result":Z
    :try_start_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getInstance()Lcom/boyaa/godsdk/core/GodSDKIAP;

    move-result-object v2

    const-string v3, "431"

    const-string v4, "isSupportSendToFriendsCircle"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/boyaa/godsdk/core/GodSDKIAP;->callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 82
    :goto_0
    return v1

    .line 78
    :catch_0
    move-exception v0

    .line 79
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isSupportSendToFriendsCirCleForLua()V
    .locals 8

    .prologue
    .line 86
    const/4 v2, 0x0

    .line 88
    .local v2, "result":Z
    :try_start_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getInstance()Lcom/boyaa/godsdk/core/GodSDKIAP;

    move-result-object v3

    const-string v4, "431"

    const-string v5, "isSupportSendToFriendsCircle"

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/boyaa/godsdk/core/GodSDKIAP;->callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 92
    :goto_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 93
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    const-string v4, "flag"

    if-eqz v2, :cond_0

    const/4 v3, 0x1

    :goto_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v3

    const-string v4, "weixinCheckSupportSendToFriendsCirCleForLua"

    new-instance v5, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v5, v1}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v5}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    return-void

    .line 89
    .end local v1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    :catch_0
    move-exception v0

    .line 90
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0

    .line 93
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    :cond_0
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public static isSupportWeixin()Z
    .locals 7

    .prologue
    .line 40
    const/4 v1, 0x1

    .line 46
    .local v1, "isSuppotr":Z
    :try_start_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    const-string v3, "com.boyaa.godsdk.core.Wechat"

    const-string v4, "isWXAppInstalled"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/boyaa/godsdk/core/GodSDK;->callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 52
    .end local v1    # "isSuppotr":Z
    :goto_0
    return v1

    .line 47
    .restart local v1    # "isSuppotr":Z
    :catch_0
    move-exception v0

    .line 48
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isWXAppSupportPayment()Z
    .locals 7

    .prologue
    .line 57
    :try_start_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getInstance()Lcom/boyaa/godsdk/core/GodSDKIAP;

    move-result-object v2

    const-string v3, "431"

    const-string v4, "isWXAppSupportPayment"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/boyaa/godsdk/core/GodSDKIAP;->callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 60
    :goto_0
    return v1

    .line 59
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isWXAppSupportPaymentForLua()V
    .locals 7

    .prologue
    .line 66
    :try_start_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getInstance()Lcom/boyaa/godsdk/core/GodSDKIAP;

    move-result-object v2

    const-string v3, "431"

    const-string v4, "isWXAppSupportPayment"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/boyaa/godsdk/core/GodSDKIAP;->callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 67
    .local v0, "isPaySupported":Z
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 68
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    const-string v3, "flag"

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v2

    const-string v3, "isWXAppSupportPaymentForLua"

    new-instance v4, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v4, v1}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v4}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .end local v1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    :goto_1
    return-void

    .line 68
    .restart local v1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 70
    .end local v1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    :catch_0
    move-exception v2

    goto :goto_1
.end method

.method public static onOpenWeiXinResult(Z)V
    .locals 6
    .param p0, "isSuccess"    # Z

    .prologue
    const/4 v2, 0x0

    .line 129
    if-nez p0, :cond_0

    .line 130
    invoke-static {}, Lcom/boyaa/widget/BoyaaToast;->getInstance()Lcom/boyaa/widget/BoyaaToast;

    move-result-object v3

    sget-object v4, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-string v5, "\u4f60\u8fd8\u672a\u5b89\u88c5\u5fae\u4fe1"

    invoke-virtual {v3, v4, v5, v2}, Lcom/boyaa/widget/BoyaaToast;->show(Landroid/content/Context;Ljava/lang/String;I)V

    .line 133
    :cond_0
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    .line 134
    .local v1, "msg":Landroid/os/Message;
    const/16 v3, 0x4ba

    iput v3, v1, Landroid/os/Message;->what:I

    .line 135
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 136
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v3, "openShareChannel"

    const-string v4, "weixin"

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    const-string v3, "resultCode"

    if-eqz p0, :cond_1

    const/4 v2, 0x1

    :cond_1
    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 138
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 140
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 141
    return-void
.end method

.method public static openWeiXin()V
    .locals 16

    .prologue
    const/4 v15, 0x0

    .line 99
    :try_start_0
    const-string v8, "com.tencent.mm"

    .line 100
    .local v8, "packageName":Ljava/lang/String;
    sget-object v13, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v13}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    .line 101
    .local v7, "pManager":Landroid/content/pm/PackageManager;
    const/4 v13, 0x0

    invoke-virtual {v7, v13}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v9

    .line 102
    .local v9, "packages":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/content/pm/PackageInfo;>;"
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_0

    .line 106
    const/4 v13, 0x0

    invoke-virtual {v7, v8, v13}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v10

    .line 107
    .local v10, "pi":Landroid/content/pm/PackageInfo;
    new-instance v11, Landroid/content/Intent;

    const-string v13, "android.intent.action.MAIN"

    const/4 v14, 0x0

    invoke-direct {v11, v13, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 108
    .local v11, "resolveIntent":Landroid/content/Intent;
    iget-object v13, v10, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v11, v13}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 109
    const/4 v13, 0x0

    invoke-virtual {v7, v11, v13}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 110
    .local v0, "apps":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/content/pm/ResolveInfo;

    .line 111
    .local v12, "ri":Landroid/content/pm/ResolveInfo;
    if-eqz v12, :cond_1

    .line 112
    iget-object v13, v12, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v8, v13, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 113
    iget-object v13, v12, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v13, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    .line 114
    .local v1, "className":Ljava/lang/String;
    new-instance v4, Landroid/content/Intent;

    const-string v13, "android.intent.action.MAIN"

    invoke-direct {v4, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 115
    .local v4, "intent":Landroid/content/Intent;
    const/high16 v13, 0x10000000

    invoke-virtual {v4, v13}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 116
    new-instance v2, Landroid/content/ComponentName;

    invoke-direct {v2, v8, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .local v2, "cn":Landroid/content/ComponentName;
    invoke-virtual {v4, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 118
    sget-object v13, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const/16 v14, 0x1005

    invoke-virtual {v13, v4, v14}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 126
    .end local v0    # "apps":Ljava/util/List;
    .end local v1    # "className":Ljava/lang/String;
    .end local v2    # "cn":Landroid/content/ComponentName;
    .end local v4    # "intent":Landroid/content/Intent;
    .end local v6    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/content/pm/PackageInfo;>;"
    .end local v7    # "pManager":Landroid/content/pm/PackageManager;
    .end local v9    # "packages":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    .end local v10    # "pi":Landroid/content/pm/PackageInfo;
    .end local v11    # "resolveIntent":Landroid/content/Intent;
    .end local v12    # "ri":Landroid/content/pm/ResolveInfo;
    :goto_1
    return-void

    .line 103
    .restart local v6    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/content/pm/PackageInfo;>;"
    .restart local v7    # "pManager":Landroid/content/pm/PackageManager;
    .restart local v9    # "packages":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/PackageInfo;

    .line 104
    .local v5, "item":Landroid/content/pm/PackageInfo;
    const-string v13, "package = "

    iget-object v14, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {v13, v14}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 123
    .end local v5    # "item":Landroid/content/pm/PackageInfo;
    .end local v6    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/content/pm/PackageInfo;>;"
    .end local v7    # "pManager":Landroid/content/pm/PackageManager;
    .end local v9    # "packages":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    :catch_0
    move-exception v3

    .line 124
    .local v3, "e":Ljava/lang/Exception;
    invoke-static {v15}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper;->onOpenWeiXinResult(Z)V

    goto :goto_1

    .line 120
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v0    # "apps":Ljava/util/List;
    .restart local v6    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/content/pm/PackageInfo;>;"
    .restart local v7    # "pManager":Landroid/content/pm/PackageManager;
    .restart local v9    # "packages":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    .restart local v10    # "pi":Landroid/content/pm/PackageInfo;
    .restart local v11    # "resolveIntent":Landroid/content/Intent;
    .restart local v12    # "ri":Landroid/content/pm/ResolveInfo;
    :cond_1
    const/4 v13, 0x0

    :try_start_1
    invoke-static {v13}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper;->onOpenWeiXinResult(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public static weixinMergeAndSendImage()V
    .locals 29

    .prologue
    .line 230
    :try_start_0
    new-instance v19, Lorg/json/JSONObject;

    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v26

    const-string v27, "weixinMergeAndSendImage"

    invoke-virtual/range {v26 .. v27}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 231
    .local v19, "jsonObject":Lorg/json/JSONObject;
    const-string v26, "imageBgPath"

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 232
    .local v13, "imageBgPath":Ljava/lang/String;
    const-string v26, "tilesets"

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v22

    .line 233
    .local v22, "tilesets":Lorg/json/JSONArray;
    const-string v26, "isSendToFriendsCircle"

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v15

    .line 235
    .local v15, "isSendToFriendsCircle":Z
    invoke-static {v13}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 236
    .local v4, "bgBmp":Landroid/graphics/Bitmap;
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v23

    .line 237
    .local v23, "width":I
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    .line 239
    .local v11, "height":I
    sget-object v26, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move/from16 v0, v23

    move-object/from16 v1, v26

    invoke-static {v0, v11, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 240
    .local v5, "bmp":Landroid/graphics/Bitmap;
    new-instance v6, Landroid/graphics/Canvas;

    invoke-direct {v6, v5}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 241
    .local v6, "canvas":Landroid/graphics/Canvas;
    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    move/from16 v0, v26

    move/from16 v1, v27

    move-object/from16 v2, v28

    invoke-virtual {v6, v4, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 243
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_0
    invoke-virtual/range {v22 .. v22}, Lorg/json/JSONArray;->length()I

    move-result v26

    move/from16 v0, v26

    if-lt v12, v0, :cond_0

    .line 262
    const/16 v26, 0x1f

    move/from16 v0, v26

    invoke-virtual {v6, v0}, Landroid/graphics/Canvas;->save(I)I

    .line 263
    invoke-virtual {v6}, Landroid/graphics/Canvas;->restore()V

    .line 265
    const-string v26, "weixinMergeAndSendImage.png"

    move-object/from16 v0, v26

    invoke-static {v5, v0}, Lcom/boyaa/util/ScreenShotUtil;->saveBitmapAsFile(Landroid/graphics/Bitmap;Ljava/lang/String;)Ljava/io/File;

    move-result-object v10

    .line 267
    .local v10, "file":Ljava/io/File;
    new-instance v18, Lorg/json/JSONObject;

    invoke-direct/range {v18 .. v18}, Lorg/json/JSONObject;-><init>()V

    .line 268
    .local v18, "json":Lorg/json/JSONObject;
    const-string v26, "type"

    const/16 v27, 0x2

    move-object/from16 v0, v18

    move-object/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 269
    const-string v26, "imgUrl"

    invoke-virtual {v10}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v27

    move-object/from16 v0, v18

    move-object/from16 v1, v26

    move-object/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 270
    const-string v26, "openId"

    const-string v27, ""

    move-object/from16 v0, v18

    move-object/from16 v1, v26

    move-object/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 271
    const-string v26, "circleOfFriends"

    move-object/from16 v0, v18

    move-object/from16 v1, v26

    invoke-virtual {v0, v1, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 272
    invoke-virtual/range {v18 .. v18}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v20

    .line 274
    .local v20, "jsonStr":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v26

    new-instance v27, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper$4;

    move-object/from16 v0, v27

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper$4;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v26 .. v27}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 288
    .end local v4    # "bgBmp":Landroid/graphics/Bitmap;
    .end local v5    # "bmp":Landroid/graphics/Bitmap;
    .end local v6    # "canvas":Landroid/graphics/Canvas;
    .end local v10    # "file":Ljava/io/File;
    .end local v11    # "height":I
    .end local v12    # "i":I
    .end local v13    # "imageBgPath":Ljava/lang/String;
    .end local v15    # "isSendToFriendsCircle":Z
    .end local v18    # "json":Lorg/json/JSONObject;
    .end local v20    # "jsonStr":Ljava/lang/String;
    .end local v22    # "tilesets":Lorg/json/JSONArray;
    .end local v23    # "width":I
    :goto_1
    return-void

    .line 244
    .restart local v4    # "bgBmp":Landroid/graphics/Bitmap;
    .restart local v5    # "bmp":Landroid/graphics/Bitmap;
    .restart local v6    # "canvas":Landroid/graphics/Canvas;
    .restart local v11    # "height":I
    .restart local v12    # "i":I
    .restart local v13    # "imageBgPath":Ljava/lang/String;
    .restart local v15    # "isSendToFriendsCircle":Z
    .restart local v22    # "tilesets":Lorg/json/JSONArray;
    .restart local v23    # "width":I
    :cond_0
    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v17

    .line 245
    .local v17, "itemJson":Lorg/json/JSONObject;
    const-string v26, "x"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v24

    .line 246
    .local v24, "x":I
    const-string v26, "y"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v25

    .line 247
    .local v25, "y":I
    const-string v26, "width"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    .line 248
    .local v8, "displayWidth":I
    const-string v26, "height"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    .line 250
    .local v7, "displayHeight":I
    const-string v26, "imagePath"

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 251
    .local v14, "imagePath":Ljava/lang/String;
    invoke-static {v14}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v16

    .line 253
    .local v16, "itemBmp":Landroid/graphics/Bitmap;
    if-lez v8, :cond_1

    if-lez v7, :cond_1

    .line 254
    move-object/from16 v0, v16

    invoke-static {v0, v8, v7}, Lcom/boyaa/util/ScreenShotUtil;->compress(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v21

    .line 255
    .local v21, "newBmp":Landroid/graphics/Bitmap;
    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v26, v0

    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v27, v0

    const/16 v28, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v26

    move/from16 v2, v27

    move-object/from16 v3, v28

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 243
    .end local v21    # "newBmp":Landroid/graphics/Bitmap;
    :goto_2
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_0

    .line 258
    :cond_1
    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v26, v0

    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v27, v0

    const/16 v28, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v26

    move/from16 v2, v27

    move-object/from16 v3, v28

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 283
    .end local v4    # "bgBmp":Landroid/graphics/Bitmap;
    .end local v5    # "bmp":Landroid/graphics/Bitmap;
    .end local v6    # "canvas":Landroid/graphics/Canvas;
    .end local v7    # "displayHeight":I
    .end local v8    # "displayWidth":I
    .end local v11    # "height":I
    .end local v12    # "i":I
    .end local v13    # "imageBgPath":Ljava/lang/String;
    .end local v14    # "imagePath":Ljava/lang/String;
    .end local v15    # "isSendToFriendsCircle":Z
    .end local v16    # "itemBmp":Landroid/graphics/Bitmap;
    .end local v17    # "itemJson":Lorg/json/JSONObject;
    .end local v22    # "tilesets":Lorg/json/JSONArray;
    .end local v23    # "width":I
    .end local v24    # "x":I
    .end local v25    # "y":I
    :catch_0
    move-exception v9

    .line 285
    .local v9, "e":Lorg/json/JSONException;
    invoke-virtual {v9}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method public static weixinSendImage()V
    .locals 8

    .prologue
    .line 205
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v6

    const-string v7, "weixinSendImage"

    invoke-virtual {v6, v7}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 206
    .local v4, "jsonObject":Lorg/json/JSONObject;
    const-string v6, "imagePath"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 207
    .local v1, "imagePath":Ljava/lang/String;
    const-string v6, "isSendToFriendsCircle"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    .line 209
    .local v2, "isSendToFriendsCircle":Z
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 210
    .local v3, "json":Lorg/json/JSONObject;
    const-string v6, "type"

    const/4 v7, 0x2

    invoke-virtual {v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 211
    const-string v6, "imgUrl"

    invoke-virtual {v3, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 212
    const-string v6, "openId"

    const-string v7, ""

    invoke-virtual {v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 213
    const-string v6, "circleOfFriends"

    invoke-virtual {v3, v6, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 214
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    .line 215
    .local v5, "jsonStr":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v6

    new-instance v7, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper$3;

    invoke-direct {v7, v5}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper$3;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 226
    .end local v1    # "imagePath":Ljava/lang/String;
    .end local v2    # "isSendToFriendsCircle":Z
    .end local v3    # "json":Lorg/json/JSONObject;
    .end local v5    # "jsonStr":Ljava/lang/String;
    :goto_0
    return-void

    .line 222
    :catch_0
    move-exception v0

    .line 224
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public static weixinSendText()V
    .locals 7

    .prologue
    .line 145
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v5

    const-string v6, "weixinSendText"

    invoke-virtual {v5, v6}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 146
    .local v2, "jsonObject":Lorg/json/JSONObject;
    const-string v5, "text"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 147
    .local v4, "text":Ljava/lang/String;
    const-string v5, "isSendToFriendsCircle"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 149
    .local v0, "isSendToFriendsCircle":Z
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 150
    .local v1, "json":Lorg/json/JSONObject;
    const-string v5, "type"

    const/4 v6, 0x1

    invoke-virtual {v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 151
    const-string v5, "text"

    invoke-virtual {v1, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 152
    const-string v5, "openId"

    const-string v6, ""

    invoke-virtual {v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 153
    const-string v5, "circleOfFriends"

    invoke-virtual {v1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 154
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    .line 155
    .local v3, "jsonStr":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v5

    new-instance v6, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper$1;

    invoke-direct {v6, v3}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper$1;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 164
    .end local v0    # "isSendToFriendsCircle":Z
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v3    # "jsonStr":Ljava/lang/String;
    .end local v4    # "text":Ljava/lang/String;
    :goto_0
    return-void

    .line 162
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method public static weixinSendWebPage()V
    .locals 11

    .prologue
    .line 292
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v9

    const-string v10, "weixinSendWebPage"

    invoke-virtual {v9, v10}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v5, v9}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 293
    .local v5, "jsonObject":Lorg/json/JSONObject;
    const-string v9, "url"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 294
    .local v8, "url":Ljava/lang/String;
    const-string v9, "title"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 295
    .local v7, "title":Ljava/lang/String;
    const-string v9, "desc"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 296
    .local v0, "desc":Ljava/lang/String;
    const-string v9, "headPath"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 297
    .local v2, "headPath":Ljava/lang/String;
    const-string v9, "isSendToFriendsCircle"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    .line 299
    .local v3, "isSendToFriendsCircle":Z
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 300
    .local v4, "json":Lorg/json/JSONObject;
    const-string v9, "type"

    const/4 v10, 0x3

    invoke-virtual {v4, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 301
    const-string v9, "webUrl"

    invoke-virtual {v4, v9, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 302
    const-string v9, "title"

    invoke-virtual {v4, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 303
    const-string v9, "desc"

    invoke-virtual {v4, v9, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 304
    const-string v9, "imgUrl"

    invoke-virtual {v4, v9, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 305
    const-string v9, "openId"

    const-string v10, ""

    invoke-virtual {v4, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 306
    const-string v9, "circleOfFriends"

    invoke-virtual {v4, v9, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 307
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    .line 308
    .local v6, "jsonStr":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v9

    new-instance v10, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper$5;

    invoke-direct {v10, v6}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper$5;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v10}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 320
    .end local v0    # "desc":Ljava/lang/String;
    .end local v2    # "headPath":Ljava/lang/String;
    .end local v3    # "isSendToFriendsCircle":Z
    .end local v4    # "json":Lorg/json/JSONObject;
    .end local v6    # "jsonStr":Ljava/lang/String;
    .end local v7    # "title":Ljava/lang/String;
    .end local v8    # "url":Ljava/lang/String;
    :goto_0
    return-void

    .line 315
    :catch_0
    move-exception v1

    .line 317
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public static weixinTakeScreenShotAndSendImage()V
    .locals 13

    .prologue
    .line 168
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v11

    const-string v12, "weixinTakeScreenShotAndSendImage"

    invoke-virtual {v11, v12}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v5, v11}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 169
    .local v5, "jsonObject":Lorg/json/JSONObject;
    const-string v11, "isSendToFriendsCircle"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    .line 171
    .local v3, "isSendToFriendsCircle":Z
    const-string v11, "x"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    .line 172
    .local v9, "x":I
    const-string v11, "y"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v10

    .line 173
    .local v10, "y":I
    const-string v11, "width"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    .line 174
    .local v8, "width":I
    const-string v11, "height"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    .line 176
    .local v2, "height":I
    if-lez v8, :cond_0

    if-gtz v2, :cond_1

    .line 177
    :cond_0
    sget-object v11, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    iget v8, v11, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mWidth:I

    .line 178
    sget-object v11, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    iget v2, v11, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mHeight:I

    .line 181
    :cond_1
    sget-object v11, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v9, v10, v8, v2, v11}, Lcom/boyaa/util/ScreenShotUtil;->saveGLPixels(IIIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 182
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    const/16 v11, 0x500

    const/16 v12, 0x2d0

    invoke-static {v0, v11, v12}, Lcom/boyaa/util/ScreenShotUtil;->compress(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 184
    .local v7, "screenShotSample":Landroid/graphics/Bitmap;
    const-string v11, "weixinTakeScreenShotAndSendImage.png"

    invoke-static {v7, v11}, Lcom/boyaa/util/ScreenShotUtil;->saveBitmapAsFile(Landroid/graphics/Bitmap;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 186
    .local v1, "file":Ljava/io/File;
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 187
    .local v4, "json":Lorg/json/JSONObject;
    const-string v11, "type"

    const/4 v12, 0x2

    invoke-virtual {v4, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 188
    const-string v11, "imgUrl"

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 189
    const-string v11, "openId"

    const-string v12, ""

    invoke-virtual {v4, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 190
    const-string v11, "circleOfFriends"

    invoke-virtual {v4, v11, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 191
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    .line 192
    .local v6, "jsonStr":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v11

    new-instance v12, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper$2;

    invoke-direct {v12, v6}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper$2;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v12}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "height":I
    .end local v3    # "isSendToFriendsCircle":Z
    .end local v4    # "json":Lorg/json/JSONObject;
    .end local v6    # "jsonStr":Ljava/lang/String;
    .end local v7    # "screenShotSample":Landroid/graphics/Bitmap;
    .end local v8    # "width":I
    .end local v9    # "x":I
    .end local v10    # "y":I
    :goto_0
    return-void

    .line 199
    :catch_0
    move-exception v11

    goto :goto_0
.end method

.method public static weixinTakeScreenShotAndSendWebPage()V
    .locals 15

    .prologue
    .line 324
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v13

    const-string v14, "weixinTakeScreenShotAndSendWebPage"

    invoke-virtual {v13, v14}, Lcom/boyaa/app/core/HandlerManager;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v5, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 325
    .local v5, "jsonObject":Lorg/json/JSONObject;
    const-string v13, "url"

    invoke-virtual {v5, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 326
    .local v9, "url":Ljava/lang/String;
    const-string v13, "title"

    invoke-virtual {v5, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 327
    .local v8, "title":Ljava/lang/String;
    const-string v13, "desc"

    invoke-virtual {v5, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 328
    .local v0, "desc":Ljava/lang/String;
    const-string v13, "isSendToFriendsCircle"

    invoke-virtual {v5, v13}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    .line 330
    .local v3, "isSendToFriendsCircle":Z
    const-string v13, "x"

    invoke-virtual {v5, v13}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v11

    .line 331
    .local v11, "x":I
    const-string v13, "y"

    invoke-virtual {v5, v13}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v12

    .line 332
    .local v12, "y":I
    const-string v13, "width"

    invoke-virtual {v5, v13}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v10

    .line 333
    .local v10, "width":I
    const-string v13, "height"

    invoke-virtual {v5, v13}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    .line 335
    .local v2, "height":I
    if-lez v10, :cond_0

    if-gtz v2, :cond_1

    .line 336
    :cond_0
    sget-object v13, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    iget v10, v13, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mWidth:I

    .line 337
    sget-object v13, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    iget v2, v13, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mHeight:I

    .line 340
    :cond_1
    sget-object v13, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v11, v12, v10, v2, v13}, Lcom/boyaa/util/ScreenShotUtil;->saveGLPixels(IIIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 342
    .local v7, "screenShot":Landroid/graphics/Bitmap;
    const-string v13, "weixinTakeScreenShotAndSendWebPage.png"

    invoke-static {v7, v13}, Lcom/boyaa/util/ScreenShotUtil;->saveBitmapAsFile(Landroid/graphics/Bitmap;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 344
    .local v1, "file":Ljava/io/File;
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 345
    .local v4, "json":Lorg/json/JSONObject;
    const-string v13, "type"

    const/4 v14, 0x3

    invoke-virtual {v4, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 346
    const-string v13, "webUrl"

    invoke-virtual {v4, v13, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 347
    const-string v13, "title"

    invoke-virtual {v4, v13, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 348
    const-string v13, "desc"

    invoke-virtual {v4, v13, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 349
    const-string v13, "imgUrl"

    invoke-virtual {v1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v14

    invoke-virtual {v4, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 350
    const-string v13, "openId"

    const-string v14, ""

    invoke-virtual {v4, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 351
    const-string v13, "circleOfFriends"

    invoke-virtual {v4, v13, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 352
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    .line 354
    .local v6, "jsonStr":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v13

    new-instance v14, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper$6;

    invoke-direct {v14, v6}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper$6;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v14}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 363
    .end local v0    # "desc":Ljava/lang/String;
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "height":I
    .end local v3    # "isSendToFriendsCircle":Z
    .end local v4    # "json":Lorg/json/JSONObject;
    .end local v6    # "jsonStr":Ljava/lang/String;
    .end local v7    # "screenShot":Landroid/graphics/Bitmap;
    .end local v8    # "title":Ljava/lang/String;
    .end local v9    # "url":Ljava/lang/String;
    .end local v10    # "width":I
    .end local v11    # "x":I
    .end local v12    # "y":I
    :goto_0
    return-void

    .line 361
    :catch_0
    move-exception v13

    goto :goto_0
.end method
