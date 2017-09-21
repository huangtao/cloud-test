.class public Lcom/boyaa/godsdk/core/GodSDKActivityCenter;
.super Ljava/lang/Object;
.source "GodSDKActivityCenter.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/IActivityCenterPlugin;


# static fields
.field private static final ACTIVITY_CENTER_PLUGIN_PROTOCOL:Ljava/lang/Class;

.field private static final TAG:Ljava/lang/String; = "GodSDKActivityCenter"

.field private static instance:Lcom/boyaa/godsdk/core/GodSDKActivityCenter;


# instance fields
.field private mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

.field private mActivityCenterPriorityList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

.field private mDebugMode:Z

.field private mSupportingActivityCentersMap:Ljava/util/Map;
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
    const-class v0, Lcom/boyaa/godsdk/protocol/ActivityCenterPluginProtocol;

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->ACTIVITY_CENTER_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 37
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->instance:Lcom/boyaa/godsdk/core/GodSDKActivityCenter;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    .line 53
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebugMode:Z

    .line 64
    new-instance v0, Lcom/boyaa/godsdk/core/utils/Debug;

    invoke-direct {v0, p0}, Lcom/boyaa/godsdk/core/utils/Debug;-><init>(Lcom/boyaa/godsdk/core/IDebugable;)V

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 65
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/godsdk/core/GodSDKActivityCenter;)Lcom/boyaa/godsdk/callback/ActivityCenterListener;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    return-object v0
.end method

