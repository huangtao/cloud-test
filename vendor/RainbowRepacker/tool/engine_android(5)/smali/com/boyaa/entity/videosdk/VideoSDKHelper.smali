.class public Lcom/boyaa/entity/videosdk/VideoSDKHelper;
.super Ljava/lang/Object;
.source "VideoSDKHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/entity/videosdk/VideoSDKHelper$VideoSDKHandler;
    }
.end annotation


# static fields
.field private static instance:Lcom/boyaa/entity/videosdk/VideoSDKHelper;


# instance fields
.field private mAppId:I

.field private mAudioEnable:Z

.field private mBluetooth:Z

.field private mFrameType:I

.field public mHandler:Landroid/os/Handler;

.field private mOrientation:I

.field private mRoomId:I

.field private mRoomType:I

.field private mSupport2G:Z

.field private mUserId:I

.field private mVersion:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Lcom/boyaa/entity/videosdk/VideoSDKHelper$VideoSDKHandler;

    invoke-direct {v0, p0}, Lcom/boyaa/entity/videosdk/VideoSDKHelper$VideoSDKHandler;-><init>(Lcom/boyaa/entity/videosdk/VideoSDKHelper;)V

    iput-object v0, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mHandler:Landroid/os/Handler;

    .line 41
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/entity/videosdk/VideoSDKHelper;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 237
    invoke-direct {p0, p1}, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->sendVideoCmd(Ljava/lang/String;)V

    return-void
.end method

.method public static getInstance()Lcom/boyaa/entity/videosdk/VideoSDKHelper;
    .locals 1

    .prologue
    .line 44
    sget-object v0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->instance:Lcom/boyaa/entity/videosdk/VideoSDKHelper;

    if-nez v0, :cond_0

    .line 45
    invoke-static {}, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->initInstance()V

    .line 47
    :cond_0
    sget-object v0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->instance:Lcom/boyaa/entity/videosdk/VideoSDKHelper;

    return-object v0
.end method

.method private static declared-synchronized initInstance()V
    .locals 2

    .prologue
    .line 51
    const-class v1, Lcom/boyaa/entity/videosdk/VideoSDKHelper;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->instance:Lcom/boyaa/entity/videosdk/VideoSDKHelper;

    if-nez v0, :cond_0

    .line 52
    new-instance v0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;

    invoke-direct {v0}, Lcom/boyaa/entity/videosdk/VideoSDKHelper;-><init>()V

    sput-object v0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->instance:Lcom/boyaa/entity/videosdk/VideoSDKHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    :cond_0
    monitor-exit v1

    return-void

    .line 51
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private sendVideoCmd(Ljava/lang/String;)V
    .locals 5
    .param p1, "cmd"    # Ljava/lang/String;

    .prologue
    .line 238
    new-instance v2, Ljava/util/TreeMap;

    invoke-direct {v2}, Ljava/util/TreeMap;-><init>()V

    .line 239
    .local v2, "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "cmd"

    invoke-virtual {v2, v4, p1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    new-instance v0, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v0, v2}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    .line 241
    .local v0, "jsonUtil":Lcom/boyaa/util/JsonUtil;
    invoke-virtual {v0}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v3

    .line 242
    .local v3, "result":Ljava/lang/String;
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 243
    .local v1, "luaMsg":Landroid/os/Message;
    const/16 v4, 0x4ef

    iput v4, v1, Landroid/os/Message;->what:I

    .line 244
    iput-object v3, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 245
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 246
    return-void
.end method

