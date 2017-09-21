.class public Lcom/boyaa/godsdk/core/GodSDKLocation;
.super Ljava/lang/Object;
.source "GodSDKLocation.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/ILocationPlugin;


# static fields
.field public static final ACTION_START_LOCATE:I = 0x1

.field public static final ACTION_STOP_LOCATE:I = 0x2

.field private static final LOCATION_PLUGIN_PROTOCOL:Ljava/lang/Class;

.field private static final TAG:Ljava/lang/String; = "GodSDKLocation"

.field private static instance:Lcom/boyaa/godsdk/core/GodSDKLocation;


# instance fields
.field private mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

.field private mDebugMode:Z

.field private mLocationChannelPriorityList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mLocationListener:Lcom/boyaa/godsdk/callback/LocationListener;

.field private mSupportingLocationChannelsMap:Ljava/util/Map;
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
    .line 31
    const-class v0, Lcom/boyaa/godsdk/protocol/LocationPluginProtocol;

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKLocation;->LOCATION_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 33
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKLocation;->instance:Lcom/boyaa/godsdk/core/GodSDKLocation;

    .line 50
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationListener:Lcom/boyaa/godsdk/callback/LocationListener;

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebugMode:Z

    .line 66
    new-instance v0, Lcom/boyaa/godsdk/core/utils/Debug;

    invoke-direct {v0, p0}, Lcom/boyaa/godsdk/core/utils/Debug;-><init>(Lcom/boyaa/godsdk/core/IDebugable;)V

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 67
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/godsdk/core/GodSDKLocation;)Lcom/boyaa/godsdk/callback/LocationListener;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationListener:Lcom/boyaa/godsdk/callback/LocationListener;

    return-object v0
.end method

.method public static getInstance()Lcom/boyaa/godsdk/core/GodSDKLocation;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKLocation;->instance:Lcom/boyaa/godsdk/core/GodSDKLocation;

    if-nez v0, :cond_0

    .line 54
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKLocation;->syncInit()V

    .line 56
    :cond_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKLocation;->instance:Lcom/boyaa/godsdk/core/GodSDKLocation;

    return-object v0
.end method

