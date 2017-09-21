.class public Lcom/boyaa/godsdk/core/GodSDKAccount;
.super Ljava/lang/Object;
.source "GodSDKAccount.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/IAccountPlugin;


# static fields
.field private static final ACCOUNT_PLUGIN_PROTOCOL:Ljava/lang/Class;

.field private static final TAG:Ljava/lang/String; = "GodSDKAccount"

.field private static instance:Lcom/boyaa/godsdk/core/GodSDKAccount;


# instance fields
.field private mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

.field private mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

.field private mDebugMode:Z

.field private mLoginTagPriorityList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSupportingLoginTagsMap:Ljava/util/Map;
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
    .line 33
    const-class v0, Lcom/boyaa/godsdk/protocol/AccountPluginProtocol;

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKAccount;->ACCOUNT_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 34
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKAccount;->instance:Lcom/boyaa/godsdk/core/GodSDKAccount;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebugMode:Z

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    .line 60
    new-instance v0, Lcom/boyaa/godsdk/core/utils/Debug;

    invoke-direct {v0, p0}, Lcom/boyaa/godsdk/core/utils/Debug;-><init>(Lcom/boyaa/godsdk/core/IDebugable;)V

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 61
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/godsdk/core/GodSDKAccount;)Lcom/boyaa/godsdk/callback/AccountListener;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    return-object v0
.end method