.method private getActivityCenterByClassName(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 394
    :try_start_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v4

    .line 395
    invoke-virtual {v4, p1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 396
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->ACTIVITYCENTER:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v2

    .line 398
    .local v2, "obj":Ljava/lang/Object;
    sget-object v4, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->ACTIVITY_CENTER_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v5, "getActivityCenter"

    const/4 v6, 0x0

    .line 399
    const/4 v7, 0x0

    .line 397
    invoke-static {v4, v5, v6, v2, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 404
    .end local v2    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v0

    .line 401
    :catch_0
    move-exception v1

    .line 402
    .local v1, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v5, "getActivityCenterByClassName Exception"

    invoke-virtual {v4, v5, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v0, v3

    .line 404
    goto :goto_0
.end method

.method public static getInstance()Lcom/boyaa/godsdk/core/GodSDKActivityCenter;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->instance:Lcom/boyaa/godsdk/core/GodSDKActivityCenter;

    if-nez v0, :cond_0

    .line 41
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->syncInit()V

    .line 43
    :cond_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->instance:Lcom/boyaa/godsdk/core/GodSDKActivityCenter;

    return-object v0
.end method

.method private getPluginObjectByActivityCenter(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
    .locals 3
    .param p1, "activityCenter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 409
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->getSupportingActivityCentersMap()Ljava/util/Map;

    move-result-object v0

    .line 410
    .local v0, "ActivityCenterClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 411
    .local v1, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    return-object v2
.end method

.method private getSupportingActivityCentersMap()Ljava/util/Map;
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
    .line 359
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mSupportingActivityCentersMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 360
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->initSupporingActivityCenters()V

    .line 362
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mSupportingActivityCentersMap:Ljava/util/Map;

    return-object v0
.end method

.method private declared-synchronized initDefaultActivityCenterPriorityList()V
    .locals 15

    .prologue
    .line 429
    monitor-enter p0

    :try_start_0
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterPriorityList:Ljava/util/List;

    if-nez v9, :cond_0

    .line 430
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterPriorityList:Ljava/util/List;

    .line 432
    :cond_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginList()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v5

    .line 434
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

    .line 465
    :goto_1
    monitor-exit p0

    return-void

    .line 434
    :cond_2
    :try_start_2
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 436
    .local v4, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_start_3
    invoke-virtual {v4}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 437
    .local v7, "type1":I
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->getPluginType()Lcom/boyaa/godsdk/core/PluginType;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/godsdk/core/PluginType;->getType()I

    move-result v8

    .line 438
    .local v8, "type2":I
    and-int v6, v7, v8

    .line 440
    .local v6, "result":I
    if-ne v6, v8, :cond_1

    .line 442
    invoke-virtual {v4}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v9

    .line 441
    invoke-direct {p0, v9}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->getActivityCenterByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 442
    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 443
    .local v2, "activityCenterstrs":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 445
    const-string v9, "[,_\\-;]"

    invoke-virtual {v2, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 446
    .local v1, "activityCenters":[Ljava/lang/String;
    array-length v11, v1

    const/4 v9, 0x0

    :goto_2
    if-lt v9, v11, :cond_4

    .line 453
    .end local v1    # "activityCenters":[Ljava/lang/String;
    :cond_3
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "initDefaultActivityCenterPriorityList ActivityCenters list="

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 454
    const/4 v12, 0x1

    new-array v12, v12, [Ljava/util/List;

    const/4 v13, 0x0

    iget-object v14, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterPriorityList:Ljava/util/List;

    aput-object v14, v12, v13

    invoke-static {v12}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 453
    invoke-virtual {v9, v11}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 456
    .end local v2    # "activityCenterstrs":Ljava/lang/String;
    .end local v6    # "result":I
    .end local v7    # "type1":I
    .end local v8    # "type2":I
    :catch_0
    move-exception v3

    .line 457
    .local v3, "e":Ljava/lang/NumberFormatException;
    :try_start_4
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 458
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "initDefaultActivityCenterPriorityList Plugin Type NumberFormatException plugin.getPluginType() = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 459
    invoke-virtual {v4}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 458
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 457
    invoke-virtual {v9, v11, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 462
    .end local v3    # "e":Ljava/lang/NumberFormatException;
    .end local v4    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :catch_1
    move-exception v3

    .line 463
    .local v3, "e":Ljava/lang/Exception;
    :try_start_5
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v10, "initDefaultActivityCenterPriorityList Exception"

    invoke-virtual {v9, v10, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 429
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v5    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :catchall_0
    move-exception v9

    monitor-exit p0

    throw v9

    .line 446
    .restart local v1    # "activityCenters":[Ljava/lang/String;
    .restart local v2    # "activityCenterstrs":Ljava/lang/String;
    .restart local v4    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    .restart local v5    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    .restart local v6    # "result":I
    .restart local v7    # "type1":I
    .restart local v8    # "type2":I
    :cond_4
    :try_start_6
    aget-object v0, v1, v9

    .line 447
    .local v0, "activityCenter":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_5

    .line 448
    iget-object v12, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterPriorityList:Ljava/util/List;

    .line 449
    invoke-interface {v12, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 446
    :cond_5
    add-int/lit8 v9, v9, 0x1

    goto :goto_2
.end method

.method private declared-synchronized initSupporingActivityCenters()V
    .locals 11

    .prologue
    .line 366
    monitor-enter p0

    :try_start_0
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mSupportingActivityCentersMap:Ljava/util/Map;

    if-nez v7, :cond_1

    .line 367
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mSupportingActivityCentersMap:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 369
    :try_start_1
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    .line 370
    invoke-virtual {v7, p0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginListByType(Lcom/boyaa/godsdk/core/IPlugin;)Ljava/util/List;

    move-result-object v6

    .line 371
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

    .line 390
    .end local v6    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    .line 371
    .restart local v6    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :cond_2
    :try_start_2
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;

    .line 372
    .local v5, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    invoke-virtual {v5}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v3

    .line 373
    .local v3, "className":Ljava/lang/String;
    invoke-direct {p0, v3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->getActivityCenterByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 374
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 375
    .local v2, "activityCenterstrs":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 377
    const-string v7, "[,_\\-;]"

    invoke-virtual {v2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 378
    .local v1, "activityCenters":[Ljava/lang/String;
    array-length v9, v1

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v9, :cond_0

    aget-object v0, v1, v7

    .line 379
    .local v0, "activityCenter":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_3

    .line 380
    iget-object v10, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mSupportingActivityCentersMap:Ljava/util/Map;

    invoke-interface {v10, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 378
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 386
    .end local v0    # "activityCenter":Ljava/lang/String;
    .end local v1    # "activityCenters":[Ljava/lang/String;
    .end local v2    # "activityCenterstrs":Ljava/lang/String;
    .end local v3    # "className":Ljava/lang/String;
    .end local v5    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    .end local v6    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :catch_0
    move-exception v4

    .line 387
    .local v4, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v8, "initSupporingActivityCenterTags Exception"

    invoke-virtual {v7, v8, v4}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 366
    .end local v4    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7
.end method

.method private requestDisplayActivityCenter(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "activityCenter"    # Ljava/lang/String;

    .prologue
    .line 317
    :try_start_0
    invoke-direct {p0, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->getPluginObjectByActivityCenter(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 318
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->ACTIVITYCENTER:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 319
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->ACTIVITY_CENTER_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 320
    const-string v3, "displayActivityCenter"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    .line 321
    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-class v6, Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    aput-object v6, v4, v5

    .line 322
    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    aput-object v7, v5, v6

    .line 319
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 341
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 323
    :catch_0
    move-exception v0

    .line 324
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKActivityCenter.displayActivityCenter Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 325
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    if-eqz v2, :cond_0

    .line 326
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$8;

    invoke-direct {v2, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$8;-><init>(Lcom/boyaa/godsdk/core/GodSDKActivityCenter;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private requestForcePushing(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "activityCenter"    # Ljava/lang/String;

    .prologue
    .line 248
    :try_start_0
    invoke-direct {p0, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->getPluginObjectByActivityCenter(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 249
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->ACTIVITYCENTER:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 250
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->ACTIVITY_CENTER_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 251
    const-string v3, "forcePushing"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    .line 252
    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-class v6, Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    aput-object v6, v4, v5

    .line 253
    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    aput-object v7, v5, v6

    .line 250
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 272
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 254
    :catch_0
    move-exception v0

    .line 255
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKActivityCenter.forcePushing Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 256
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    if-eqz v2, :cond_0

    .line 257
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$6;

    invoke-direct {v2, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$6;-><init>(Lcom/boyaa/godsdk/core/GodSDKActivityCenter;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private requestNumOfActivity(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "activityCenter"    # Ljava/lang/String;

    .prologue
    .line 110
    :try_start_0
    invoke-direct {p0, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->getPluginObjectByActivityCenter(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 111
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->ACTIVITYCENTER:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 112
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->ACTIVITY_CENTER_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 113
    const-string v3, "getNumOfActivity"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    .line 114
    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-class v6, Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    aput-object v6, v4, v5

    .line 115
    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    aput-object v7, v5, v6

    .line 112
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 116
    :catch_0
    move-exception v0

    .line 117
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKActivityCenter.getNumOfActivity Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 118
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    if-eqz v2, :cond_0

    .line 119
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$2;

    invoke-direct {v2, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$2;-><init>(Lcom/boyaa/godsdk/core/GodSDKActivityCenter;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private requestSwitchServer(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "activityCenter"    # Ljava/lang/String;

    .prologue
    .line 179
    :try_start_0
    invoke-direct {p0, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->getPluginObjectByActivityCenter(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 180
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->ACTIVITYCENTER:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 181
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->ACTIVITY_CENTER_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 182
    const-string v3, "switchServer"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    .line 183
    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-class v6, Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    aput-object v6, v4, v5

    .line 184
    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    aput-object v7, v5, v6

    .line 181
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 185
    :catch_0
    move-exception v0

    .line 186
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKActivityCenter.switchServer Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 187
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    if-eqz v2, :cond_0

    .line 188
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$4;

    invoke-direct {v2, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$4;-><init>(Lcom/boyaa/godsdk/core/GodSDKActivityCenter;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private static declared-synchronized syncInit()V
    .locals 2

    .prologue
    .line 47
    const-class v1, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->instance:Lcom/boyaa/godsdk/core/GodSDKActivityCenter;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;

    invoke-direct {v0}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;-><init>()V

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->instance:Lcom/boyaa/godsdk/core/GodSDKActivityCenter;
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
    .param p1, "ActivityCenter"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "map"    # Ljava/util/Map;
    .param p4, "listener"    # Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    .prologue
    .line 517
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->getSupportingActivityCentersMap()Ljava/util/Map;

    move-result-object v0

    .line 518
    .local v0, "ActivityCenterClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 519
    .local v1, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v4

    .line 520
    invoke-virtual {v4, v1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 521
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->ACTIVITYCENTER:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v3

    .line 522
    .local v3, "obj":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 524
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/util/Map;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v6, v4, v5

    .line 525
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p3, v5, v6

    const/4 v6, 0x1

    aput-object p4, v5, v6

    .line 523
    invoke-static {v1, p2, v4, v3, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 543
    .end local v0    # "ActivityCenterClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "className":Ljava/lang/String;
    .end local v3    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v4

    .line 526
    :catch_0
    move-exception v2

    .line 527
    .local v2, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

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

    .line 528
    if-eqz p4, :cond_0

    .line 529
    new-instance v4, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$9;

    invoke-direct {v4, p0, p4}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$9;-><init>(Lcom/boyaa/godsdk/core/GodSDKActivityCenter;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)V

    invoke-static {v4}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 543
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
    .line 505
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->getDefaultActivityCenter()Ljava/lang/String;

    move-result-object v0

    .line 506
    .local v0, "mActivityCenter":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 507
    const/4 v1, 0x0

    .line 509
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public displayActivityCenter(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;

    .prologue
    const/4 v5, -0x2

    .line 277
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 278
    .local v1, "json":Lorg/json/JSONObject;
    const-string v4, "activityCenter"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 279
    .local v2, "mActivityCenter":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v2}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->displayActivityCenter(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 287
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "mActivityCenter":Ljava/lang/String;
    :goto_0
    return-void

    .line 280
    :catch_0
    move-exception v0

    .line 281
    .local v0, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v3

    .line 282
    .local v3, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 283
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 284
    const-string v4, "\u6d3b\u52a8\u4e2d\u5fc3\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709activityCenter\u5b57\u6bb5"

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 285
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    const/4 v5, 0x0

    invoke-interface {v4, v3, v5}, Lcom/boyaa/godsdk/callback/ActivityCenterListener;->onCallBack(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public displayActivityCenter(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "activityCenter"    # Ljava/lang/String;

    .prologue
    .line 292
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKActivityCenter.displayActivityCenter parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 293
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", ActivityCenter = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 292
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 294
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 295
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    if-eqz v0, :cond_0

    .line 296
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$7;

    invoke-direct {v0, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$7;-><init>(Lcom/boyaa/godsdk/core/GodSDKActivityCenter;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 311
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->requestDisplayActivityCenter(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 312
    return-void
.end method

.method public forcePushing(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;

    .prologue
    const/4 v5, -0x2

    .line 208
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 209
    .local v1, "json":Lorg/json/JSONObject;
    const-string v4, "activityCenter"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 210
    .local v2, "mActivityCenter":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v2}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->forcePushing(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 218
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "mActivityCenter":Ljava/lang/String;
    :goto_0
    return-void

    .line 211
    :catch_0
    move-exception v0

    .line 212
    .local v0, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v3

    .line 213
    .local v3, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 214
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 215
    const-string v4, "\u6d3b\u52a8\u4e2d\u5fc3\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709activityCenter\u5b57\u6bb5"

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 216
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    const/4 v5, 0x0

    invoke-interface {v4, v3, v5}, Lcom/boyaa/godsdk/callback/ActivityCenterListener;->onCallBack(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public forcePushing(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "activityCenter"    # Ljava/lang/String;

    .prologue
    .line 223
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKActivityCenter.forcePushing parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 224
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", ActivityCenter = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 223
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 225
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 226
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    if-eqz v0, :cond_0

    .line 227
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$5;

    invoke-direct {v0, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$5;-><init>(Lcom/boyaa/godsdk/core/GodSDKActivityCenter;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 242
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->requestForcePushing(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    return-void
.end method

.method public getActivityCenterListener()Lcom/boyaa/godsdk/callback/ActivityCenterListener;
    .locals 1

    .prologue
    .line 349
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    return-object v0
.end method

.method public getDebugMode()Z
    .locals 1

    .prologue
    .line 560
    iget-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebugMode:Z

    return v0
.end method

.method public getDebugTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 566
    const-string v0, "GodSDKActivityCenter"

    return-object v0
.end method

.method public getDefaultActivityCenter()Ljava/lang/String;
    .locals 3

    .prologue
    .line 416
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterPriorityList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 417
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->initDefaultActivityCenterPriorityList()V

    .line 419
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getDefaultActivityCenterTag mActivityCenterPriorityList == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 420
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterPriorityList:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 419
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 421
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterPriorityList:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 422
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterPriorityList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 423
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterPriorityList:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 425
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getNumOfActivity(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;

    .prologue
    const/4 v5, -0x2

    .line 70
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 71
    .local v1, "json":Lorg/json/JSONObject;
    const-string v4, "activityCenter"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 72
    .local v2, "mActivityCenter":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v2}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->getNumOfActivity(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "mActivityCenter":Ljava/lang/String;
    :goto_0
    return-void

    .line 73
    :catch_0
    move-exception v0

    .line 74
    .local v0, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v3

    .line 75
    .local v3, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 76
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 77
    const-string v4, "\u6d3b\u52a8\u4e2d\u5fc3\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709activityCenter\u5b57\u6bb5"

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 78
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    const/4 v5, 0x0

    invoke-interface {v4, v3, v5}, Lcom/boyaa/godsdk/callback/ActivityCenterListener;->onCallBack(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getNumOfActivity(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "activityCenter"    # Ljava/lang/String;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKActivityCenter.getNumOfActivity parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 86
    const-string v2, ", ActivityCenter = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 87
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 88
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    if-eqz v0, :cond_0

    .line 89
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$1;

    invoke-direct {v0, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$1;-><init>(Lcom/boyaa/godsdk/core/GodSDKActivityCenter;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 104
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->requestNumOfActivity(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    return-void
.end method

.method public getPluginType()Lcom/boyaa/godsdk/core/PluginType;
    .locals 1

    .prologue
    .line 549
    sget-object v0, Lcom/boyaa/godsdk/core/PluginType;->ACTIVITYCENTER:Lcom/boyaa/godsdk/core/PluginType;

    return-object v0
.end method

.method public getSupportingActivityCenters()Ljava/util/Set;
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
    .line 354
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->getSupportingActivityCentersMap()Ljava/util/Map;

    move-result-object v0

    .line 355
    .local v0, "mActivityCenterClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public isSupportMethod(Ljava/lang/String;)Z
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 469
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->getDefaultActivityCenter()Ljava/lang/String;

    move-result-object v0

    .line 470
    .local v0, "mActivityCenter":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 471
    const/4 v1, 0x0

    .line 473
    :goto_0
    return v1

    :cond_0
    invoke-virtual {p0, v0, p1}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 10
    .param p1, "activityCenter"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 480
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->getSupportingActivityCentersMap()Ljava/util/Map;

    move-result-object v0

    .line 481
    .local v0, "ActivityCenterClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 482
    .local v1, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    .line 483
    invoke-virtual {v7, v1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v7

    .line 484
    sget-object v8, Lcom/boyaa/godsdk/core/PluginType;->ACTIVITYCENTER:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v7, v8}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v4

    .line 485
    .local v4, "obj":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 486
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "isSupportMethod className == "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 487
    const-string v9, " isLocalClass == "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->isLocalClass()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 488
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

    .line 486
    invoke-virtual {v7, v8}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 490
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Ljava/util/Map;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-class v9, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v9, v7, v8

    .line 489
    invoke-static {v1, p2, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->getMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 491
    .local v3, "method":Ljava/lang/reflect/Method;
    if-eqz v3, :cond_0

    .line 499
    .end local v0    # "ActivityCenterClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "className":Ljava/lang/String;
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "obj":Ljava/lang/Object;
    :goto_0
    return v5

    .restart local v0    # "ActivityCenterClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v1    # "className":Ljava/lang/String;
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    .restart local v4    # "obj":Ljava/lang/Object;
    :cond_0
    move v5, v6

    .line 494
    goto :goto_0

    .line 496
    .end local v0    # "ActivityCenterClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "className":Ljava/lang/String;
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 497
    .local v2, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v7, "isSupportMethod Exception"

    invoke-virtual {v5, v7, v2}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move v5, v6

    .line 499
    goto :goto_0
.end method

.method public setActivityCenterListener(Lcom/boyaa/godsdk/callback/ActivityCenterListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    .prologue
    .line 345
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    .line 346
    return-void
.end method

.method public setDebugMode(Z)V
    .locals 0
    .param p1, "debugMode"    # Z

    .prologue
    .line 554
    iput-boolean p1, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebugMode:Z

    .line 555
    return-void
.end method

.method public switchServer(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;

    .prologue
    const/4 v5, -0x2

    .line 139
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 140
    .local v1, "json":Lorg/json/JSONObject;
    const-string v4, "activityCenter"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 141
    .local v2, "mActivityCenter":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v2}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->switchServer(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 149
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "mActivityCenter":Ljava/lang/String;
    :goto_0
    return-void

    .line 142
    :catch_0
    move-exception v0

    .line 143
    .local v0, "e":Lorg/json/JSONException;
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v3

    .line 144
    .local v3, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 145
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 146
    const-string v4, "\u6d3b\u52a8\u4e2d\u5fc3\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709activityCenter\u5b57\u6bb5"

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 147
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    const/4 v5, 0x0

    invoke-interface {v4, v3, v5}, Lcom/boyaa/godsdk/callback/ActivityCenterListener;->onCallBack(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public switchServer(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "activityCenter"    # Ljava/lang/String;

    .prologue
    .line 154
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKActivityCenter.switchServer parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 155
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", ActivityCenter = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 154
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 156
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 157
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->mActivityCenterListener:Lcom/boyaa/godsdk/callback/ActivityCenterListener;

    if-eqz v0, :cond_0

    .line 158
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$3;

    invoke-direct {v0, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter$3;-><init>(Lcom/boyaa/godsdk/core/GodSDKActivityCenter;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 173
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKActivityCenter;->requestSwitchServer(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    return-void
.end method
