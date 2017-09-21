.class public Lcom/boyaa/godsdk/core/GodSDKAds;
.super Ljava/lang/Object;
.source "GodSDKAds.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/IAdsPlugin;


# static fields
.field private static final ADS_PLUGIN_PROTOCOL:Ljava/lang/Class;

.field private static final TAG:Ljava/lang/String; = "GodSDKAds"

.field private static instance:Lcom/boyaa/godsdk/core/GodSDKAds;


# instance fields
.field private mAdsChannelPriorityList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

.field private mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

.field private mDebugMode:Z

.field private mSupportingAdsChannelsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lcom/boyaa/godsdk/protocol/AdsPluginProtocol;

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKAds;->ADS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 37
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKAds;->instance:Lcom/boyaa/godsdk/core/GodSDKAds;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    .line 53
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebugMode:Z

    .line 64
    new-instance v0, Lcom/boyaa/godsdk/core/utils/Debug;

    invoke-direct {v0, p0}, Lcom/boyaa/godsdk/core/utils/Debug;-><init>(Lcom/boyaa/godsdk/core/IDebugable;)V

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 65
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/godsdk/core/GodSDKAds;)Lcom/boyaa/godsdk/callback/AdsListener;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    return-object v0
.end method

.method private getAdsChannelByClassName(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 403
    :try_start_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v4

    .line 404
    invoke-virtual {v4, p1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 405
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->ADVERTISEMENT:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v2

    .line 407
    .local v2, "obj":Ljava/lang/Object;
    sget-object v4, Lcom/boyaa/godsdk/core/GodSDKAds;->ADS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v5, "getAdsChannel"

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 406
    invoke-static {v4, v5, v6, v2, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 412
    .end local v2    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v0

    .line 409
    :catch_0
    move-exception v1

    .line 410
    .local v1, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v5, "getAdsChannelByClassName Exception"

    invoke-virtual {v4, v5, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v0, v3

    .line 412
    goto :goto_0
.end method

.method public static getInstance()Lcom/boyaa/godsdk/core/GodSDKAds;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKAds;->instance:Lcom/boyaa/godsdk/core/GodSDKAds;

    if-nez v0, :cond_0

    .line 41
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAds;->syncInit()V

    .line 43
    :cond_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKAds;->instance:Lcom/boyaa/godsdk/core/GodSDKAds;

    return-object v0
.end method

.method private getPluginObjectByAdsChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
    .locals 3
    .param p1, "AdsChannel"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 417
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAds;->getSupportingAdsChannelsMap()Ljava/util/Map;

    move-result-object v0

    .line 418
    .local v0, "AdsChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 419
    .local v1, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    return-object v2
.end method

.method private getSupportingAdsChannelsMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 369
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mSupportingAdsChannelsMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 370
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAds;->initSupporingAdsChannels()V

    .line 372
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mSupportingAdsChannelsMap:Ljava/util/Map;

    return-object v0
.end method

.method private declared-synchronized initDefaultAdsChannelPriorityList()V
    .locals 15

    .prologue
    .line 437
    monitor-enter p0

    :try_start_0
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsChannelPriorityList:Ljava/util/List;

    if-nez v9, :cond_0

    .line 438
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsChannelPriorityList:Ljava/util/List;

    .line 440
    :cond_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginList()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v5

    .line 442
    .local v5, "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :try_start_1
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_1
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v9

    if-nez v9, :cond_2

    .line 472
    :goto_1
    monitor-exit p0

    return-void

    .line 442
    :cond_2
    :try_start_2
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 444
    .local v4, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_start_3
    invoke-virtual {v4}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 445
    .local v7, "type1":I
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAds;->getPluginType()Lcom/boyaa/godsdk/core/PluginType;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/godsdk/core/PluginType;->getType()I

    move-result v8

    .line 446
    .local v8, "type2":I
    and-int v6, v7, v8

    .line 448
    .local v6, "result":I
    if-ne v6, v8, :cond_1

    .line 450
    invoke-virtual {v4}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v9

    .line 449
    invoke-direct {p0, v9}, Lcom/boyaa/godsdk/core/GodSDKAds;->getAdsChannelByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 450
    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 451
    .local v2, "AdsChannelstrs":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 453
    const-string v9, "[,_\\-;]"

    invoke-virtual {v2, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 454
    .local v1, "AdsChannels":[Ljava/lang/String;
    array-length v11, v1

    const/4 v9, 0x0

    :goto_2
    if-lt v9, v11, :cond_4

    .line 460
    .end local v1    # "AdsChannels":[Ljava/lang/String;
    :cond_3
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "initDefaultAdsChannelPriorityList AdsChannels list="

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 461
    const/4 v12, 0x1

    new-array v12, v12, [Ljava/util/List;

    const/4 v13, 0x0

    iget-object v14, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsChannelPriorityList:Ljava/util/List;

    aput-object v14, v12, v13

    invoke-static {v12}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 460
    invoke-virtual {v9, v11}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 463
    .end local v2    # "AdsChannelstrs":Ljava/lang/String;
    .end local v6    # "result":I
    .end local v7    # "type1":I
    .end local v8    # "type2":I
    :catch_0
    move-exception v3

    .line 464
    .local v3, "e":Ljava/lang/NumberFormatException;
    :try_start_4
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 465
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "initDefaultAdsChannelPriorityList Plugin Type NumberFormatException plugin.getPluginType() = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 466
    invoke-virtual {v4}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 465
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 464
    invoke-virtual {v9, v11, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 469
    .end local v3    # "e":Ljava/lang/NumberFormatException;
    .end local v4    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :catch_1
    move-exception v3

    .line 470
    .local v3, "e":Ljava/lang/Exception;
    :try_start_5
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v10, "initDefaultAdsChannelPriorityList Exception"

    invoke-virtual {v9, v10, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 437
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v5    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :catchall_0
    move-exception v9

    monitor-exit p0

    throw v9

    .line 454
    .restart local v1    # "AdsChannels":[Ljava/lang/String;
    .restart local v2    # "AdsChannelstrs":Ljava/lang/String;
    .restart local v4    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    .restart local v5    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    .restart local v6    # "result":I
    .restart local v7    # "type1":I
    .restart local v8    # "type2":I
    :cond_4
    :try_start_6
    aget-object v0, v1, v9

    .line 455
    .local v0, "AdsChannel":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_5

    .line 456
    iget-object v12, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsChannelPriorityList:Ljava/util/List;

    invoke-interface {v12, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 454
    :cond_5
    add-int/lit8 v9, v9, 0x1

    goto :goto_2
.end method

.method private declared-synchronized initSupporingAdsChannels()V
    .locals 11

    .prologue
    .line 376
    monitor-enter p0

    :try_start_0
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mSupportingAdsChannelsMap:Ljava/util/Map;

    if-nez v7, :cond_1

    .line 377
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mSupportingAdsChannelsMap:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 379
    :try_start_1
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    .line 380
    invoke-virtual {v7, p0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginListByType(Lcom/boyaa/godsdk/core/IPlugin;)Ljava/util/List;

    move-result-object v6

    .line 381
    .local v6, "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v7

    if-nez v7, :cond_2

    .line 399
    .end local v6    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    .line 381
    .restart local v6    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :cond_2
    :try_start_2
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;

    .line 382
    .local v5, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    invoke-virtual {v5}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v3

    .line 383
    .local v3, "className":Ljava/lang/String;
    invoke-direct {p0, v3}, Lcom/boyaa/godsdk/core/GodSDKAds;->getAdsChannelByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 384
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 385
    .local v2, "AdsChannelstrs":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 386
    const-string v7, "[,_\\-;]"

    invoke-virtual {v2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 387
    .local v1, "AdsChannels":[Ljava/lang/String;
    array-length v9, v1

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v9, :cond_0

    aget-object v0, v1, v7

    .line 388
    .local v0, "AdsChannel":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_3

    .line 389
    iget-object v10, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mSupportingAdsChannelsMap:Ljava/util/Map;

    invoke-interface {v10, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 387
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 395
    .end local v0    # "AdsChannel":Ljava/lang/String;
    .end local v1    # "AdsChannels":[Ljava/lang/String;
    .end local v2    # "AdsChannelstrs":Ljava/lang/String;
    .end local v3    # "className":Ljava/lang/String;
    .end local v5    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    .end local v6    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :catch_0
    move-exception v4

    .line 396
    .local v4, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v8, "initSupporingAdsChannelTags Exception"

    invoke-virtual {v7, v8, v4}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 376
    .end local v4    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7
.end method

.method private requestHideAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "adsChannel"    # Ljava/lang/String;
    .param p3, "adsType"    # Lcom/boyaa/godsdk/core/AdsType;
    .param p4, "adsMode"    # Lcom/boyaa/godsdk/core/AdsMode;
    .param p5, "params"    # Ljava/lang/String;

    .prologue
    .line 327
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAds;->getPluginObjectByAdsChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 328
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->ADVERTISEMENT:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 329
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAds;->ADS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "hideAds"

    .line 330
    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Lcom/boyaa/godsdk/core/AdsType;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    .line 331
    const-class v6, Lcom/boyaa/godsdk/core/AdsMode;

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-class v6, Lcom/boyaa/godsdk/callback/AdsListener;

    aput-object v6, v4, v5

    .line 332
    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p3, v5, v6

    const/4 v6, 0x2

    aput-object p5, v5, v6

    const/4 v6, 0x3

    aput-object p4, v5, v6

    const/4 v6, 0x4

    .line 333
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    aput-object v7, v5, v6

    .line 329
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 351
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 334
    :catch_0
    move-exception v0

    .line 335
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKAds.hideAds Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 336
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    if-eqz v2, :cond_0

    .line 337
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKAds$6;

    invoke-direct {v2, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAds$6;-><init>(Lcom/boyaa/godsdk/core/GodSDKAds;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private requestPreloadAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "adsChannel"    # Ljava/lang/String;
    .param p3, "adsType"    # Lcom/boyaa/godsdk/core/AdsType;
    .param p4, "adsMode"    # Lcom/boyaa/godsdk/core/AdsMode;
    .param p5, "params"    # Ljava/lang/String;

    .prologue
    .line 136
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAds;->getPluginObjectByAdsChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 137
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->ADVERTISEMENT:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 138
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAds;->ADS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "preloadAds"

    .line 139
    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Lcom/boyaa/godsdk/core/AdsType;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    .line 140
    const-class v6, Lcom/boyaa/godsdk/core/AdsMode;

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-class v6, Lcom/boyaa/godsdk/callback/AdsListener;

    aput-object v6, v4, v5

    .line 141
    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p3, v5, v6

    const/4 v6, 0x2

    aput-object p5, v5, v6

    const/4 v6, 0x3

    aput-object p4, v5, v6

    const/4 v6, 0x4

    .line 142
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    aput-object v7, v5, v6

    .line 138
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 160
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 143
    :catch_0
    move-exception v0

    .line 144
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKAds.preloadAds Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 145
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    if-eqz v2, :cond_0

    .line 146
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKAds$2;

    invoke-direct {v2, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAds$2;-><init>(Lcom/boyaa/godsdk/core/GodSDKAds;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private requestQueryPoints(Ljava/lang/String;)F
    .locals 6
    .param p1, "adsChannel"    # Ljava/lang/String;

    .prologue
    .line 605
    :try_start_0
    invoke-direct {p0, p1}, Lcom/boyaa/godsdk/core/GodSDKAds;->getPluginObjectByAdsChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 606
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->ADVERTISEMENT:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 607
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAds;->ADS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 608
    const-string v3, "queryPoints"

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 607
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 608
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    int-to-float v2, v2

    .line 625
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return v2

    .line 609
    :catch_0
    move-exception v0

    .line 610
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKAds.queryPoints Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 611
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    if-eqz v2, :cond_0

    .line 612
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKAds$8;

    invoke-direct {v2, p0, p1}, Lcom/boyaa/godsdk/core/GodSDKAds$8;-><init>(Lcom/boyaa/godsdk/core/GodSDKAds;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 625
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private requestShowAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "adsChannel"    # Ljava/lang/String;
    .param p3, "adsType"    # Lcom/boyaa/godsdk/core/AdsType;
    .param p4, "adsMode"    # Lcom/boyaa/godsdk/core/AdsMode;
    .param p5, "params"    # Ljava/lang/String;

    .prologue
    .line 231
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAds;->getPluginObjectByAdsChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 232
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->ADVERTISEMENT:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 233
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAds;->ADS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "showAds"

    .line 234
    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Lcom/boyaa/godsdk/core/AdsType;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    .line 235
    const-class v6, Lcom/boyaa/godsdk/core/AdsMode;

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-class v6, Lcom/boyaa/godsdk/callback/AdsListener;

    aput-object v6, v4, v5

    .line 236
    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p3, v5, v6

    const/4 v6, 0x2

    aput-object p5, v5, v6

    const/4 v6, 0x3

    aput-object p4, v5, v6

    const/4 v6, 0x4

    .line 237
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    aput-object v7, v5, v6

    .line 233
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 255
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 238
    :catch_0
    move-exception v0

    .line 239
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKAds.showAds Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 240
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    if-eqz v2, :cond_0

    .line 241
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKAds$4;

    invoke-direct {v2, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAds$4;-><init>(Lcom/boyaa/godsdk/core/GodSDKAds;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private requestSpendPoints(Ljava/lang/String;I)V
    .locals 8
    .param p1, "adsChannel"    # Ljava/lang/String;
    .param p2, "points"    # I

    .prologue
    .line 636
    :try_start_0
    invoke-direct {p0, p1}, Lcom/boyaa/godsdk/core/GodSDKAds;->getPluginObjectByAdsChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 637
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->ADVERTISEMENT:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 638
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAds;->ADS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "spendPoints"

    .line 639
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    .line 638
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 657
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 640
    :catch_0
    move-exception v0

    .line 641
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKAds.spendPoints Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 642
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    if-eqz v2, :cond_0

    .line 643
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKAds$9;

    invoke-direct {v2, p0, p1}, Lcom/boyaa/godsdk/core/GodSDKAds$9;-><init>(Lcom/boyaa/godsdk/core/GodSDKAds;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private static declared-synchronized syncInit()V
    .locals 2

    .prologue
    .line 47
    const-class v1, Lcom/boyaa/godsdk/core/GodSDKAds;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKAds;->instance:Lcom/boyaa/godsdk/core/GodSDKAds;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKAds;

    invoke-direct {v0}, Lcom/boyaa/godsdk/core/GodSDKAds;-><init>()V

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKAds;->instance:Lcom/boyaa/godsdk/core/GodSDKAds;
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


# virtual methods
.method public callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;
    .locals 7
    .param p1, "adsChannel"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "map"    # Ljava/util/Map;
    .param p4, "listener"    # Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    .prologue
    .line 524
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAds;->getSupportingAdsChannelsMap()Ljava/util/Map;

    move-result-object v0

    .line 525
    .local v0, "AdsChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 526
    .local v1, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v4

    .line 527
    invoke-virtual {v4, v1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 528
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->ADVERTISEMENT:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v3

    .line 529
    .local v3, "obj":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 531
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/util/Map;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v6, v4, v5

    .line 532
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p3, v5, v6

    const/4 v6, 0x1

    aput-object p4, v5, v6

    .line 530
    invoke-static {v1, p2, v4, v3, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 550
    .end local v0    # "AdsChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "className":Ljava/lang/String;
    .end local v3    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v4

    .line 533
    :catch_0
    move-exception v2

    .line 534
    .local v2, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "callSpecialMethod "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "Exception"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v2}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 535
    if-eqz p4, :cond_0

    .line 536
    new-instance v4, Lcom/boyaa/godsdk/core/GodSDKAds$7;

    invoke-direct {v4, p0, p4}, Lcom/boyaa/godsdk/core/GodSDKAds$7;-><init>(Lcom/boyaa/godsdk/core/GodSDKAds;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)V

    invoke-static {v4}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 550
    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public callSpecialMethod(Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "map"    # Ljava/util/Map;
    .param p3, "listener"    # Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    .prologue
    .line 512
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAds;->getDefaultAdsChannel()Ljava/lang/String;

    move-result-object v0

    .line 513
    .local v0, "mAdsChannel":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 514
    const/4 v1, 0x0

    .line 516
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKAds;->callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public getAdsListener()Lcom/boyaa/godsdk/callback/AdsListener;
    .locals 1

    .prologue
    .line 359
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    return-object v0
.end method

.method public getDebugMode()Z
    .locals 1

    .prologue
    .line 567
    iget-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebugMode:Z

    return v0
.end method

.method public getDebugTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 573
    const-string v0, "GodSDKAds"

    return-object v0
.end method

.method public getDefaultAdsChannel()Ljava/lang/String;
    .locals 3

    .prologue
    .line 424
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsChannelPriorityList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 425
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAds;->initDefaultAdsChannelPriorityList()V

    .line 427
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getDefaultAdsChannelTag mAdsChannelPriorityList == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 428
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsChannelPriorityList:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 427
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 429
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsChannelPriorityList:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 430
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsChannelPriorityList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 431
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsChannelPriorityList:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 433
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPluginType()Lcom/boyaa/godsdk/core/PluginType;
    .locals 1

    .prologue
    .line 556
    sget-object v0, Lcom/boyaa/godsdk/core/PluginType;->ADVERTISEMENT:Lcom/boyaa/godsdk/core/PluginType;

    return-object v0
.end method

.method public getSupportingAdsChannels()Ljava/util/Set;
    .locals 2
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
    .line 364
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAds;->getSupportingAdsChannelsMap()Ljava/util/Map;

    move-result-object v0

    .line 365
    .local v0, "mAdsChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public hideAds(Landroid/app/Activity;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
    .locals 10
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "adsType"    # Lcom/boyaa/godsdk/core/AdsType;
    .param p3, "adsMode"    # Lcom/boyaa/godsdk/core/AdsMode;
    .param p4, "params"    # Ljava/lang/String;

    .prologue
    const/4 v9, -0x2

    .line 287
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, p4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 288
    .local v7, "json":Lorg/json/JSONObject;
    const-string v0, "AdsChannel"

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .local v2, "mAdsChannel":Ljava/lang/String;
    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    .line 289
    invoke-virtual/range {v0 .. v5}, Lcom/boyaa/godsdk/core/GodSDKAds;->hideAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 297
    .end local v2    # "mAdsChannel":Ljava/lang/String;
    .end local v7    # "json":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 290
    :catch_0
    move-exception v6

    .line 291
    .local v6, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v8

    .line 292
    .local v8, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v8, v9}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 293
    invoke-virtual {v8, v9}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 294
    const-string v0, "\u5e7f\u544a\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709AdsChannel\u5b57\u6bb5"

    invoke-virtual {v8, v0}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 295
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    const/4 v1, 0x0

    invoke-interface {v0, v8, v1}, Lcom/boyaa/godsdk/callback/AdsListener;->onCallBack(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public hideAds(Landroid/app/Activity;Lcom/boyaa/godsdk/core/AdsType;Ljava/lang/String;)V
    .locals 10
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "adsType"    # Lcom/boyaa/godsdk/core/AdsType;
    .param p3, "params"    # Ljava/lang/String;

    .prologue
    const/4 v9, -0x2

    .line 270
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 271
    .local v7, "json":Lorg/json/JSONObject;
    const-string v0, "AdsChannel"

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 272
    .local v2, "mAdsChannel":Ljava/lang/String;
    sget-object v4, Lcom/boyaa/godsdk/core/AdsMode;->ADS_MODE_PAUSE:Lcom/boyaa/godsdk/core/AdsMode;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/boyaa/godsdk/core/GodSDKAds;->hideAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 281
    .end local v2    # "mAdsChannel":Ljava/lang/String;
    .end local v7    # "json":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 274
    :catch_0
    move-exception v6

    .line 275
    .local v6, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v8

    .line 276
    .local v8, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v8, v9}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 277
    invoke-virtual {v8, v9}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 278
    const-string v0, "\u5e7f\u544a\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709AdsChannel\u5b57\u6bb5"

    invoke-virtual {v8, v0}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 279
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    const/4 v1, 0x0

    invoke-interface {v0, v8, v1}, Lcom/boyaa/godsdk/callback/AdsListener;->onCallBack(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public hideAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "adsChannel"    # Ljava/lang/String;
    .param p3, "adsType"    # Lcom/boyaa/godsdk/core/AdsType;
    .param p4, "adsMode"    # Lcom/boyaa/godsdk/core/AdsMode;
    .param p5, "params"    # Ljava/lang/String;

    .prologue
    .line 302
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKAds.hideAds parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", AdsChannel = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 303
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 302
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 304
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 305
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    if-eqz v0, :cond_0

    .line 306
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKAds$5;

    invoke-direct {v0, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAds$5;-><init>(Lcom/boyaa/godsdk/core/GodSDKAds;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 322
    :cond_0
    :goto_0
    return-void

    .line 321
    :cond_1
    invoke-direct/range {p0 .. p5}, Lcom/boyaa/godsdk/core/GodSDKAds;->requestHideAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public hideAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Ljava/lang/String;)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "adsChannel"    # Ljava/lang/String;
    .param p3, "adsType"    # Lcom/boyaa/godsdk/core/AdsType;
    .param p4, "params"    # Ljava/lang/String;

    .prologue
    .line 260
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKAds.hideAds parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", AdsChannel = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 261
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 260
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 263
    sget-object v4, Lcom/boyaa/godsdk/core/AdsMode;->ADS_MODE_PAUSE:Lcom/boyaa/godsdk/core/AdsMode;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/boyaa/godsdk/core/GodSDKAds;->hideAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V

    .line 265
    return-void
.end method

.method public isSupportMethod(Ljava/lang/String;)Z
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 476
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAds;->getDefaultAdsChannel()Ljava/lang/String;

    move-result-object v0

    .line 477
    .local v0, "mAdsChannel":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 478
    const/4 v1, 0x0

    .line 480
    :goto_0
    return v1

    :cond_0
    invoke-virtual {p0, v0, p1}, Lcom/boyaa/godsdk/core/GodSDKAds;->isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 10
    .param p1, "adsChannel"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 487
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAds;->getSupportingAdsChannelsMap()Ljava/util/Map;

    move-result-object v0

    .line 488
    .local v0, "AdsChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 489
    .local v1, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    .line 490
    invoke-virtual {v7, v1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v7

    .line 491
    sget-object v8, Lcom/boyaa/godsdk/core/PluginType;->ADVERTISEMENT:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v7, v8}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v4

    .line 492
    .local v4, "obj":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 493
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "isSupportMethod className == "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 494
    const-string v9, " isLocalClass == "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->isLocalClass()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 495
    const-string v9, ", isMemberClass == "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->isMemberClass()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 493
    invoke-virtual {v7, v8}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 497
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Ljava/util/Map;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-class v9, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v9, v7, v8

    .line 496
    invoke-static {v1, p2, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->getMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 498
    .local v3, "method":Ljava/lang/reflect/Method;
    if-eqz v3, :cond_0

    .line 506
    .end local v0    # "AdsChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "className":Ljava/lang/String;
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "obj":Ljava/lang/Object;
    :goto_0
    return v5

    .restart local v0    # "AdsChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v1    # "className":Ljava/lang/String;
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    .restart local v4    # "obj":Ljava/lang/Object;
    :cond_0
    move v5, v6

    .line 501
    goto :goto_0

    .line 503
    .end local v0    # "AdsChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "className":Ljava/lang/String;
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 504
    .local v2, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v7, "isSupportMethod Exception"

    invoke-virtual {v5, v7, v2}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move v5, v6

    .line 506
    goto :goto_0
.end method

.method public preloadAds(Landroid/app/Activity;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
    .locals 10
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "adsType"    # Lcom/boyaa/godsdk/core/AdsType;
    .param p3, "adsMode"    # Lcom/boyaa/godsdk/core/AdsMode;
    .param p4, "params"    # Ljava/lang/String;

    .prologue
    const/4 v9, -0x2

    .line 96
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, p4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 97
    .local v7, "json":Lorg/json/JSONObject;
    const-string v0, "AdsChannel"

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .local v2, "mAdsChannel":Ljava/lang/String;
    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    .line 98
    invoke-virtual/range {v0 .. v5}, Lcom/boyaa/godsdk/core/GodSDKAds;->preloadAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .end local v2    # "mAdsChannel":Ljava/lang/String;
    .end local v7    # "json":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 99
    :catch_0
    move-exception v6

    .line 100
    .local v6, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v8

    .line 101
    .local v8, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v8, v9}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 102
    invoke-virtual {v8, v9}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 103
    const-string v0, "\u5e7f\u544a\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709AdsChannel\u5b57\u6bb5"

    invoke-virtual {v8, v0}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 104
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    const/4 v1, 0x0

    invoke-interface {v0, v8, v1}, Lcom/boyaa/godsdk/callback/AdsListener;->onCallBack(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public preloadAds(Landroid/app/Activity;Lcom/boyaa/godsdk/core/AdsType;Ljava/lang/String;)V
    .locals 10
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "adsType"    # Lcom/boyaa/godsdk/core/AdsType;
    .param p3, "params"    # Ljava/lang/String;

    .prologue
    const/4 v9, -0x2

    .line 79
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 80
    .local v7, "json":Lorg/json/JSONObject;
    const-string v0, "AdsChannel"

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 81
    .local v2, "mAdsChannel":Ljava/lang/String;
    sget-object v4, Lcom/boyaa/godsdk/core/AdsMode;->ADS_MODE_PAUSE:Lcom/boyaa/godsdk/core/AdsMode;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/boyaa/godsdk/core/GodSDKAds;->preloadAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    .end local v2    # "mAdsChannel":Ljava/lang/String;
    .end local v7    # "json":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 83
    :catch_0
    move-exception v6

    .line 84
    .local v6, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v8

    .line 85
    .local v8, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v8, v9}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 86
    invoke-virtual {v8, v9}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 87
    const-string v0, "\u5e7f\u544a\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709AdsChannel\u5b57\u6bb5"

    invoke-virtual {v8, v0}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 88
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    const/4 v1, 0x0

    invoke-interface {v0, v8, v1}, Lcom/boyaa/godsdk/callback/AdsListener;->onCallBack(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public preloadAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "adsChannel"    # Ljava/lang/String;
    .param p3, "adsType"    # Lcom/boyaa/godsdk/core/AdsType;
    .param p4, "adsMode"    # Lcom/boyaa/godsdk/core/AdsMode;
    .param p5, "params"    # Ljava/lang/String;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKAds.preloadAds parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", AdsChannel = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 112
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 111
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 113
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 114
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    if-eqz v0, :cond_0

    .line 115
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKAds$1;

    invoke-direct {v0, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAds$1;-><init>(Lcom/boyaa/godsdk/core/GodSDKAds;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 131
    :cond_0
    :goto_0
    return-void

    .line 130
    :cond_1
    invoke-direct/range {p0 .. p5}, Lcom/boyaa/godsdk/core/GodSDKAds;->requestPreloadAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public preloadAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Ljava/lang/String;)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "adsChannel"    # Ljava/lang/String;
    .param p3, "adsType"    # Lcom/boyaa/godsdk/core/AdsType;
    .param p4, "params"    # Ljava/lang/String;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKAds.preloadAds parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", AdsChannel = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 71
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 72
    sget-object v4, Lcom/boyaa/godsdk/core/AdsMode;->ADS_MODE_PAUSE:Lcom/boyaa/godsdk/core/AdsMode;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/boyaa/godsdk/core/GodSDKAds;->preloadAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V

    .line 74
    return-void
.end method

.method public queryPoints()F
    .locals 2

    .prologue
    .line 582
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAds;->getDefaultAdsChannel()Ljava/lang/String;

    move-result-object v0

    .line 583
    .local v0, "mAdsChannel":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/boyaa/godsdk/core/GodSDKAds;->requestQueryPoints(Ljava/lang/String;)F

    move-result v1

    return v1
.end method

.method public queryPoints(Ljava/lang/String;)F
    .locals 1
    .param p1, "adsChannel"    # Ljava/lang/String;

    .prologue
    .line 600
    invoke-direct {p0, p1}, Lcom/boyaa/godsdk/core/GodSDKAds;->requestQueryPoints(Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public setAdsListener(Lcom/boyaa/godsdk/callback/AdsListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/boyaa/godsdk/callback/AdsListener;

    .prologue
    .line 355
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    .line 356
    return-void
.end method

.method public setDebugMode(Z)V
    .locals 0
    .param p1, "debugMode"    # Z

    .prologue
    .line 561
    iput-boolean p1, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebugMode:Z

    .line 562
    return-void
.end method

.method public showAds(Landroid/app/Activity;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
    .locals 10
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "adsType"    # Lcom/boyaa/godsdk/core/AdsType;
    .param p3, "adsMode"    # Lcom/boyaa/godsdk/core/AdsMode;
    .param p4, "params"    # Ljava/lang/String;

    .prologue
    const/4 v9, -0x2

    .line 191
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, p4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 192
    .local v7, "json":Lorg/json/JSONObject;
    const-string v0, "AdsChannel"

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .local v2, "mAdsChannel":Ljava/lang/String;
    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    .line 193
    invoke-virtual/range {v0 .. v5}, Lcom/boyaa/godsdk/core/GodSDKAds;->showAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    .end local v2    # "mAdsChannel":Ljava/lang/String;
    .end local v7    # "json":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 194
    :catch_0
    move-exception v6

    .line 195
    .local v6, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v8

    .line 196
    .local v8, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v8, v9}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 197
    invoke-virtual {v8, v9}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 198
    const-string v0, "\u5e7f\u544a\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709AdsChannel\u5b57\u6bb5"

    invoke-virtual {v8, v0}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 199
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    const/4 v1, 0x0

    invoke-interface {v0, v8, v1}, Lcom/boyaa/godsdk/callback/AdsListener;->onCallBack(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public showAds(Landroid/app/Activity;Lcom/boyaa/godsdk/core/AdsType;Ljava/lang/String;)V
    .locals 10
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "adsType"    # Lcom/boyaa/godsdk/core/AdsType;
    .param p3, "params"    # Ljava/lang/String;

    .prologue
    const/4 v9, -0x2

    .line 174
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 175
    .local v7, "json":Lorg/json/JSONObject;
    const-string v0, "AdsChannel"

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 176
    .local v2, "mAdsChannel":Ljava/lang/String;
    sget-object v4, Lcom/boyaa/godsdk/core/AdsMode;->ADS_MODE_PAUSE:Lcom/boyaa/godsdk/core/AdsMode;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/boyaa/godsdk/core/GodSDKAds;->showAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    .end local v2    # "mAdsChannel":Ljava/lang/String;
    .end local v7    # "json":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 178
    :catch_0
    move-exception v6

    .line 179
    .local v6, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v8

    .line 180
    .local v8, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v8, v9}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 181
    invoke-virtual {v8, v9}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 182
    const-string v0, "\u5e7f\u544a\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709AdsChannel\u5b57\u6bb5"

    invoke-virtual {v8, v0}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 183
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    const/4 v1, 0x0

    invoke-interface {v0, v8, v1}, Lcom/boyaa/godsdk/callback/AdsListener;->onCallBack(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public showAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "adsChannel"    # Ljava/lang/String;
    .param p3, "adsType"    # Lcom/boyaa/godsdk/core/AdsType;
    .param p4, "adsMode"    # Lcom/boyaa/godsdk/core/AdsMode;
    .param p5, "params"    # Ljava/lang/String;

    .prologue
    .line 206
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKAds.showAds parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", AdsChannel = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 207
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 206
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 208
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 209
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mAdsListener:Lcom/boyaa/godsdk/callback/AdsListener;

    if-eqz v0, :cond_0

    .line 210
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKAds$3;

    invoke-direct {v0, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAds$3;-><init>(Lcom/boyaa/godsdk/core/GodSDKAds;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 226
    :cond_0
    :goto_0
    return-void

    .line 225
    :cond_1
    invoke-direct/range {p0 .. p5}, Lcom/boyaa/godsdk/core/GodSDKAds;->requestShowAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public showAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Ljava/lang/String;)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "adsChannel"    # Ljava/lang/String;
    .param p3, "adsType"    # Lcom/boyaa/godsdk/core/AdsType;
    .param p4, "params"    # Ljava/lang/String;

    .prologue
    .line 165
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAds;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKAds.showAds parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", AdsChannel = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 166
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 165
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 167
    sget-object v4, Lcom/boyaa/godsdk/core/AdsMode;->ADS_MODE_PAUSE:Lcom/boyaa/godsdk/core/AdsMode;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/boyaa/godsdk/core/GodSDKAds;->showAds(Landroid/app/Activity;Ljava/lang/String;Lcom/boyaa/godsdk/core/AdsType;Lcom/boyaa/godsdk/core/AdsMode;Ljava/lang/String;)V

    .line 169
    return-void
.end method

.method public spendPoints(I)V
    .locals 1
    .param p1, "points"    # I

    .prologue
    .line 593
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAds;->getDefaultAdsChannel()Ljava/lang/String;

    move-result-object v0

    .line 594
    .local v0, "mAdsChannel":Ljava/lang/String;
    invoke-direct {p0, v0, p1}, Lcom/boyaa/godsdk/core/GodSDKAds;->requestSpendPoints(Ljava/lang/String;I)V

    .line 595
    return-void
.end method

.method public spendPoints(Ljava/lang/String;I)V
    .locals 0
    .param p1, "adsChannel"    # Ljava/lang/String;
    .param p2, "points"    # I

    .prologue
    .line 631
    invoke-direct {p0, p1, p2}, Lcom/boyaa/godsdk/core/GodSDKAds;->requestSpendPoints(Ljava/lang/String;I)V

    .line 632
    return-void
.end method