.method private findAppropriateMethodName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "origMethodName"    # Ljava/lang/String;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 771
    invoke-static {p1, p2}, Lcom/boyaa/godsdk/core/utils/AppropriateMethodNameAdapter;->getSuitableMethod(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance()Lcom/boyaa/godsdk/core/GodSDKAccount;
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKAccount;->instance:Lcom/boyaa/godsdk/core/GodSDKAccount;

    if-nez v0, :cond_0

    .line 38
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKAccount;->syncInit()V

    .line 40
    :cond_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKAccount;->instance:Lcom/boyaa/godsdk/core/GodSDKAccount;

    return-object v0
.end method

.method private getLoginTagByClassName(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 364
    :try_start_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v4

    .line 365
    invoke-virtual {v4, p1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 366
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v2

    .line 368
    .local v2, "obj":Ljava/lang/Object;
    sget-object v4, Lcom/boyaa/godsdk/core/GodSDKAccount;->ACCOUNT_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v5, "getLoginTag"

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 367
    invoke-static {v4, v5, v6, v2, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 373
    .end local v2    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 370
    :catch_0
    move-exception v0

    .line 371
    .local v0, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v5, "getLoginTagByClassName Exception"

    invoke-virtual {v4, v5, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v1, v3

    .line 373
    goto :goto_0
.end method

.method private getPluginObjectByLoginTag(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
    .locals 3
    .param p1, "loginTag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 378
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getSupportLoginTagsMap()Ljava/util/Map;

    move-result-object v1

    .line 379
    .local v1, "loginTagClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 380
    .local v0, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    return-object v2
.end method

.method private getSupportLoginTagsMap()Ljava/util/Map;
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
    .line 337
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mSupportingLoginTagsMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 338
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->initSupportingLoginTags()V

    .line 340
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mSupportingLoginTagsMap:Ljava/util/Map;

    return-object v0
.end method

.method private declared-synchronized initDefaultLoginTagPriorityList()V
    .locals 11

    .prologue
    .line 397
    monitor-enter p0

    :try_start_0
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mLoginTagPriorityList:Ljava/util/List;

    if-nez v7, :cond_0

    .line 398
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mLoginTagPriorityList:Ljava/util/List;

    .line 400
    :cond_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    invoke-virtual {v7}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginList()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 402
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

    .line 424
    :goto_1
    monitor-exit p0

    return-void

    .line 402
    :cond_2
    :try_start_2
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 404
    .local v2, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_start_3
    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 405
    .local v5, "type1":I
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getPluginType()Lcom/boyaa/godsdk/core/PluginType;

    move-result-object v8

    invoke-virtual {v8}, Lcom/boyaa/godsdk/core/PluginType;->getType()I

    move-result v6

    .line 406
    .local v6, "type2":I
    and-int v4, v5, v6

    .line 408
    .local v4, "result":I
    if-ne v4, v6, :cond_1

    .line 410
    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v8

    .line 409
    invoke-direct {p0, v8}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getLoginTagByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 411
    .local v1, "loginTag":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 412
    iget-object v8, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mLoginTagPriorityList:Ljava/util/List;

    invoke-interface {v8, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 415
    .end local v1    # "loginTag":Ljava/lang/String;
    .end local v4    # "result":I
    .end local v5    # "type1":I
    .end local v6    # "type2":I
    :catch_0
    move-exception v0

    .line 416
    .local v0, "e":Ljava/lang/NumberFormatException;
    :try_start_4
    iget-object v8, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 417
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Plugin Type NumberFormatException plugin.getPluginType() = "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 418
    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 417
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 416
    invoke-virtual {v8, v9, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 421
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .end local v2    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :catch_1
    move-exception v0

    .line 422
    .local v0, "e":Ljava/lang/Exception;
    :try_start_5
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v8, "initDefaultLoginTagPriorityList Exception"

    invoke-virtual {v7, v8, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 397
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v3    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7
.end method

.method private declared-synchronized initSupportingLoginTags()V
    .locals 7

    .prologue
    .line 344
    monitor-enter p0

    :try_start_0
    iget-object v5, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mSupportingLoginTagsMap:Ljava/util/Map;

    if-nez v5, :cond_1

    .line 345
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mSupportingLoginTagsMap:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 347
    :try_start_1
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v5

    .line 348
    invoke-virtual {v5, p0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginListByType(Lcom/boyaa/godsdk/core/IPlugin;)Ljava/util/List;

    move-result-object v4

    .line 349
    .local v4, "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v6

    if-nez v6, :cond_2

    .line 360
    .end local v4    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :cond_1
    :goto_1
    monitor-exit p0

    return-void

    .line 349
    .restart local v4    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :cond_2
    :try_start_2
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;

    .line 350
    .local v3, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    invoke-virtual {v3}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v0

    .line 351
    .local v0, "className":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getLoginTagByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 352
    .local v2, "loginTag":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 353
    iget-object v6, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mSupportingLoginTagsMap:Ljava/util/Map;

    invoke-interface {v6, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 356
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "loginTag":Ljava/lang/String;
    .end local v3    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    .end local v4    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :catch_0
    move-exception v1

    .line 357
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v5, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v6, "initSupporingLoginTags Exception"

    invoke-virtual {v5, v6, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 344
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method private isSupportAppointMethod(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 10
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 747
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getSupportLoginTagsMap()Ljava/util/Map;

    move-result-object v2

    .line 748
    .local v2, "loginTagClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 749
    .local v0, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    .line 750
    invoke-virtual {v7, v0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v7

    .line 751
    sget-object v8, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v7, v8}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v4

    .line 752
    .local v4, "obj":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 753
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "isSupportAppointMethod className == "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 754
    const-string v9, " isLocalClass == "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->isLocalClass()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 755
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

    .line 753
    invoke-virtual {v7, v8}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 757
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Landroid/app/Activity;

    aput-object v9, v7, v8

    .line 756
    invoke-static {v0, p1, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->getMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 758
    .local v3, "method":Ljava/lang/reflect/Method;
    if-eqz v3, :cond_0

    .line 766
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "loginTagClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "obj":Ljava/lang/Object;
    :goto_0
    return v5

    .restart local v0    # "className":Ljava/lang/String;
    .restart local v2    # "loginTagClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    .restart local v4    # "obj":Ljava/lang/Object;
    :cond_0
    move v5, v6

    .line 761
    goto :goto_0

    .line 763
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "loginTagClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 764
    .local v1, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v7, "isSupportAppointMethod Exception"

    invoke-virtual {v5, v7, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move v5, v6

    .line 766
    goto :goto_0
.end method

.method private static declared-synchronized syncInit()V
    .locals 2

    .prologue
    .line 44
    const-class v1, Lcom/boyaa/godsdk/core/GodSDKAccount;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKAccount;->instance:Lcom/boyaa/godsdk/core/GodSDKAccount;

    if-nez v0, :cond_0

    .line 45
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKAccount;

    invoke-direct {v0}, Lcom/boyaa/godsdk/core/GodSDKAccount;-><init>()V

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKAccount;->instance:Lcom/boyaa/godsdk/core/GodSDKAccount;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    :cond_0
    monitor-exit v1

    return-void

    .line 44
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;
    .locals 7
    .param p1, "loginTag"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "map"    # Ljava/util/Map;
    .param p4, "listener"    # Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    .prologue
    .line 476
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getSupportLoginTagsMap()Ljava/util/Map;

    move-result-object v2

    .line 477
    .local v2, "loginTagClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 478
    .local v0, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v4

    .line 479
    invoke-virtual {v4, v0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 480
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v3

    .line 481
    .local v3, "obj":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 483
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/util/Map;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v6, v4, v5

    .line 484
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p3, v5, v6

    const/4 v6, 0x1

    aput-object p4, v5, v6

    .line 482
    invoke-static {v0, p2, v4, v3, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 502
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "loginTagClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v4

    .line 485
    :catch_0
    move-exception v1

    .line 486
    .local v1, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

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

    .line 487
    if-eqz p4, :cond_0

    .line 488
    new-instance v4, Lcom/boyaa/godsdk/core/GodSDKAccount$6;

    invoke-direct {v4, p0, p4}, Lcom/boyaa/godsdk/core/GodSDKAccount$6;-><init>(Lcom/boyaa/godsdk/core/GodSDKAccount;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)V

    invoke-static {v4}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 502
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
    .line 464
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getDefaultLoginTag()Ljava/lang/String;

    move-result-object v0

    .line 465
    .local v0, "loginTag":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 466
    const/4 v1, 0x0

    .line 468
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKAccount;->callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public getAccessToken(Landroid/app/Activity;)Ljava/lang/String;
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 663
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getDefaultLoginTag()Ljava/lang/String;

    move-result-object v0

    .line 664
    .local v0, "loginTag":Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getAccessToken(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getAccessToken(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 669
    const/4 v1, 0x0

    .line 671
    .local v1, "accessToken":Ljava/lang/String;
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getPluginObjectByLoginTag(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v6

    .line 672
    sget-object v7, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    .line 671
    invoke-interface {v6, v7}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v5

    .line 673
    .local v5, "obj":Ljava/lang/Object;
    const-string v6, "getAccessToken"

    invoke-direct {p0, v6, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isSupportAppointMethod(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 675
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "getAccessToken"

    .line 676
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    const-class v10, Landroid/app/Activity;

    aput-object v10, v8, v9

    .line 677
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object p1, v9, v10

    .line 674
    invoke-static {v6, v7, v8, v5, v9}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object v1, v0

    .line 694
    .end local v5    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-object v1

    .line 680
    .restart local v5    # "obj":Ljava/lang/Object;
    :cond_1
    const-string v6, "getAccessToken"

    .line 679
    invoke-direct {p0, v6, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->findAppropriateMethodName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 681
    .local v2, "appropriateMethodName":Ljava/lang/String;
    invoke-virtual {p0, p2, v2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 682
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 683
    .local v4, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v6, "Activity"

    invoke-interface {v4, v6, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 685
    sget-object v6, Lcom/boyaa/godsdk/core/GodSDKAccount;->ACCOUNT_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 686
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Ljava/util/Map;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    .line 687
    const-class v9, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v9, v7, v8

    .line 688
    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    .line 684
    invoke-static {v6, v2, v7, v5, v8}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object v1, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 691
    .end local v2    # "appropriateMethodName":Ljava/lang/String;
    .end local v4    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v5    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v3

    .line 692
    .local v3, "e":Ljava/lang/Exception;
    iget-object v6, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "getAccessToken "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " Exception "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method getAccountListener()Lcom/boyaa/godsdk/callback/AccountListener;
    .locals 1

    .prologue
    .line 307
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    return-object v0
.end method

.method public getDebugMode()Z
    .locals 1

    .prologue
    .line 317
    iget-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebugMode:Z

    return v0
.end method

.method public getDebugTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 322
    const-string v0, "GodSDKAccount"

    return-object v0
.end method

.method public getDefaultLoginTag()Ljava/lang/String;
    .locals 3

    .prologue
    .line 385
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mLoginTagPriorityList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 386
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->initDefaultLoginTagPriorityList()V

    .line 388
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getDefaultLoginTag mLoginTagPriorityList == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 389
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mLoginTagPriorityList:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 388
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 390
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mLoginTagPriorityList:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mLoginTagPriorityList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 391
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mLoginTagPriorityList:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 393
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getLoginExtraInfos(Landroid/app/Activity;)Ljava/util/Map;
    .locals 4
    .param p1, "activity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 699
    invoke-virtual {p0, p1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isLogined(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v1

    .line 700
    .local v1, "loginTag":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 701
    invoke-virtual {p0, p1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->requestLogin(Landroid/app/Activity;)V

    .line 708
    :cond_0
    :goto_0
    return-object v2

    .line 704
    :cond_1
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getDefaultLoginTag()Ljava/lang/String;

    move-result-object v0

    .line 705
    .local v0, "defaultLoginTag":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 706
    invoke-virtual {p0, p1, v1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getLoginExtraInfos(Landroid/app/Activity;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    goto :goto_0
.end method

.method public getLoginExtraInfos(Landroid/app/Activity;Ljava/lang/String;)Ljava/util/Map;
    .locals 11
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "loginTag"    # Ljava/lang/String;
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
    .line 714
    const/4 v3, 0x0

    .line 715
    .local v3, "infos":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p0, p1, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isLogined(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 717
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getPluginObjectByLoginTag(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v6

    .line 718
    sget-object v7, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v6, v7}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v5

    .line 719
    .local v5, "obj":Ljava/lang/Object;
    const-string v6, "getLoginExtraInfos"

    invoke-direct {p0, v6, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isSupportAppointMethod(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 721
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "getLoginExtraInfos"

    .line 722
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    const-class v10, Landroid/app/Activity;

    aput-object v10, v8, v9

    .line 723
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object p1, v9, v10

    .line 720
    invoke-static {v6, v7, v8, v5, v9}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Ljava/util/Map;

    move-object v3, v0

    .line 742
    .end local v5    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-object v3

    .line 726
    .restart local v5    # "obj":Ljava/lang/Object;
    :cond_1
    const-string v6, "getLoginExtraInfos"

    .line 725
    invoke-direct {p0, v6, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->findAppropriateMethodName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 727
    .local v1, "appropriateMethodName":Ljava/lang/String;
    invoke-virtual {p0, p2, v1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 728
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 729
    .local v4, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v6, "Activity"

    invoke-interface {v4, v6, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 731
    sget-object v6, Lcom/boyaa/godsdk/core/GodSDKAccount;->ACCOUNT_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 732
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    .line 733
    const-class v9, Ljava/util/Map;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    .line 734
    const-class v9, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v9, v7, v8

    .line 735
    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    .line 731
    invoke-static {v6, v1, v7, v5, v8}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 730
    move-object v0, v6

    check-cast v0, Ljava/util/Map;

    move-object v3, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 738
    .end local v1    # "appropriateMethodName":Ljava/lang/String;
    .end local v4    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v5    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 739
    .local v2, "e":Ljava/lang/Exception;
    iget-object v6, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "getLoginExtraInfos "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " Exception "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v2}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getPluginType()Lcom/boyaa/godsdk/core/PluginType;
    .locals 1

    .prologue
    .line 327
    sget-object v0, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    return-object v0
.end method

.method public getSupportLoginTags()Ljava/util/Set;
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
    .line 332
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getSupportLoginTagsMap()Ljava/util/Map;

    move-result-object v0

    .line 333
    .local v0, "loginTagClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public getUserId(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 199
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v4

    invoke-virtual {v4}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v4

    if-nez v4, :cond_0

    move-object v2, v3

    .line 213
    :goto_0
    return-object v2

    .line 204
    :cond_0
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getPluginObjectByLoginTag(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 205
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    .line 204
    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 207
    .local v1, "obj":Ljava/lang/Object;
    sget-object v4, Lcom/boyaa/godsdk/core/GodSDKAccount;->ACCOUNT_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v5, "getUserID"

    .line 208
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/app/Activity;

    aput-object v8, v6, v7

    .line 209
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    .line 206
    invoke-static {v4, v5, v6, v1, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 210
    .local v2, "result":Ljava/lang/String;
    goto :goto_0

    .line 211
    .end local v1    # "obj":Ljava/lang/Object;
    .end local v2    # "result":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 212
    .local v0, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v5, "GodSDKAccount.getUserId Exception"

    invoke-virtual {v4, v5, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v2, v3

    .line 213
    goto :goto_0
.end method

.method public hideFloatView(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 644
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getDefaultLoginTag()Ljava/lang/String;

    move-result-object v0

    .line 645
    .local v0, "loginTag":Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->hideFloatView(Landroid/app/Activity;Ljava/lang/String;)V

    .line 646
    return-void
.end method

.method public hideFloatView(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 651
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getPluginObjectByLoginTag(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 652
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    .line 651
    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 653
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAccount;->ACCOUNT_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "hideFloatView"

    .line 654
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    .line 655
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    .line 653
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 659
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return-void

    .line 656
    :catch_0
    move-exception v0

    .line 657
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "hideFloatView "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Exception "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public isFloatViewRequired()Z
    .locals 2

    .prologue
    .line 600
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getDefaultLoginTag()Ljava/lang/String;

    move-result-object v0

    .line 601
    .local v0, "loginTag":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 602
    const/4 v1, 0x0

    .line 604
    :goto_0
    return v1

    :cond_0
    invoke-virtual {p0, v0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isFloatViewRequired(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public isFloatViewRequired(Ljava/lang/String;)Z
    .locals 7
    .param p1, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 609
    const/4 v2, 0x0

    .line 611
    .local v2, "result":Z
    :try_start_0
    invoke-direct {p0, p1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getPluginObjectByLoginTag(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v3

    .line 612
    sget-object v4, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    .line 611
    invoke-interface {v3, v4}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 614
    .local v1, "obj":Ljava/lang/Object;
    sget-object v3, Lcom/boyaa/godsdk/core/GodSDKAccount;->ACCOUNT_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v4, "isFloatViewRequired"

    const/4 v5, 0x0

    .line 615
    const/4 v6, 0x0

    .line 613
    invoke-static {v3, v4, v5, v1, v6}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    move v3, v2

    .line 620
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return v3

    .line 617
    :catch_0
    move-exception v0

    .line 618
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "isFloatViewRequired "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " Exception "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 620
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public isLogined(Landroid/app/Activity;)Ljava/lang/String;
    .locals 12
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v6, 0x0

    .line 171
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v5

    invoke-virtual {v5}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v5

    if-nez v5, :cond_0

    move-object v1, v6

    .line 191
    :goto_0
    return-object v1

    .line 174
    :cond_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getSupportLoginTagsMap()Ljava/util/Map;

    move-result-object v2

    .line 175
    .local v2, "loginTagClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_2

    move-object v1, v6

    .line 191
    goto :goto_0

    .line 175
    :cond_2
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 177
    .local v1, "loginTag":Ljava/lang/String;
    :try_start_0
    invoke-direct {p0, v1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getPluginObjectByLoginTag(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v5

    .line 178
    sget-object v8, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v5, v8}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v3

    .line 180
    .local v3, "obj":Ljava/lang/Object;
    sget-object v5, Lcom/boyaa/godsdk/core/GodSDKAccount;->ACCOUNT_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v8, "isLogined"

    .line 181
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    const-class v11, Landroid/app/Activity;

    aput-object v11, v9, v10

    .line 182
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p1, v10, v11

    .line 179
    invoke-static {v5, v8, v9, v3, v10}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 183
    .local v4, "result":Z
    if-eqz v4, :cond_1

    goto :goto_0

    .line 186
    .end local v3    # "obj":Ljava/lang/Object;
    .end local v4    # "result":Z
    :catch_0
    move-exception v0

    .line 187
    .local v0, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v8, "GodSDKAccount.isLogined Exception"

    invoke-virtual {v5, v8, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public isLogined(Landroid/app/Activity;Ljava/lang/String;)Z
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 150
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v3

    invoke-virtual {v3}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v3

    if-nez v3, :cond_0

    .line 165
    :goto_0
    return v2

    .line 154
    :cond_0
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getPluginObjectByLoginTag(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v3

    .line 155
    sget-object v4, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    .line 154
    invoke-interface {v3, v4}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 157
    .local v1, "obj":Ljava/lang/Object;
    sget-object v3, Lcom/boyaa/godsdk/core/GodSDKAccount;->ACCOUNT_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v4, "isLogined"

    .line 158
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/app/Activity;

    aput-object v7, v5, v6

    .line 159
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    .line 156
    invoke-static {v3, v4, v5, v1, v6}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 160
    .local v2, "result":Z
    goto :goto_0

    .line 161
    .end local v1    # "obj":Ljava/lang/Object;
    .end local v2    # "result":Z
    :catch_0
    move-exception v0

    .line 162
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 163
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "GodSDKAccount.isLogined(String loginTag) Exception loginTag == "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 164
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 163
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 162
    invoke-virtual {v3, v4, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public isSupportLogout()Z
    .locals 2

    .prologue
    .line 507
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getDefaultLoginTag()Ljava/lang/String;

    move-result-object v0

    .line 508
    .local v0, "loginTag":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 509
    const/4 v1, 0x0

    .line 511
    :goto_0
    return v1

    :cond_0
    invoke-virtual {p0, v0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isSupportLogout(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public isSupportLogout(Ljava/lang/String;)Z
    .locals 7
    .param p1, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 517
    const/4 v2, 0x0

    .line 519
    .local v2, "result":Z
    :try_start_0
    invoke-direct {p0, p1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getPluginObjectByLoginTag(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v3

    .line 520
    sget-object v4, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    .line 519
    invoke-interface {v3, v4}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 522
    .local v1, "obj":Ljava/lang/Object;
    sget-object v3, Lcom/boyaa/godsdk/core/GodSDKAccount;->ACCOUNT_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v4, "isSupportLogout"

    .line 523
    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 522
    invoke-static {v3, v4, v5, v1, v6}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 521
    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    move v3, v2

    .line 529
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return v3

    .line 525
    :catch_0
    move-exception v0

    .line 526
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "isSupportLogout loginTag == "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " Exception"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 529
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public isSupportMethod(Ljava/lang/String;)Z
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 428
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getDefaultLoginTag()Ljava/lang/String;

    move-result-object v0

    .line 429
    .local v0, "loginTag":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 430
    const/4 v1, 0x0

    .line 432
    :goto_0
    return v1

    :cond_0
    invoke-virtual {p0, v0, p1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 10
    .param p1, "loginTag"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 439
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getSupportLoginTagsMap()Ljava/util/Map;

    move-result-object v2

    .line 440
    .local v2, "loginTagClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 441
    .local v0, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    .line 442
    invoke-virtual {v7, v0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v7

    .line 443
    sget-object v8, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v7, v8}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v4

    .line 444
    .local v4, "obj":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 445
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "isSupportMethod className == "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 446
    const-string v9, " isLocalClass == "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->isLocalClass()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 447
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

    .line 445
    invoke-virtual {v7, v8}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 449
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Ljava/util/Map;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-class v9, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v9, v7, v8

    .line 448
    invoke-static {v0, p2, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->getMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 450
    .local v3, "method":Ljava/lang/reflect/Method;
    if-eqz v3, :cond_0

    .line 458
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "loginTagClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "obj":Ljava/lang/Object;
    :goto_0
    return v5

    .restart local v0    # "className":Ljava/lang/String;
    .restart local v2    # "loginTagClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    .restart local v4    # "obj":Ljava/lang/Object;
    :cond_0
    move v5, v6

    .line 453
    goto :goto_0

    .line 455
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "loginTagClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 456
    .local v1, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v7, "isSupportMethod Exception"

    invoke-virtual {v5, v7, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move v5, v6

    .line 458
    goto :goto_0
.end method

.method public isSupportSwitchAccount()Z
    .locals 2

    .prologue
    .line 219
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getDefaultLoginTag()Ljava/lang/String;

    move-result-object v0

    .line 220
    .local v0, "loginTag":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 221
    const/4 v1, 0x0

    .line 223
    :goto_0
    return v1

    :cond_0
    invoke-virtual {p0, v0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isSupportSwitchAccount(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public isSupportSwitchAccount(Ljava/lang/String;)Z
    .locals 7
    .param p1, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 229
    const/4 v2, 0x0

    .line 231
    .local v2, "result":Z
    :try_start_0
    invoke-direct {p0, p1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getPluginObjectByLoginTag(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v3

    .line 232
    sget-object v4, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    .line 231
    invoke-interface {v3, v4}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 234
    .local v1, "obj":Ljava/lang/Object;
    sget-object v3, Lcom/boyaa/godsdk/core/GodSDKAccount;->ACCOUNT_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v4, "isSupportSwitchAccount"

    const/4 v5, 0x0

    .line 235
    const/4 v6, 0x0

    .line 233
    invoke-static {v3, v4, v5, v1, v6}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    move v3, v2

    .line 241
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return v3

    .line 237
    :catch_0
    move-exception v0

    .line 238
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "isSupportSwitchAccount loginTag == "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 239
    const-string v5, " Exception"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 238
    invoke-virtual {v3, v4, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 241
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public requestLogin(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 127
    invoke-virtual {p0, p1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isLogined(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v1

    .line 128
    .local v1, "loginTag":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 129
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    if-eqz v2, :cond_0

    .line 130
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKAccount$4;

    invoke-direct {v2, p0, v1}, Lcom/boyaa/godsdk/core/GodSDKAccount$4;-><init>(Lcom/boyaa/godsdk/core/GodSDKAccount;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 146
    :cond_0
    :goto_0
    return-void

    .line 144
    :cond_1
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getDefaultLoginTag()Ljava/lang/String;

    move-result-object v0

    .line 145
    .local v0, "defaultLoginTag":Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->requestLogin(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public requestLogin(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 65
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKAccount.requestLogin"

    invoke-virtual {v2, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 66
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    invoke-virtual {v2}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v2

    if-nez v2, :cond_1

    .line 67
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    if-eqz v2, :cond_0

    .line 68
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKAccount$1;

    invoke-direct {v2, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount$1;-><init>(Lcom/boyaa/godsdk/core/GodSDKAccount;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 123
    :cond_0
    :goto_0
    return-void

    .line 82
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isLogined(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 83
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    if-eqz v2, :cond_0

    .line 84
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKAccount$2;

    invoke-direct {v2, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount$2;-><init>(Lcom/boyaa/godsdk/core/GodSDKAccount;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 99
    :cond_2
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getPluginObjectByLoginTag(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 100
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 101
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAccount;->ACCOUNT_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "login"

    .line 102
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Lcom/boyaa/godsdk/callback/AccountListener;

    aput-object v6, v4, v5

    .line 103
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    aput-object v7, v5, v6

    .line 101
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 104
    .end local v1    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 105
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKAccount.requestLogin Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 106
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    if-eqz v2, :cond_0

    .line 107
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKAccount$3;

    invoke-direct {v2, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount$3;-><init>(Lcom/boyaa/godsdk/core/GodSDKAccount;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public requestLogout(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 534
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getDefaultLoginTag()Ljava/lang/String;

    move-result-object v0

    .line 535
    .local v0, "loginTag":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 536
    iget-object v1, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    if-eqz v1, :cond_0

    .line 537
    new-instance v1, Lcom/boyaa/godsdk/core/GodSDKAccount$7;

    invoke-direct {v1, p0}, Lcom/boyaa/godsdk/core/GodSDKAccount$7;-><init>(Lcom/boyaa/godsdk/core/GodSDKAccount;)V

    invoke-static {v1}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 552
    :cond_0
    :goto_0
    return-void

    .line 550
    :cond_1
    invoke-virtual {p0, p1, v0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->requestLogout(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public requestLogout(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 556
    invoke-virtual {p0, p1, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isLogined(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 557
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    if-eqz v2, :cond_0

    .line 558
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKAccount$8;

    invoke-direct {v2, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount$8;-><init>(Lcom/boyaa/godsdk/core/GodSDKAccount;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 596
    :cond_0
    :goto_0
    return-void

    .line 573
    :cond_1
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getPluginObjectByLoginTag(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 574
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    .line 573
    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 575
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAccount;->ACCOUNT_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "logout"

    .line 576
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Lcom/boyaa/godsdk/callback/AccountListener;

    aput-object v6, v4, v5

    .line 577
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    aput-object v7, v5, v6

    .line 575
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 578
    .end local v1    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 579
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "requestLogout "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Exception "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 580
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    if-eqz v2, :cond_0

    .line 581
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKAccount$9;

    invoke-direct {v2, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount$9;-><init>(Lcom/boyaa/godsdk/core/GodSDKAccount;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public requestSwitchAccount(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 290
    invoke-virtual {p0, p1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isLogined(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v1

    .line 291
    .local v1, "loginTag":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 292
    invoke-virtual {p0, p1}, Lcom/boyaa/godsdk/core/GodSDKAccount;->requestLogin(Landroid/app/Activity;)V

    .line 299
    :cond_0
    :goto_0
    return-void

    .line 295
    :cond_1
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getDefaultLoginTag()Ljava/lang/String;

    move-result-object v0

    .line 296
    .local v0, "defaultLoginTag":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 297
    invoke-virtual {p0, p1, v0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->requestSwitchAccount(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public requestSwitchAccount(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 9
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 246
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v4, "GodSDKAccount.requestSwitchAccount"

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 247
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v3

    invoke-virtual {v3}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v3

    if-nez v3, :cond_0

    .line 248
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    if-eqz v3, :cond_0

    .line 249
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v2

    .line 250
    .local v2, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    const/16 v3, 0x2904

    invoke-virtual {v2, v3}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 251
    const/4 v3, -0x4

    invoke-virtual {v2, v3}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 252
    const-string v3, "\u8bf7\u6c42\u5207\u6362\u8d26\u53f7\u65f6GodSDK\u672a\u521d\u59cb\u5316"

    invoke-virtual {v2, v3}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 253
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    invoke-interface {v3, v2, p2}, Lcom/boyaa/godsdk/callback/AccountListener;->onSwitchAccountFailed(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    .line 256
    .end local v2    # "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->isLogined(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 258
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getPluginObjectByLoginTag(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v3

    .line 259
    sget-object v4, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v3, v4}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 260
    .local v1, "obj":Ljava/lang/Object;
    sget-object v3, Lcom/boyaa/godsdk/core/GodSDKAccount;->ACCOUNT_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 261
    const-string v4, "switchAccount"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/app/Activity;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    .line 262
    const-class v7, Lcom/boyaa/godsdk/callback/AccountListener;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    .line 263
    aput-object p1, v6, v7

    const/4 v7, 0x1

    iget-object v8, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    aput-object v8, v6, v7

    .line 260
    invoke-static {v3, v4, v5, v1, v6}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 286
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_1
    :goto_0
    return-void

    .line 264
    :catch_0
    move-exception v0

    .line 265
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v4, "requestSwitchAccount Exception "

    invoke-virtual {v3, v4, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 266
    iget-object v3, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    if-eqz v3, :cond_1

    .line 267
    new-instance v3, Lcom/boyaa/godsdk/core/GodSDKAccount$5;

    invoke-direct {v3, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount$5;-><init>(Lcom/boyaa/godsdk/core/GodSDKAccount;Ljava/lang/String;)V

    invoke-static {v3}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 284
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->requestLogin(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setAccountListener(Lcom/boyaa/godsdk/callback/AccountListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/boyaa/godsdk/callback/AccountListener;

    .prologue
    .line 303
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mAccountListener:Lcom/boyaa/godsdk/callback/AccountListener;

    .line 304
    return-void
.end method

.method public setDebugMode(Z)V
    .locals 0
    .param p1, "debugMode"    # Z

    .prologue
    .line 312
    iput-boolean p1, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebugMode:Z

    .line 313
    return-void
.end method

.method public showFloatView(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 625
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getDefaultLoginTag()Ljava/lang/String;

    move-result-object v0

    .line 626
    .local v0, "loginTag":Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lcom/boyaa/godsdk/core/GodSDKAccount;->showFloatView(Landroid/app/Activity;Ljava/lang/String;)V

    .line 627
    return-void
.end method

.method public showFloatView(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "loginTag"    # Ljava/lang/String;

    .prologue
    .line 632
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKAccount;->getPluginObjectByLoginTag(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 633
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->ACCOUNT:Lcom/boyaa/godsdk/core/PluginType;

    .line 632
    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 634
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKAccount;->ACCOUNT_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "showFloatView"

    .line 635
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    .line 636
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    .line 634
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 640
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return-void

    .line 637
    :catch_0
    move-exception v0

    .line 638
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKAccount;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "showFloatView "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Exception "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