.method private showDialog(Ljava/lang/String;)V
    .locals 3
    .param p1, "networkTips"    # Ljava/lang/String;

    .prologue
    .line 104
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_1

    .line 105
    :cond_0
    const-string p1, "\u60a8\u73b0\u5728\u4f7f\u7528\u7684\u662f\u8fd0\u8425\u5546\u7f51\u7edc\uff0c\u7ee7\u7eed\u4f7f\u7528\u4f1a\n\u6d88\u8017\u624b\u673a\u6d41\u91cf\uff0c\u4e14\u65e0\u6cd5\u4fdd\u8bc1\u8bed\u97f3\u8d28\u91cf\u3002"

    .line 108
    :cond_1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 109
    .local v0, "dialog":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 110
    const-string v1, "\u53d6\u6d88"

    new-instance v2, Lcom/boyaa/entity/videosdk/VideoSDKHelper$1;

    invoke-direct {v2, p0}, Lcom/boyaa/entity/videosdk/VideoSDKHelper$1;-><init>(Lcom/boyaa/entity/videosdk/VideoSDKHelper;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 119
    const-string v1, "\u7ee7\u7eed\u4f7f\u7528"

    new-instance v2, Lcom/boyaa/entity/videosdk/VideoSDKHelper$2;

    invoke-direct {v2, p0}, Lcom/boyaa/entity/videosdk/VideoSDKHelper$2;-><init>(Lcom/boyaa/entity/videosdk/VideoSDKHelper;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 127
    const-string v1, "cmd_dialog_showing"

    invoke-direct {p0, v1}, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->sendVideoCmd(Ljava/lang/String;)V

    .line 128
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 129
    return-void
.end method


# virtual methods
.method public closeMicrophone()V
    .locals 2

    .prologue
    .line 133
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    if-nez v0, :cond_0

    .line 134
    const-string v0, "VideoSdk"

    const-string v1, "BoyaaVoice\u672a\u767b\u5f55"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    :goto_0
    return-void

    .line 137
    :cond_0
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/boyaa/videosdk/BoyaaVoice;->setAudioControlInfo(Z)V

    goto :goto_0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 11
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 142
    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4}, Ljava/util/TreeMap;-><init>()V

    .line 143
    .local v4, "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "cmd_undefine"

    .line 144
    .local v1, "cmd":Ljava/lang/String;
    iget v7, p1, Landroid/os/Message;->what:I

    sparse-switch v7, :sswitch_data_0

    .line 222
    :goto_0
    const-string v7, "cmd"

    invoke-virtual {v4, v7, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    new-instance v2, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v2, v4}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    .line 224
    .local v2, "jsonUtil":Lcom/boyaa/util/JsonUtil;
    invoke-virtual {v2}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v5

    .line 225
    .local v5, "result":Ljava/lang/String;
    const-string v7, "VideoSdk result "

    invoke-static {v7, v5}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    new-instance v3, Landroid/os/Message;

    invoke-direct {v3}, Landroid/os/Message;-><init>()V

    .line 227
    .local v3, "luaMsg":Landroid/os/Message;
    const/16 v7, 0x4ef

    iput v7, v3, Landroid/os/Message;->what:I

    .line 228
    iput-object v5, v3, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 229
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v7

    invoke-virtual {v7, v3}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 232
    const-string v7, "cmd_microphone_open_error"

    if-ne v1, v7, :cond_0

    .line 233
    invoke-virtual {p0}, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->closeMicrophone()V

    .line 235
    :cond_0
    return-void

    .line 147
    .end local v2    # "jsonUtil":Lcom/boyaa/util/JsonUtil;
    .end local v3    # "luaMsg":Landroid/os/Message;
    .end local v5    # "result":Ljava/lang/String;
    :sswitch_0
    const-string v1, "cmd_login_success"

    .line 148
    goto :goto_0

    .line 152
    :sswitch_1
    const-string v1, "cmd_login_fail"

    .line 153
    goto :goto_0

    .line 157
    :sswitch_2
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v7

    invoke-virtual {v7, v8}, Lcom/boyaa/videosdk/BoyaaVoice;->setAudioSend(Z)V

    .line 158
    const-string v1, "cmd_microphone_open"

    .line 159
    goto :goto_0

    .line 163
    :sswitch_3
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v7

    invoke-virtual {v7, v9}, Lcom/boyaa/videosdk/BoyaaVoice;->setAudioSend(Z)V

    .line 164
    const-string v1, "cmd_microphone_close"

    .line 165
    goto :goto_0

    .line 169
    :sswitch_4
    const-string v1, "cmd_microphone_operate_fail"

    .line 170
    goto :goto_0

    .line 174
    :sswitch_5
    const-string v1, "cmd_users_status_change"

    .line 176
    iget-object v7, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 177
    .local v0, "bEnableValue":Z
    iget v6, p1, Landroid/os/Message;->arg1:I

    .line 178
    .local v6, "userId":I
    const-string v10, "isEnable"

    if-eqz v0, :cond_1

    move v7, v8

    :goto_1
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v10, v7}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    const-string v7, "userId"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    move v7, v9

    .line 178
    goto :goto_1

    .line 185
    .end local v0    # "bEnableValue":Z
    .end local v6    # "userId":I
    :sswitch_6
    const-string v1, "cmd_users_status_change"

    .line 187
    iget-object v7, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 188
    .restart local v0    # "bEnableValue":Z
    iget v6, p1, Landroid/os/Message;->arg1:I

    .line 189
    .restart local v6    # "userId":I
    const-string v7, "isEnable"

    if-eqz v0, :cond_2

    :goto_2
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    const-string v7, "userId"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    :cond_2
    move v8, v9

    .line 189
    goto :goto_2

    .line 196
    .end local v0    # "bEnableValue":Z
    .end local v6    # "userId":I
    :sswitch_7
    const-string v1, "cmd_users_status_change"

    .line 198
    iget-object v7, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 199
    .restart local v0    # "bEnableValue":Z
    iget v6, p1, Landroid/os/Message;->arg1:I

    .line 200
    .restart local v6    # "userId":I
    const-string v7, "isEnable"

    if-eqz v0, :cond_3

    :goto_3
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    const-string v7, "userId"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    :cond_3
    move v8, v9

    .line 200
    goto :goto_3

    .line 207
    .end local v0    # "bEnableValue":Z
    .end local v6    # "userId":I
    :sswitch_8
    const-string v1, "cmd_users_status_change"

    .line 209
    iget-object v7, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 210
    .restart local v0    # "bEnableValue":Z
    iget v6, p1, Landroid/os/Message;->arg1:I

    .line 211
    .restart local v6    # "userId":I
    const-string v7, "isEnable"

    if-eqz v0, :cond_4

    :goto_4
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    const-string v7, "userId"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    :cond_4
    move v8, v9

    .line 211
    goto :goto_4

    .line 218
    .end local v0    # "bEnableValue":Z
    .end local v6    # "userId":I
    :sswitch_9
    const-string v1, "cmd_microphone_open_error"

    goto/16 :goto_0

    .line 144
    :sswitch_data_0
    .sparse-switch
        0x36 -> :sswitch_0
        0x40 -> :sswitch_1
        0x57 -> :sswitch_9
        0x61 -> :sswitch_6
        0x62 -> :sswitch_7
        0x66 -> :sswitch_3
        0x67 -> :sswitch_2
        0x68 -> :sswitch_4
        0x69 -> :sswitch_8
        0x70 -> :sswitch_5
    .end sparse-switch
