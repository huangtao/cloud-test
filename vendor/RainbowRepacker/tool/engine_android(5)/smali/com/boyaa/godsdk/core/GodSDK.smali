.class public Lcom/boyaa/godsdk/core/GodSDK;
.super Ljava/lang/Object;
.source "GodSDK.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/ISDKPlugin;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator;
    }
.end annotation


# static fields
.field public static final BOYAA_GODSDK_VERSION_CODE:Ljava/lang/String; = "BOYAA_GODSDK_VERSION_CODE"

.field public static final BOYAA_GODSDK_VERSION_NAME:Ljava/lang/String; = "BOYAA_GODSDK_VERSION_NAME"

.field public static GODSDK_CHANNEL_SYMBOL_FILENAME:Ljava/lang/String; = null

.field public static GODSDK_CONFIG_FILENAME:Ljava/lang/String; = null

.field private static GODSDK_SYMBOL:Ljava/lang/String; = null

.field private static final GODSDK_VERSION_CODE:I = 0x2

.field private static final GODSDK_VERSION_NAME:Ljava/lang/String; = "0.0.0.2beta"

.field private static final TAG:Ljava/lang/String; = "GodSDK"

.field private static instance:Lcom/boyaa/godsdk/core/GodSDK;

.field private static mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

.field private static sMainThreadHandler:Landroid/os/Handler;

.field private static sUIContext:Landroid/content/Context;


# instance fields
.field private mActivityRequestCodeIterator:Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mAlreadyQuitSDKNum:I

.field private mDebugMode:Z

.field private mInitLock:Ljava/lang/Object;

.field private mInsideListener:Lcom/boyaa/godsdk/callback/SDKListener;

.field private mIsInitSuccess:Z

.field private mIsQuitRequiredChecked:Z

.field private mOutsideSdkListener:Lcom/boyaa/godsdk/callback/SDKListener;

.field private mPluginList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;",
            ">;"
        }
    .end annotation
.end field

.field private mQuitRequiredClassName:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSDKObjectMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 71
    const-string v0, "GodSDKPlugins.xml"

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDK;->GODSDK_CONFIG_FILENAME:Ljava/lang/String;

    .line 76
    const-string v0, "GodSDKChannelSymbol.txt"

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDK;->GODSDK_CHANNEL_SYMBOL_FILENAME:Ljava/lang/String;

    .line 100
    sput-object v1, Lcom/boyaa/godsdk/core/GodSDK;->GODSDK_SYMBOL:Ljava/lang/String;

    .line 102
    sput-object v1, Lcom/boyaa/godsdk/core/GodSDK;->instance:Lcom/boyaa/godsdk/core/GodSDK;

    .line 248
    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 322
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 247
    iput-boolean v1, p0, Lcom/boyaa/godsdk/core/GodSDK;->mDebugMode:Z

    .line 251
    iput-object v2, p0, Lcom/boyaa/godsdk/core/GodSDK;->mOutsideSdkListener:Lcom/boyaa/godsdk/callback/SDKListener;

    .line 252
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDK$1;

    invoke-direct {v0, p0}, Lcom/boyaa/godsdk/core/GodSDK$1;-><init>(Lcom/boyaa/godsdk/core/GodSDK;)V

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDK;->mInsideListener:Lcom/boyaa/godsdk/callback/SDKListener;

    .line 310
    iput-object v2, p0, Lcom/boyaa/godsdk/core/GodSDK;->mPluginList:Ljava/util/List;

    .line 311
    iput-boolean v1, p0, Lcom/boyaa/godsdk/core/GodSDK;->mIsInitSuccess:Z

    .line 312
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDK;->mInitLock:Ljava/lang/Object;

    .line 316
    iput-boolean v1, p0, Lcom/boyaa/godsdk/core/GodSDK;->mIsQuitRequiredChecked:Z

    .line 318
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDK;->mQuitRequiredClassName:Ljava/util/List;

    .line 320
    iput v1, p0, Lcom/boyaa/godsdk/core/GodSDK;->mAlreadyQuitSDKNum:I

    .line 323
    new-instance v0, Lcom/boyaa/godsdk/core/utils/Debug;

    invoke-direct {v0, p0}, Lcom/boyaa/godsdk/core/utils/Debug;-><init>(Lcom/boyaa/godsdk/core/IDebugable;)V

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 324
    return-void
.end method

.method static synthetic access$0()Lcom/boyaa/godsdk/core/utils/Debug;
    .locals 1

    .prologue
    .line 248
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    return-object v0
.end method

.method static synthetic access$1(Lcom/boyaa/godsdk/core/GodSDK;)Lcom/boyaa/godsdk/callback/SDKListener;
    .locals 1

    .prologue
    .line 251
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDK;->mOutsideSdkListener:Lcom/boyaa/godsdk/callback/SDKListener;

    return-object v0
.end method

.method static synthetic access$2(Lcom/boyaa/godsdk/core/GodSDK;)I
    .locals 1

    .prologue
    .line 320
    iget v0, p0, Lcom/boyaa/godsdk/core/GodSDK;->mAlreadyQuitSDKNum:I

    return v0
.end method

.method static synthetic access$3(Lcom/boyaa/godsdk/core/GodSDK;I)V
    .locals 0

    .prologue
    .line 320
    iput p1, p0, Lcom/boyaa/godsdk/core/GodSDK;->mAlreadyQuitSDKNum:I

    return-void
.end method

.method static synthetic access$4(Lcom/boyaa/godsdk/core/GodSDK;)Ljava/util/List;
    .locals 1

    .prologue
    .line 318
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDK;->mQuitRequiredClassName:Ljava/util/List;

    return-object v0
.end method

