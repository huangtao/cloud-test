.class public Lcom/boyaa/godsdk/core/GodSDKShare;
.super Ljava/lang/Object;
.source "GodSDKShare.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/ISharePlugin;


# static fields
.field public static final ACTION_AUTHORIZING:I = 0x1

.field public static final ACTION_FOLLOWING_USER:I = 0x6

.field public static final ACTION_GETTING_FRIEND_LIST:I = 0x2

.field public static final ACTION_SENDING_DIRECT_MESSAGE:I = 0x5

.field public static final ACTION_SHARE:I = 0x9

.field public static final ACTION_TIMELINE:I = 0x7

.field public static final ACTION_USER_INFOR:I = 0x8

.field private static final SHARE_PLUGIN_PROTOCOL:Ljava/lang/Class;

.field private static final TAG:Ljava/lang/String; = "GodSDKShare"

.field private static instance:Lcom/boyaa/godsdk/core/GodSDKShare;


# instance fields
.field private mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

.field private mDebugMode:Z

.field private mShareChannelPriorityList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

.field private mSupportingShareChannelsMap:Ljava/util/Map;
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
    const-class v0, Lcom/boyaa/godsdk/protocol/SharePluginProtocol;

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKShare;->SHARE_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 54
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKShare;->instance:Lcom/boyaa/godsdk/core/GodSDKShare;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    .line 70
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebugMode:Z

    .line 81
    new-instance v0, Lcom/boyaa/godsdk/core/utils/Debug;

    invoke-direct {v0, p0}, Lcom/boyaa/godsdk/core/utils/Debug;-><init>(Lcom/boyaa/godsdk/core/IDebugable;)V

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 82
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/godsdk/core/GodSDKShare;)Lcom/boyaa/godsdk/callback/ShareListener;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    return-object v0
.end method

.method public static getInstance()Lcom/boyaa/godsdk/core/GodSDKShare;
    .locals 1

    .prologue
    .line 57
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKShare;->instance:Lcom/boyaa/godsdk/core/GodSDKShare;

    if-nez v0, :cond_0

    .line 58
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKShare;->syncInit()V

    .line 60
    :cond_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKShare;->instance:Lcom/boyaa/godsdk/core/GodSDKShare;

    return-object v0
.end method

.method private getPluginObjectByShareChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
    .locals 3
    .param p1, "shareChannel"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 496
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKShare;->getSupportingShareChannelsMap()Ljava/util/Map;

    move-result-object v0

    .line 497
    .local v0, "ShareChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 498
    .local v1, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    return-object v2
.end method

