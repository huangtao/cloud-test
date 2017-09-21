.class public Lcom/boyaa/videosdk/BoyaaVoice;
.super Ljava/lang/Object;
.source "BoyaaVoice.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/videosdk/BoyaaVoice$GetParams;
    }
.end annotation


# static fields
.field public static mInstance:Lcom/boyaa/videosdk/BoyaaVoice;

.field public static mVersionTag:I

.field public static mVol:F

.field private static syncKey:[B


# instance fields
.field private audioManager:Lcom/boyaa/videodemo/utils/AppRTCAudioManager;

.field public mActivity:Landroid/app/Activity;

.field public mAppId:I

.field public mHandler:Landroid/os/Handler;

.field public mIsBlue:Z

.field public mMessageHandler:Landroid/os/Handler;

.field public mNetWorkType:I

.field public mOrientation:I

.field public mRoomID:I

.field private mRoomType:I

.field public mUID:I

.field public mVideoFrameType:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 59
    const/high16 v0, 0x3f800000    # 1.0f

    sput v0, Lcom/boyaa/videosdk/BoyaaVoice;->mVol:F

    .line 77
    sput v1, Lcom/boyaa/videosdk/BoyaaVoice;->mVersionTag:I

    .line 81
    new-array v0, v1, [B

    sput-object v0, Lcom/boyaa/videosdk/BoyaaVoice;->syncKey:[B

    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;IIIIIZIZZZILandroid/os/Handler;)V
    .locals 5
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "appId"    # I
    .param p3, "uid"    # I
    .param p4, "roomid"    # I
    .param p5, "roomtype"    # I
    .param p6, "video_frame_type"    # I
    .param p7, "b2G"    # Z
    .param p8, "orientation"    # I
    .param p9, "bBluetooth"    # Z
    .param p10, "bAudioOpen"    # Z
    .param p11, "bVedioOpen"    # Z
    .param p12, "iTag"    # I
    .param p13, "handler"    # Landroid/os/Handler;

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const/4 v1, 0x0

    iput v1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mUID:I

    .line 66
    const/4 v1, 0x0

    iput v1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mRoomID:I

    .line 67
    const/4 v1, 0x0

    iput v1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mVideoFrameType:I

    .line 68
    const/4 v1, 0x0

    iput v1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mNetWorkType:I

    .line 70
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mIsBlue:Z

    .line 73
    const/4 v1, 0x0

    iput v1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mOrientation:I

    .line 75
    const/4 v1, 0x0

    iput v1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mRoomType:I

    .line 78
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->audioManager:Lcom/boyaa/videodemo/utils/AppRTCAudioManager;

    .line 630
    new-instance v1, Lcom/boyaa/videosdk/BoyaaVoice$1;

    invoke-direct {v1, p0}, Lcom/boyaa/videosdk/BoyaaVoice$1;-><init>(Lcom/boyaa/videosdk/BoyaaVoice;)V

    iput-object v1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    .line 98
    iput-object p1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mActivity:Landroid/app/Activity;

    .line 99
    iput p2, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mAppId:I

    .line 100
    iput p3, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mUID:I

    .line 101
    iput p4, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mRoomID:I

    .line 102
    iput p5, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mRoomType:I

    .line 103
    iput p6, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mVideoFrameType:I

    .line 104
    sput-boolean p7, Lcom/boyaa/videodemo/utils/Constants;->bSupport2G:Z

    .line 105
    iput p8, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mOrientation:I

    .line 106
    iput-boolean p9, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mIsBlue:Z

    .line 107
    sput-boolean p10, Lcom/boyaa/videodemo/utils/Constants;->bOpenAudio:Z

    .line 108
    sput-boolean p11, Lcom/boyaa/videodemo/utils/Constants;->bOpenVideo:Z

    .line 110
    sput p12, Lcom/boyaa/videosdk/BoyaaVoice;->mVersionTag:I

    .line 112
    move-object/from16 v0, p13

    iput-object v0, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    .line 113
    sput-object p0, Lcom/boyaa/videosdk/BoyaaVoice;->mInstance:Lcom/boyaa/videosdk/BoyaaVoice;

    .line 115
    iget-object v1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mActivity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/boyaa/videodemo/utils/NetUtils;->GetNetworkType(Landroid/content/Context;)I

    move-result v1

    iput v1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mNetWorkType:I

    .line 119
    iget v1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mUID:I

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mRoomID:I

    if-eqz v1, :cond_0

    .line 121
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v1

    iget v2, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mUID:I

    invoke-virtual {v1, v2}, Lcom/boyaa/videodemo/utils/CacheRef;->setUserID(I)V

    .line 123
    new-instance v1, Lcom/boyaa/videosdk/BoyaaVoice$GetParams;

    invoke-direct {v1, p0}, Lcom/boyaa/videosdk/BoyaaVoice$GetParams;-><init>(Lcom/boyaa/videosdk/BoyaaVoice;)V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, ""

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/boyaa/videosdk/BoyaaVoice$GetParams;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 143
    :cond_0
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/videosdk/BoyaaVoice;)V
    .locals 0

    .prologue
    .line 145
    invoke-direct {p0}, Lcom/boyaa/videosdk/BoyaaVoice;->onAudioManagerChangedState()V

    return-void
.end method

.method static synthetic access$1(Lcom/boyaa/videosdk/BoyaaVoice;Lcom/boyaa/videodemo/utils/AppRTCAudioManager;)V
    .locals 0

    .prologue
    .line 78
    iput-object p1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->audioManager:Lcom/boyaa/videodemo/utils/AppRTCAudioManager;

    return-void
.end method

.method static synthetic access$2(Lcom/boyaa/videosdk/BoyaaVoice;)Lcom/boyaa/videodemo/utils/AppRTCAudioManager;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/boyaa/videosdk/BoyaaVoice;->audioManager:Lcom/boyaa/videodemo/utils/AppRTCAudioManager;

    return-object v0
.end method

.method static synthetic access$3(Lcom/boyaa/videosdk/BoyaaVoice;)I
    .locals 1

    .prologue
    .line 75
    iget v0, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mRoomType:I

    return v0
.end method

.method public static getInstance()Lcom/boyaa/videosdk/BoyaaVoice;
    .locals 1

    .prologue
    .line 175
    sget-object v0, Lcom/boyaa/videosdk/BoyaaVoice;->mInstance:Lcom/boyaa/videosdk/BoyaaVoice;

    return-object v0
.end method

.method public static getInstance(Landroid/app/Activity;IIIIIZIZZZILandroid/os/Handler;)Lcom/boyaa/videosdk/BoyaaVoice;
    .locals 15
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "appId"    # I
    .param p2, "uid"    # I
    .param p3, "roomid"    # I
    .param p4, "roomtype"    # I
    .param p5, "video_frame_type"    # I
    .param p6, "b2G"    # Z
    .param p7, "orientation"    # I
    .param p8, "bBluetooth"    # Z
    .param p9, "bAudioOpen"    # Z
    .param p10, "bVedioOpen"    # Z
    .param p11, "iVersionTag"    # I
    .param p12, "handler"    # Landroid/os/Handler;

    .prologue
    .line 165
    sget-object v14, Lcom/boyaa/videosdk/BoyaaVoice;->syncKey:[B

    monitor-enter v14

    .line 166
    :try_start_0
    sget-object v0, Lcom/boyaa/videosdk/BoyaaVoice;->mInstance:Lcom/boyaa/videosdk/BoyaaVoice;

    if-eqz v0, :cond_0

    .line 167
    sget-object v0, Lcom/boyaa/videosdk/BoyaaVoice;->mInstance:Lcom/boyaa/videosdk/BoyaaVoice;

    invoke-virtual {v0}, Lcom/boyaa/videosdk/BoyaaVoice;->Destory()V

    .line 169
    :cond_0
    new-instance v0, Lcom/boyaa/videosdk/BoyaaVoice;

    move-object v1, p0

    move/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    move/from16 v12, p11

    move-object/from16 v13, p12

    invoke-direct/range {v0 .. v13}, Lcom/boyaa/videosdk/BoyaaVoice;-><init>(Landroid/app/Activity;IIIIIZIZZZILandroid/os/Handler;)V

    sput-object v0, Lcom/boyaa/videosdk/BoyaaVoice;->mInstance:Lcom/boyaa/videosdk/BoyaaVoice;

    .line 165
    monitor-exit v14
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 171
    sget-object v0, Lcom/boyaa/videosdk/BoyaaVoice;->mInstance:Lcom/boyaa/videosdk/BoyaaVoice;

    return-object v0

    .line 165
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v14
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private onAudioManagerChangedState()V
    .locals 0

    .prologue
    .line 148
    return-void
.end method


# virtual methods
.method public Destory()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 184
    iget-object v0, p0, Lcom/boyaa/videosdk/BoyaaVoice;->audioManager:Lcom/boyaa/videodemo/utils/AppRTCAudioManager;

    if-eqz v0, :cond_0

    .line 185
    iget-object v0, p0, Lcom/boyaa/videosdk/BoyaaVoice;->audioManager:Lcom/boyaa/videodemo/utils/AppRTCAudioManager;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->close()V

    .line 186
    iput-object v1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->audioManager:Lcom/boyaa/videodemo/utils/AppRTCAudioManager;

    .line 189
    :cond_0
    iget-object v0, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mActivity:Landroid/app/Activity;

    if-eqz v0, :cond_1

    .line 190
    iput-object v1, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mActivity:Landroid/app/Activity;

    .line 192
    :cond_1
    invoke-static {}, Lcom/example/webrtc/AudioActivity;->getInstance()Lcom/example/webrtc/AudioActivity;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 193
    invoke-static {}, Lcom/example/webrtc/AudioActivity;->getInstance()Lcom/example/webrtc/AudioActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/webrtc/AudioActivity;->release()V

    .line 195
    :cond_2
    invoke-virtual {p0}, Lcom/boyaa/videosdk/BoyaaVoice;->SDKlogout()V

    .line 196
    sput-object v1, Lcom/boyaa/videosdk/BoyaaVoice;->mInstance:Lcom/boyaa/videosdk/BoyaaVoice;

    .line 197
    return-void
.end method

.method public SDKlogout()V
    .locals 1

    .prologue
    .line 205
    const/4 v0, 0x0

    sput-boolean v0, Lcom/boyaa/videodemo/utils/Constants;->loginRoom:Z

    .line 207
    invoke-static {}, Lboyaa/speex/VoiceManager;->getInstance()Lboyaa/speex/VoiceManager;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 208
    invoke-static {}, Lboyaa/speex/VoiceManager;->getInstance()Lboyaa/speex/VoiceManager;

    move-result-object v0

    invoke-virtual {v0}, Lboyaa/speex/VoiceManager;->release()V

    .line 211
    :cond_0
    invoke-static {}, Lcom/boyaa/videodemo/data/AudioService;->getInstance()Lcom/boyaa/videodemo/data/AudioService;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 212
    invoke-static {}, Lcom/boyaa/videodemo/data/AudioService;->getInstance()Lcom/boyaa/videodemo/data/AudioService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/data/AudioService;->release()V

    .line 214
    :cond_1
    invoke-static {}, Lcom/boyaa/videodemo/data/VideoService;->getInstance()Lcom/boyaa/videodemo/data/VideoService;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 215
    invoke-static {}, Lcom/boyaa/videodemo/data/VideoService;->getInstance()Lcom/boyaa/videodemo/data/VideoService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/data/VideoService;->release()V

    .line 219
    :cond_2
    invoke-static {}, Lh264/com/VideoManager1;->getInstance()Lh264/com/VideoManager1;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 220
    invoke-static {}, Lh264/com/VideoManager1;->getInstance()Lh264/com/VideoManager1;

    move-result-object v0

    invoke-virtual {v0}, Lh264/com/VideoManager1;->release()V

    .line 222
    :cond_3
    invoke-static {}, Lh264/com/VideoManager2;->getInstance()Lh264/com/VideoManager2;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 223
    invoke-static {}, Lh264/com/VideoManager2;->getInstance()Lh264/com/VideoManager2;

    move-result-object v0

    invoke-virtual {v0}, Lh264/com/VideoManager2;->release()V

    .line 224
    :cond_4
    invoke-static {}, Lh264/com/VideoManager3;->getInstance()Lh264/com/VideoManager3;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 225
    invoke-static {}, Lh264/com/VideoManager3;->getInstance()Lh264/com/VideoManager3;

    move-result-object v0

    invoke-virtual {v0}, Lh264/com/VideoManager3;->release()V

    .line 226
    :cond_5
    invoke-static {}, Lh264/com/VideoManager4;->getInstance()Lh264/com/VideoManager4;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 227
    invoke-static {}, Lh264/com/VideoManager4;->getInstance()Lh264/com/VideoManager4;

    move-result-object v0

    invoke-virtual {v0}, Lh264/com/VideoManager4;->release()V

    .line 228
    :cond_6
    invoke-static {}, Lh264/com/VideoManager5;->getInstance()Lh264/com/VideoManager5;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 229
    invoke-static {}, Lh264/com/VideoManager5;->getInstance()Lh264/com/VideoManager5;

    move-result-object v0

    invoke-virtual {v0}, Lh264/com/VideoManager5;->release()V

    .line 230
    :cond_7
    invoke-static {}, Lh264/com/VideoManager6;->getInstance()Lh264/com/VideoManager6;

    move-result-object v0

    if-eqz v0, :cond_8

    .line 231
    invoke-static {}, Lh264/com/VideoManager6;->getInstance()Lh264/com/VideoManager6;

    move-result-object v0

    invoke-virtual {v0}, Lh264/com/VideoManager6;->release()V

    .line 232
    :cond_8
    invoke-static {}, Lh264/com/VideoManager7;->getInstance()Lh264/com/VideoManager7;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 233
    invoke-static {}, Lh264/com/VideoManager7;->getInstance()Lh264/com/VideoManager7;

    move-result-object v0

    invoke-virtual {v0}, Lh264/com/VideoManager7;->release()V

    .line 236
    :cond_9
    invoke-static {}, Lcom/boyaa/videodemo/data/ClientVedio;->getInstance()Lcom/boyaa/videodemo/data/ClientVedio;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 237
    invoke-static {}, Lcom/boyaa/videodemo/data/ClientVedio;->getInstance()Lcom/boyaa/videodemo/data/ClientVedio;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/data/ClientVedio;->release()V

    .line 239
    :cond_a
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->release()V

    .line 240
    return-void
.end method

.method public SetLoudspeakerStatus(Z)V
    .locals 1
    .param p1, "bOn"    # Z

    .prologue
    .line 623
    invoke-static {}, Lcom/example/webrtc/AudioActivity;->getInstance()Lcom/example/webrtc/AudioActivity;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/example/webrtc/AudioActivity;->SetPlayoutSpeaker(Z)I

    .line 624
    return-void
.end method

.method public getNetWorkValue()I
    .locals 1

    .prologue
    .line 344
    iget-object v0, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/boyaa/videodemo/utils/NetUtils;->GetNetworkType(Landroid/content/Context;)I

    move-result v0

    return v0
.end method

.method public getSDKParams()I
    .locals 10

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 367
    const-string v7, "xuanfu"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Tid ="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v9, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mRoomID:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "appId="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mAppId:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "userID ="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mUID:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/boyaa/videodemo/utils/LogUtils;->s(Ljava/lang/String;Ljava/lang/String;)V

    .line 368
    iget v7, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mRoomID:I

    iget v8, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mAppId:I

    iget v9, p0, Lcom/boyaa/videosdk/BoyaaVoice;->mUID:I

    invoke-static {v7, v8, v9}, Lcom/boyaa/videodemo/utils/FetchSDKParams;->getRequest(III)Ljava/lang/String;

    move-result-object v3

    .line 369
    .local v3, "strParams":Ljava/lang/String;
    const-string v7, "xuanfu"

    invoke-static {v7, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->s(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_4

    .line 373
    const-string v7, ":"

    invoke-virtual {v3, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 374
    .local v0, "params":[Ljava/lang/String;
    if-eqz v0, :cond_0

    array-length v7, v0

    const/4 v8, 0x2

    if-eq v7, v8, :cond_1

    :cond_0
    move v5, v6

    .line 395
    .end local v0    # "params":[Ljava/lang/String;
    :goto_0
    return v5

    .line 377
    .restart local v0    # "params":[Ljava/lang/String;
    :cond_1
    aget-object v2, v0, v6

    .line 378
    .local v2, "strIP":Ljava/lang/String;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_2

    .line 379
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v7

    iput-object v2, v7, Lcom/boyaa/videodemo/utils/CacheRef;->mIP:Ljava/lang/String;

    .line 383
    aget-object v4, v0, v5

    .line 384
    .local v4, "strPort":Ljava/lang/String;
    if-eqz v4, :cond_3

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_3

    .line 386
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 387
    .local v1, "port":I
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v6

    iput v1, v6, Lcom/boyaa/videodemo/utils/CacheRef;->mPort:I

    goto :goto_0

    .end local v1    # "port":I
    .end local v4    # "strPort":Ljava/lang/String;
    :cond_2
    move v5, v6

    .line 381
    goto :goto_0

    .restart local v4    # "strPort":Ljava/lang/String;
    :cond_3
    move v5, v6

    .line 390
    goto :goto_0

    .end local v0    # "params":[Ljava/lang/String;
    .end local v2    # "strIP":Ljava/lang/String;
    .end local v4    # "strPort":Ljava/lang/String;
    :cond_4
    move v5, v6

    .line 393
    goto :goto_0
.end method

.method public setAudioControlInfo(Z)V
    .locals 2
    .param p1, "bEnableValue"    # Z

    .prologue
    .line 306
    new-instance v0, Lcom/boyaa/videodemo/utils/NetUtils;

    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/boyaa/videodemo/utils/NetUtils;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/NetUtils;->isNetWork()Z

    move-result v0

    if-nez v0, :cond_0

    .line 307
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    iget-object v0, v0, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v1, 0x68

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 312
    :goto_0
    return-void

    .line 311
    :cond_0
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->getUserID()I

    move-result v0

    invoke-static {v0, p1}, Lcom/boyaa/videodemo/utils/ApiUtils;->requestAudioControl(IZ)V

    goto :goto_0
.end method

.method public setAudioSend(Z)V
    .locals 1
    .param p1, "bSend"    # Z

    .prologue
    .line 296
    invoke-static {}, Lcom/example/webrtc/AudioActivity;->getInstance()Lcom/example/webrtc/AudioActivity;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/example/webrtc/AudioActivity;->setAudioSend(Z)V

    .line 297
    return-void
.end method