.method public static getChannelSymbol(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 124
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDK;->GODSDK_SYMBOL:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 125
    invoke-static {p0}, Lcom/boyaa/godsdk/core/GodSDK;->syncInitChannelSymbol(Landroid/content/Context;)V

    .line 127
    :cond_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDK;->GODSDK_SYMBOL:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 128
    invoke-static {p0}, Lcom/boyaa/godsdk/core/GodSDK;->syncInitChannelSymbolByEOCDField(Landroid/content/Context;)V

    .line 130
    :cond_1
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDK;->GODSDK_SYMBOL:Ljava/lang/String;

    return-object v0
.end method

.method public static getInstance()Lcom/boyaa/godsdk/core/GodSDK;
    .locals 1

    .prologue
    .line 105
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDK;->instance:Lcom/boyaa/godsdk/core/GodSDK;

    if-nez v0, :cond_0

    .line 106
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->syncInit()V

    .line 108
    :cond_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDK;->instance:Lcom/boyaa/godsdk/core/GodSDK;

    return-object v0
.end method

.method private declared-synchronized initMainThreadHandler()V
    .locals 2

    .prologue
    .line 548
    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDK;->sMainThreadHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 549
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDK;->sMainThreadHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 551
    :cond_0
    monitor-exit p0

    return-void

    .line 548
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private varargs initPluginInfo(Landroid/app/Activity;[Ljava/lang/String;)Z
    .locals 17
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "notInitSDKs"    # [Ljava/lang/String;

    .prologue
    .line 428
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/godsdk/core/GodSDK;->initMainThreadHandler()V

    .line 429
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/godsdk/core/GodSDK;->initSDKObjectMap()V

    .line 431
    invoke-direct/range {p0 .. p1}, Lcom/boyaa/godsdk/core/GodSDK;->isVersionConfigRight(Landroid/content/Context;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 432
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/boyaa/godsdk/core/GodSDK;->mOutsideSdkListener:Lcom/boyaa/godsdk/callback/SDKListener;

    if-eqz v11, :cond_0

    .line 433
    new-instance v11, Lcom/boyaa/godsdk/core/GodSDK$2;

    move-object/from16 v0, p0

    invoke-direct {v11, v0}, Lcom/boyaa/godsdk/core/GodSDK$2;-><init>(Lcom/boyaa/godsdk/core/GodSDK;)V

    invoke-static {v11}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 445
    :cond_0
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lcom/boyaa/godsdk/core/GodSDK;->setIsInitSuccess(Z)V

    .line 446
    const/4 v11, 0x0

    .line 504
    :goto_0
    return v11

    .line 449
    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v11

    .line 450
    sget-object v12, Lcom/boyaa/godsdk/core/GodSDK;->GODSDK_CONFIG_FILENAME:Ljava/lang/String;

    .line 449
    invoke-virtual {v11, v12}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 452
    .local v3, "inputStream":Ljava/io/InputStream;
    const-string v11, "UTF-8"

    .line 451
    invoke-static {v3, v11}, Lcom/boyaa/godsdk/core/GodSDKConfigParser;->parse(Ljava/io/InputStream;Ljava/lang/String;)Ljava/util/List;

    move-result-object v7

    .line 453
    .local v7, "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/boyaa/godsdk/core/GodSDK;->mPluginList:Ljava/util/List;

    .line 454
    const/4 v4, 0x0

    .line 455
    .local v4, "notInitSDKList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p2, :cond_2

    move-object/from16 v0, p2

    array-length v11, v0

    if-lez v11, :cond_2

    .line 456
    invoke-static/range {p2 .. p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .line 458
    :cond_2
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_3
    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-nez v11, :cond_4

    .line 484
    const/4 v11, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lcom/boyaa/godsdk/core/GodSDK;->setIsInitSuccess(Z)V

    .line 485
    const/4 v11, 0x1

    goto :goto_0

    .line 458
    :cond_4
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;

    .line 459
    .local v6, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    invoke-virtual {v6}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v1

    .line 460
    .local v1, "className":Ljava/lang/String;
    if-eqz v4, :cond_5

    invoke-interface {v4, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_7

    .line 461
    :cond_5
    invoke-static {v1}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->getClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 463
    .local v9, "sdkClass":Ljava/lang/Class;
    const/4 v11, 0x0

    const/4 v13, 0x0

    invoke-static {v9, v11, v13}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->constructObject(Ljava/lang/Class;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 462
    check-cast v10, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    .line 464
    .local v10, "sdkObj":Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/boyaa/godsdk/core/GodSDK;->mSDKObjectMap:Ljava/util/Map;

    invoke-interface {v11, v1, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 466
    invoke-interface {v10}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getActivityLifeCycleListener()Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;

    move-result-object v11

    .line 465
    invoke-static {v11}, Lcom/boyaa/godsdk/core/ActivityAgent;->addListener(Lcom/boyaa/godsdk/callback/ActivityLifeCycleListener;)V

    .line 467
    invoke-virtual {v6}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getParams()Ljava/util/Map;

    move-result-object v5

    .line 469
    .local v5, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v11, "initSDK"

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Class;

    const/4 v14, 0x0

    const-class v15, Landroid/app/Activity;

    aput-object v15, v13, v14

    const/4 v14, 0x1

    .line 470
    const-class v15, Ljava/util/Map;

    aput-object v15, v13, v14

    const/4 v14, 0x2

    const-class v15, Lcom/boyaa/godsdk/callback/SDKListener;

    aput-object v15, v13, v14

    .line 471
    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object p1, v14, v15

    const/4 v15, 0x1

    aput-object v5, v14, v15

    const/4 v15, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/godsdk/core/GodSDK;->mInsideListener:Lcom/boyaa/godsdk/callback/SDKListener;

    move-object/from16 v16, v0

    aput-object v16, v14, v15

    .line 468
    invoke-static {v9, v11, v13, v10, v14}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Boolean;

    invoke-virtual {v11}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    .line 472
    .local v8, "result":Z
    sget-object v11, Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "class class == "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 473
    const-string v14, ", initSDK result == "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 472
    invoke-virtual {v11, v13}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 474
    if-nez v8, :cond_3

    .line 477
    new-instance v11, Ljava/lang/Exception;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v13, "\u521d\u59cb\u5316\u5f02\u5e38"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v11
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 487
    .end local v1    # "className":Ljava/lang/String;
    .end local v3    # "inputStream":Ljava/io/InputStream;
    .end local v4    # "notInitSDKList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    .end local v7    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    .end local v8    # "result":Z
    .end local v9    # "sdkClass":Ljava/lang/Class;
    .end local v10    # "sdkObj":Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
    :catch_0
    move-exception v2

    .line 488
    .local v2, "e":Ljava/lang/Exception;
    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lcom/boyaa/godsdk/core/GodSDK;->setIsInitSuccess(Z)V

    .line 489
    sget-object v11, Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v12, "\u771f\u5b9e\u7b2c\u4e09\u65b9SDK\u521d\u59cb\u5316\u5f02\u5e38"

    invoke-virtual {v11, v12, v2}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 490
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/boyaa/godsdk/core/GodSDK;->mOutsideSdkListener:Lcom/boyaa/godsdk/callback/SDKListener;

    if-eqz v11, :cond_6

    .line 491
    new-instance v11, Lcom/boyaa/godsdk/core/GodSDK$3;

    move-object/from16 v0, p0

    invoke-direct {v11, v0}, Lcom/boyaa/godsdk/core/GodSDK$3;-><init>(Lcom/boyaa/godsdk/core/GodSDK;)V

    invoke-static {v11}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 504
    :cond_6
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 480
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v1    # "className":Ljava/lang/String;
    .restart local v3    # "inputStream":Ljava/io/InputStream;
    .restart local v4    # "notInitSDKList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v6    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    .restart local v7    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :cond_7
    :try_start_1
    sget-object v11, Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "class class == "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 481
    const-string v14, "does not init"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 480
    invoke-virtual {v11, v13}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1
.end method

.method private initSDKObjectMap()V
    .locals 1

    .prologue
    .line 554
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDK;->mSDKObjectMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 555
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDK;->mSDKObjectMap:Ljava/util/Map;

    .line 557
    :cond_0
    return-void
.end method

.method private isVersionConfigRight(Landroid/content/Context;)Z
    .locals 11
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v7, 0x0

    .line 514
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDK;->getVersionName()Ljava/lang/String;

    move-result-object v6

    .line 515
    .local v6, "versionName":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDK;->getVersionCode()I

    move-result v5

    .line 518
    .local v5, "versionCode":I
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v8

    .line 519
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    .line 520
    const/16 v10, 0x80

    .line 519
    invoke-virtual {v8, v9, v10}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 521
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v4, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 522
    .local v4, "metaData":Landroid/os/Bundle;
    if-nez v4, :cond_1

    .line 544
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v4    # "metaData":Landroid/os/Bundle;
    :cond_0
    :goto_0
    return v7

    .line 527
    .restart local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .restart local v4    # "metaData":Landroid/os/Bundle;
    :cond_1
    const-string v8, "BOYAA_GODSDK_VERSION_NAME"

    invoke-virtual {v4, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 528
    .local v2, "configVersionName":Ljava/lang/String;
    const-string v8, "BOYAA_GODSDK_VERSION_CODE"

    invoke-virtual {v4, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 530
    .local v1, "configVersionCode":I
    sget-object v8, Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "GodSDK VersionCode == "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 531
    const-string v10, ", GodSDK Manifest VersionCode == "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 530
    invoke-virtual {v8, v9}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 532
    sget-object v8, Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "GodSDK VersionName == "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 533
    const-string v10, ", GodSDK Manifest VersionName == "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 532
    invoke-virtual {v8, v9}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 535
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v8

    if-eqz v8, :cond_0

    .line 536
    if-ne v5, v1, :cond_0

    .line 537
    const/4 v7, 0x1

    goto :goto_0

    .line 541
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v1    # "configVersionCode":I
    .end local v2    # "configVersionName":Ljava/lang/String;
    .end local v4    # "metaData":Landroid/os/Bundle;
    :catch_0
    move-exception v3

    .line 542
    .local v3, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v8, Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v9, "isVersionConfigRight Exception "

    invoke-virtual {v8, v9, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static readComment(Ljava/io/File;)V
    .locals 17
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 191
    const/4 v11, 0x0

    .line 193
    .local v11, "zipFile":Ljava/io/RandomAccessFile;
    :try_start_0
    new-instance v12, Ljava/io/RandomAccessFile;

    const-string v13, "r"

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v13}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 195
    .end local v11    # "zipFile":Ljava/io/RandomAccessFile;
    .local v12, "zipFile":Ljava/io/RandomAccessFile;
    :try_start_1
    invoke-virtual {v12}, Ljava/io/RandomAccessFile;->length()J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-wide v5

    .line 197
    .local v5, "fileSize":J
    const-wide/16 v7, 0x1

    .local v7, "i":J
    :goto_0
    sub-long v13, v5, v7

    const-wide/16 v15, 0x0

    cmp-long v13, v13, v15

    if-gez v13, :cond_2

    .line 227
    :cond_0
    :goto_1
    if-eqz v12, :cond_6

    .line 229
    :try_start_2
    invoke-virtual {v12}, Ljava/io/RandomAccessFile;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    move-object v11, v12

    .line 234
    .end local v5    # "fileSize":J
    .end local v7    # "i":J
    .end local v12    # "zipFile":Ljava/io/RandomAccessFile;
    .restart local v11    # "zipFile":Ljava/io/RandomAccessFile;
    :cond_1
    :goto_2
    return-void

    .line 198
    .end local v11    # "zipFile":Ljava/io/RandomAccessFile;
    .restart local v5    # "fileSize":J
    .restart local v7    # "i":J
    .restart local v12    # "zipFile":Ljava/io/RandomAccessFile;
    :cond_2
    sub-long v13, v5, v7

    :try_start_3
    invoke-virtual {v12, v13, v14}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 199
    invoke-virtual {v12}, Ljava/io/RandomAccessFile;->readByte()B

    move-result v1

    .line 200
    .local v1, "b":B
    const/4 v13, 0x6

    if-ne v1, v13, :cond_3

    .line 201
    sub-long v13, v5, v7

    const-wide/16 v15, 0x3

    sub-long/2addr v13, v15

    invoke-virtual {v12, v13, v14}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 203
    const/4 v13, 0x4

    new-array v9, v13, [B

    .line 204
    .local v9, "key":[B
    invoke-virtual {v12, v9}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 205
    const/4 v13, 0x0

    aget-byte v13, v9, v13

    const/16 v14, 0x50

    if-ne v13, v14, :cond_3

    const/4 v13, 0x1

    aget-byte v13, v9, v13

    const/16 v14, 0x4b

    if-ne v13, v14, :cond_3

    const/4 v13, 0x2

    aget-byte v13, v9, v13

    const/4 v14, 0x5

    if-eq v13, v14, :cond_4

    .line 197
    .end local v9    # "key":[B
    :cond_3
    const-wide/16 v13, 0x1

    add-long/2addr v7, v13

    goto :goto_0

    .line 209
    .restart local v9    # "key":[B
    :cond_4
    const/16 v13, 0x12

    new-array v10, v13, [B

    .line 210
    .local v10, "tmp":[B
    invoke-virtual {v12, v10}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 211
    const/16 v13, 0x10

    aget-byte v13, v10, v13

    and-int/lit16 v13, v13, 0xff

    .line 212
    const/16 v14, 0x11

    aget-byte v14, v10, v14

    and-int/lit16 v14, v14, 0xff

    shl-int/lit8 v14, v14, 0x8

    .line 211
    or-int v3, v13, v14

    .line 213
    .local v3, "commentSize":I
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 214
    if-lez v3, :cond_0

    .line 215
    new-array v2, v3, [B

    .line 216
    .local v2, "comment":[B
    invoke-virtual {v12, v2}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 217
    new-instance v13, Ljava/lang/String;

    const-string v14, "UTF-8"

    invoke-direct {v13, v2, v14}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 218
    const-string v14, "[,;]"

    invoke-virtual {v13, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    .line 217
    aget-object v13, v13, v14

    .line 218
    const-string v14, "="

    invoke-virtual {v13, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x1

    .line 217
    aget-object v13, v13, v14

    sput-object v13, Lcom/boyaa/godsdk/core/GodSDK;->GODSDK_SYMBOL:Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto/16 :goto_1

    .line 223
    .end local v1    # "b":B
    .end local v2    # "comment":[B
    .end local v3    # "commentSize":I
    .end local v5    # "fileSize":J
    .end local v7    # "i":J
    .end local v9    # "key":[B
    .end local v10    # "tmp":[B
    :catch_0
    move-exception v4

    move-object v11, v12

    .line 224
    .end local v12    # "zipFile":Ljava/io/RandomAccessFile;
    .local v4, "ex":Ljava/lang/Exception;
    .restart local v11    # "zipFile":Ljava/io/RandomAccessFile;
    :goto_3
    :try_start_4
    sget-object v13, Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v14, "readComment Exception "

    invoke-virtual {v13, v14, v4}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 225
    const-string v13, ""

    sput-object v13, Lcom/boyaa/godsdk/core/GodSDK;->GODSDK_SYMBOL:Ljava/lang/String;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 227
    if-eqz v11, :cond_1

    .line 229
    :try_start_5
    invoke-virtual {v11}, Ljava/io/RandomAccessFile;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_2

    .line 230
    :catch_1
    move-exception v13

    goto/16 :goto_2

    .line 226
    .end local v4    # "ex":Ljava/lang/Exception;
    :catchall_0
    move-exception v13

    .line 227
    :goto_4
    if-eqz v11, :cond_5

    .line 229
    :try_start_6
    invoke-virtual {v11}, Ljava/io/RandomAccessFile;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 233
    :cond_5
    :goto_5
    throw v13

    .line 230
    .end local v11    # "zipFile":Ljava/io/RandomAccessFile;
    .restart local v5    # "fileSize":J
    .restart local v7    # "i":J
    .restart local v12    # "zipFile":Ljava/io/RandomAccessFile;
    :catch_2
    move-exception v13

    move-object v11, v12

    .end local v12    # "zipFile":Ljava/io/RandomAccessFile;
    .restart local v11    # "zipFile":Ljava/io/RandomAccessFile;
    goto/16 :goto_2

    .end local v5    # "fileSize":J
    .end local v7    # "i":J
    :catch_3
    move-exception v14

    goto :goto_5

    .line 226
    .end local v11    # "zipFile":Ljava/io/RandomAccessFile;
    .restart local v12    # "zipFile":Ljava/io/RandomAccessFile;
    :catchall_1
    move-exception v13

    move-object v11, v12

    .end local v12    # "zipFile":Ljava/io/RandomAccessFile;
    .restart local v11    # "zipFile":Ljava/io/RandomAccessFile;
    goto :goto_4

    .line 223
    :catch_4
    move-exception v4

    goto :goto_3

    .end local v11    # "zipFile":Ljava/io/RandomAccessFile;
    .restart local v5    # "fileSize":J
    .restart local v7    # "i":J
    .restart local v12    # "zipFile":Ljava/io/RandomAccessFile;
    :cond_6
    move-object v11, v12

    .end local v12    # "zipFile":Ljava/io/RandomAccessFile;
    .restart local v11    # "zipFile":Ljava/io/RandomAccessFile;
    goto/16 :goto_2
.end method

.method public static runOnMainThread(Ljava/lang/Runnable;)V
    .locals 1
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 240
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDK;->sMainThreadHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1

    .line 241
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDK;->sMainThreadHandler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 245
    :cond_0
    :goto_0
    return-void

    .line 242
    :cond_1
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDK;->sUIContext:Landroid/content/Context;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/boyaa/godsdk/core/GodSDK;->sUIContext:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 243
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDK;->sUIContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0, p0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private setActivityRequestCodeIterator(Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 347
    .local p1, "iterator":Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator;, "Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator<Ljava/lang/Integer;>;"
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDK;->mActivityRequestCodeIterator:Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator;

    .line 348
    return-void
.end method

.method private setIsInitSuccess(Z)V
    .locals 2
    .param p1, "result"    # Z

    .prologue
    .line 364
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDK;->mInitLock:Ljava/lang/Object;

    monitor-enter v1

    .line 365
    :try_start_0
    iput-boolean p1, p0, Lcom/boyaa/godsdk/core/GodSDK;->mIsInitSuccess:Z

    .line 364
    monitor-exit v1

    .line 367
    return-void

    .line 364
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private static declared-synchronized syncInit()V
    .locals 2

    .prologue
    .line 112
    const-class v1, Lcom/boyaa/godsdk/core/GodSDK;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDK;->instance:Lcom/boyaa/godsdk/core/GodSDK;

    if-nez v0, :cond_0

    .line 113
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDK;

    invoke-direct {v0}, Lcom/boyaa/godsdk/core/GodSDK;-><init>()V

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDK;->instance:Lcom/boyaa/godsdk/core/GodSDK;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    :cond_0
    monitor-exit v1

    return-void

    .line 112
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static declared-synchronized syncInitChannelSymbol(Landroid/content/Context;)V
    .locals 10
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 134
    const-class v8, Lcom/boyaa/godsdk/core/GodSDK;

    monitor-enter v8

    :try_start_0
    sget-object v7, Lcom/boyaa/godsdk/core/GodSDK;->GODSDK_SYMBOL:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v7, :cond_1

    .line 135
    const/4 v3, 0x0

    .line 136
    .local v3, "inputReader":Ljava/io/InputStreamReader;
    const/4 v0, 0x0

    .line 138
    .local v0, "bufReader":Ljava/io/BufferedReader;
    :try_start_1
    new-instance v4, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 139
    invoke-virtual {v7}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v7

    sget-object v9, Lcom/boyaa/godsdk/core/GodSDK;->GODSDK_CHANNEL_SYMBOL_FILENAME:Ljava/lang/String;

    invoke-virtual {v7, v9}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v7

    .line 138
    invoke-direct {v4, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 140
    .end local v3    # "inputReader":Ljava/io/InputStreamReader;
    .local v4, "inputReader":Ljava/io/InputStreamReader;
    :try_start_2
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_7
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 141
    .end local v0    # "bufReader":Ljava/io/BufferedReader;
    .local v1, "bufReader":Ljava/io/BufferedReader;
    :try_start_3
    const-string v5, ""

    .line 142
    .local v5, "line":Ljava/lang/String;
    const-string v6, ""

    .line 143
    .local v6, "result":Ljava/lang/String;
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_2

    .line 146
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_8
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 147
    const/4 v0, 0x0

    .line 148
    .end local v1    # "bufReader":Ljava/io/BufferedReader;
    .restart local v0    # "bufReader":Ljava/io/BufferedReader;
    :try_start_4
    invoke-virtual {v4}, Ljava/io/InputStreamReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_7
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 149
    const/4 v3, 0x0

    .line 151
    .end local v4    # "inputReader":Ljava/io/InputStreamReader;
    .restart local v3    # "inputReader":Ljava/io/InputStreamReader;
    :try_start_5
    const-string v7, " "

    const-string v9, ""

    invoke-virtual {v6, v7, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    sput-object v7, Lcom/boyaa/godsdk/core/GodSDK;->GODSDK_SYMBOL:Ljava/lang/String;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 156
    if-eqz v0, :cond_0

    .line 158
    :try_start_6
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 159
    const/4 v0, 0x0

    .line 163
    :cond_0
    :goto_1
    if-eqz v3, :cond_1

    .line 165
    :try_start_7
    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 166
    const/4 v3, 0x0

    .line 172
    .end local v0    # "bufReader":Ljava/io/BufferedReader;
    .end local v3    # "inputReader":Ljava/io/InputStreamReader;
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "result":Ljava/lang/String;
    :cond_1
    :goto_2
    monitor-exit v8

    return-void

    .line 144
    .restart local v1    # "bufReader":Ljava/io/BufferedReader;
    .restart local v4    # "inputReader":Ljava/io/InputStreamReader;
    .restart local v5    # "line":Ljava/lang/String;
    .restart local v6    # "result":Ljava/lang/String;
    :cond_2
    :try_start_8
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    move-result-object v6

    goto :goto_0

    .line 153
    .end local v1    # "bufReader":Ljava/io/BufferedReader;
    .end local v4    # "inputReader":Ljava/io/InputStreamReader;
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "result":Ljava/lang/String;
    .restart local v0    # "bufReader":Ljava/io/BufferedReader;
    .restart local v3    # "inputReader":Ljava/io/InputStreamReader;
    :catch_0
    move-exception v2

    .line 154
    .local v2, "e":Ljava/io/IOException;
    :goto_3
    :try_start_9
    const-string v7, ""

    sput-object v7, Lcom/boyaa/godsdk/core/GodSDK;->GODSDK_SYMBOL:Ljava/lang/String;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 156
    if-eqz v0, :cond_3

    .line 158
    :try_start_a
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 159
    const/4 v0, 0x0

    .line 163
    :cond_3
    :goto_4
    if-eqz v3, :cond_1

    .line 165
    :try_start_b
    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_2
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 166
    const/4 v3, 0x0

    goto :goto_2

    .line 155
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v7

    .line 156
    :goto_5
    if-eqz v0, :cond_4

    .line 158
    :try_start_c
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_3
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .line 159
    const/4 v0, 0x0

    .line 163
    :cond_4
    :goto_6
    if-eqz v3, :cond_5

    .line 165
    :try_start_d
    invoke-virtual {v3}, Ljava/io/InputStreamReader;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_4
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 166
    const/4 v3, 0x0

    .line 170
    :cond_5
    :goto_7
    :try_start_e
    throw v7
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    .line 134
    .end local v0    # "bufReader":Ljava/io/BufferedReader;
    .end local v3    # "inputReader":Ljava/io/InputStreamReader;
    :catchall_1
    move-exception v7

    monitor-exit v8

    throw v7

    .line 160
    .restart local v0    # "bufReader":Ljava/io/BufferedReader;
    .restart local v2    # "e":Ljava/io/IOException;
    .restart local v3    # "inputReader":Ljava/io/InputStreamReader;
    :catch_1
    move-exception v7

    goto :goto_4

    .line 167
    :catch_2
    move-exception v7

    goto :goto_2

    .line 160
    .end local v2    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v9

    goto :goto_6

    .line 167
    :catch_4
    move-exception v9

    goto :goto_7

    .line 160
    .restart local v5    # "line":Ljava/lang/String;
    .restart local v6    # "result":Ljava/lang/String;
    :catch_5
    move-exception v7

    goto :goto_1

    .line 167
    :catch_6
    move-exception v7

    goto :goto_2

    .line 155
    .end local v3    # "inputReader":Ljava/io/InputStreamReader;
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "result":Ljava/lang/String;
    .restart local v4    # "inputReader":Ljava/io/InputStreamReader;
    :catchall_2
    move-exception v7

    move-object v3, v4

    .end local v4    # "inputReader":Ljava/io/InputStreamReader;
    .restart local v3    # "inputReader":Ljava/io/InputStreamReader;
    goto :goto_5

    .end local v0    # "bufReader":Ljava/io/BufferedReader;
    .end local v3    # "inputReader":Ljava/io/InputStreamReader;
    .restart local v1    # "bufReader":Ljava/io/BufferedReader;
    .restart local v4    # "inputReader":Ljava/io/InputStreamReader;
    :catchall_3
    move-exception v7

    move-object v0, v1

    .end local v1    # "bufReader":Ljava/io/BufferedReader;
    .restart local v0    # "bufReader":Ljava/io/BufferedReader;
    move-object v3, v4

    .end local v4    # "inputReader":Ljava/io/InputStreamReader;
    .restart local v3    # "inputReader":Ljava/io/InputStreamReader;
    goto :goto_5

    .line 153
    .end local v3    # "inputReader":Ljava/io/InputStreamReader;
    .restart local v4    # "inputReader":Ljava/io/InputStreamReader;
    :catch_7
    move-exception v2

    move-object v3, v4

    .end local v4    # "inputReader":Ljava/io/InputStreamReader;
    .restart local v3    # "inputReader":Ljava/io/InputStreamReader;
    goto :goto_3

    .end local v0    # "bufReader":Ljava/io/BufferedReader;
    .end local v3    # "inputReader":Ljava/io/InputStreamReader;
    .restart local v1    # "bufReader":Ljava/io/BufferedReader;
    .restart local v4    # "inputReader":Ljava/io/InputStreamReader;
    :catch_8
    move-exception v2

    move-object v0, v1

    .end local v1    # "bufReader":Ljava/io/BufferedReader;
    .restart local v0    # "bufReader":Ljava/io/BufferedReader;
    move-object v3, v4

    .end local v4    # "inputReader":Ljava/io/InputStreamReader;
    .restart local v3    # "inputReader":Ljava/io/InputStreamReader;
    goto :goto_3
.end method

.method private static declared-synchronized syncInitChannelSymbolByEOCDField(Landroid/content/Context;)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 176
    const-class v6, Lcom/boyaa/godsdk/core/GodSDK;

    monitor-enter v6

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 179
    .local v4, "manager":Landroid/content/pm/PackageManager;
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 180
    .local v3, "info":Landroid/content/pm/PackageInfo;
    iget-object v5, v3, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v5, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 181
    .local v0, "dir":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 183
    .local v2, "file":Ljava/io/File;
    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->readComment(Ljava/io/File;)V
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 188
    .end local v0    # "dir":Ljava/lang/String;
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "info":Landroid/content/pm/PackageInfo;
    :goto_0
    monitor-exit v6

    return-void

    .line 185
    :catch_0
    move-exception v1

    .line 186
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :try_start_2
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 176
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v4    # "manager":Landroid/content/pm/PackageManager;
    :catchall_0
    move-exception v5

    monitor-exit v6

    throw v5
.end method


# virtual methods
.method public callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;
    .locals 5
    .param p1, "sdkName"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "map"    # Ljava/util/Map;
    .param p4, "listener"    # Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    .prologue
    .line 675
    :try_start_0
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDK;->mSDKObjectMap:Ljava/util/Map;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDK;->mSDKObjectMap:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 676
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDK;->mSDKObjectMap:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 678
    .local v1, "obj":Ljava/lang/Object;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Ljava/util/Map;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-class v4, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v4, v2, v3

    .line 679
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p3, v3, v4

    const/4 v4, 0x1

    aput-object p4, v3, v4

    .line 677
    invoke-static {p1, p2, v2, v1, v3}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 698
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v2

    .line 681
    :catch_0
    move-exception v0

    .line 682
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "callSpecialMethod "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Exception"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 683
    if-eqz p4, :cond_0

    .line 684
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDK$4;

    invoke-direct {v2, p0, p4}, Lcom/boyaa/godsdk/core/GodSDK$4;-><init>(Lcom/boyaa/godsdk/core/GodSDK;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 698
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method declared-synchronized getActivityRequestCode()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 351
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDK;->mActivityRequestCodeIterator:Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator;

    if-eqz v1, :cond_1

    .line 352
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDK;->mActivityRequestCodeIterator:Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator;

    invoke-interface {v1}, Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 353
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDK;->mActivityRequestCodeIterator:Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator;

    invoke-interface {v1}, Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 354
    .local v0, "requestCode":I
    monitor-exit p0

    return v0

    .line 356
    .end local v0    # "requestCode":I
    :cond_0
    :try_start_1
    new-instance v1, Ljava/lang/Exception;

    const-string v2, "\u6ca1\u6709\u8db3\u591f\u7684Activity Request Code\u53ef\u4f9b\u4f7f\u7528!"

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 351
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 359
    :cond_1
    :try_start_2
    new-instance v1, Ljava/lang/Exception;

    const-string v2, "\u6ca1\u6709\u8bbe\u7f6e\u53ef\u4ee5\u83b7\u53d6Activity Request Code \u7684Iterator!"

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method

.method public getDebugMode()Z
    .locals 1

    .prologue
    .line 566
    iget-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDK;->mDebugMode:Z

    return v0
.end method

.method public getDebugTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 571
    const-string v0, "GodSDK"

    return-object v0
.end method

.method public getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;
    .locals 1

    .prologue
    .line 376
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    return-object v0
.end method

.method getPluginList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;",
            ">;"
        }
    .end annotation

    .prologue
    .line 380
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDK;->mPluginList:Ljava/util/List;

    return-object v0
.end method

.method getPluginListByType(Lcom/boyaa/godsdk/core/IPlugin;)Ljava/util/List;
    .locals 1
    .param p1, "plugin"    # Lcom/boyaa/godsdk/core/IPlugin;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/boyaa/godsdk/core/IPlugin;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 406
    invoke-interface {p1}, Lcom/boyaa/godsdk/core/IPlugin;->getPluginType()Lcom/boyaa/godsdk/core/PluginType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginListByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method getPluginListByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/util/List;
    .locals 10
    .param p1, "pluginType"    # Lcom/boyaa/godsdk/core/PluginType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/boyaa/godsdk/core/PluginType;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 384
    iget-object v6, p0, Lcom/boyaa/godsdk/core/GodSDK;->mPluginList:Ljava/util/List;

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/boyaa/godsdk/core/GodSDK;->mPluginList:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-nez v6, :cond_2

    .line 385
    :cond_0
    const/4 v3, 0x0

    .line 402
    :cond_1
    return-object v3

    .line 387
    :cond_2
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 388
    .local v3, "resultList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    iget-object v6, p0, Lcom/boyaa/godsdk/core/GodSDK;->mPluginList:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_3
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;

    .line 390
    .local v1, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_start_0
    invoke-virtual {v1}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 391
    .local v4, "type1":I
    invoke-virtual {p1}, Lcom/boyaa/godsdk/core/PluginType;->getType()I

    move-result v5

    .line 392
    .local v5, "type2":I
    and-int v2, v4, v5

    .line 393
    .local v2, "result":I
    if-ne v2, v5, :cond_3

    .line 394
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 396
    .end local v2    # "result":I
    .end local v4    # "type1":I
    .end local v5    # "type2":I
    :catch_0
    move-exception v0

    .line 397
    .local v0, "e":Ljava/lang/NumberFormatException;
    sget-object v7, Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 398
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Plugin Type NumberFormatException plugin.getPluginType() = "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 399
    invoke-virtual {v1}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 398
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 397
    invoke-virtual {v7, v8, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
    .locals 2
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 410
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDK;->mSDKObjectMap:Ljava/util/Map;

    if-nez v1, :cond_0

    .line 411
    const/4 v0, 0x0

    .line 414
    :goto_0
    return-object v0

    .line 413
    :cond_0
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDK;->mSDKObjectMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    .line 414
    .local v0, "obj":Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
    goto :goto_0
.end method

.method public getPluginType()Lcom/boyaa/godsdk/core/PluginType;
    .locals 1

    .prologue
    .line 586
    sget-object v0, Lcom/boyaa/godsdk/core/PluginType;->SDK:Lcom/boyaa/godsdk/core/PluginType;

    return-object v0
.end method

.method getSDKListener()Lcom/boyaa/godsdk/callback/SDKListener;
    .locals 1

    .prologue
    .line 423
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDK;->mOutsideSdkListener:Lcom/boyaa/godsdk/callback/SDKListener;

    return-object v0
.end method

.method public getVersionCode()I
    .locals 1

    .prologue
    .line 581
    const/4 v0, 0x2

    return v0
.end method

.method public getVersionName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 576
    const-string v0, "0.0.0.2beta"

    return-object v0
.end method

.method public varargs initSDK(Landroid/app/Activity;Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator;[Ljava/lang/String;)Z
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p3, "notInitSDKs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator",
            "<",
            "Ljava/lang/Integer;",
            ">;[",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 329
    .local p2, "requestCodes":Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator;, "Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 330
    sget-object v1, Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v2, "GodSDK.initSDK\u5df2\u7ecf\u8c03\u7528\u8fc7"

    invoke-virtual {v1, v2}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 331
    const/4 v0, 0x1

    .line 337
    :goto_0
    return v0

    .line 333
    :cond_0
    invoke-direct {p0, p1, p3}, Lcom/boyaa/godsdk/core/GodSDK;->initPluginInfo(Landroid/app/Activity;[Ljava/lang/String;)Z

    move-result v0

    .line 334
    .local v0, "result":Z
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDK;->setActivityRequestCodeIterator(Lcom/boyaa/godsdk/core/GodSDK$IGodSDKIterator;)V

    .line 335
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getInstance()Lcom/boyaa/godsdk/core/GodSDKIAP;

    move-result-object v1

    invoke-virtual {v1}, Lcom/boyaa/godsdk/core/GodSDKIAP;->getSupportingPmodes()Ljava/util/Set;

    .line 336
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getSupportLoginTags()Ljava/util/Set;

    goto :goto_0
.end method

.method public isInitSuccess()Z
    .locals 2

    .prologue
    .line 370
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDK;->mInitLock:Ljava/lang/Object;

    monitor-enter v1

    .line 371
    :try_start_0
    iget-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDK;->mIsInitSuccess:Z

    monitor-exit v1

    return v0

    .line 370
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public declared-synchronized isQuitRequired()Z
    .locals 11

    .prologue
    const/4 v4, 0x1

    .line 591
    monitor-enter p0

    :try_start_0
    iget-boolean v6, p0, Lcom/boyaa/godsdk/core/GodSDK;->mIsQuitRequiredChecked:Z

    if-eqz v6, :cond_1

    .line 592
    iget-object v6, p0, Lcom/boyaa/godsdk/core/GodSDK;->mQuitRequiredClassName:Ljava/util/List;

    if-eqz v6, :cond_0

    .line 593
    iget-object v6, p0, Lcom/boyaa/godsdk/core/GodSDK;->mQuitRequiredClassName:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    if-lez v6, :cond_0

    .line 622
    :goto_0
    monitor-exit p0

    return v4

    .line 596
    :cond_0
    const/4 v4, 0x0

    goto :goto_0

    .line 599
    :cond_1
    const/4 v4, 0x0

    .line 600
    .local v4, "result":Z
    :try_start_1
    iget-object v6, p0, Lcom/boyaa/godsdk/core/GodSDK;->mQuitRequiredClassName:Ljava/util/List;

    if-eqz v6, :cond_3

    .line 601
    iget-object v6, p0, Lcom/boyaa/godsdk/core/GodSDK;->mQuitRequiredClassName:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->clear()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 606
    :goto_1
    :try_start_2
    iget-object v6, p0, Lcom/boyaa/godsdk/core/GodSDK;->mSDKObjectMap:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 607
    .local v1, "classNameSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_2
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_4

    .line 618
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/boyaa/godsdk/core/GodSDK;->mIsQuitRequiredChecked:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 619
    .end local v1    # "classNameSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :catch_0
    move-exception v2

    .line 620
    .local v2, "e":Ljava/lang/Exception;
    :try_start_3
    sget-object v6, Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v7, "isQuitRequired Exception"

    invoke-virtual {v6, v7, v2}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 591
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v4    # "result":Z
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 603
    .restart local v4    # "result":Z
    :cond_3
    :try_start_4
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lcom/boyaa/godsdk/core/GodSDK;->mQuitRequiredClassName:Ljava/util/List;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 607
    .restart local v1    # "classNameSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_4
    :try_start_5
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 608
    .local v0, "className":Ljava/lang/String;
    iget-object v6, p0, Lcom/boyaa/godsdk/core/GodSDK;->mSDKObjectMap:Ljava/util/Map;

    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    .line 610
    .local v5, "sdkObj":Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
    const-class v6, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    const-string v8, "isQuitRequired"

    const/4 v9, 0x0

    .line 611
    const/4 v10, 0x0

    .line 609
    invoke-static {v6, v8, v9, v5, v10}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    .line 612
    .local v3, "flag":Z
    if-eqz v3, :cond_2

    .line 614
    iget-object v6, p0, Lcom/boyaa/godsdk/core/GodSDK;->mQuitRequiredClassName:Ljava/util/List;

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 615
    const/4 v4, 0x1

    goto :goto_2
.end method

.method public printExceptionMsg(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 4
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 702
    new-instance v2, Ljava/io/StringWriter;

    invoke-direct {v2}, Ljava/io/StringWriter;-><init>()V

    .line 703
    .local v2, "sw":Ljava/io/StringWriter;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 704
    .local v1, "pw":Ljava/io/PrintWriter;
    invoke-virtual {p1, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 705
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 706
    .local v0, "cause":Ljava/lang/Throwable;
    :goto_0
    if-nez v0, :cond_0

    .line 710
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 711
    invoke-virtual {v2}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 707
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 708
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_0
.end method

.method public quit(Landroid/app/Activity;)V
    .locals 10
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v4, 0x0

    .line 627
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDK;->isQuitRequired()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 628
    iput v4, p0, Lcom/boyaa/godsdk/core/GodSDK;->mAlreadyQuitSDKNum:I

    .line 629
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDK;->mQuitRequiredClassName:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 654
    :cond_0
    return-void

    .line 629
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 631
    .local v0, "className":Ljava/lang/String;
    :try_start_0
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDK;->mSDKObjectMap:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    .line 632
    .local v2, "sdkObj":Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
    const-class v4, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    const-string v5, "quit"

    .line 633
    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/app/Activity;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const-class v8, Lcom/boyaa/godsdk/callback/SDKListener;

    aput-object v8, v6, v7

    .line 634
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    const/4 v8, 0x1

    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDK;->mInsideListener:Lcom/boyaa/godsdk/callback/SDKListener;

    aput-object v9, v7, v8

    .line 632
    invoke-static {v4, v5, v6, v2, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 636
    .end local v2    # "sdkObj":Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
    :catch_0
    move-exception v1

    .line 637
    .local v1, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/boyaa/godsdk/core/GodSDK;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " quit Exception"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public release(Landroid/app/Activity;)V
    .locals 9
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 658
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDK;->mSDKObjectMap:Ljava/util/Map;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDK;->mSDKObjectMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 659
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDK;->mSDKObjectMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 660
    .local v1, "classNameSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 670
    .end local v1    # "classNameSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_0
    return-void

    .line 660
    .restart local v1    # "classNameSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 662
    .local v0, "className":Ljava/lang/String;
    :try_start_0
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDK;->mSDKObjectMap:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    .line 663
    .local v2, "sdkObj":Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
    const-class v4, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    .line 664
    const-string v5, "release"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/app/Activity;

    aput-object v8, v6, v7

    .line 665
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    .line 663
    invoke-static {v4, v5, v6, v2, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 666
    .end local v2    # "sdkObj":Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method public setDebugMode(Z)V
    .locals 0
    .param p1, "debugMode"    # Z

    .prologue
    .line 561
    iput-boolean p1, p0, Lcom/boyaa/godsdk/core/GodSDK;->mDebugMode:Z

    .line 562
    return-void
.end method

.method public setSDKListener(Lcom/boyaa/godsdk/callback/SDKListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/boyaa/godsdk/callback/SDKListener;

    .prologue
    .line 419
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDK;->mOutsideSdkListener:Lcom/boyaa/godsdk/callback/SDKListener;

    .line 420
    return-void
.end method
