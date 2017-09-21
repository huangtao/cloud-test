.class public Lcom/boyaa/godsdk/core/GodSDKAnalytics;
.super Ljava/lang/Object;
.source "GodSDKAnalytics.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/IAnalyticsPlugin;


# static fields
.field private static final ANALYTICS_PLUGIN_PROTOCOL:Ljava/lang/Class;

.field private static final TAG:Ljava/lang/String; = "GodSDKAnalytics"

.field private static instance:Lcom/boyaa/godsdk/core/GodSDKAnalytics;


# instance fields
.field private mAnalyticClassNamePriorityList:Ljava/util/List;
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


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-class v0, Lcom/boyaa/godsdk/protocol/AnalyticsPluginProtocol;

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->ANALYTICS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 29
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->instance:Lcom/boyaa/godsdk/core/GodSDKAnalytics;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebugMode:Z

    .line 48
    new-instance v0, Lcom/boyaa/godsdk/core/utils/Debug;

    invoke-direct {v0, p0}, Lcom/boyaa/godsdk/core/utils/Debug;-><init>(Lcom/boyaa/godsdk/core/IDebugable;)V

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 49
    return-void
.end method

.method private getDefaultAnalyticClassName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 72
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mAnalyticClassNamePriorityList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 73
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->initDefaultAnalyticPriorityList()V

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getDefaultAnalyticClassName mAnalyticClassNamePriorityList == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mAnalyticClassNamePriorityList:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 76
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mAnalyticClassNamePriorityList:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mAnalyticClassNamePriorityList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 77
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mAnalyticClassNamePriorityList:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 79
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getDefaultAnalyticObject()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 110
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getDefaultAnalyticClassName()Ljava/lang/String;

    move-result-object v0

    .line 111
    .local v0, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->ANALYTICS:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 112
    .local v1, "obj":Ljava/lang/Object;
    return-object v1
.end method

.method public static getInstance()Lcom/boyaa/godsdk/core/GodSDKAnalytics;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->instance:Lcom/boyaa/godsdk/core/GodSDKAnalytics;

    if-nez v0, :cond_0

    .line 32
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->syncInit()V

    .line 34
    :cond_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->instance:Lcom/boyaa/godsdk/core/GodSDKAnalytics;

    return-object v0
.end method

