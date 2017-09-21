.class public Lcom/boyaa/entity/imsdk/ImSDKHelper;
.super Ljava/lang/Object;
.source "ImSDKHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/entity/imsdk/ImSDKHelper$ImSDKHandler;
    }
.end annotation


# static fields
.field private static instance:Lcom/boyaa/entity/imsdk/ImSDKHelper;


# instance fields
.field public mHandler:Landroid/os/Handler;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Lcom/boyaa/entity/imsdk/ImSDKHelper$ImSDKHandler;

    invoke-direct {v0, p0}, Lcom/boyaa/entity/imsdk/ImSDKHelper$ImSDKHandler;-><init>(Lcom/boyaa/entity/imsdk/ImSDKHelper;)V

    iput-object v0, p0, Lcom/boyaa/entity/imsdk/ImSDKHelper;->mHandler:Landroid/os/Handler;

    .line 25
    return-void
.end method

.method public static getInstance()Lcom/boyaa/entity/imsdk/ImSDKHelper;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lcom/boyaa/entity/imsdk/ImSDKHelper;->instance:Lcom/boyaa/entity/imsdk/ImSDKHelper;

    if-nez v0, :cond_0

    .line 29
    invoke-static {}, Lcom/boyaa/entity/imsdk/ImSDKHelper;->initInstance()V

    .line 31
    :cond_0
    sget-object v0, Lcom/boyaa/entity/imsdk/ImSDKHelper;->instance:Lcom/boyaa/entity/imsdk/ImSDKHelper;

    return-object v0
.end method

.method private static declared-synchronized initInstance()V
    .locals 2

    .prologue
    .line 35
    const-class v1, Lcom/boyaa/entity/imsdk/ImSDKHelper;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/entity/imsdk/ImSDKHelper;->instance:Lcom/boyaa/entity/imsdk/ImSDKHelper;

    if-nez v0, :cond_0

    .line 36
    new-instance v0, Lcom/boyaa/entity/imsdk/ImSDKHelper;

    invoke-direct {v0}, Lcom/boyaa/entity/imsdk/ImSDKHelper;-><init>()V

    sput-object v0, Lcom/boyaa/entity/imsdk/ImSDKHelper;->instance:Lcom/boyaa/entity/imsdk/ImSDKHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    :cond_0
    monitor-exit v1

    return-void

    .line 35
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public getContractsInfo()Ljava/lang/String;
    .locals 2

    .prologue
    .line 66
    invoke-static {}, Lcom/boyaa/androidim/api/IMSDK_Interface;->getInstance()Lcom/boyaa/androidim/api/IMSDK_Interface;

    move-result-object v1

    invoke-virtual {v1}, Lcom/boyaa/androidim/api/IMSDK_Interface;->getContractsInfo()Ljava/lang/String;

    move-result-object v0

    .line 67
    .local v0, "jsonData":Ljava/lang/String;
    return-object v0
.end method

.method public getLocation()Ljava/lang/String;
    .locals 2

    .prologue
    .line 58
    invoke-static {}, Lcom/boyaa/androidim/api/IMSDK_Interface;->getInstance()Lcom/boyaa/androidim/api/IMSDK_Interface;

    move-result-object v1

    invoke-virtual {v1}, Lcom/boyaa/androidim/api/IMSDK_Interface;->getLocation()Ljava/lang/String;

    move-result-object v0

    .line 59
    .local v0, "jsonData":Ljava/lang/String;
    return-object v0
.end method

.method public goGPSSetting()V
    .locals 1

    .prologue
    .line 50
    invoke-static {}, Lcom/boyaa/androidim/api/IMSDK_Interface;->getInstance()Lcom/boyaa/androidim/api/IMSDK_Interface;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/androidim/api/IMSDK_Interface;->goGPSSetting()V

    .line 51
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 8
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 102
    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4}, Ljava/util/TreeMap;-><init>()V

    .line 104
    .local v4, "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget v6, p1, Landroid/os/Message;->what:I

    packed-switch v6, :pswitch_data_0

    .line 126
    :cond_0
    :goto_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, v4}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 127
    .local v0, "jsonData":Ljava/lang/String;
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 128
    .local v1, "luaMsg":Landroid/os/Message;
    const/16 v6, 0x4f0

    iput v6, v1, Landroid/os/Message;->what:I

    .line 129
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 130
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v6

    invoke-virtual {v6, v1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 131
    return-void

    .line 107
    .end local v0    # "jsonData":Ljava/lang/String;
    .end local v1    # "luaMsg":Landroid/os/Message;
    :pswitch_0
    const-string v6, "cmd"

    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 111
    :pswitch_1
    const-string v6, "cmd"

    const/4 v7, 0x2

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    if-eqz p1, :cond_0

    .line 114
    iget-object v5, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    .line 115
    .local v5, "recrodPath":Ljava/lang/String;
    iget v3, p1, Landroid/os/Message;->arg1:I

    .line 116
    .local v3, "mAudioTime":I
    iget v2, p1, Landroid/os/Message;->arg2:I

    .line 118
    .local v2, "mAudioFileSize":I
    const-string v6, "recordPath"

    invoke-virtual {v4, v6, v5}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    const-string v6, "fileTime"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    const-string v6, "fileSize"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 104
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public login(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/boyaa/entity/imsdk/ImSDKHelper;->mHandler:Landroid/os/Handler;

    invoke-static {p1, v0}, Lcom/boyaa/androidim/api/IMSDK_Interface;->getInstance(Landroid/app/Activity;Landroid/os/Handler;)Lcom/boyaa/androidim/api/IMSDK_Interface;

    .line 45
    return-void
.end method

.method public startAudioPlay(Ljava/lang/String;)V
    .locals 1
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-static {}, Lcom/boyaa/androidim/api/IMSDK_Interface;->getInstance()Lcom/boyaa/androidim/api/IMSDK_Interface;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/boyaa/androidim/api/IMSDK_Interface;->startAudioPlay(Ljava/lang/String;)V

    .line 89
    return-void
.end method

.method public startAudioRecord()V
    .locals 1

    .prologue
    .line 74
    invoke-static {}, Lcom/boyaa/androidim/api/IMSDK_Interface;->getInstance()Lcom/boyaa/androidim/api/IMSDK_Interface;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/androidim/api/IMSDK_Interface;->startAudioRecord()V

    .line 75
    return-void
.end method

.method public stopAudioPlay()V
    .locals 1

    .prologue
    .line 95
    invoke-static {}, Lcom/boyaa/androidim/api/IMSDK_Interface;->getInstance()Lcom/boyaa/androidim/api/IMSDK_Interface;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/androidim/api/IMSDK_Interface;->stopAudioPlay()V

    .line 96
    return-void
.end method

.method public stopAudioRecord()V
    .locals 1

    .prologue
    .line 81
    invoke-static {}, Lcom/boyaa/androidim/api/IMSDK_Interface;->getInstance()Lcom/boyaa/androidim/api/IMSDK_Interface;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/androidim/api/IMSDK_Interface;->stopAudioRecord()V

    .line 82
    return-void
.end method
