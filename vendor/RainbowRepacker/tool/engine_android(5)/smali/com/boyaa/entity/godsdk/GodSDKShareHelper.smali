.class public Lcom/boyaa/entity/godsdk/GodSDKShareHelper;
.super Ljava/lang/Object;
.source "GodSDKShareHelper.java"


# static fields
.field public static QQ_SHARE_TYPE_APP:I

.field public static QQ_SHARE_TYPE_IAMGE_AND_URL:I

.field public static QQ_SHARE_TYPE_MUSIC:I

.field public static QQ_SHARE_TYPE_ONLY_IAMGE:I

.field private static TAG:Ljava/lang/String;

.field private static instance:Lcom/boyaa/entity/godsdk/GodSDKShareHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->instance:Lcom/boyaa/entity/godsdk/GodSDKShareHelper;

    .line 32
    const-string v0, "GodSDKShareHelper"

    sput-object v0, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->TAG:Ljava/lang/String;

    .line 34
    const/4 v0, 0x1

    sput v0, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->QQ_SHARE_TYPE_IAMGE_AND_URL:I

    .line 35
    const/4 v0, 0x2

    sput v0, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->QQ_SHARE_TYPE_ONLY_IAMGE:I

    .line 36
    const/4 v0, 0x3

    sput v0, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->QQ_SHARE_TYPE_MUSIC:I

    .line 37
    const/4 v0, 0x4

    sput v0, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->QQ_SHARE_TYPE_APP:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    invoke-direct {p0}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->initListeners()V

    .line 54
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/entity/godsdk/GodSDKShareHelper;ZLjava/lang/String;Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 0

    .prologue
    .line 95
    invoke-direct {p0, p1, p2, p3}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->onGetShareResult(ZLjava/lang/String;Lcom/boyaa/godsdk/callback/CallbackStatus;)V

    return-void
.end method

.method public static getInstance()Lcom/boyaa/entity/godsdk/GodSDKShareHelper;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->instance:Lcom/boyaa/entity/godsdk/GodSDKShareHelper;

    if-nez v0, :cond_0

    .line 41
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->initInstance()V

    .line 43
    :cond_0
    sget-object v0, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->instance:Lcom/boyaa/entity/godsdk/GodSDKShareHelper;

    return-object v0
.end method

