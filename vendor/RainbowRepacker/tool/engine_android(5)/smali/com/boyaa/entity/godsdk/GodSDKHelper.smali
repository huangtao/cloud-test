.class public Lcom/boyaa/entity/godsdk/GodSDKHelper;
.super Ljava/lang/Object;
.source "GodSDKHelper.java"


# static fields
.field private static instance:Lcom/boyaa/entity/godsdk/GodSDKHelper;

.field private static mDebugSwitch:Z


# instance fields
.field private mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

.field private mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

.field private mIsFloatViewRequired:Z

.field private mIsQuitRequired:Z

.field private mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

.field private mSDKListner:Lcom/boyaa/godsdk/callback/SDKListener;

.field private mShouldDestoryAndKillProcess:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const/4 v0, 0x1

    sput-boolean v0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mDebugSwitch:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-boolean v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mIsQuitRequired:Z

    .line 47
    iput-boolean v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mIsFloatViewRequired:Z

    .line 48
    iput-boolean v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mShouldDestoryAndKillProcess:Z

    .line 160
    new-instance v0, Lcom/boyaa/entity/godsdk/GodSDKHelper$1;

    invoke-direct {v0, p0}, Lcom/boyaa/entity/godsdk/GodSDKHelper$1;-><init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;)V

    iput-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mSDKListner:Lcom/boyaa/godsdk/callback/SDKListener;

    .line 184
    new-instance v0, Lcom/boyaa/entity/godsdk/GodSDKHelper$2;

    invoke-direct {v0, p0}, Lcom/boyaa/entity/godsdk/GodSDKHelper$2;-><init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;)V

    iput-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    .line 257
    new-instance v0, Lcom/boyaa/entity/godsdk/GodSDKHelper$3;

    invoke-direct {v0, p0}, Lcom/boyaa/entity/godsdk/GodSDKHelper$3;-><init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;)V

    iput-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

    .line 292
    new-instance v0, Lcom/boyaa/entity/godsdk/GodSDKHelper$4;

    invoke-direct {v0, p0}, Lcom/boyaa/entity/godsdk/GodSDKHelper$4;-><init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;)V

    iput-object v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    .line 51
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/entity/godsdk/GodSDKHelper;Z)V
    .locals 0

    .prologue
    .line 48
    iput-boolean p1, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mShouldDestoryAndKillProcess:Z

    return-void
.end method