.method private declared-synchronized initDefaultAnalyticPriorityList()V
    .locals 11

    .prologue
    .line 83
    monitor-enter p0

    :try_start_0
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mAnalyticClassNamePriorityList:Ljava/util/List;

    if-nez v7, :cond_0

    .line 84
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mAnalyticClassNamePriorityList:Ljava/util/List;

    .line 86
    :cond_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    invoke-virtual {v7}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginList()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 88
    .local v3, "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :try_start_1
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v8

    if-nez v8, :cond_2

    .line 107
    :goto_1
    monitor-exit p0

    return-void

    .line 88
    :cond_2
    :try_start_2
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 90
    .local v2, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_start_3
    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 91
    .local v5, "type1":I
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getPluginType()Lcom/boyaa/godsdk/core/PluginType;

    move-result-object v8

    invoke-virtual {v8}, Lcom/boyaa/godsdk/core/PluginType;->getType()I

    move-result v6

    .line 92
    .local v6, "type2":I
    and-int v4, v5, v6

    .line 94
    .local v4, "result":I
    if-ne v4, v6, :cond_1

    .line 95
    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v0

    .line 96
    .local v0, "className":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 97
    iget-object v8, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mAnalyticClassNamePriorityList:Ljava/util/List;

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 100
    .end local v0    # "className":Ljava/lang/String;
    .end local v4    # "result":I
    .end local v5    # "type1":I
    .end local v6    # "type2":I
    :catch_0
    move-exception v1

    .line 101
    .local v1, "e":Ljava/lang/NumberFormatException;
    :try_start_4
    iget-object v8, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "initDefaultAnalyticPriorityList Plugin Type NumberFormatException plugin.getPluginType() = "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 104
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v2    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :catch_1
    move-exception v1

    .line 105
    .local v1, "e":Ljava/lang/Exception;
    :try_start_5
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v8, "initDefaultAnalyticPriorityList Exception"

    invoke-virtual {v7, v8, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 83
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7
.end method

.method private static declared-synchronized syncInit()V
    .locals 2

    .prologue
    .line 38
    const-class v1, Lcom/boyaa/godsdk/core/GodSDKAnalytics;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->instance:Lcom/boyaa/godsdk/core/GodSDKAnalytics;

    if-nez v0, :cond_0

    .line 39
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;

    invoke-direct {v0}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;-><init>()V

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->instance:Lcom/boyaa/godsdk/core/GodSDKAnalytics;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    :cond_0
    monitor-exit v1

    return-void

    .line 38
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;
    .locals 1
    .param p1, "flag"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "map"    # Ljava/util/Map;
    .param p4, "listener"    # Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    .prologue
    .line 169
    invoke-virtual {p0, p2, p3, p4}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->callSpecialMethod(Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public callSpecialMethod(Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;
    .locals 6
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "map"    # Ljava/util/Map;
    .param p3, "listener"    # Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    .prologue
    .line 142
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getDefaultAnalyticObject()Ljava/lang/Object;

    move-result-object v2

    .line 143
    .local v2, "obj":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 144
    .local v0, "className":Ljava/lang/String;
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Ljava/util/Map;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p2, v4, v5

    const/4 v5, 0x1

    aput-object p3, v4, v5

    invoke-static {v0, p1, v3, v2, v4}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 162
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v3

    .line 145
    :catch_0
    move-exception v1

    .line 146
    .local v1, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "callSpecialMethod "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " Exception "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 147
    if-eqz p3, :cond_0

    .line 148
    new-instance v3, Lcom/boyaa/godsdk/core/GodSDKAnalytics$1;

    invoke-direct {v3, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKAnalytics$1;-><init>(Lcom/boyaa/godsdk/core/GodSDKAnalytics;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)V

    invoke-static {v3}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 162
    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getAnalyticName()Ljava/lang/String;
    .locals 8

    .prologue
    .line 290
    const/4 v2, 0x0

    .line 292
    .local v2, "name":Ljava/lang/String;
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getDefaultAnalyticObject()Ljava/lang/Object;

    move-result-object v3

    .line 293
    .local v3, "obj":Ljava/lang/Object;
    sget-object v4, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->ANALYTICS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v5, "getAnalyticName"

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static {v4, v5, v6, v3, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/lang/String;

    move-object v2, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 297
    .end local v3    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v2

    .line 294
    :catch_0
    move-exception v1

    .line 295
    .local v1, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v5, "getAnalyticName Exception"

    invoke-virtual {v4, v5, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getDebugMode()Z
    .locals 1

    .prologue
    .line 63
    iget-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebugMode:Z

    return v0
.end method

.method public getDebugTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    const-string v0, "GodSDKAnalytics"

    return-object v0
.end method

.method public getPluginType()Lcom/boyaa/godsdk/core/PluginType;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/boyaa/godsdk/core/PluginType;->ANALYTICS:Lcom/boyaa/godsdk/core/PluginType;

    return-object v0
.end method

.method public isSupportMethod(Ljava/lang/String;)Z
    .locals 9
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 118
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getDefaultAnalyticObject()Ljava/lang/Object;

    move-result-object v3

    .line 119
    .local v3, "obj":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 120
    .local v0, "className":Ljava/lang/String;
    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Ljava/util/Map;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const-class v8, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v8, v6, v7

    invoke-static {v0, p1, v6}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->getMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 121
    .local v2, "method":Ljava/lang/reflect/Method;
    if-eqz v2, :cond_0

    .line 129
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v3    # "obj":Ljava/lang/Object;
    :goto_0
    return v4

    .restart local v0    # "className":Ljava/lang/String;
    .restart local v2    # "method":Ljava/lang/reflect/Method;
    .restart local v3    # "obj":Ljava/lang/Object;
    :cond_0
    move v4, v5

    .line 124
    goto :goto_0

    .line 126
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v3    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 127
    .local v1, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v6, "isSupportMethod Exception"

    invoke-virtual {v4, v6, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move v4, v5

    .line 129
    goto :goto_0
.end method

.method public isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "flag"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    .line 135
    invoke-virtual {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->isSupportMethod(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public onEvent(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "eventId"    # Ljava/lang/String;

    .prologue
    .line 223
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getDefaultAnalyticObject()Ljava/lang/Object;

    move-result-object v1

    .line 224
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->ANALYTICS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "onEvent"

    .line 225
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    .line 226
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    .line 224
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return-void

    .line 227
    :catch_0
    move-exception v0

    .line 228
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKAnalytics.onEvent Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onEvent(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)V
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "eventId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 236
    .local p3, "paramMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getDefaultAnalyticObject()Ljava/lang/Object;

    move-result-object v1

    .line 238
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->ANALYTICS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "onEvent"

    .line 239
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    .line 240
    const-class v6, Ljava/util/Map;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    .line 241
    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    const/4 v6, 0x2

    aput-object p3, v5, v6

    .line 238
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 245
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return-void

    .line 242
    :catch_0
    move-exception v0

    .line 243
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKAnalytics.onEvent Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onKillProcess(Landroid/content/Context;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 211
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getDefaultAnalyticObject()Ljava/lang/Object;

    move-result-object v1

    .line 212
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->ANALYTICS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 213
    const-string v3, "onKillProcess"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/content/Context;

    aput-object v6, v4, v5

    .line 214
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    .line 212
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 218
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return-void

    .line 215
    :catch_0
    move-exception v0

    .line 216
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKAnalytics.onKillProcess Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onPauseSession(Landroid/app/Activity;)V
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 199
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getDefaultAnalyticObject()Ljava/lang/Object;

    move-result-object v1

    .line 200
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->ANALYTICS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 201
    const-string v3, "onPauseSession"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    .line 202
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    .line 200
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return-void

    .line 203
    :catch_0
    move-exception v0

    .line 204
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKAnalytics.onPauseSession Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onResumeSession(Landroid/app/Activity;)V
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 187
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getDefaultAnalyticObject()Ljava/lang/Object;

    move-result-object v1

    .line 188
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->ANALYTICS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 189
    const-string v3, "onResumeSession"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    .line 190
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    .line 188
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 194
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return-void

    .line 191
    :catch_0
    move-exception v0

    .line 192
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKAnalytics.onResumeSession Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public reportError(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "errorId"    # Ljava/lang/String;
    .param p3, "errorMsg"    # Ljava/lang/String;

    .prologue
    .line 263
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getDefaultAnalyticObject()Ljava/lang/Object;

    move-result-object v1

    .line 265
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->ANALYTICS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "reportError"

    .line 266
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/content/Context;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    .line 267
    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    .line 268
    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    const/4 v6, 0x2

    aput-object p3, v5, v6

    .line 265
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 272
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return-void

    .line 269
    :catch_0
    move-exception v0

    .line 270
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKAnalytics.reportError Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public reportError(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "errorId"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 277
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getDefaultAnalyticObject()Ljava/lang/Object;

    move-result-object v1

    .line 279
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->ANALYTICS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "reportError"

    .line 280
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/content/Context;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    .line 281
    const-class v6, Ljava/lang/Throwable;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    .line 282
    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    const/4 v6, 0x2

    aput-object p3, v5, v6

    .line 279
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 286
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return-void

    .line 283
    :catch_0
    move-exception v0

    .line 284
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKAnalytics.reportError Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public setCatchUncaughtExceptions(Landroid/content/Context;Z)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "bool"    # Z

    .prologue
    .line 250
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getDefaultAnalyticObject()Ljava/lang/Object;

    move-result-object v1

    .line 251
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->ANALYTICS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 252
    const-string v3, "setCatchUncaughtExceptions"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/content/Context;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    .line 253
    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    .line 254
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    .line 251
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 258
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return-void

    .line 255
    :catch_0
    move-exception v0

    .line 256
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKAnalytics.setCatchUncaughtExceptions Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public setDebugMode(Z)V
    .locals 0
    .param p1, "debugMode"    # Z

    .prologue
    .line 58
    iput-boolean p1, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebugMode:Z

    .line 59
    return-void
.end method

.method public setSessionContinueMillis(J)V
    .locals 8
    .param p1, "interval"    # J

    .prologue
    .line 175
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->getDefaultAnalyticObject()Ljava/lang/Object;

    move-result-object v1

    .line 176
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->ANALYTICS_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 177
    const-string v3, "setSessionContinueMillis"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    .line 178
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    .line 176
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 182
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return-void

    .line 179
    :catch_0
    move-exception v0

    .line 180
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAnalytics;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKAnalytics.setSessionContinueMillis Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