.method private static declared-synchronized initInstance()V
    .locals 2

    .prologue
    .line 47
    const-class v1, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->instance:Lcom/boyaa/entity/godsdk/GodSDKShareHelper;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;

    invoke-direct {v0}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;-><init>()V

    sput-object v0, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->instance:Lcom/boyaa/entity/godsdk/GodSDKShareHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    :cond_0
    monitor-exit v1

    return-void

    .line 47
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private initListeners()V
    .locals 2

    .prologue
    .line 57
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKShare;->getInstance()Lcom/boyaa/godsdk/core/GodSDKShare;

    move-result-object v0

    new-instance v1, Lcom/boyaa/entity/godsdk/GodSDKShareHelper$1;

    invoke-direct {v1, p0}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper$1;-><init>(Lcom/boyaa/entity/godsdk/GodSDKShareHelper;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/GodSDKShare;->setShareListener(Lcom/boyaa/godsdk/callback/ShareListener;)V

    .line 93
    return-void
.end method

.method private onGetShareResult(ZLjava/lang/String;Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 5
    .param p1, "isSuccess"    # Z
    .param p2, "adsChannel"    # Ljava/lang/String;
    .param p3, "status"    # Lcom/boyaa/godsdk/callback/CallbackStatus;

    .prologue
    .line 96
    sget-object v2, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "onGetShareResultisSuccess = "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " adsChannel = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    .line 99
    .local v1, "msg":Landroid/os/Message;
    const/16 v2, 0x4b9

    iput v2, v1, Landroid/os/Message;->what:I

    .line 100
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 101
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v3, "isSuccess"

    if-eqz p1, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 103
    const-string v2, "shareChannel"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 106
    sget-object v2, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->TAG:Ljava/lang/String;

    const-string v3, "onGetShareResult"

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 108
    return-void

    .line 101
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method public isSupportQQ()Z
    .locals 8

    .prologue
    .line 157
    const/4 v1, 0x0

    .line 159
    .local v1, "isSupport":Z
    :try_start_0
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 160
    .local v3, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "Activity"

    sget-object v5, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKShare;->getInstance()Lcom/boyaa/godsdk/core/GodSDKShare;

    move-result-object v4

    const-string v5, "qq"

    const-string v6, "isSupportQQ"

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v6, v3, v7}, Lcom/boyaa/godsdk/core/GodSDKShare;->callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    move v2, v1

    .line 167
    .end local v1    # "isSupport":Z
    .end local v3    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local v2, "isSupport":I
    :goto_0
    return v2

    .line 162
    .end local v2    # "isSupport":I
    .restart local v1    # "isSupport":Z
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    move v2, v1

    .line 163
    .restart local v2    # "isSupport":I
    goto :goto_0
.end method

.method public onOpenQQResult(Z)V
    .locals 6
    .param p1, "isSuccess"    # Z

    .prologue
    const/4 v2, 0x0

    .line 142
    if-nez p1, :cond_0

    .line 143
    invoke-static {}, Lcom/boyaa/widget/BoyaaToast;->getInstance()Lcom/boyaa/widget/BoyaaToast;

    move-result-object v3

    sget-object v4, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-string v5, "\u4f60\u8fd8\u672a\u5b89\u88c5QQ"

    invoke-virtual {v3, v4, v5, v2}, Lcom/boyaa/widget/BoyaaToast;->show(Landroid/content/Context;Ljava/lang/String;I)V

    .line 146
    :cond_0
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    .line 147
    .local v1, "msg":Landroid/os/Message;
    const/16 v3, 0x4ba

    iput v3, v1, Landroid/os/Message;->what:I

    .line 148
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 149
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v3, "openShareChannel"

    const-string v4, "qq"

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    const-string v3, "resultCode"

    if-eqz p1, :cond_1

    const/4 v2, 0x1

    :cond_1
    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 151
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 153
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 154
    return-void
.end method

.method public openQQ()V
    .locals 15

    .prologue
    .line 112
    :try_start_0
    const-string v8, "com.tencent.mobileqq"

    .line 113
    .local v8, "packageName":Ljava/lang/String;
    sget-object v13, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v13}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    .line 114
    .local v7, "pManager":Landroid/content/pm/PackageManager;
    const/4 v13, 0x0

    invoke-virtual {v7, v13}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v9

    .line 115
    .local v9, "packages":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/content/pm/PackageInfo;>;"
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_0

    .line 119
    const/4 v13, 0x0

    invoke-virtual {v7, v8, v13}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v10

    .line 120
    .local v10, "pi":Landroid/content/pm/PackageInfo;
    new-instance v11, Landroid/content/Intent;

    const-string v13, "android.intent.action.MAIN"

    const/4 v14, 0x0

    invoke-direct {v11, v13, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 121
    .local v11, "resolveIntent":Landroid/content/Intent;
    iget-object v13, v10, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v11, v13}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 122
    const/4 v13, 0x0

    invoke-virtual {v7, v11, v13}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 123
    .local v0, "apps":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/content/pm/ResolveInfo;

    .line 124
    .local v12, "ri":Landroid/content/pm/ResolveInfo;
    if-eqz v12, :cond_1

    .line 125
    iget-object v13, v12, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v8, v13, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 126
    iget-object v13, v12, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v13, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    .line 127
    .local v1, "className":Ljava/lang/String;
    new-instance v4, Landroid/content/Intent;

    const-string v13, "android.intent.action.MAIN"

    invoke-direct {v4, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 128
    .local v4, "intent":Landroid/content/Intent;
    new-instance v2, Landroid/content/ComponentName;

    invoke-direct {v2, v8, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .local v2, "cn":Landroid/content/ComponentName;
    invoke-virtual {v4, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 130
    const/high16 v13, 0x10000000

    invoke-virtual {v4, v13}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 131
    sget-object v13, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const/16 v14, 0x1004

    invoke-virtual {v13, v4, v14}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 139
    .end local v0    # "apps":Ljava/util/List;
    .end local v1    # "className":Ljava/lang/String;
    .end local v2    # "cn":Landroid/content/ComponentName;
    .end local v4    # "intent":Landroid/content/Intent;
    .end local v6    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/content/pm/PackageInfo;>;"
    .end local v7    # "pManager":Landroid/content/pm/PackageManager;
    .end local v8    # "packageName":Ljava/lang/String;
    .end local v9    # "packages":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    .end local v10    # "pi":Landroid/content/pm/PackageInfo;
    .end local v11    # "resolveIntent":Landroid/content/Intent;
    .end local v12    # "ri":Landroid/content/pm/ResolveInfo;
    :goto_1
    return-void

    .line 116
    .restart local v6    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/content/pm/PackageInfo;>;"
    .restart local v7    # "pManager":Landroid/content/pm/PackageManager;
    .restart local v8    # "packageName":Ljava/lang/String;
    .restart local v9    # "packages":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/PackageInfo;

    .line 117
    .local v5, "item":Landroid/content/pm/PackageInfo;
    const-string v13, "package = "

    iget-object v14, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {v13, v14}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 136
    .end local v5    # "item":Landroid/content/pm/PackageInfo;
    .end local v6    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/content/pm/PackageInfo;>;"
    .end local v7    # "pManager":Landroid/content/pm/PackageManager;
    .end local v8    # "packageName":Ljava/lang/String;
    .end local v9    # "packages":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    :catch_0
    move-exception v3

    .line 137
    .local v3, "e":Ljava/lang/Exception;
    const/4 v13, 0x0

    invoke-virtual {p0, v13}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->onOpenQQResult(Z)V

    goto :goto_1

    .line 133
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v0    # "apps":Ljava/util/List;
    .restart local v6    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/content/pm/PackageInfo;>;"
    .restart local v7    # "pManager":Landroid/content/pm/PackageManager;
    .restart local v8    # "packageName":Ljava/lang/String;
    .restart local v9    # "packages":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    .restart local v10    # "pi":Landroid/content/pm/PackageInfo;
    .restart local v11    # "resolveIntent":Landroid/content/Intent;
    .restart local v12    # "ri":Landroid/content/pm/ResolveInfo;
    :cond_1
    const/4 v13, 0x0

    :try_start_1
    invoke-virtual {p0, v13}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->onOpenQQResult(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public qqShare(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "type"    # I
    .param p2, "shareType"    # I
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "summary"    # Ljava/lang/String;
    .param p5, "imageUrl"    # Ljava/lang/String;
    .param p6, "appName"    # Ljava/lang/String;
    .param p7, "extarFlag"    # I
    .param p8, "targetUrl"    # Ljava/lang/String;
    .param p9, "audioUrl"    # Ljava/lang/String;

    .prologue
    .line 183
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 184
    .local v1, "json":Lorg/json/JSONObject;
    const-string v2, "type"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 185
    const-string v2, "shareType"

    invoke-virtual {v1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 186
    const-string v2, "title"

    invoke-virtual {v1, v2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 187
    const-string v2, "summary"

    invoke-virtual {v1, v2, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 188
    const-string v2, "imageUrl"

    invoke-virtual {v1, v2, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 189
    const-string v2, "appName"

    invoke-virtual {v1, v2, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 190
    const-string v2, "extarFlag"

    invoke-virtual {v1, v2, p7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 191
    const-string v2, "targetUrl"

    invoke-virtual {v1, v2, p8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 192
    const-string v2, "audioUrl"

    invoke-virtual {v1, v2, p9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 194
    sget-object v2, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "qqShare "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "qq"

    invoke-virtual {p0, v2, v3}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->share(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 202
    .end local v1    # "json":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 197
    :catch_0
    move-exception v0

    .line 198
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->TAG:Ljava/lang/String;

    const-string v3, "qqShare failed"

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public qqShareWebPage(Ljava/lang/String;)V
    .locals 16
    .param p1, "jsonStr"    # Ljava/lang/String;

    .prologue
    .line 206
    :try_start_0
    new-instance v12, Lorg/json/JSONObject;

    move-object/from16 v0, p1

    invoke-direct {v12, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 207
    .local v12, "json":Lorg/json/JSONObject;
    const-string v1, "isSendToFriendsCircle"

    invoke-virtual {v12, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v11

    .line 208
    .local v11, "isSendToFriendCircle":Z
    if-eqz v11, :cond_0

    const/4 v2, 0x2

    .line 209
    .local v2, "type":I
    :goto_0
    sget v3, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->QQ_SHARE_TYPE_IAMGE_AND_URL:I

    .line 210
    .local v3, "shareType":I
    const-string v1, "title"

    invoke-virtual {v12, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 211
    .local v4, "title":Ljava/lang/String;
    const-string v1, "desc"

    invoke-virtual {v12, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 212
    .local v5, "summery":Ljava/lang/String;
    const-string v1, "imageUrl"

    invoke-virtual {v12, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 214
    .local v6, "imageUrl":Ljava/lang/String;
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v13

    .line 215
    .local v13, "packManager":Landroid/content/pm/PackageManager;
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v15, 0x0

    invoke-virtual {v13, v1, v15}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v14

    .line 216
    .local v14, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v1, v14, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v1, v13}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    .line 218
    .local v7, "appName":Ljava/lang/String;
    const/4 v8, 0x0

    .line 219
    .local v8, "extarFlag":I
    const-string v1, "targetUrl"

    invoke-virtual {v12, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 220
    .local v9, "targetUrl":Ljava/lang/String;
    const-string v10, ""

    .local v10, "audioUrl":Ljava/lang/String;
    move-object/from16 v1, p0

    .line 223
    invoke-virtual/range {v1 .. v10}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->qqShare(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 228
    .end local v2    # "type":I
    .end local v3    # "shareType":I
    .end local v4    # "title":Ljava/lang/String;
    .end local v5    # "summery":Ljava/lang/String;
    .end local v6    # "imageUrl":Ljava/lang/String;
    .end local v7    # "appName":Ljava/lang/String;
    .end local v8    # "extarFlag":I
    .end local v9    # "targetUrl":Ljava/lang/String;
    .end local v10    # "audioUrl":Ljava/lang/String;
    .end local v11    # "isSendToFriendCircle":Z
    .end local v12    # "json":Lorg/json/JSONObject;
    .end local v13    # "packManager":Landroid/content/pm/PackageManager;
    .end local v14    # "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_1
    return-void

    .line 208
    .restart local v11    # "isSendToFriendCircle":Z
    .restart local v12    # "json":Lorg/json/JSONObject;
    :cond_0
    const/4 v2, 0x1

    goto :goto_0

    .line 224
    .end local v11    # "isSendToFriendCircle":Z
    .end local v12    # "json":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method public share(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "jsonStr"    # Ljava/lang/String;
    .param p2, "shareChannel"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 236
    const-string v0, "qq"

    if-ne p2, v0, :cond_0

    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->getInstance()Lcom/boyaa/entity/godsdk/GodSDKShareHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->isSupportQQ()Z

    move-result v0

    if-nez v0, :cond_0

    .line 237
    invoke-static {}, Lcom/boyaa/widget/BoyaaToast;->getInstance()Lcom/boyaa/widget/BoyaaToast;

    move-result-object v0

    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-string v2, "\u4f60\u8fd8\u672a\u5b89\u88c5QQ"

    invoke-virtual {v0, v1, v2, v3}, Lcom/boyaa/widget/BoyaaToast;->show(Landroid/content/Context;Ljava/lang/String;I)V

    .line 238
    invoke-direct {p0, v3, p2, v4}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->onGetShareResult(ZLjava/lang/String;Lcom/boyaa/godsdk/callback/CallbackStatus;)V

    .line 245
    :goto_0
    return-void

    .line 239
    :cond_0
    const-string v0, "weixin"

    if-ne p2, v0, :cond_1

    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKWechatHelper;->isSupportWeixin()Z

    move-result v0

    if-nez v0, :cond_1

    .line 240
    invoke-direct {p0, v3, p2, v4}, Lcom/boyaa/entity/godsdk/GodSDKShareHelper;->onGetShareResult(ZLjava/lang/String;Lcom/boyaa/godsdk/callback/CallbackStatus;)V

    .line 241
    invoke-static {}, Lcom/boyaa/widget/BoyaaToast;->getInstance()Lcom/boyaa/widget/BoyaaToast;

    move-result-object v0

    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-string v2, "\u4f60\u8fd8\u672a\u5b89\u88c5\u5fae\u4fe1"

    invoke-virtual {v0, v1, v2, v3}, Lcom/boyaa/widget/BoyaaToast;->show(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_0

    .line 243
    :cond_1
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKShare;->getInstance()Lcom/boyaa/godsdk/core/GodSDKShare;

    move-result-object v0

    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v0, v1, p1, p2}, Lcom/boyaa/godsdk/core/GodSDKShare;->share(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