.method private getLocationChannelByClassName(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 388
    :try_start_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 389
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->LOCATION:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v2

    .line 390
    .local v2, "obj":Ljava/lang/Object;
    sget-object v4, Lcom/boyaa/godsdk/core/GodSDKLocation;->LOCATION_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v5, "getLocationChannel"

    .line 391
    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 390
    invoke-static {v4, v5, v6, v2, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 396
    .end local v2    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 393
    :catch_0
    move-exception v0

    .line 394
    .local v0, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v5, "getLocationChannelByClassName Exception"

    invoke-virtual {v4, v5, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v1, v3

    .line 396
    goto :goto_0
.end method

.method private getPluginObjectByLocationChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
    .locals 3
    .param p1, "locationChannel"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 351
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKLocation;->getSupportingLocationChannelsMap()Ljava/util/Map;

    move-result-object v1

    .line 352
    .local v1, "locationChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 353
    .local v0, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    return-object v2
.end method

.method private getSupportingLocationChannelsMap()Ljava/util/Map;
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
    .line 357
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mSupportingLocationChannelsMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 358
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKLocation;->initSupporingLocationChannels()V

    .line 360
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mSupportingLocationChannelsMap:Ljava/util/Map;

    return-object v0
.end method

.method private initDefaultLocationChannelPriorityList()V
    .locals 15

    .prologue
    .line 314
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationChannelPriorityList:Ljava/util/List;

    if-eqz v9, :cond_0

    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationChannelPriorityList:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-nez v9, :cond_1

    .line 315
    :cond_0
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationChannelPriorityList:Ljava/util/List;

    .line 317
    :cond_1
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginList()Ljava/util/List;

    move-result-object v5

    .line 319
    .local v5, "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :try_start_0
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_2
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_3

    .line 348
    :goto_1
    return-void

    .line 319
    :cond_3
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 321
    .local v4, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_start_1
    invoke-virtual {v4}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 322
    .local v7, "type1":I
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKLocation;->getPluginType()Lcom/boyaa/godsdk/core/PluginType;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/godsdk/core/PluginType;->getType()I

    move-result v8

    .line 323
    .local v8, "type2":I
    and-int v6, v7, v8

    .line 325
    .local v6, "result":I
    if-ne v6, v8, :cond_2

    .line 326
    invoke-virtual {v4}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/boyaa/godsdk/core/GodSDKLocation;->getLocationChannelByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 327
    .local v3, "locationChannelstrs":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_4

    .line 328
    const-string v9, "[,_\\-;]"

    invoke-virtual {v3, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 329
    .local v2, "locationChannels":[Ljava/lang/String;
    array-length v11, v2

    const/4 v9, 0x0

    :goto_2
    if-lt v9, v11, :cond_5

    .line 335
    .end local v2    # "locationChannels":[Ljava/lang/String;
    :cond_4
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "initDefaultLocationChannelPriorityList locationChannels list="

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 336
    const/4 v12, 0x1

    new-array v12, v12, [Ljava/util/List;

    const/4 v13, 0x0

    iget-object v14, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationChannelPriorityList:Ljava/util/List;

    aput-object v14, v12, v13

    invoke-static {v12}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 335
    invoke-virtual {v9, v11}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 338
    .end local v3    # "locationChannelstrs":Ljava/lang/String;
    .end local v6    # "result":I
    .end local v7    # "type1":I
    .end local v8    # "type2":I
    :catch_0
    move-exception v0

    .line 339
    .local v0, "e":Ljava/lang/NumberFormatException;
    :try_start_2
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 340
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "initDefaultLocationChannelPriorityList Plugin Type NumberFormatException plugin.getPluginType() = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 341
    invoke-virtual {v4}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 340
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 339
    invoke-virtual {v9, v11, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 345
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .end local v4    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :catch_1
    move-exception v0

    .line 346
    .local v0, "e":Ljava/lang/Exception;
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v10, "initDefaultLocationChannelPriorityList Exception"

    invoke-virtual {v9, v10, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 329
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "locationChannels":[Ljava/lang/String;
    .restart local v3    # "locationChannelstrs":Ljava/lang/String;
    .restart local v4    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    .restart local v6    # "result":I
    .restart local v7    # "type1":I
    .restart local v8    # "type2":I
    :cond_5
    :try_start_3
    aget-object v1, v2, v9

    .line 330
    .local v1, "locationChannel":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_6

    .line 331
    iget-object v12, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationChannelPriorityList:Ljava/util/List;

    invoke-interface {v12, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 329
    :cond_6
    add-int/lit8 v9, v9, 0x1

    goto :goto_2
.end method

.method private declared-synchronized initSupporingLocationChannels()V
    .locals 11

    .prologue
    .line 364
    monitor-enter p0

    :try_start_0
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mSupportingLocationChannelsMap:Ljava/util/Map;

    if-nez v7, :cond_1

    .line 365
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mSupportingLocationChannelsMap:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 367
    :try_start_1
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    invoke-virtual {v7, p0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginListByType(Lcom/boyaa/godsdk/core/IPlugin;)Ljava/util/List;

    move-result-object v6

    .line 368
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

    .line 384
    .end local v6    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    .line 368
    .restart local v6    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :cond_2
    :try_start_2
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;

    .line 369
    .local v5, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    invoke-virtual {v5}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v0

    .line 370
    .local v0, "className":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/boyaa/godsdk/core/GodSDKLocation;->getLocationChannelByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 371
    .local v4, "locationChannelstrs":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 372
    const-string v7, "[,_\\-;]"

    invoke-virtual {v4, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 373
    .local v3, "locationChannels":[Ljava/lang/String;
    array-length v9, v3

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v9, :cond_0

    aget-object v2, v3, v7

    .line 374
    .local v2, "locationChannel":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_3

    .line 375
    iget-object v10, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mSupportingLocationChannelsMap:Ljava/util/Map;

    invoke-interface {v10, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 373
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 380
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "locationChannel":Ljava/lang/String;
    .end local v3    # "locationChannels":[Ljava/lang/String;
    .end local v4    # "locationChannelstrs":Ljava/lang/String;
    .end local v5    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    .end local v6    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :catch_0
    move-exception v1

    .line 381
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v8, "initSupporingLocationChannelTags Exception"

    invoke-virtual {v7, v8, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 364
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7
.end method

.method private requestStartLocation(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "locationChannel"    # Ljava/lang/String;
    .param p3, "params"    # Ljava/lang/String;

    .prologue
    .line 203
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKLocation;->getPluginObjectByLocationChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->LOCATION:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 204
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKLocation;->LOCATION_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "startLocate"

    .line 205
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-class v6, Lcom/boyaa/godsdk/callback/LocationListener;

    aput-object v6, v4, v5

    .line 206
    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p3, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationListener:Lcom/boyaa/godsdk/callback/LocationListener;

    aput-object v7, v5, v6

    .line 204
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 224
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 207
    :catch_0
    move-exception v0

    .line 208
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKLocation.startLocate Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 209
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationListener:Lcom/boyaa/godsdk/callback/LocationListener;

    if-eqz v2, :cond_0

    .line 210
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKLocation$3;

    invoke-direct {v2, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKLocation$3;-><init>(Lcom/boyaa/godsdk/core/GodSDKLocation;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private requestStopLocation(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "locationChannel"    # Ljava/lang/String;

    .prologue
    .line 249
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKLocation;->getPluginObjectByLocationChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->LOCATION:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 250
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKLocation;->LOCATION_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "stopLocate"

    .line 251
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Lcom/boyaa/godsdk/callback/LocationListener;

    aput-object v6, v4, v5

    .line 252
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationListener:Lcom/boyaa/godsdk/callback/LocationListener;

    aput-object v7, v5, v6

    .line 250
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 270
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 253
    :catch_0
    move-exception v0

    .line 254
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKLocation.stopLocate Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 255
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationListener:Lcom/boyaa/godsdk/callback/LocationListener;

    if-eqz v2, :cond_0

    .line 256
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKLocation$5;

    invoke-direct {v2, p0}, Lcom/boyaa/godsdk/core/GodSDKLocation$5;-><init>(Lcom/boyaa/godsdk/core/GodSDKLocation;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private static syncInit()V
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKLocation;->instance:Lcom/boyaa/godsdk/core/GodSDKLocation;

    if-nez v0, :cond_0

    .line 61
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKLocation;

    invoke-direct {v0}, Lcom/boyaa/godsdk/core/GodSDKLocation;-><init>()V

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKLocation;->instance:Lcom/boyaa/godsdk/core/GodSDKLocation;

    .line 63
    :cond_0
    return-void
.end method


# virtual methods
.method public callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;
    .locals 7
    .param p1, "locationChannel"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "map"    # Ljava/util/Map;
    .param p4, "listener"    # Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    .prologue
    .line 136
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKLocation;->getSupportingLocationChannelsMap()Ljava/util/Map;

    move-result-object v2

    .line 137
    .local v2, "locationChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 138
    .local v0, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 139
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->LOCATION:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v3

    .line 140
    .local v3, "obj":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 142
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/util/Map;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p3, v5, v6

    const/4 v6, 0x1

    aput-object p4, v5, v6

    .line 141
    invoke-static {v0, p2, v4, v3, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 160
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "locationChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v4

    .line 143
    :catch_0
    move-exception v1

    .line 144
    .local v1, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

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

    invoke-virtual {v4, v5, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 145
    if-eqz p4, :cond_0

    .line 146
    new-instance v4, Lcom/boyaa/godsdk/core/GodSDKLocation$1;

    invoke-direct {v4, p0, p4}, Lcom/boyaa/godsdk/core/GodSDKLocation$1;-><init>(Lcom/boyaa/godsdk/core/GodSDKLocation;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)V

    invoke-static {v4}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 160
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
    .line 124
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKLocation;->getDefaultLocationChannel()Ljava/lang/String;

    move-result-object v0

    .line 125
    .local v0, "locationChannel":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 126
    const/4 v1, 0x0

    .line 128
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKLocation;->callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public getDebugMode()Z
    .locals 1

    .prologue
    .line 81
    iget-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebugMode:Z

    return v0
.end method

.method public getDebugTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    const-string v0, "GodSDKLocation"

    return-object v0
.end method

.method public getDefaultLocationChannel()Ljava/lang/String;
    .locals 3

    .prologue
    .line 302
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationChannelPriorityList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 303
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKLocation;->initDefaultLocationChannelPriorityList()V

    .line 305
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getDefaultLocationChannel mLocationChannelPriorityList == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationChannelPriorityList:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 306
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationChannelPriorityList:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationChannelPriorityList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 307
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationChannelPriorityList:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 309
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getLocation(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "locationChannel"    # Ljava/lang/String;

    .prologue
    .line 274
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "GodSDKLocation.getLocation locationChannel = "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 275
    const/4 v2, 0x0

    .line 277
    .local v2, "infos":Ljava/lang/String;
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKLocation;->getPluginObjectByLocationChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 278
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->LOCATION:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v3

    .line 280
    .local v3, "obj":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getLocation"

    .line 281
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/app/Activity;

    aput-object v8, v6, v7

    .line 282
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    .line 279
    invoke-static {v4, v5, v6, v3, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/lang/String;

    move-object v2, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 286
    .end local v3    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v2

    .line 283
    :catch_0
    move-exception v1

    .line 284
    .local v1, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "getLocation "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " Exception "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getPluginType()Lcom/boyaa/godsdk/core/PluginType;
    .locals 1

    .prologue
    .line 71
    sget-object v0, Lcom/boyaa/godsdk/core/PluginType;->LOCATION:Lcom/boyaa/godsdk/core/PluginType;

    return-object v0
.end method

.method public getSupportingLocationChannels()Ljava/util/Set;
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
    .line 296
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKLocation;->getSupportingLocationChannelsMap()Ljava/util/Map;

    move-result-object v0

    .line 297
    .local v0, "mLocationChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public isSupportMethod(Ljava/lang/String;)Z
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 91
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKLocation;->getDefaultLocationChannel()Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, "locationChannel":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 93
    const/4 v1, 0x0

    .line 95
    :goto_0
    return v1

    :cond_0
    invoke-virtual {p0, v0, p1}, Lcom/boyaa/godsdk/core/GodSDKLocation;->isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 10
    .param p1, "locationChannel"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 102
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKLocation;->getSupportingLocationChannelsMap()Ljava/util/Map;

    move-result-object v0

    .line 103
    .local v0, "LocationChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 104
    .local v1, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    invoke-virtual {v7, v1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v7

    .line 105
    sget-object v8, Lcom/boyaa/godsdk/core/PluginType;->LOCATION:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v7, v8}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v4

    .line 106
    .local v4, "obj":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 107
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "isSupportMethod className == "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " isLocalClass == "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->isLocalClass()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 108
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

    .line 107
    invoke-virtual {v7, v8}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 110
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Ljava/util/Map;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-class v9, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v9, v7, v8

    .line 109
    invoke-static {v1, p2, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->getMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 111
    .local v3, "method":Ljava/lang/reflect/Method;
    if-eqz v3, :cond_0

    .line 119
    .end local v0    # "LocationChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "className":Ljava/lang/String;
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "obj":Ljava/lang/Object;
    :goto_0
    return v5

    .restart local v0    # "LocationChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v1    # "className":Ljava/lang/String;
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    .restart local v4    # "obj":Ljava/lang/Object;
    :cond_0
    move v5, v6

    .line 114
    goto :goto_0

    .line 116
    .end local v0    # "LocationChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "className":Ljava/lang/String;
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 117
    .local v2, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v7, "isSupportMethod Exception"

    invoke-virtual {v5, v7, v2}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move v5, v6

    .line 119
    goto :goto_0
.end method

.method public setDebugMode(Z)V
    .locals 0
    .param p1, "debugMode"    # Z

    .prologue
    .line 76
    iput-boolean p1, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebugMode:Z

    .line 77
    return-void
.end method

.method public setLocationListener(Lcom/boyaa/godsdk/callback/LocationListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/boyaa/godsdk/callback/LocationListener;

    .prologue
    .line 291
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationListener:Lcom/boyaa/godsdk/callback/LocationListener;

    .line 292
    return-void
.end method

.method public startLocate(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;

    .prologue
    const/4 v5, -0x2

    .line 166
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 167
    .local v1, "json":Lorg/json/JSONObject;
    const-string v4, "LocationChannel"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 168
    .local v2, "locationChannel":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v2}, Lcom/boyaa/godsdk/core/GodSDKLocation;->startLocate(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "locationChannel":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 169
    :catch_0
    move-exception v0

    .line 170
    .local v0, "e":Lorg/json/JSONException;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationListener:Lcom/boyaa/godsdk/callback/LocationListener;

    if-eqz v4, :cond_0

    .line 171
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v3

    .line 172
    .local v3, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 173
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 174
    const-string v4, "startLocate\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709LocationChannel\u5b57\u6bb5"

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 175
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationListener:Lcom/boyaa/godsdk/callback/LocationListener;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-interface {v4, v3, v5, v6}, Lcom/boyaa/godsdk/callback/LocationListener;->onFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public startLocate(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "locationChannel"    # Ljava/lang/String;

    .prologue
    .line 182
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKLocation.startLocate parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", locationChannel = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 183
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationListener:Lcom/boyaa/godsdk/callback/LocationListener;

    if-eqz v0, :cond_0

    .line 185
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKLocation$2;

    invoke-direct {v0, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKLocation$2;-><init>(Lcom/boyaa/godsdk/core/GodSDKLocation;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 198
    :cond_0
    invoke-direct {p0, p1, p3, p2}, Lcom/boyaa/godsdk/core/GodSDKLocation;->requestStartLocation(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    return-void
.end method

.method public stopLocate(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 403
    return-void
.end method

.method public stopLocate(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "locationChannel"    # Ljava/lang/String;

    .prologue
    .line 228
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKLocation.stopLocate locationChannel = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 229
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 230
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKLocation;->mLocationListener:Lcom/boyaa/godsdk/callback/LocationListener;

    if-eqz v0, :cond_0

    .line 231
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKLocation$4;

    invoke-direct {v0, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKLocation$4;-><init>(Lcom/boyaa/godsdk/core/GodSDKLocation;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 244
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/boyaa/godsdk/core/GodSDKLocation;->requestStopLocation(Landroid/app/Activity;Ljava/lang/String;)V

    .line 245
    return-void
.end method
