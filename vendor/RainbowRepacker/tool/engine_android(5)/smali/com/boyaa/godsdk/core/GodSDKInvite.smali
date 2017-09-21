.class public Lcom/boyaa/godsdk/core/GodSDKInvite;
.super Ljava/lang/Object;
.source "GodSDKInvite.java"

# interfaces
.implements Lcom/boyaa/godsdk/core/IInvitePlugin;


# static fields
.field private static final INVITE_PLUGIN_PROTOCOL:Ljava/lang/Class;

.field private static final TAG:Ljava/lang/String; = "GodSDKInvite"

.field private static instance:Lcom/boyaa/godsdk/core/GodSDKInvite;


# instance fields
.field private mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

.field private mDebugMode:Z

.field private mInviteChannelPriorityList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mInviteListener:Lcom/boyaa/godsdk/callback/InviteListener;

.field private mSupportingInviteChannelsMap:Ljava/util/Map;
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
    const-class v0, Lcom/boyaa/godsdk/protocol/InvitePluginProtocol;

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKInvite;->INVITE_PLUGIN_PROTOCOL:Ljava/lang/Class;

    .line 37
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKInvite;->instance:Lcom/boyaa/godsdk/core/GodSDKInvite;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteListener:Lcom/boyaa/godsdk/callback/InviteListener;

    .line 53
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mDebugMode:Z

    .line 64
    new-instance v0, Lcom/boyaa/godsdk/core/utils/Debug;

    invoke-direct {v0, p0}, Lcom/boyaa/godsdk/core/utils/Debug;-><init>(Lcom/boyaa/godsdk/core/IDebugable;)V

    iput-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 65
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/godsdk/core/GodSDKInvite;)Lcom/boyaa/godsdk/callback/InviteListener;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteListener:Lcom/boyaa/godsdk/callback/InviteListener;

    return-object v0
.end method

.method public static getInstance()Lcom/boyaa/godsdk/core/GodSDKInvite;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKInvite;->instance:Lcom/boyaa/godsdk/core/GodSDKInvite;

    if-nez v0, :cond_0

    .line 41
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDKInvite;->syncInit()V

    .line 43
    :cond_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKInvite;->instance:Lcom/boyaa/godsdk/core/GodSDKInvite;

    return-object v0
.end method

