.class public Lcom/boyaa/godsdk/core/GodSDKPush;
.super Ljava/lang/Object;
.source "GodSDKPush.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/IPushPlugin;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/godsdk/core/GodSDKPush$Action;,
        Lcom/boyaa/godsdk/core/GodSDKPush$BundleKey;
    }
.end annotation


# static fields
.field private static final PUSH_PLUGIN_PROTOCOL:Ljava/lang/Class;

.field private static final TAG:Ljava/lang/String; = "GodSDKPush"

.field private static instance:Lcom/boyaa/godsdk/core/GodSDKPush;


# instance fields
.field private mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

.field private mDebugMode:Z

.field private mPushClassNamePriorityList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

.field private mPushName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 76
    const-class v0, Lcom/boyaa/godsdk/protocol/PushPluginProtocol;

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKPush;->PUSH_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 78
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKPush;->instance:Lcom/boyaa/godsdk/core/GodSDKPush;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebugMode:Z

    .line 99
    new-instance v0, Lcom/boyaa/godsdk/core/utils/Debug;

    invoke-direct {v0, p0}, Lcom/boyaa/godsdk/core/utils/Debug;-><init>(Lcom/boyaa/godsdk/core/IDebugable;)V

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 100
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/godsdk/core/GodSDKPush;)Lcom/boyaa/godsdk/callback/PushListener;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    return-object v0
.end method

.method static broadcastGetRegistrationId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "registrationId"    # Ljava/lang/String;
    .param p2, "pushName"    # Ljava/lang/String;

    .prologue
    .line 68
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 69
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.boyaa.godsdk.action.GodSDKPush.RECEIVE_REGISTRATION_ID"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 70
    const-string v1, "registrationId"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 71
    const-string v1, "pushName"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 72
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 73
    return-void
.end method