.method static synthetic access$1(Lcom/boyaa/entity/godsdk/GodSDKHelper;ILjava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 466
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->switchAccountCallLuaback(ILjava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    return-void
.end method

.method static synthetic access$2(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .prologue
    .line 514
    invoke-direct {p0, p1, p2, p3}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->godsdkSDKSwitchAccountCallLuaBack(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$3(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 495
    invoke-direct {p0, p1, p2}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->godsdkSDKLogoutCallLuaBack(Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$4(Lcom/boyaa/entity/godsdk/GodSDKHelper;)Z
    .locals 1

    .prologue
    .line 47
    iget-boolean v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mIsFloatViewRequired:Z

    return v0
.end method

.method static synthetic access$5(Lcom/boyaa/entity/godsdk/GodSDKHelper;ILjava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 447
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->loginCallLuaBack(ILjava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    return-void
.end method

.method static synthetic access$6(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 438
    invoke-direct {p0, p1}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->payResultCallLua(Ljava/lang/String;)V

    return-void
.end method

.method private checkIsFloatViewRequired()V
    .locals 1

    .prologue
    .line 149
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isFloatViewRequired()Z

    move-result v0

    iput-boolean v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mIsFloatViewRequired:Z

    .line 150
    return-void
.end method

.method private checkIsQuitRequired()V
    .locals 1

    .prologue
    .line 145
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->isQuitRequired()Z

    move-result v0

    iput-boolean v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mIsQuitRequired:Z

    .line 146
    return-void
.end method

.method public static getInstance()Lcom/boyaa/entity/godsdk/GodSDKHelper;
    .locals 1

    .prologue
    .line 54
    sget-object v0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->instance:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    if-nez v0, :cond_0

    .line 55
    invoke-static {}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->initInstance()V

    .line 57
    :cond_0
    sget-object v0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->instance:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    return-object v0
.end method

.method private godsdkSDKLogoutCallLuaBack(Ljava/lang/String;I)V
    .locals 3
    .param p1, "loginTag"    # Ljava/lang/String;
    .param p2, "flag"    # I

    .prologue
    .line 496
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 497
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "loginTag"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 498
    const-string v1, "flag"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 499
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v2, Lcom/boyaa/entity/godsdk/GodSDKHelper$10;

    invoke-direct {v2, p0, v0}, Lcom/boyaa/entity/godsdk/GodSDKHelper$10;-><init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/util/Map;)V

    invoke-virtual {v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 507
    return-void
.end method

.method private godsdkSDKSwitchAccountCallLuaBack(Ljava/lang/String;ILjava/lang/String;)V
    .locals 3
    .param p1, "loginTag"    # Ljava/lang/String;
    .param p2, "flag"    # I
    .param p3, "userId"    # Ljava/lang/String;

    .prologue
    .line 515
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 516
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "loginTag"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 517
    const-string v1, "flag"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 518
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 519
    const-string v1, "userId"

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 521
    :cond_0
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v2, Lcom/boyaa/entity/godsdk/GodSDKHelper$11;

    invoke-direct {v2, p0, v0}, Lcom/boyaa/entity/godsdk/GodSDKHelper$11;-><init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/util/Map;)V

    invoke-virtual {v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 529
    return-void
.end method

.method private static declared-synchronized initInstance()V
    .locals 2

    .prologue
    .line 61
    const-class v1, Lcom/boyaa/entity/godsdk/GodSDKHelper;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->instance:Lcom/boyaa/entity/godsdk/GodSDKHelper;

    if-nez v0, :cond_0

    .line 62
    new-instance v0, Lcom/boyaa/entity/godsdk/GodSDKHelper;

    invoke-direct {v0}, Lcom/boyaa/entity/godsdk/GodSDKHelper;-><init>()V

    sput-object v0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->instance:Lcom/boyaa/entity/godsdk/GodSDKHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    :cond_0
    monitor-exit v1

    return-void

    .line 61
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private loginCallLuaBack(ILjava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 3
    .param p1, "resultFlag"    # I
    .param p2, "loginTag"    # Ljava/lang/String;
    .param p3, "openId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 448
    .local p4, "paramMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 449
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "Flag"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 450
    const-string v1, "LoginTag"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 451
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 452
    const-string v1, "Token"

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 454
    :cond_0
    if-eqz p4, :cond_1

    invoke-virtual {p4}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 455
    const-string v1, "ExtraParams"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p4}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 457
    :cond_1
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v2, Lcom/boyaa/entity/godsdk/GodSDKHelper$8;

    invoke-direct {v2, p0, v0}, Lcom/boyaa/entity/godsdk/GodSDKHelper$8;-><init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/util/Map;)V

    invoke-virtual {v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 464
    return-void
.end method

.method private payResultCallLua(Ljava/lang/String;)V
    .locals 2
    .param p1, "ret"    # Ljava/lang/String;

    .prologue
    .line 439
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/entity/godsdk/GodSDKHelper$7;

    invoke-direct {v1, p0, p1}, Lcom/boyaa/entity/godsdk/GodSDKHelper$7;-><init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 445
    return-void
.end method

.method private switchAccountCallLuaback(ILjava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 3
    .param p1, "resultFlag"    # I
    .param p2, "loginTag"    # Ljava/lang/String;
    .param p3, "openId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 467
    .local p4, "paramMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 468
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "Flag"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    const-string v1, "LoginTag"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 470
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 471
    const-string v1, "Token"

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    :cond_0
    if-eqz p4, :cond_1

    invoke-virtual {p4}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 474
    const-string v1, "ExtraParams"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p4}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    :cond_1
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v2, Lcom/boyaa/entity/godsdk/GodSDKHelper$9;

    invoke-direct {v2, p0, v0}, Lcom/boyaa/entity/godsdk/GodSDKHelper$9;-><init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;Ljava/util/Map;)V

    invoke-virtual {v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 483
    return-void
.end method


# virtual methods
.method public AlipaySimpleCheckAccount(Landroid/app/Activity;)V
    .locals 5
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 115
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getInstance()Lcom/boyaa/godsdk/core/GodSDKIAP;

    move-result-object v1

    const-string v2, "265"

    const-string v3, "checkAccount"

    invoke-virtual {v1, v2, v3}, Lcom/boyaa/godsdk/core/GodSDKIAP;->isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 116
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 117
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "activity"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getInstance()Lcom/boyaa/godsdk/core/GodSDKIAP;

    move-result-object v1

    const-string v2, "265"

    const-string v3, "checkAccount"

    new-instance v4, Lcom/boyaa/entity/godsdk/GodSDKHelper$6;

    invoke-direct {v4, p0}, Lcom/boyaa/entity/godsdk/GodSDKHelper$6;-><init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;)V

    invoke-virtual {v1, v2, v3, v0, v4}, Lcom/boyaa/godsdk/core/GodSDKIAP;->callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    .line 141
    .end local v0    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    return-void
.end method

.method public callSpecialMethod(Ljava/lang/String;)V
    .locals 6
    .param p1, "params"    # Ljava/lang/String;

    .prologue
    .line 533
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 534
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "Activity"

    sget-object v5, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    const-string v4, "params"

    invoke-interface {v2, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 536
    const-string v3, ""

    .line 537
    .local v3, "methodName":Ljava/lang/String;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 540
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 541
    .local v1, "jsonRes":Lorg/json/JSONObject;
    const-string v4, "method"

    const-string v5, ""

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 547
    .end local v1    # "jsonRes":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    const-string v4, ""

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 548
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v4

    .line 549
    new-instance v5, Lcom/boyaa/entity/godsdk/GodSDKHelper$12;

    invoke-direct {v5, p0}, Lcom/boyaa/entity/godsdk/GodSDKHelper$12;-><init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;)V

    .line 548
    invoke-virtual {v4, v3, v2, v5}, Lcom/boyaa/godsdk/core/GodSDKAccount;->callSpecialMethod(Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    .line 572
    :cond_1
    return-void

    .line 542
    :catch_0
    move-exception v0

    .line 543
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public getChannelSymbol(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 157
    invoke-static {p1}, Lcom/boyaa/godsdk/core/GodSDK;->getChannelSymbol(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultLoginTagsForLua()Ljava/lang/String;
    .locals 1

    .prologue
    .line 377
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getDefaultLoginTag()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSupportLoginTagsForLua()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 372
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getSupportLoginTags()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getSupportingPmodesForLua()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 367
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getInstance()Lcom/boyaa/godsdk/core/GodSDKIAP;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getSupportingPmodes()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public init()V
    .locals 5

    .prologue
    .line 68
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mSDKListner:Lcom/boyaa/godsdk/callback/SDKListener;

    invoke-virtual {v1, v2}, Lcom/boyaa/godsdk/core/GodSDK;->setSDKListener(Lcom/boyaa/godsdk/callback/SDKListener;)V

    .line 69
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getInstance()Lcom/boyaa/godsdk/core/GodSDKIAP;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mIAPListener:Lcom/boyaa/godsdk/callback/IAPListener;

    invoke-virtual {v1, v2}, Lcom/boyaa/godsdk/core/GodSDKIAP;->setIAPListener(Lcom/boyaa/godsdk/callback/IAPListener;)V

    .line 70
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    invoke-virtual {v1, v2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->setAccountListener(Lcom/boyaa/godsdk/callback/AccountListener;)V

    .line 71
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKPush;->getInstance()Lcom/boyaa/godsdk/core/GodSDKPush;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    invoke-virtual {v1, v2}, Lcom/boyaa/godsdk/core/GodSDKPush;->setPushListener(Lcom/boyaa/godsdk/callback/PushListener;)V

    .line 74
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v1

    sget-boolean v2, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mDebugSwitch:Z

    invoke-virtual {v1, v2}, Lcom/boyaa/godsdk/core/GodSDK;->setDebugMode(Z)V

    .line 75
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getInstance()Lcom/boyaa/godsdk/core/GodSDKIAP;

    move-result-object v1

    sget-boolean v2, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mDebugSwitch:Z

    invoke-virtual {v1, v2}, Lcom/boyaa/godsdk/core/GodSDKIAP;->setDebugMode(Z)V

    .line 76
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v1

    sget-boolean v2, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mDebugSwitch:Z

    invoke-virtual {v1, v2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->setDebugMode(Z)V

    .line 77
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKPush;->getInstance()Lcom/boyaa/godsdk/core/GodSDKPush;

    move-result-object v1

    sget-boolean v2, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mDebugSwitch:Z

    invoke-virtual {v1, v2}, Lcom/boyaa/godsdk/core/GodSDKPush;->setDebugMode(Z)V

    .line 78
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAnalytics;

    move-result-object v1

    sget-boolean v2, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mDebugSwitch:Z

    invoke-virtual {v1, v2}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->setDebugMode(Z)V

    .line 79
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKShare;->getInstance()Lcom/boyaa/godsdk/core/GodSDKShare;

    move-result-object v1

    sget-boolean v2, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mDebugSwitch:Z

    invoke-virtual {v1, v2}, Lcom/boyaa/godsdk/core/GodSDKShare;->setDebugMode(Z)V

    .line 82
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v1

    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    .line 83
    new-instance v3, Lcom/boyaa/entity/godsdk/GodSDKHelper$5;

    invoke-direct {v3, p0}, Lcom/boyaa/entity/godsdk/GodSDKHelper$5;-><init>(Lcom/boyaa/entity/godsdk/GodSDKHelper;)V

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/String;

    .line 82
    invoke-virtual {v1, v2, v3, v4}, Lcom/boyaa/godsdk/core/GodSDK;->initSDK(Landroid/app/Activity;Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator;[Ljava/lang/String;)Z

    move-result v0

    .line 103
    .local v0, "b":Z
    const-string v1, "gaojie"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "initSDK b = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    invoke-direct {p0}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->checkIsQuitRequired()V

    .line 105
    invoke-direct {p0}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->checkIsFloatViewRequired()V

    .line 106
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v1}, Lcom/boyaa/entity/godsdk/getui/GeTuiHelper;->loadLastClientId(Landroid/content/Context;)V

    .line 107
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKPush;->getInstance()Lcom/boyaa/godsdk/core/GodSDKPush;

    move-result-object v1

    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v1, v2}, Lcom/boyaa/godsdk/core/GodSDKPush;->turnOnPush(Landroid/content/Context;)V

    .line 109
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAnalytics;

    move-result-object v1

    const-wide/32 v2, 0xea60

    invoke-virtual {v1, v2, v3}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->setSessionContinueMillis(J)V

    .line 110
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAnalytics;

    move-result-object v1

    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->setCatchUncaughtExceptions(Landroid/content/Context;Z)V

    .line 111
    return-void
.end method

.method public isQuitRequired()Z
    .locals 1

    .prologue
    .line 153
    iget-boolean v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mIsQuitRequired:Z

    return v0
.end method

.method public isSupportQuitForLua()V
    .locals 5

    .prologue
    .line 350
    invoke-virtual {p0}, Lcom/boyaa/entity/godsdk/GodSDKHelper;->isQuitRequired()Z

    move-result v0

    .line 351
    .local v0, "isSupport":Z
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 352
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    const-string v3, "isSupport"

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v2

    const-string v3, "isGodSDKSupportQuit"

    new-instance v4, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v4, v1}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v4}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 354
    return-void

    .line 352
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public isSupportSwitchAccountForLua(Ljava/lang/String;)V
    .locals 5
    .param p1, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 358
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isSupportSwitchAccount(Ljava/lang/String;)Z

    move-result v0

    .line 359
    .local v0, "isSupport":Z
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 360
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    const-string v3, "isSupport"

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    const-string v3, "gaojie"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v2, "isSupportSwitchAccountForLua = "

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz v0, :cond_1

    const-string v2, "true"

    :goto_1
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v2

    const-string v3, "isThirdPartySupportSwitchAccount"

    new-instance v4, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v4, v1}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    invoke-virtual {v4}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 363
    return-void

    .line 360
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 361
    :cond_1
    const-string v2, "false"

    goto :goto_1
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 424
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v0, p1, p2, p3}, Lcom/boyaa/godsdk/core/ActivityAgent;->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)V

    .line 426
    return-void
.end method

.method public onCreate()V
    .locals 1

    .prologue
    .line 382
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v0}, Lcom/boyaa/godsdk/core/ActivityAgent;->onCreate(Landroid/app/Activity;)V

    .line 383
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 416
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v0}, Lcom/boyaa/godsdk/core/ActivityAgent;->onDestroy(Landroid/app/Activity;)V

    .line 417
    iget-boolean v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mShouldDestoryAndKillProcess:Z

    if-eqz v0, :cond_0

    .line 418
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/GodSDK;->release(Landroid/app/Activity;)V

    .line 419
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 421
    :cond_0
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 386
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v0, p1}, Lcom/boyaa/godsdk/core/ActivityAgent;->onNewIntent(Landroid/app/Activity;Landroid/content/Intent;)V

    .line 387
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 405
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v0}, Lcom/boyaa/godsdk/core/ActivityAgent;->onPause(Landroid/app/Activity;)V

    .line 406
    iget-boolean v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mIsFloatViewRequired:Z

    if-eqz v0, :cond_0

    .line 407
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v0

    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->hideFloatView(Landroid/app/Activity;)V

    .line 409
    :cond_0
    return-void
.end method

.method public onRestart()V
    .locals 1

    .prologue
    .line 401
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v0}, Lcom/boyaa/godsdk/core/ActivityAgent;->onRestart(Landroid/app/Activity;)V

    .line 402
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 394
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v0}, Lcom/boyaa/godsdk/core/ActivityAgent;->onResume(Landroid/app/Activity;)V

    .line 395
    iget-boolean v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mIsFloatViewRequired:Z

    if-eqz v0, :cond_0

    .line 396
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v0

    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->showFloatView(Landroid/app/Activity;)V

    .line 398
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 390
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v0}, Lcom/boyaa/godsdk/core/ActivityAgent;->onStart(Landroid/app/Activity;)V

    .line 391
    return-void
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 412
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v0}, Lcom/boyaa/godsdk/core/ActivityAgent;->onStop(Landroid/app/Activity;)V

    .line 413
    return-void