.method private getInviteChannelByClassName(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 187
    :try_start_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v4

    .line 188
    invoke-virtual {v4, p1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 189
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->INVITE:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v2

    .line 191
    .local v2, "obj":Ljava/lang/Object;
    sget-object v4, Lcom/boyaa/godsdk/core/GodSDKInvite;->INVITE_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v5, "getInviteChannel"

    .line 192
    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 191
    invoke-static {v4, v5, v6, v2, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 190
    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    .end local v2    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v0

    .line 194
    :catch_0
    move-exception v1

    .line 195
    .local v1, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v5, "getInviteChannelByClassName Exception"

    invoke-virtual {v4, v5, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v0, v3

    .line 197
    goto :goto_0
.end method

.method private getPluginObjectByInviteChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;
    .locals 3
    .param p1, "inviteChannel"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 202
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKInvite;->getSupportingInviteChannelsMap()Ljava/util/Map;

    move-result-object v0

    .line 203
    .local v0, "InviteChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 204
    .local v1, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    return-object v2
.end method

.method private getSupportingInviteChannelsMap()Ljava/util/Map;
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
    .line 152
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mSupportingInviteChannelsMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 153
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKInvite;->initSupporingInviteChannels()V

    .line 155
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mSupportingInviteChannelsMap:Ljava/util/Map;

    return-object v0
.end method

.method private declared-synchronized initDefaultInviteChannelPriorityList()V
    .locals 15

    .prologue
    .line 222
    monitor-enter p0

    :try_start_0
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteChannelPriorityList:Ljava/util/List;

    if-nez v9, :cond_0

    .line 223
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteChannelPriorityList:Ljava/util/List;

    .line 225
    :cond_0
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginList()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v5

    .line 227
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

    .line 258
    :goto_1
    monitor-exit p0

    return-void

    .line 227
    :cond_2
    :try_start_2
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 229
    .local v4, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :try_start_3
    invoke-virtual {v4}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 230
    .local v7, "type1":I
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKInvite;->getPluginType()Lcom/boyaa/godsdk/core/PluginType;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/godsdk/core/PluginType;->getType()I

    move-result v8

    .line 231
    .local v8, "type2":I
    and-int v6, v7, v8

    .line 233
    .local v6, "result":I
    if-ne v6, v8, :cond_1

    .line 235
    invoke-virtual {v4}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v9

    .line 234
    invoke-direct {p0, v9}, Lcom/boyaa/godsdk/core/GodSDKInvite;->getInviteChannelByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 235
    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 236
    .local v2, "InviteChannelstrs":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 238
    const-string v9, "[,_\\-;]"

    invoke-virtual {v2, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 239
    .local v1, "InviteChannels":[Ljava/lang/String;
    array-length v11, v1

    const/4 v9, 0x0

    :goto_2
    if-lt v9, v11, :cond_4

    .line 246
    .end local v1    # "InviteChannels":[Ljava/lang/String;
    :cond_3
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "initDefaultInviteChannelPriorityList InviteChannels list="

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 247
    const/4 v12, 0x1

    new-array v12, v12, [Ljava/util/List;

    const/4 v13, 0x0

    iget-object v14, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteChannelPriorityList:Ljava/util/List;

    aput-object v14, v12, v13

    invoke-static {v12}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 246
    invoke-virtual {v9, v11}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 249
    .end local v2    # "InviteChannelstrs":Ljava/lang/String;
    .end local v6    # "result":I
    .end local v7    # "type1":I
    .end local v8    # "type2":I
    :catch_0
    move-exception v3

    .line 250
    .local v3, "e":Ljava/lang/NumberFormatException;
    :try_start_4
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    .line 251
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "initDefaultInviteChannelPriorityList Plugin Type NumberFormatException plugin.getPluginType() = "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 252
    invoke-virtual {v4}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getPluginType()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 251
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 250
    invoke-virtual {v9, v11, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 255
    .end local v3    # "e":Ljava/lang/NumberFormatException;
    .end local v4    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    :catch_1
    move-exception v3

    .line 256
    .local v3, "e":Ljava/lang/Exception;
    :try_start_5
    iget-object v9, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v10, "initDefaultInviteChannelPriorityList Exception"

    invoke-virtual {v9, v10, v3}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 222
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v5    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :catchall_0
    move-exception v9

    monitor-exit p0

    throw v9

    .line 239
    .restart local v1    # "InviteChannels":[Ljava/lang/String;
    .restart local v2    # "InviteChannelstrs":Ljava/lang/String;
    .restart local v4    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    .restart local v5    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    .restart local v6    # "result":I
    .restart local v7    # "type1":I
    .restart local v8    # "type2":I
    :cond_4
    :try_start_6
    aget-object v0, v1, v9

    .line 240
    .local v0, "InviteChannel":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_5

    .line 241
    iget-object v12, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteChannelPriorityList:Ljava/util/List;

    .line 242
    invoke-interface {v12, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 239
    :cond_5
    add-int/lit8 v9, v9, 0x1

    goto :goto_2
.end method

.method private declared-synchronized initSupporingInviteChannels()V
    .locals 11

    .prologue
    .line 159
    monitor-enter p0

    :try_start_0
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mSupportingInviteChannelsMap:Ljava/util/Map;

    if-nez v7, :cond_1

    .line 160
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mSupportingInviteChannelsMap:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 162
    :try_start_1
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    .line 163
    invoke-virtual {v7, p0}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginListByType(Lcom/boyaa/godsdk/core/IPlugin;)Ljava/util/List;

    move-result-object v6

    .line 164
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

    .line 183
    .end local v6    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    .line 164
    .restart local v6    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :cond_2
    :try_start_2
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;

    .line 165
    .local v5, "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    invoke-virtual {v5}, Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;->getClassName()Ljava/lang/String;

    move-result-object v3

    .line 166
    .local v3, "className":Ljava/lang/String;
    invoke-direct {p0, v3}, Lcom/boyaa/godsdk/core/GodSDKInvite;->getInviteChannelByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 167
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 168
    .local v2, "InviteChannelstrs":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 170
    const-string v7, "[,_\\-;]"

    invoke-virtual {v2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 171
    .local v1, "InviteChannels":[Ljava/lang/String;
    array-length v9, v1

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v9, :cond_0

    aget-object v0, v1, v7

    .line 172
    .local v0, "InviteChannel":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_3

    .line 173
    iget-object v10, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mSupportingInviteChannelsMap:Ljava/util/Map;

    invoke-interface {v10, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 171
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 179
    .end local v0    # "InviteChannel":Ljava/lang/String;
    .end local v1    # "InviteChannels":[Ljava/lang/String;
    .end local v2    # "InviteChannelstrs":Ljava/lang/String;
    .end local v3    # "className":Ljava/lang/String;
    .end local v5    # "plugin":Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;
    .end local v6    # "pluginList":Ljava/util/List;, "Ljava/util/List<Lcom/boyaa/godsdk/core/GodSDKConfigParser$Plugin;>;"
    :catch_0
    move-exception v4

    .line 180
    .local v4, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v8, "initSupporingInviteChannelTags Exception"

    invoke-virtual {v7, v8, v4}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 159
    .end local v4    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7
.end method

.method private requestInvite(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "inviteChannel"    # Ljava/lang/String;
    .param p3, "params"    # Ljava/lang/String;

    .prologue
    .line 111
    :try_start_0
    invoke-direct {p0, p2}, Lcom/boyaa/godsdk/core/GodSDKInvite;->getPluginObjectByInviteChannel(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v2

    .line 112
    sget-object v3, Lcom/boyaa/godsdk/core/PluginType;->INVITE:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v2, v3}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v1

    .line 113
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lcom/boyaa/godsdk/core/GodSDKInvite;->INVITE_PLUGIN_PROTOCOL:Ljava/lang/Class;

    const-string v3, "invite"

    .line 114
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/app/Activity;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    .line 115
    const-class v6, Lcom/boyaa/godsdk/callback/InviteListener;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    .line 116
    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p3, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteListener:Lcom/boyaa/godsdk/callback/InviteListener;

    aput-object v7, v5, v6

    .line 113
    invoke-static {v2, v3, v4, v1, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 117
    :catch_0
    move-exception v0

    .line 118
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v3, "GodSDKInvite.invite Exception"

    invoke-virtual {v2, v3, v0}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 119
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteListener:Lcom/boyaa/godsdk/callback/InviteListener;

    if-eqz v2, :cond_0

    .line 120
    new-instance v2, Lcom/boyaa/godsdk/core/GodSDKInvite$2;

    invoke-direct {v2, p0, p2}, Lcom/boyaa/godsdk/core/GodSDKInvite$2;-><init>(Lcom/boyaa/godsdk/core/GodSDKInvite;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private static declared-synchronized syncInit()V
    .locals 2

    .prologue
    .line 47
    const-class v1, Lcom/boyaa/godsdk/core/GodSDKInvite;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/godsdk/core/GodSDKInvite;->instance:Lcom/boyaa/godsdk/core/GodSDKInvite;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKInvite;

    invoke-direct {v0}, Lcom/boyaa/godsdk/core/GodSDKInvite;-><init>()V

    sput-object v0, Lcom/boyaa/godsdk/core/GodSDKInvite;->instance:Lcom/boyaa/godsdk/core/GodSDKInvite;
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
    .param p1, "inviteChannel"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "map"    # Ljava/util/Map;
    .param p4, "listener"    # Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    .prologue
    .line 310
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKInvite;->getSupportingInviteChannelsMap()Ljava/util/Map;

    move-result-object v0

    .line 311
    .local v0, "InviteChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 312
    .local v1, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v4

    .line 313
    invoke-virtual {v4, v1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v4

    .line 314
    sget-object v5, Lcom/boyaa/godsdk/core/PluginType;->INVITE:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v4, v5}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v3

    .line 315
    .local v3, "obj":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 317
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/util/Map;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v6, v4, v5

    .line 318
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p3, v5, v6

    const/4 v6, 0x1

    aput-object p4, v5, v6

    .line 316
    invoke-static {v1, p2, v4, v3, v5}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->invokeMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 336
    .end local v0    # "InviteChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "className":Ljava/lang/String;
    .end local v3    # "obj":Ljava/lang/Object;
    :goto_0
    return-object v4

    .line 319
    :catch_0
    move-exception v2

    .line 320
    .local v2, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

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

    .line 321
    if-eqz p4, :cond_0

    .line 322
    new-instance v4, Lcom/boyaa/godsdk/core/GodSDKInvite$3;

    invoke-direct {v4, p0, p4}, Lcom/boyaa/godsdk/core/GodSDKInvite$3;-><init>(Lcom/boyaa/godsdk/core/GodSDKInvite;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)V

    invoke-static {v4}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 336
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
    .line 298
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKInvite;->getDefaultInviteChannel()Ljava/lang/String;

    move-result-object v0

    .line 299
    .local v0, "mInviteChannel":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 300
    const/4 v1, 0x0

    .line 302
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/boyaa/godsdk/core/GodSDKInvite;->callSpecialMethod(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/godsdk/callback/SpecialMethodListener;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public getDebugMode()Z
    .locals 1

    .prologue
    .line 353
    iget-boolean v0, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mDebugMode:Z

    return v0
.end method

.method public getDebugTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 359
    const-string v0, "GodSDKInvite"

    return-object v0
.end method

.method public getDefaultInviteChannel()Ljava/lang/String;
    .locals 3

    .prologue
    .line 209
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteChannelPriorityList:Ljava/util/List;

    if-nez v0, :cond_0

    .line 210
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKInvite;->initDefaultInviteChannelPriorityList()V

    .line 212
    :cond_0
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getDefaultInviteChannelTag mInviteChannelPriorityList == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 213
    iget-object v2, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteChannelPriorityList:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 212
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 214
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteChannelPriorityList:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 215
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteChannelPriorityList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 216
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteChannelPriorityList:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 218
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getInviteListener()Lcom/boyaa/godsdk/callback/InviteListener;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteListener:Lcom/boyaa/godsdk/callback/InviteListener;

    return-object v0
.end method

.method public getPluginType()Lcom/boyaa/godsdk/core/PluginType;
    .locals 1

    .prologue
    .line 342
    sget-object v0, Lcom/boyaa/godsdk/core/PluginType;->INVITE:Lcom/boyaa/godsdk/core/PluginType;

    return-object v0
.end method

.method public getSupportingInviteChannels()Ljava/util/Set;
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
    .line 147
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKInvite;->getSupportingInviteChannelsMap()Ljava/util/Map;

    move-result-object v0

    .line 148
    .local v0, "mInviteChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public invite(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;

    .prologue
    const/4 v5, -0x2

    .line 94
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 95
    .local v1, "json":Lorg/json/JSONObject;
    const-string v4, "InviteChannel"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 96
    .local v2, "mInviteChannel":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v2}, Lcom/boyaa/godsdk/core/GodSDKInvite;->invite(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "mInviteChannel":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Lorg/json/JSONException;
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteListener:Lcom/boyaa/godsdk/callback/InviteListener;

    if-eqz v4, :cond_0

    .line 99
    invoke-static {}, Lcom/boyaa/godsdk/callback/CallbackStatus;->obtain()Lcom/boyaa/godsdk/callback/CallbackStatus;

    move-result-object v3

    .line 100
    .local v3, "status":Lcom/boyaa/godsdk/callback/CallbackStatus;
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMainStatus(I)V

    .line 101
    invoke-virtual {v3, v5}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setSubStatus(I)V

    .line 102
    const-string v4, "\u9080\u8bf7\u53c2\u6570\u5f02\u5e38\uff0c\u6ca1\u6709InviteChannel\u5b57\u6bb5"

    invoke-virtual {v3, v4}, Lcom/boyaa/godsdk/callback/CallbackStatus;->setMsg(Ljava/lang/String;)V

    .line 103
    iget-object v4, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteListener:Lcom/boyaa/godsdk/callback/InviteListener;

    const/4 v5, 0x0

    invoke-interface {v4, v3, v5}, Lcom/boyaa/godsdk/callback/InviteListener;->onError(Lcom/boyaa/godsdk/callback/CallbackStatus;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public invite(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Ljava/lang/String;
    .param p3, "inviteChannel"    # Ljava/lang/String;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GodSDKInvite.invite parmas == "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 71
    const-string v2, ", InviteChannel = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 72
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->isInitSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 73
    iget-object v0, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteListener:Lcom/boyaa/godsdk/callback/InviteListener;

    if-eqz v0, :cond_0

    .line 74
    new-instance v0, Lcom/boyaa/godsdk/core/GodSDKInvite$1;

    invoke-direct {v0, p0, p3}, Lcom/boyaa/godsdk/core/GodSDKInvite$1;-><init>(Lcom/boyaa/godsdk/core/GodSDKInvite;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/boyaa/godsdk/core/GodSDK;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 88
    :cond_0
    invoke-direct {p0, p1, p3, p2}, Lcom/boyaa/godsdk/core/GodSDKInvite;->requestInvite(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    return-void
.end method

.method public isSupportMethod(Ljava/lang/String;)Z
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 262
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/GodSDKInvite;->getDefaultInviteChannel()Ljava/lang/String;

    move-result-object v0

    .line 263
    .local v0, "mInviteChannel":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 264
    const/4 v1, 0x0

    .line 266
    :goto_0
    return v1

    :cond_0
    invoke-virtual {p0, v0, p1}, Lcom/boyaa/godsdk/core/GodSDKInvite;->isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public isSupportMethod(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 10
    .param p1, "inviteChannel"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 273
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/GodSDKInvite;->getSupportingInviteChannelsMap()Ljava/util/Map;

    move-result-object v0

    .line 274
    .local v0, "InviteChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 275
    .local v1, "className":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v7

    .line 276
    invoke-virtual {v7, v1}, Lcom/boyaa/godsdk/core/GodSDK;->getPluginObjectByClassName(Ljava/lang/String;)Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;

    move-result-object v7

    .line 277
    sget-object v8, Lcom/boyaa/godsdk/core/PluginType;->INVITE:Lcom/boyaa/godsdk/core/PluginType;

    invoke-interface {v7, v8}, Lcom/boyaa/godsdk/protocol/SDKPluginProtocol;->getPluginByType(Lcom/boyaa/godsdk/core/PluginType;)Ljava/lang/Object;

    move-result-object v4

    .line 278
    .local v4, "obj":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 279
    iget-object v7, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "isSupportMethod className == "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 280
    const-string v9, " isLocalClass == "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->isLocalClass()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 281
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

    .line 279
    invoke-virtual {v7, v8}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 283
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Ljava/util/Map;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-class v9, Lcom/boyaa/godsdk/callback/SpecialMethodListener;

    aput-object v9, v7, v8

    .line 282
    invoke-static {v1, p2, v7}, Lcom/boyaa/godsdk/core/utils/ReflectUtils;->getMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 284
    .local v3, "method":Ljava/lang/reflect/Method;
    if-eqz v3, :cond_0

    .line 292
    .end local v0    # "InviteChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "className":Ljava/lang/String;
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "obj":Ljava/lang/Object;
    :goto_0
    return v5

    .restart local v0    # "InviteChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v1    # "className":Ljava/lang/String;
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    .restart local v4    # "obj":Ljava/lang/Object;
    :cond_0
    move v5, v6

    .line 287
    goto :goto_0

    .line 289
    .end local v0    # "InviteChannelClassNameMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "className":Ljava/lang/String;
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 290
    .local v2, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mDebug:Lcom/boyaa/godsdk/core/utils/Debug;

    const-string v7, "isSupportMethod Exception"

    invoke-virtual {v5, v7, v2}, Lcom/boyaa/godsdk/core/utils/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    move v5, v6

    .line 292
    goto :goto_0
.end method

.method public setDebugMode(Z)V
    .locals 0
    .param p1, "debugMode"    # Z

    .prologue
    .line 347
    iput-boolean p1, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mDebugMode:Z

    .line 348
    return-void
.end method

.method public setInviteListener(Lcom/boyaa/godsdk/callback/InviteListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/boyaa/godsdk/callback/InviteListener;

    .prologue
    .line 138
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKInvite;->mInviteListener:Lcom/boyaa/godsdk/callback/InviteListener;

    .line 139
    return-void
.end method