.method static broadcastReceiveRawData(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "rawData"    # Ljava/lang/String;
    .param p2, "pushName"    # Ljava/lang/String;

    .prologue
    .line 53
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 54
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.boyaa.godsdk.action.GodSDKPush.RECEIVE_RAW_DATA"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 55
    const-string v1, "rawData"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 56
    const-string v1, "pushName"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 57
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 58
    return-void
.end method

.method private getDefaultPushClassName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 123
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushClassNamePriorityList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 124
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->initDefaultPushPriorityList()V

    .line 126
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getDefaultPushClassName mPushClassNamePriorityList == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushClassNamePriorityList:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 127
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushClassNamePriorityList:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushClassNamePriorityList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 128
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushClassNamePriorityList:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 130
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getDefaultPushObject()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 161
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->getDefaultPushClassName()Ljava/lang/String;

    move-result-object v0

    .line 162
    .local v0, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->PUSH:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 163
    .local v1, "obj":Ljava/lang/Object;
    return-object v1
.end method

.method public static getInstance()Lcom/boyaa/godsdk/core/GodSDKPush;
    .locals 1

    .prologue
    .line 80
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKPush;->instance:Lcom/boyaa/godsdk/core/GodSDKPush;

    if-nez v0, :cond_0

    .line 81
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKPush;->syncInit()V

    .line 83
    :cond_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKPush;->instance:Lcom/boyaa/godsdk/core/GodSDKPush;

    return-object v0
.end method

.method private declared-synchronized initDefaultPushPriorityList()V
    .locals 11

    .prologue
    .line 134
    monitor-enter p0

    :try_start_0
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushClassNamePriorityList:Ljava/util/List;

    if-nez v7, :cond_0

    .line 135
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushClassNamePriorityList:Ljava/util/List;

    .line 137
    :cond_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    invoke-virtual {v7}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginList()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 139
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

    .line 158
    :goto_1
    monitor-exit p0

    return-void

    .line 139
    :cond_2
    :try_start_2
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 141
    .local v2, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_start_3
    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 142
    .local v5, "type1":I
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->getPluginType()Lcom/boyaa/godsdk/core/PluginType;

    move-result-object v8

    invoke-virtual {v8}, Lcom/boyaa/godsdk/core/PluginType;->getType()I

    move-result v6

    .line 143
    .local v6, "type2":I
    and-int v4, v5, v6

    .line 145
    .local v4, "result":I
    if-ne v4, v6, :cond_1

    .line 146
    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v0

    .line 147
    .local v0, "className":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 148
    iget-object v8, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushClassNamePriorityList:Ljava/util/List;

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 151
    .end local v0    # "className":Ljava/lang/String;
    .end local v4    # "result":I
    .end local v5    # "type1":I
    .end local v6    # "type2":I
    :catch_0
    move-exception v1

    .line 152
    .local v1, "e":Ljava/lang/NumberFormatException;
    :try_start_4
    iget-object v8, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "initDefaultPushPriorityList Plugin Type NumberFormatException plugin.getPluginType() = "

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

    .line 155
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v2    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :catch_1
    move-exception v1

    .line 156
    .local v1, "e":Ljava/lang/Exception;
    :try_start_5
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v8, "initDefaultPushPriorityList Exception"

    invoke-virtual {v7, v8, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 134
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7
.end method

.method private declared-synchronized initPushName()V
    .locals 6

    .prologue
    .line 488
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushName:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 490
    :try_start_1
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->getDefaultPushObject()Ljava/lang/Object;

    move-result-object v1

    .line 491
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKPush;->PUSH_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "getPushName"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushName:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 496
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 492
    :catch_0
    move-exception v0

    .line 493
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "getPushName Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 488
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private static declared-synchronized syncInit()V
    .locals 2

    .prologue
    .line 87
    const-class v1, Lcom/boyaa/godsdk/core/GodSDKPush;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKPush;->instance:Lcom/boyaa/godsdk/core/GodSDKPush;

    if-nez v0, :cond_0

    .line 88
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKPush;

    invoke-direct {v0}, Lcom/boyaa/godsdk/core/GodSDKPush;-><init>()V

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKPush;->instance:Lcom/boyaa/godsdk/core/GodSDKPush;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    :cond_0
    monitor-exit v1

    return-void

    .line 87
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public addAlias(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "alias"    # Ljava/lang/String;

    .prologue
    .line 210
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->isSupportAddAlias()Z

    move-result v2

    if-nez v2, :cond_1

    .line 211
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    if-eqz v2, :cond_0

    .line 212
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKPush$1;

    invoke-direct {v2, p0}, Lcom/boyaa/godsdk/core/GodSDKPush$1;-><init>(Lcom/boyaa/godsdk/core/GodSDKPush;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 247
    :cond_0
    :goto_0
    return-void

    .line 228
    :cond_1
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->getDefaultPushObject()Ljava/lang/Object;

    move-result-object v1

    .line 229
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKPush;->PUSH_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "addAlias"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/content/Context;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-class v6, Lcom/boyaa/godsdk/callback/PushListener;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    aput-object v7, v5, v6

    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 230
    .end local v1    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 231
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKPush.addAlias Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 232
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    if-eqz v2, :cond_0

    .line 233
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKPush$2;

    invoke-direct {v2, p0}, Lcom/boyaa/godsdk/core/GodSDKPush$2;-><init>(Lcom/boyaa/godsdk/core/GodSDKPush;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;
    .locals 1
    .param p1, "flag"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "map"    # Ljava/util/Map;
    .param p4, "listener"    # Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    .prologue
    .line 476
    invoke-virtual {p0, p2, p3, p4}, Lcom/boyaa/godsdk/core/GodSDKPush;->callSpecialMethod(Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public callSpecialMethod(Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;
    .locals 6
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "map"    # Ljava/util/Map;
    .param p3, "listener"    # Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    .prologue
    .line 449
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->getDefaultPushObject()Ljava/lang/Object;

    move-result-object v2

    .line 450
    .local v2, "obj":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 451
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

    .line 469
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v3

    .line 452
    :catch_0
    move-exception v1

    .line 453
    .local v1, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "callSpecialMethod "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "Exception"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 454
    if-eqz p3, :cond_0

    .line 455
    new-instance v3, Lcom/boyaa/godsdk/core/GodSDKPush$9;

    invoke-direct {v3, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKPush$9;-><init>(Lcom/boyaa/godsdk/core/GodSDKPush;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)V

    invoke-static {v3}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 469
    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getDebugMode()Z
    .locals 1

    .prologue
    .line 114
    iget-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebugMode:Z

    return v0
.end method

.method public getDebugTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 119
    const-string v0, "GodSDKPush"

    return-object v0
.end method

.method public getPluginType()Lcom/boyaa/godsdk/core/PluginType;
    .locals 1

    .prologue
    .line 104
    sget-object v0, Lcom/boyaa/godsdk/core/PluginType;->PUSH:Lcom/boyaa/godsdk/core/PluginType;

    return-object v0
.end method

.method getPushListener()Lcom/boyaa/godsdk/callback/PushListener;
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    return-object v0
.end method

.method public getPushName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 481
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushName:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 482
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->initPushName()V

    .line 484
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushName:Ljava/lang/String;

    return-object v0
.end method

.method public getRegistrationId(Landroid/content/Context;)Ljava/lang/String;
    .locals 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 411
    const/4 v3, 0x0

    .line 413
    .local v3, "result":Ljava/lang/String;
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->getDefaultPushObject()Ljava/lang/Object;

    move-result-object v2

    .line 414
    .local v2, "obj":Ljava/lang/Object;
    sget-object v4, Lcom/boyaa/godsdk/core/GodSDKPush;->PUSH_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v5, "getRegistrationId"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/content/Context;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    invoke-static {v4, v5, v6, v2, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/lang/String;

    move-object v3, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v4, v3

    .line 419
    .end local v2    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v4

    .line 416
    :catch_0
    move-exception v1

    .line 417
    .local v1, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v5, "GodSDKPush.getRegistrationId Exception"

    invoke-virtual {v4, v5, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 419
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public isSupportAddAlias()Z
    .locals 7

    .prologue
    .line 197
    const/4 v2, 0x0

    .line 199
    .local v2, "result":Z
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->getDefaultPushObject()Ljava/lang/Object;

    move-result-object v1

    .line 200
    .local v1, "obj":Ljava/lang/Object;
    sget-object v3, Lcom/boyaa/godsdk/core/GodSDKPush;->PUSH_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v4, "isSupportAddAlias"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v1, v6}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    move v3, v2

    .line 205
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return v3

    .line 202
    :catch_0
    move-exception v0

    .line 203
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v4, "GodSDKPush.isSupportAddAlias Exception"

    invoke-virtual {v3, v4, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 205
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public isSupportMethod(Ljava/lang/String;)Z
    .locals 9
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 425
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->getDefaultPushObject()Ljava/lang/Object;

    move-result-object v3

    .line 426
    .local v3, "obj":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 427
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

    .line 428
    .local v2, "method":Ljava/lang/reflect/Method;
    if-eqz v2, :cond_0

    .line 436
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

    .line 431
    goto :goto_0

    .line 433
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v3    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 434
    .local v1, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v6, "isSupportMethod Exception"

    invoke-virtual {v4, v6, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move v4, v5

    .line 436
    goto :goto_0
.end method

.method public isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "flag"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    .line 442
    invoke-virtual {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKPush;->isSupportMethod(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSupportRemoveAlias()Z
    .locals 7

    .prologue
    .line 251
    const/4 v2, 0x0

    .line 253
    .local v2, "result":Z
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->getDefaultPushObject()Ljava/lang/Object;

    move-result-object v1

    .line 254
    .local v1, "obj":Ljava/lang/Object;
    sget-object v3, Lcom/boyaa/godsdk/core/GodSDKPush;->PUSH_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v4, "isSupportRemoveAlias"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v1, v6}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    move v3, v2

    .line 259
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return v3

    .line 256
    :catch_0
    move-exception v0

    .line 257
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v4, "GodSDKPush.isSupportRemoveAlias Exception"

    invoke-virtual {v3, v4, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 259
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public isSupportRemoveTags()Z
    .locals 7

    .prologue
    .line 358
    const/4 v2, 0x0

    .line 360
    .local v2, "result":Z
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->getDefaultPushObject()Ljava/lang/Object;

    move-result-object v1

    .line 361
    .local v1, "obj":Ljava/lang/Object;
    sget-object v3, Lcom/boyaa/godsdk/core/GodSDKPush;->PUSH_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v4, "isSupportRemovetTags"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v1, v6}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    move v3, v2

    .line 366
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return v3

    .line 363
    :catch_0
    move-exception v0

    .line 364
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v4, "GodSDKPush.isSupportRemovetTags Exception"

    invoke-virtual {v3, v4, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 366
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public isSupportSetTags()Z
    .locals 7

    .prologue
    .line 305
    const/4 v2, 0x0

    .line 307
    .local v2, "result":Z
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->getDefaultPushObject()Ljava/lang/Object;

    move-result-object v1

    .line 308
    .local v1, "obj":Ljava/lang/Object;
    sget-object v3, Lcom/boyaa/godsdk/core/GodSDKPush;->PUSH_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v4, "isSupportSetTags"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v1, v6}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    move v3, v2

    .line 313
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return v3

    .line 310
    :catch_0
    move-exception v0

    .line 311
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v4, "GodSDKPush.isSupportSetTags Exception"

    invoke-virtual {v3, v4, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 313
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public removeAlias(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "alias"    # Ljava/lang/String;

    .prologue
    .line 264
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->isSupportRemoveAlias()Z

    move-result v2

    if-nez v2, :cond_1

    .line 265
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    if-eqz v2, :cond_0

    .line 266
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKPush$3;

    invoke-direct {v2, p0}, Lcom/boyaa/godsdk/core/GodSDKPush$3;-><init>(Lcom/boyaa/godsdk/core/GodSDKPush;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 301
    :cond_0
    :goto_0
    return-void

    .line 282
    :cond_1
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->getDefaultPushObject()Ljava/lang/Object;

    move-result-object v1

    .line 283
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKPush;->PUSH_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "removeAlias"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/content/Context;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-class v6, Lcom/boyaa/godsdk/callback/PushListener;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    aput-object v7, v5, v6

    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 284
    .end local v1    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 285
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKPush.removeAlias Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 286
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    if-eqz v2, :cond_0

    .line 287
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKPush$4;

    invoke-direct {v2, p0}, Lcom/boyaa/godsdk/core/GodSDKPush$4;-><init>(Lcom/boyaa/godsdk/core/GodSDKPush;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public removeTags(Landroid/content/Context;Ljava/util/List;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 371
    .local p2, "tags":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->isSupportRemoveTags()Z

    move-result v2

    if-nez v2, :cond_1

    .line 372
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    if-eqz v2, :cond_0

    .line 373
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKPush$7;

    invoke-direct {v2, p0}, Lcom/boyaa/godsdk/core/GodSDKPush$7;-><init>(Lcom/boyaa/godsdk/core/GodSDKPush;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 407
    :cond_0
    :goto_0
    return-void

    .line 389
    :cond_1
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->getDefaultPushObject()Ljava/lang/Object;

    move-result-object v1

    .line 390
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKPush;->PUSH_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "removeTags"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/content/Context;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/util/List;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-class v6, Lcom/boyaa/godsdk/callback/PushListener;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    aput-object v7, v5, v6

    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 391
    .end local v1    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 392
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKPush.removeTags Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 393
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    if-eqz v2, :cond_0

    .line 394
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKPush$8;

    invoke-direct {v2, p0}, Lcom/boyaa/godsdk/core/GodSDKPush$8;-><init>(Lcom/boyaa/godsdk/core/GodSDKPush;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public setDebugMode(Z)V
    .locals 0
    .param p1, "debugMode"    # Z

    .prologue
    .line 109
    iput-boolean p1, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebugMode:Z

    .line 110
    return-void
.end method

.method public setPushListener(Lcom/boyaa/godsdk/callback/PushListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/boyaa/godsdk/callback/PushListener;

    .prologue
    .line 168
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    .line 169
    return-void
.end method

.method public setTags(Landroid/content/Context;Ljava/util/List;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 318
    .local p2, "tags":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->isSupportSetTags()Z

    move-result v2

    if-nez v2, :cond_1

    .line 319
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    if-eqz v2, :cond_0

    .line 320
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKPush$5;

    invoke-direct {v2, p0}, Lcom/boyaa/godsdk/core/GodSDKPush$5;-><init>(Lcom/boyaa/godsdk/core/GodSDKPush;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 354
    :cond_0
    :goto_0
    return-void

    .line 336
    :cond_1
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->getDefaultPushObject()Ljava/lang/Object;

    move-result-object v1

    .line 337
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKPush;->PUSH_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "setTags"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/content/Context;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/util/List;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-class v6, Lcom/boyaa/godsdk/callback/PushListener;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    aput-object v7, v5, v6

    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 338
    .end local v1    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 339
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKPush.setTags Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 340
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mPushListener:Lcom/boyaa/godsdk/callback/PushListener;

    if-eqz v2, :cond_0

    .line 341
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKPush$6;

    invoke-direct {v2, p0}, Lcom/boyaa/godsdk/core/GodSDKPush$6;-><init>(Lcom/boyaa/godsdk/core/GodSDKPush;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public turnOffPush(Landroid/content/Context;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 188
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->getDefaultPushObject()Ljava/lang/Object;

    move-result-object v1

    .line 189
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKPush;->PUSH_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "turnOffPush"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/content/Context;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 193
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return-void

    .line 190
    :catch_0
    move-exception v0

    .line 191
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKPush.turnOffPush Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public turnOnPush(Landroid/content/Context;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 178
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKPush;->getDefaultPushObject()Ljava/lang/Object;

    move-result-object v1

    .line 179
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKPush;->PUSH_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "turnOnPush"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/content/Context;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return-void

    .line 180
    :catch_0
    move-exception v0

    .line 181
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKPush;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKPush.turnOnPush Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