.method private getShareChannelByClassName(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 482
    :try_start_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v4

    .line 483
    invoke-virtual {v4, p1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 484
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->SHARE:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v2

    .line 486
    .local v2, "obj":Ljava/lang/Object;
    sget-object v4, Lcom/boyaa/godsdk/core/GodSDKShare;->SHARE_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v5, "getShareChannel"

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 485
    invoke-static {v4, v5, v6, v2, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 491
    .end local v2    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v0

    .line 488
    :catch_0
    move-exception v1

    .line 489
    .local v1, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v5, "getShareChannelByClassName Exception"

    invoke-virtual {v4, v5, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v0, v3

    .line 491
    goto :goto_0
.end method

.method private getSupportingShareChannelsMap()Ljava/util/Map;
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
    .line 447
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mSupportingShareChannelsMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 448
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKShare;->initSupporingShareChannels()V

    .line 450
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mSupportingShareChannelsMap:Ljava/util/Map;

    return-object v0
.end method

.method private declared-synchronized initDefaultShareChannelPriorityList()V
    .locals 15

    .prologue
    .line 516
    monitor-enter p0

    :try_start_0
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareChannelPriorityList:Ljava/util/List;

    if-nez v9, :cond_0

    .line 517
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareChannelPriorityList:Ljava/util/List;

    .line 519
    :cond_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginList()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v5

    .line 521
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

    .line 551
    :goto_1
    monitor-exit p0

    return-void

    .line 521
    :cond_2
    :try_start_2
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 523
    .local v4, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_start_3
    invoke-virtual {v4}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 524
    .local v7, "type1":I
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKShare;->getPluginType()Lcom/boyaa/godsdk/core/PluginType;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/godsdk/core/PluginType;->getType()I

    move-result v8

    .line 525
    .local v8, "type2":I
    and-int v6, v7, v8

    .line 527
    .local v6, "result":I
    if-ne v6, v8, :cond_1

    .line 529
    invoke-virtual {v4}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v9

    .line 528
    invoke-direct {p0, v9}, Lcom/boyaa/godsdk/core/GodSDKShare;->getShareChannelByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 529
    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 530
    .local v2, "ShareChannelstrs":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 532
    const-string v9, "[,_\\-;]"

    invoke-virtual {v2, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 533
    .local v1, "ShareChannels":[Ljava/lang/String;
    array-length v11, v1

    const/4 v9, 0x0

    :goto_2
    if-lt v9, v11, :cond_4

    .line 539
    .end local v1    # "ShareChannels":[Ljava/lang/String;
    :cond_3
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "initDefaultShareChannelPriorityList ShareChannels list="

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 540
    const/4 v12, 0x1

    new-array v12, v12, [Ljava/util/List;

    const/4 v13, 0x0

    iget-object v14, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareChannelPriorityList:Ljava/util/List;

    aput-object v14, v12, v13

    invoke-static {v12}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 539
    invoke-virtual {v9, v11}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 542
    .end local v2    # "ShareChannelstrs":Ljava/lang/String;
    .end local v6    # "result":I
    .end local v7    # "type1":I
    .end local v8    # "type2":I
    :catch_0
    move-exception v3

    .line 543
    .local v3, "e":Ljava/lang/NumberFormatException;
    :try_start_4
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 544
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "initDefaultShareChannelPriorityList Plugin Type NumberFormatException plugin.getPluginType() = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 545
    invoke-virtual {v4}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 544
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 543
    invoke-virtual {v9, v11, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 548
    .end local v3    # "e":Ljava/lang/NumberFormatException;
    .end local v4    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :catch_1
    move-exception v3

    .line 549
    .local v3, "e":Ljava/lang/Exception;
    :try_start_5
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v10, "initDefaultShareChannelPriorityList Exception"

    invoke-virtual {v9, v10, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 516
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v5    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :catchall_0
    move-exception v9

    monitor-exit p0

    throw v9

    .line 533
    .restart local v1    # "ShareChannels":[Ljava/lang/String;
    .restart local v2    # "ShareChannelstrs":Ljava/lang/String;
    .restart local v4    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    .restart local v5    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    .restart local v6    # "result":I
    .restart local v7    # "type1":I
    .restart local v8    # "type2":I
    :cond_4
    :try_start_6
    aget-object v0, v1, v9

    .line 534
    .local v0, "ShareChannel":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_5

    .line 535
    iget-object v12, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareChannelPriorityList:Ljava/util/List;

    invoke-interface {v12, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 533
    :cond_5
    add-int/lit8 v9, v9, 0x1

    goto :goto_2
.end method

.method private declared-synchronized initSupporingShareChannels()V
    .locals 11

    .prologue
    .line 454
    monitor-enter p0

    :try_start_0
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mSupportingShareChannelsMap:Ljava/util/Map;

    if-nez v7, :cond_1

    .line 455
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mSupportingShareChannelsMap:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 457
    :try_start_1
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    .line 458
    invoke-virtual {v7, p0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginListByType(Lcom/boyaa/godsdk/core/IPlugin;)Ljava/util/List;

    move-result-object v6

    .line 459
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

    .line 478
    .end local v6    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    .line 459
    .restart local v6    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :cond_2
    :try_start_2
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;

    .line 460
    .local v5, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    invoke-virtual {v5}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v3

    .line 461
    .local v3, "className":Ljava/lang/String;
    invoke-direct {p0, v3}, Lcom/boyaa/godsdk/core/GodSDKShare;->getShareChannelByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 462
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 463
    .local v2, "ShareChannelstrs":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 465
    const-string v7, "[,_\\-;]"

    invoke-virtual {v2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 466
    .local v1, "ShareChannels":[Ljava/lang/String;
    array-length v9, v1

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v9, :cond_0

    aget-object v0, v1, v7

    .line 467
    .local v0, "ShareChannel":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_3

    .line 468
    iget-object v10, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mSupportingShareChannelsMap:Ljava/util/Map;

    invoke-interface {v10, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 466
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 474
    .end local v0    # "ShareChannel":Ljava/lang/String;
    .end local v1    # "ShareChannels":[Ljava/lang/String;
    .end local v2    # "ShareChannelstrs":Ljava/lang/String;
    .end local v3    # "className":Ljava/lang/String;
    .end local v5    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    .end local v6    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :catch_0
    move-exception v4

    .line 475
    .local v4, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v8, "initSupporingShareChannelTags Exception"

    invoke-virtual {v7, v8, v4}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 454
    .end local v4    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7
.end method

.method private requestAuthorize(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "shareChannel"    # Ljava/lang/String;
    .param p3, "params"    # Ljava/lang/String;

    .prologue
    .line 196
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKShare;->getPluginObjectByShareChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 197
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->SHARE:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 198
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKShare;->SHARE_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "authorize"

    .line 199
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    .line 200
    const-class v6, Lcom/boyaa/godsdk/callback/ShareListener;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    .line 201
    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p3, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    aput-object v7, v5, v6

    .line 198
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 220
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 202
    :catch_0
    move-exception v0

    .line 203
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKShare.authorize Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 204
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    if-eqz v2, :cond_0

    .line 205
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKShare$4;

    invoke-direct {v2, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKShare$4;-><init>(Lcom/boyaa/godsdk/core/GodSDKShare;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private requestFollowFriend(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "shareChannel"    # Ljava/lang/String;
    .param p3, "params"    # Ljava/lang/String;

    .prologue
    .line 405
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKShare;->getPluginObjectByShareChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 406
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->SHARE:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 407
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKShare;->SHARE_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "followFriend"

    .line 408
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    .line 409
    const-class v6, Lcom/boyaa/godsdk/callback/ShareListener;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    .line 410
    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p3, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    aput-object v7, v5, v6

    .line 407
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 429
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 411
    :catch_0
    move-exception v0

    .line 412
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKShare.followFriend Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 413
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    if-eqz v2, :cond_0

    .line 414
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKShare$10;

    invoke-direct {v2, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKShare$10;-><init>(Lcom/boyaa/godsdk/core/GodSDKShare;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private requestGetUserInfo(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;
    .locals 9
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "shareChannel"    # Ljava/lang/String;
    .param p3, "params"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 266
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKShare;->getPluginObjectByShareChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v3

    .line 267
    sget-object v4, Lcom/boyaa/godsdk/core/PluginType;->SHARE:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v3, v4}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 268
    .local v1, "obj":Ljava/lang/Object;
    sget-object v3, Lcom/boyaa/godsdk/core/GodSDKShare;->SHARE_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 269
    const-string v4, "getUserInfo"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/app/Activity;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    .line 270
    const-class v7, Lcom/boyaa/godsdk/callback/ShareListener;

    aput-object v7, v5, v6

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    .line 271
    aput-object p1, v6, v7

    const/4 v7, 0x1

    aput-object p3, v6, v7

    const/4 v7, 0x2

    iget-object v8, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    aput-object v8, v6, v7

    .line 268
    invoke-static {v3, v4, v5, v1, v6}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 272
    .local v2, "result":Ljava/lang/Object;
    check-cast v2, Ljava/util/Map;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 290
    .end local v1    # "obj":Ljava/lang/Object;
    .end local v2    # "result":Ljava/lang/Object;
    :goto_0
    return-object v2

    .line 273
    :catch_0
    move-exception v0

    .line 274
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v4, "GodSDKShare.getUserInfo Exception"

    invoke-virtual {v3, v4, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 275
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    if-eqz v3, :cond_0

    .line 276
    new-instance v3, Lcom/boyaa/godsdk/core/GodSDKShare$6;

    invoke-direct {v3, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKShare$6;-><init>(Lcom/boyaa/godsdk/core/GodSDKShare;Ljava/lang/String;)V

    invoke-static {v3}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 290
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private requestListFriend(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "shareChannel"    # Ljava/lang/String;
    .param p3, "params"    # Ljava/lang/String;

    .prologue
    .line 336
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKShare;->getPluginObjectByShareChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 337
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->SHARE:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 338
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKShare;->SHARE_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "listFriend"

    .line 339
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    .line 340
    const-class v6, Lcom/boyaa/godsdk/callback/ShareListener;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    .line 341
    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p3, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    aput-object v7, v5, v6

    .line 338
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 360
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 342
    :catch_0
    move-exception v0

    .line 343
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKShare.listFriend Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 344
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    if-eqz v2, :cond_0

    .line 345
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKShare$8;

    invoke-direct {v2, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKShare$8;-><init>(Lcom/boyaa/godsdk/core/GodSDKShare;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private requestShare(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "shareChannel"    # Ljava/lang/String;
    .param p3, "params"    # Ljava/lang/String;

    .prologue
    .line 127
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKShare;->getPluginObjectByShareChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 128
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->SHARE:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 129
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKShare;->SHARE_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "share"

    .line 130
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    .line 131
    const-class v6, Lcom/boyaa/godsdk/callback/ShareListener;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    .line 132
    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p3, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    aput-object v7, v5, v6

    .line 129
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 133
    :catch_0
    move-exception v0

    .line 134
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKShare.share Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 135
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    if-eqz v2, :cond_0

    .line 136
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKShare$2;

    invoke-direct {v2, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKShare$2;-><init>(Lcom/boyaa/godsdk/core/GodSDKShare;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private static declared-synchronized syncInit()V
    .locals 2

    .prologue
    .line 64
    const-class v1, Lcom/boyaa/godsdk/core/GodSDKShare;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKShare;->instance:Lcom/boyaa/godsdk/core/GodSDKShare;

    if-nez v0, :cond_0

    .line 65
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKShare;

    invoke-direct {v0}, Lcom/boyaa/godsdk/core/GodSDKShare;-><init>()V

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKShare;->instance:Lcom/boyaa/godsdk/core/GodSDKShare;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    :cond_0
    monitor-exit v1

    return-void

    .line 64
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public authorize(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;

    .prologue
    const/4 v5, -0x2

    .line 181
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 182
    .local v1, "json":Lorg/json/JSONObject;
    const-string v4, "ShareChannel"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 183
    .local v2, "mShareChannel":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v2}, Lcom/boyaa/godsdk/core/GodSDKShare;->authorize(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "mShareChannel":Ljava/lang/String;
    :goto_0
    return-void

    .line 184
    :catch_0
    move-exception v0

    .line 185
    .local v0, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v3

    .line 186
    .local v3, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 187
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 188
    const-string v4, "\u6388\u6743\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709ShareChannel\u5b57\u6bb5"

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 189
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-interface {v4, v3, v5, v6}, Lcom/boyaa/godsdk/callback/ShareListener;->onError(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public authorize(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "shareChannel"    # Ljava/lang/String;

    .prologue
    .line 156
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKShare.authorize parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 157
    const-string v2, ", ShareChannel = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 156
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 158
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 159
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    if-eqz v0, :cond_0

    .line 160
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKShare$3;

    invoke-direct {v0, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKShare$3;-><init>(Lcom/boyaa/godsdk/core/GodSDKShare;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 175
    :cond_0
    invoke-direct {p0, p1, p3, p2}, Lcom/boyaa/godsdk/core/GodSDKShare;->requestAuthorize(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    return-void
.end method

.method public callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;
    .locals 7
    .param p1, "shareChannel"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "map"    # Ljava/util/Map;
    .param p4, "listener"    # Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    .prologue
    .line 603
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKShare;->getSupportingShareChannelsMap()Ljava/util/Map;

    move-result-object v0

    .line 604
    .local v0, "ShareChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 605
    .local v1, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v4

    .line 606
    invoke-virtual {v4, v1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 607
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->SHARE:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v3

    .line 608
    .local v3, "obj":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 610
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/util/Map;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v6, v4, v5

    .line 611
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p3, v5, v6

    const/4 v6, 0x1

    aput-object p4, v5, v6

    .line 609
    invoke-static {v1, p2, v4, v3, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 629
    .end local v0    # "ShareChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "className":Ljava/lang/String;
    .end local v3    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v4

    .line 612
    :catch_0
    move-exception v2

    .line 613
    .local v2, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

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

    .line 614
    if-eqz p4, :cond_0

    .line 615
    new-instance v4, Lcom/boyaa/godsdk/core/GodSDKShare$11;

    invoke-direct {v4, p0, p4}, Lcom/boyaa/godsdk/core/GodSDKShare$11;-><init>(Lcom/boyaa/godsdk/core/GodSDKShare;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)V

    invoke-static {v4}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 629
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
    .line 591
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKShare;->getDefaultShareChannel()Ljava/lang/String;

    move-result-object v0

    .line 592
    .local v0, "mShareChannel":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 593
    const/4 v1, 0x0

    .line 595
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKShare;->callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public followFriend(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;

    .prologue
    const/4 v5, -0x2

    .line 390
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 391
    .local v1, "json":Lorg/json/JSONObject;
    const-string v4, "ShareChannel"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 392
    .local v2, "mShareChannel":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v2}, Lcom/boyaa/godsdk/core/GodSDKShare;->followFriend(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 400
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "mShareChannel":Ljava/lang/String;
    :goto_0
    return-void

    .line 393
    :catch_0
    move-exception v0

    .line 394
    .local v0, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v3

    .line 395
    .local v3, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 396
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 397
    const-string v4, "\u5173\u6ce8\u597d\u53cb\u5f02\u5e38\uff0c\u6ca1\u6709ShareChannel\u5b57\u6bb5"

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 398
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    const/4 v5, 0x0

    const/4 v6, 0x6

    invoke-interface {v4, v3, v5, v6}, Lcom/boyaa/godsdk/callback/ShareListener;->onError(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public followFriend(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "shareChannel"    # Ljava/lang/String;

    .prologue
    .line 365
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKShare.followFriend parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 366
    const-string v2, ", ShareChannel = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 365
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 367
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 368
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    if-eqz v0, :cond_0

    .line 369
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKShare$9;

    invoke-direct {v0, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKShare$9;-><init>(Lcom/boyaa/godsdk/core/GodSDKShare;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 384
    :cond_0
    invoke-direct {p0, p1, p3, p2}, Lcom/boyaa/godsdk/core/GodSDKShare;->requestFollowFriend(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 385
    return-void
.end method

.method public getDebugMode()Z
    .locals 1

    .prologue
    .line 646
    iget-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebugMode:Z

    return v0
.end method

.method public getDebugTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 652
    const-string v0, "GodSDKShare"

    return-object v0
.end method

.method public getDefaultShareChannel()Ljava/lang/String;
    .locals 3

    .prologue
    .line 503
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareChannelPriorityList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 504
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKShare;->initDefaultShareChannelPriorityList()V

    .line 506
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getDefaultShareChannelTag mShareChannelPriorityList == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 507
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareChannelPriorityList:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 506
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 508
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareChannelPriorityList:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 509
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareChannelPriorityList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 510
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareChannelPriorityList:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 512
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPluginType()Lcom/boyaa/godsdk/core/PluginType;
    .locals 1

    .prologue
    .line 635
    sget-object v0, Lcom/boyaa/godsdk/core/PluginType;->SHARE:Lcom/boyaa/godsdk/core/PluginType;

    return-object v0
.end method

.method public getShareListener()Lcom/boyaa/godsdk/callback/ShareListener;
    .locals 1

    .prologue
    .line 437
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    return-object v0
.end method

.method public getSupportingShareChannels()Ljava/util/Set;
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
    .line 442
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKShare;->getSupportingShareChannelsMap()Ljava/util/Map;

    move-result-object v0

    .line 443
    .local v0, "mShareChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public getUserInfo(Landroid/app/Activity;Ljava/lang/String;)Ljava/util/Map;
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, -0x2

    .line 250
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 251
    .local v1, "json":Lorg/json/JSONObject;
    const-string v4, "ShareChannel"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 252
    .local v2, "mShareChannel":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v2}, Lcom/boyaa/godsdk/core/GodSDKShare;->getUserInfo(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 260
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "mShareChannel":Ljava/lang/String;
    :goto_0
    return-object v6

    .line 253
    :catch_0
    move-exception v0

    .line 254
    .local v0, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v3

    .line 255
    .local v3, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 256
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 257
    const-string v4, "\u83b7\u53d6\u7528\u6237\u8d44\u6599\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709ShareChannel\u5b57\u6bb5"

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 258
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    const/16 v5, 0x8

    invoke-interface {v4, v3, v6, v5}, Lcom/boyaa/godsdk/callback/ShareListener;->onError(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public getUserInfo(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "shareChannel"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 225
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKShare.getUserInfo parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 226
    const-string v2, ", ShareChannel = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 225
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 227
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 228
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    if-eqz v0, :cond_0

    .line 229
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKShare$5;

    invoke-direct {v0, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKShare$5;-><init>(Lcom/boyaa/godsdk/core/GodSDKShare;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 244
    :cond_0
    invoke-direct {p0, p1, p3, p2}, Lcom/boyaa/godsdk/core/GodSDKShare;->requestGetUserInfo(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public isSupportMethod(Ljava/lang/String;)Z
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 555
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKShare;->getDefaultShareChannel()Ljava/lang/String;

    move-result-object v0

    .line 556
    .local v0, "mShareChannel":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 557
    const/4 v1, 0x0

    .line 559
    :goto_0
    return v1

    :cond_0
    invoke-virtual {p0, v0, p1}, Lcom/boyaa/godsdk/core/GodSDKShare;->isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 10
    .param p1, "shareChannel"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 566
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKShare;->getSupportingShareChannelsMap()Ljava/util/Map;

    move-result-object v0

    .line 567
    .local v0, "ShareChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 568
    .local v1, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    .line 569
    invoke-virtual {v7, v1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v7

    .line 570
    sget-object v8, Lcom/boyaa/godsdk/core/PluginType;->SHARE:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v7, v8}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v4

    .line 571
    .local v4, "obj":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 572
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "isSupportMethod className == "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 573
    const-string v9, " isLocalClass == "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->isLocalClass()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 574
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

    .line 572
    invoke-virtual {v7, v8}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 576
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Ljava/util/Map;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-class v9, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v9, v7, v8

    .line 575
    invoke-static {v1, p2, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->getMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 577
    .local v3, "method":Ljava/lang/reflect/Method;
    if-eqz v3, :cond_0

    .line 585
    .end local v0    # "ShareChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "className":Ljava/lang/String;
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "obj":Ljava/lang/Object;
    :goto_0
    return v5

    .restart local v0    # "ShareChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v1    # "className":Ljava/lang/String;
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    .restart local v4    # "obj":Ljava/lang/Object;
    :cond_0
    move v5, v6

    .line 580
    goto :goto_0

    .line 582
    .end local v0    # "ShareChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "className":Ljava/lang/String;
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 583
    .local v2, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v7, "isSupportMethod Exception"

    invoke-virtual {v5, v7, v2}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move v5, v6

    .line 585
    goto :goto_0
.end method

.method public listFriend(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;

    .prologue
    const/4 v5, -0x2

    .line 321
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 322
    .local v1, "json":Lorg/json/JSONObject;
    const-string v4, "ShareChannel"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 323
    .local v2, "mShareChannel":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v2}, Lcom/boyaa/godsdk/core/GodSDKShare;->listFriend(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 331
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "mShareChannel":Ljava/lang/String;
    :goto_0
    return-void

    .line 324
    :catch_0
    move-exception v0

    .line 325
    .local v0, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v3

    .line 326
    .local v3, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 327
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 328
    const-string v4, "\u83b7\u53d6\u597d\u53cb\u6216\u5173\u6ce8\u5217\u8868\u5f02\u5e38\uff0c\u6ca1\u6709ShareChannel\u5b57\u6bb5"

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 329
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    const/4 v5, 0x0

    const/4 v6, 0x2

    invoke-interface {v4, v3, v5, v6}, Lcom/boyaa/godsdk/callback/ShareListener;->onError(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public listFriend(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "shareChannel"    # Ljava/lang/String;

    .prologue
    .line 296
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKShare.listFriend parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 297
    const-string v2, ", ShareChannel = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 296
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 298
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 299
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    if-eqz v0, :cond_0

    .line 300
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKShare$7;

    invoke-direct {v0, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKShare$7;-><init>(Lcom/boyaa/godsdk/core/GodSDKShare;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 315
    :cond_0
    invoke-direct {p0, p1, p3, p2}, Lcom/boyaa/godsdk/core/GodSDKShare;->requestListFriend(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    return-void
.end method

.method public setDebugMode(Z)V
    .locals 0
    .param p1, "debugMode"    # Z

    .prologue
    .line 640
    iput-boolean p1, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebugMode:Z

    .line 641
    return-void
.end method

.method public setShareListener(Lcom/boyaa/godsdk/callback/ShareListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/boyaa/godsdk/callback/ShareListener;

    .prologue
    .line 433
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    .line 434
    return-void
.end method

.method public share(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;

    .prologue
    const/4 v5, -0x2

    .line 112
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 113
    .local v1, "json":Lorg/json/JSONObject;
    const-string v4, "ShareChannel"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 114
    .local v2, "mShareChannel":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v2}, Lcom/boyaa/godsdk/core/GodSDKShare;->share(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "mShareChannel":Ljava/lang/String;
    :goto_0
    return-void

    .line 115
    :catch_0
    move-exception v0

    .line 116
    .local v0, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v3

    .line 117
    .local v3, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 118
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 119
    const-string v4, "\u5206\u4eab\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709ShareChannel\u5b57\u6bb5"

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 120
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    const/4 v5, 0x0

    const/16 v6, 0x9

    invoke-interface {v4, v3, v5, v6}, Lcom/boyaa/godsdk/callback/ShareListener;->onError(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public share(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "shareChannel"    # Ljava/lang/String;

    .prologue
    .line 87
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKShare.share parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", ShareChannel = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 88
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 87
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 89
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 90
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKShare;->mShareListener:Lcom/boyaa/godsdk/callback/ShareListener;

    if-eqz v0, :cond_0

    .line 91
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKShare$1;

    invoke-direct {v0, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKShare$1;-><init>(Lcom/boyaa/godsdk/core/GodSDKShare;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 106
    :cond_0
    invoke-direct {p0, p1, p3, p2}, Lcom/boyaa/godsdk/core/GodSDKShare;->requestShare(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    return-void
.end method