.end method

.method public quit()V
    .locals 2

    .prologue
    .line 486
    iget-boolean v0, p0, Lcom/boyaa/entity/godsdk/GodSDKHelper;->mIsQuitRequired:Z

    if-eqz v0, :cond_0

    .line 487
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/GodSDK;->quit(Landroid/app/Activity;)V

    .line 489
    :cond_0
    return-void
.end method

.method public requestGodSDKPay(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "payParams"    # Ljava/lang/String;
    .param p2, "pmode"    # Ljava/lang/String;

    .prologue
    .line 435
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getInstance()Lcom/boyaa/godsdk/core/GodSDKIAP;

    move-result-object v0

    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v0, v1, p1, p2}, Lcom/boyaa/godsdk/core/GodSDKIAP;->requestPay(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 436
    return-void
.end method

.method public requestGodSDKQuit()V
    .locals 2

    .prologue
    .line 345
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/GodSDK;->quit(Landroid/app/Activity;)V

    .line 346
    return-void
.end method

.method public requestLogin(Ljava/lang/String;)V
    .locals 2
    .param p1, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 337
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v0

    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v0, v1, p1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->requestLogin(Landroid/app/Activity;Ljava/lang/String;)V

    .line 338
    return-void
.end method

.method public requestSwitchAccount(Ljava/lang/String;)V
    .locals 2
    .param p1, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 341
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v0

    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-virtual {v0, v1, p1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->requestSwitchAccount(Landroid/app/Activity;Ljava/lang/String;)V

    .line 342
    return-void
.end method