.end method

.method public login(IIIZI)V
    .locals 14
    .param p1, "appId"    # I
    .param p2, "userId"    # I
    .param p3, "roomId"    # I
    .param p4, "support2G"    # Z
    .param p5, "version"    # I

    .prologue
    .line 58
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 59
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    invoke-virtual {v1}, Lcom/boyaa/videosdk/BoyaaVoice;->Destory()V

    .line 62
    :cond_0
    iput p1, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mAppId:I

    .line 63
    move/from16 v0, p2

    iput v0, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mUserId:I

    .line 64
    move/from16 v0, p3

    iput v0, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mRoomId:I

    .line 65
    const/4 v1, 0x3

    iput v1, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mRoomType:I

    .line 66
    const/4 v1, 0x0

    iput v1, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mFrameType:I

    .line 67
    const/4 v1, 0x2

    iput v1, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mOrientation:I

    .line 68
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mBluetooth:Z

    .line 69
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mAudioEnable:Z

    .line 70
    move/from16 v0, p4

    iput-boolean v0, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mSupport2G:Z

    .line 71
    move/from16 v0, p5

    iput v0, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mVersion:I

    .line 73
    const-string v1, "VideoSdk"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "appId:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mAppId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " userId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mUserId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " roomId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mRoomId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    sget-object v1, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    iget v2, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mAppId:I

    iget v3, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mUserId:I

    iget v4, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mRoomId:I

    iget v5, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mRoomType:I

    iget v6, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mFrameType:I

    .line 76
    iget-boolean v7, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mSupport2G:Z

    iget v8, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mOrientation:I

    iget-boolean v9, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mBluetooth:Z

    iget-boolean v10, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mAudioEnable:Z

    const/4 v11, 0x0

    iget v12, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mVersion:I

    iget-object v13, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->mHandler:Landroid/os/Handler;

    .line 75
    invoke-static/range {v1 .. v13}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance(Landroid/app/Activity;IIIIIZIZZZILandroid/os/Handler;)Lcom/boyaa/videosdk/BoyaaVoice;

    .line 77
    return-void
.end method

.method public logout()V
    .locals 2

    .prologue
    .line 81
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    if-nez v0, :cond_0

    .line 82
    const-string v0, "VideoSdk"

    const-string v1, "BoyaaVoice\u672a\u521d\u59cb\u5316"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    :goto_0
    return-void

    .line 85
    :cond_0
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videosdk/BoyaaVoice;->Destory()V

    goto :goto_0
.end method

.method public openMicrophone(Ljava/lang/String;)V
    .locals 2
    .param p1, "networkTips"    # Ljava/lang/String;

    .prologue
    .line 90
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    if-nez v0, :cond_0

    .line 91
    const-string v0, "VideoSdk"

    const-string v1, "BoyaaVoice\u672a\u767b\u5f55"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    :goto_0
    return-void

    .line 95
    :cond_0
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v0}, Lcom/boyaa/util/NetworkUtil;->isMobileNetwork(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 96
    invoke-direct {p0, p1}, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->showDialog(Ljava/lang/String;)V

    goto :goto_0

    .line 100
    :cond_1
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/boyaa/videosdk/BoyaaVoice;->setAudioControlInfo(Z)V

    goto :goto_0
.end method
