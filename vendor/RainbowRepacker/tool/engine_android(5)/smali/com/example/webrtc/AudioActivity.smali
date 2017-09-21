.class public Lcom/example/webrtc/AudioActivity;
.super Ljava/lang/Object;
.source "AudioActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/webrtc/AudioActivity$SortComparator;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "WebRTC_Voice"

.field private static mInstance:Lcom/example/webrtc/AudioActivity;

.field private static mLock:[B


# instance fields
.field private AGCmode:I

.field private ECmode:I

.field private NSmode:I

.field private _agcIndex:I

.field private _audioManager:Landroid/media/AudioManager;

.field private _bIsSpeakerOn:Z

.field private _context:Landroid/content/Context;

.field private _ecIndex:I

.field private _maxVolume:I

.field private _nsIndex:I

.field private _receivePort:[I

.field private _vadIndex:I

.field private _volumeLevel:I

.field private bEnableSendTag:Z

.field private bWebRTCInitSuc:Z

.field public channelList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/example/webrtc/UserChannelBean;",
            ">;"
        }
    .end annotation
.end field

.field currVolume:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 59
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/example/webrtc/AudioActivity;->mLock:[B

    .line 641
    const-string v0, "audio_wrapper"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 642
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x4

    const/4 v1, 0x0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput v1, p0, Lcom/example/webrtc/AudioActivity;->_maxVolume:I

    .line 33
    const/16 v0, 0xcc

    iput v0, p0, Lcom/example/webrtc/AudioActivity;->_volumeLevel:I

    .line 36
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/example/webrtc/AudioActivity;->_bIsSpeakerOn:Z

    .line 38
    iput v1, p0, Lcom/example/webrtc/AudioActivity;->_ecIndex:I

    .line 39
    iput v1, p0, Lcom/example/webrtc/AudioActivity;->_nsIndex:I

    .line 40
    iput v1, p0, Lcom/example/webrtc/AudioActivity;->_agcIndex:I

    .line 41
    iput v1, p0, Lcom/example/webrtc/AudioActivity;->_vadIndex:I

    .line 44
    iput v2, p0, Lcom/example/webrtc/AudioActivity;->ECmode:I

    .line 45
    iput v2, p0, Lcom/example/webrtc/AudioActivity;->NSmode:I

    .line 46
    const/4 v0, 0x3

    iput v0, p0, Lcom/example/webrtc/AudioActivity;->AGCmode:I

    .line 48
    const/4 v0, 0x7

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/example/webrtc/AudioActivity;->_receivePort:[I

    .line 53
    iput-boolean v1, p0, Lcom/example/webrtc/AudioActivity;->bEnableSendTag:Z

    .line 55
    iput-boolean v1, p0, Lcom/example/webrtc/AudioActivity;->bWebRTCInitSuc:Z

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    .line 67
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    iget-object v0, v0, Lcom/boyaa/videosdk/BoyaaVoice;->mActivity:Landroid/app/Activity;

    iput-object v0, p0, Lcom/example/webrtc/AudioActivity;->_context:Landroid/content/Context;

    .line 69
    return-void

    .line 48
    nop

    :array_0
    .array-data 4
        0x3039
        0x303b
        0x303e
        0x3040
        0x3042
        0x3044
        0x3046
    .end array-data
.end method

.method private CheckIsExist(Lcom/example/webrtc/UserChannelBean;)Z
    .locals 1
    .param p1, "bean"    # Lcom/example/webrtc/UserChannelBean;

    .prologue
    .line 334
    iget v0, p1, Lcom/example/webrtc/UserChannelBean;->user_id:I

    invoke-virtual {p0, v0}, Lcom/example/webrtc/AudioActivity;->getUserChannelBean(I)Lcom/example/webrtc/UserChannelBean;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 335
    const/4 v0, 0x1

    .line 337
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private ConfigureUserID(II)V
    .locals 1
    .param p1, "iChannel"    # I
    .param p2, "uid"    # I

    .prologue
    .line 234
    packed-switch p1, :pswitch_data_0

    .line 258
    :goto_0
    return-void

    .line 237
    :pswitch_0
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/boyaa/videodemo/utils/CacheRef;->setFUserID(I)V

    goto :goto_0

    .line 240
    :pswitch_1
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/boyaa/videodemo/utils/CacheRef;->setSUserID(I)V

    goto :goto_0

    .line 243
    :pswitch_2
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/boyaa/videodemo/utils/CacheRef;->set3UserID(I)V

    goto :goto_0

    .line 246
    :pswitch_3
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/boyaa/videodemo/utils/CacheRef;->set4UserID(I)V

    goto :goto_0

    .line 249
    :pswitch_4
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/boyaa/videodemo/utils/CacheRef;->set5UserID(I)V

    goto :goto_0

    .line 252
    :pswitch_5
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/boyaa/videodemo/utils/CacheRef;->set6UserID(I)V

    goto :goto_0

    .line 255
    :pswitch_6
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/boyaa/videodemo/utils/CacheRef;->set7UserID(I)V

    goto :goto_0

    .line 234
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method private native Create()Z
.end method

.method private native CreateChannel()I
.end method

.method private native Delete()Z
.end method

.method private native DeleteChannel(I)I
.end method

.method private native GetAllCodecs()[Ljava/lang/String;
.end method

.method private native Init(ZLandroid/content/Context;)I
.end method

.method private native NumOfCodecs()I
.end method

.method private OrderChannelUserID()V
    .locals 2

    .prologue
    .line 681
    new-instance v0, Lcom/example/webrtc/AudioActivity$SortComparator;

    invoke-direct {v0, p0}, Lcom/example/webrtc/AudioActivity$SortComparator;-><init>(Lcom/example/webrtc/AudioActivity;)V

    .line 682
    .local v0, "comp":Ljava/util/Comparator;
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 684
    return-void
.end method

.method private native SetAGCStatus(ZI)I
.end method

.method private native SetAecmMode(IZ)I
.end method

.method private native SetConnectInfo(IILjava/lang/String;II)I
.end method

.method private native SetECStatus(ZI)I
.end method

.method private native SetHighPassFilter(Z)I
.end method

.method private native SetNSStatus(ZI)I
.end method

.method private native SetRxAgcStatus(IZI)I
.end method

.method private native SetRxNsStatus(IZI)I
.end method

.method private native SetSendCodec(II)I
.end method

.method private native SetSpeakerVolume(I)I
.end method

.method private native SetVADStatus(IZI)I
.end method

.method private native StartListen(I)I
.end method

.method private native StartPlayout(I)I
.end method

.method private native StartSend(I)I
.end method

.method private native StopListen(I)I
.end method

.method private native StopPlayout(I)I
.end method

.method private native StopSend(I)I
.end method

.method private native Terminate()I
.end method

.method private WebrtcLog(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 597
    const-string v0, "*Webrtc*"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 598
    return-void
.end method

.method public static getInstance()Lcom/example/webrtc/AudioActivity;
    .locals 2

    .prologue
    .line 72
    sget-object v0, Lcom/example/webrtc/AudioActivity;->mInstance:Lcom/example/webrtc/AudioActivity;

    if-nez v0, :cond_1

    .line 73
    sget-object v1, Lcom/example/webrtc/AudioActivity;->mLock:[B

    monitor-enter v1

    .line 74
    :try_start_0
    sget-object v0, Lcom/example/webrtc/AudioActivity;->mInstance:Lcom/example/webrtc/AudioActivity;

    if-nez v0, :cond_0

    .line 75
    new-instance v0, Lcom/example/webrtc/AudioActivity;

    invoke-direct {v0}, Lcom/example/webrtc/AudioActivity;-><init>()V

    sput-object v0, Lcom/example/webrtc/AudioActivity;->mInstance:Lcom/example/webrtc/AudioActivity;

    .line 73
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    :cond_1
    sget-object v0, Lcom/example/webrtc/AudioActivity;->mInstance:Lcom/example/webrtc/AudioActivity;

    return-object v0

    .line 73
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private getSendStatus()V
    .locals 4

    .prologue
    .line 434
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/example/webrtc/AudioActivity$1;

    invoke-direct {v1, p0}, Lcom/example/webrtc/AudioActivity$1;-><init>(Lcom/example/webrtc/AudioActivity;)V

    .line 462
    const-wide/16 v2, 0xc8

    .line 434
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 463
    return-void
.end method


# virtual methods
.method public native GetSendSuccValue(I)I
.end method

.method public native SetMainConnect(II)I
.end method

.method public native SetParam(IIIIIIIII)I
.end method

.method public SetPlayoutSpeaker(Z)I
    .locals 5
    .param p1, "loudspeakerOn"    # Z

    .prologue
    const/4 v4, 0x2

    const/4 v2, 0x0

    .line 482
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->_audioManager:Landroid/media/AudioManager;

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->_context:Landroid/content/Context;

    if-eqz v1, :cond_0

    .line 484
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->_context:Landroid/content/Context;

    const-string v3, "audio"

    invoke-virtual {v1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 483
    check-cast v1, Landroid/media/AudioManager;

    iput-object v1, p0, Lcom/example/webrtc/AudioActivity;->_audioManager:Landroid/media/AudioManager;

    .line 487
    :cond_0
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->_audioManager:Landroid/media/AudioManager;

    if-nez v1, :cond_1

    .line 489
    const/4 v1, -0x1

    .line 536
    :goto_0
    return v1

    .line 492
    :cond_1
    sget-object v1, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 494
    .local v0, "apiLevel":I
    const/4 v1, 0x3

    if-eq v1, v0, :cond_2

    const/4 v1, 0x4

    if-ne v1, v0, :cond_4

    .line 496
    :cond_2
    if-eqz p1, :cond_3

    .line 498
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->setMode(I)V

    :goto_1
    move v1, v2

    .line 536
    goto :goto_0

    .line 501
    :cond_3
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, v4}, Landroid/media/AudioManager;->setMode(I)V

    goto :goto_1

    .line 505
    :cond_4
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v3, "Samsung"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 506
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v3, "samsung"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 507
    :cond_5
    const/4 v1, 0x5

    if-eq v1, v0, :cond_6

    const/4 v1, 0x6

    if-eq v1, v0, :cond_6

    .line 508
    const/4 v1, 0x7

    if-ne v1, v0, :cond_8

    .line 510
    :cond_6
    if-eqz p1, :cond_7

    .line 512
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, v4}, Landroid/media/AudioManager;->setMode(I)V

    .line 513
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, p1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    goto :goto_1

    .line 517
    :cond_7
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, p1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 518
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->setMode(I)V

    goto :goto_1

    .line 523
    :cond_8
    if-eqz p1, :cond_9

    .line 525
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, v4}, Landroid/media/AudioManager;->setMode(I)V

    .line 526
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, p1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    goto :goto_1

    .line 530
    :cond_9
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, p1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 531
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->setMode(I)V

    goto :goto_1
.end method

.method public addIndexWebrtcVoice(Lcom/example/webrtc/UserChannelBean;)V
    .locals 10
    .param p1, "bean"    # Lcom/example/webrtc/UserChannelBean;

    .prologue
    const/4 v6, 0x0

    .line 262
    invoke-direct {p0, p1}, Lcom/example/webrtc/AudioActivity;->CheckIsExist(Lcom/example/webrtc/UserChannelBean;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 330
    :cond_0
    :goto_0
    return-void

    .line 265
    :cond_1
    iget-boolean v0, p0, Lcom/example/webrtc/AudioActivity;->bWebRTCInitSuc:Z

    if-nez v0, :cond_2

    .line 267
    invoke-virtual {p0}, Lcom/example/webrtc/AudioActivity;->initWebRtcVoice()V

    .line 270
    :cond_2
    const-string v0, "WebRTC_Voice"

    const-string v1, " ####### CreateChannel() ######## "

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    invoke-direct {p0}, Lcom/example/webrtc/AudioActivity;->CreateChannel()I

    move-result v0

    iput v0, p1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    .line 272
    iget v0, p1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    if-gez v0, :cond_3

    .line 273
    const-string v0, " ##### VoE create channel failed ########"

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->WebrtcLog(Ljava/lang/String;)V

    goto :goto_0

    .line 277
    :cond_3
    iget v0, p1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    iget v1, p1, Lcom/example/webrtc/UserChannelBean;->user_id:I

    invoke-direct {p0, v0, v1}, Lcom/example/webrtc/AudioActivity;->ConfigureUserID(II)V

    .line 280
    const-string v0, "WebRTC_Voice"

    const-string v1, " ####### setConnectInfo ######## "

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    const-string v0, "WebRTC_Voice"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, " ####### setConnectInfo ########  Channel num is"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " _receivePort is "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lcom/example/webrtc/AudioActivity;->_receivePort:[I

    iget v4, p1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    aget v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 282
    iget v1, p1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->_receivePort:[I

    iget v3, p1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    aget v2, v0, v3

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->getProxyIP()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->getProxyPort()I

    move-result v4

    const/16 v5, 0x67

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/example/webrtc/AudioActivity;->SetConnectInfo(IILjava/lang/String;II)I

    move-result v0

    if-eqz v0, :cond_4

    .line 283
    const-string v0, "VoE set setConnectInfo failed"

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->WebrtcLog(Ljava/lang/String;)V

    .line 287
    :cond_4
    const-string v0, "WebRTC_Voice"

    const-string v1, " ####### StartListen(bean.channel_num) ######## "

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    iget v0, p1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->StartListen(I)I

    move-result v0

    if-eqz v0, :cond_5

    .line 289
    const-string v0, "VoE start listen failed"

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->WebrtcLog(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 296
    :cond_5
    iget-boolean v0, p0, Lcom/example/webrtc/AudioActivity;->bEnableSendTag:Z

    if-eqz v0, :cond_6

    .line 299
    iget v0, p1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->StartSend(I)I

    .line 300
    iget v0, p1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->StartPlayout(I)I

    .line 302
    invoke-direct {p0}, Lcom/example/webrtc/AudioActivity;->getSendStatus()V

    .line 316
    :goto_1
    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 319
    invoke-direct {p0}, Lcom/example/webrtc/AudioActivity;->OrderChannelUserID()V

    .line 321
    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/webrtc/UserChannelBean;

    iget v0, v0, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    if-ltz v0, :cond_0

    .line 323
    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/webrtc/UserChannelBean;

    iget v2, v0, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    .line 324
    .local v2, "iMainConnect":I
    invoke-virtual {p0, v2, v2}, Lcom/example/webrtc/AudioActivity;->SetMainConnect(II)I

    .line 326
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->getUserID()I

    move-result v1

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->getFUserID()I

    move-result v3

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->getSUserID()I

    move-result v4

    .line 327
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->get3UserID()I

    move-result v5

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->get4UserID()I

    move-result v6

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->get5UserID()I

    move-result v7

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->get6UserID()I

    move-result v8

    .line 328
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->get7UserID()I

    move-result v9

    move-object v0, p0

    .line 326
    invoke-virtual/range {v0 .. v9}, Lcom/example/webrtc/AudioActivity;->SetParam(IIIIIIIII)I

    goto/16 :goto_0

    .line 309
    .end local v2    # "iMainConnect":I
    :cond_6
    iget v0, p1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->StopSend(I)I

    .line 310
    iget v0, p1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->StopPlayout(I)I

    goto :goto_1
.end method

.method public getSendSuccValue()I
    .locals 3

    .prologue
    .line 470
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 472
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/example/webrtc/UserChannelBean;

    iget v1, v1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    invoke-virtual {p0, v1}, Lcom/example/webrtc/AudioActivity;->GetSendSuccValue(I)I

    move-result v1

    .line 475
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public getUserChannelBean(I)Lcom/example/webrtc/UserChannelBean;
    .locals 4
    .param p1, "user_id"    # I

    .prologue
    const/4 v3, 0x0

    .line 647
    iget-object v2, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_0

    move-object v2, v3

    .line 662
    :goto_0
    return-object v2

    .line 649
    :cond_0
    const/4 v1, -0x1

    .line 650
    .local v1, "iIndex":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_1

    .line 659
    :goto_2
    const/4 v2, -0x1

    if-ne v1, v2, :cond_3

    move-object v2, v3

    .line 660
    goto :goto_0

    .line 652
    :cond_1
    iget-object v2, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/example/webrtc/UserChannelBean;

    iget v2, v2, Lcom/example/webrtc/UserChannelBean;->user_id:I

    if-ne p1, v2, :cond_2

    .line 654
    move v1, v0

    .line 655
    goto :goto_2

    .line 650
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 662
    :cond_3
    iget-object v2, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/example/webrtc/UserChannelBean;

    goto :goto_0
.end method

.method public initWebRtcVoice()V
    .locals 14

    .prologue
    .line 138
    const-string v0, "TAG "

    const-string v2, " ####### Create() ######## "

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    invoke-direct {p0}, Lcom/example/webrtc/AudioActivity;->Create()Z

    .line 141
    const-string v0, "WebRTC_Voice"

    const-string v2, " ####### Init(false, false) ######## "

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    const/4 v0, 0x0

    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v2

    iget-object v2, v2, Lcom/boyaa/videosdk/BoyaaVoice;->mActivity:Landroid/app/Activity;

    invoke-direct {p0, v0, v2}, Lcom/example/webrtc/AudioActivity;->Init(ZLandroid/content/Context;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 143
    const-string v0, "VoE init failed"

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->WebrtcLog(Ljava/lang/String;)V

    .line 146
    :cond_0
    const-string v0, " TAG "

    const-string v2, " ########## setVolumeControlStream() #########"

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    const/4 v13, 0x0

    .line 151
    .local v13, "mVoiceCodecsStrings":[Ljava/lang/String;
    invoke-direct {p0}, Lcom/example/webrtc/AudioActivity;->GetAllCodecs()[Ljava/lang/String;

    move-result-object v13

    .line 153
    const-string v0, " ############ onCreate() finish ############ "

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->WebrtcLog(Ljava/lang/String;)V

    .line 155
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_0
    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v12, v0, :cond_2

    .line 207
    invoke-direct {p0}, Lcom/example/webrtc/AudioActivity;->OrderChannelUserID()V

    .line 209
    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/webrtc/UserChannelBean;

    iget v0, v0, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    if-ltz v0, :cond_1

    .line 211
    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/webrtc/UserChannelBean;

    iget v4, v0, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    .line 212
    .local v4, "iMainConnect":I
    invoke-virtual {p0, v4, v4}, Lcom/example/webrtc/AudioActivity;->SetMainConnect(II)I

    .line 214
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->getUserID()I

    move-result v3

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->getFUserID()I

    move-result v5

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->getSUserID()I

    move-result v6

    .line 215
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->get3UserID()I

    move-result v7

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->get4UserID()I

    move-result v8

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->get5UserID()I

    move-result v9

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->get6UserID()I

    move-result v10

    .line 216
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->get7UserID()I

    move-result v11

    move-object v2, p0

    .line 214
    invoke-virtual/range {v2 .. v11}, Lcom/example/webrtc/AudioActivity;->SetParam(IIIIIIIII)I

    .line 219
    .end local v4    # "iMainConnect":I
    :cond_1
    const/4 v0, 0x1

    iget v2, p0, Lcom/example/webrtc/AudioActivity;->NSmode:I

    invoke-direct {p0, v0, v2}, Lcom/example/webrtc/AudioActivity;->SetNSStatus(ZI)I

    .line 221
    const/4 v0, 0x1

    iget v2, p0, Lcom/example/webrtc/AudioActivity;->ECmode:I

    invoke-direct {p0, v0, v2}, Lcom/example/webrtc/AudioActivity;->SetECStatus(ZI)I

    .line 223
    const/4 v0, 0x3

    const/4 v2, 0x1

    invoke-direct {p0, v0, v2}, Lcom/example/webrtc/AudioActivity;->SetAecmMode(IZ)I

    .line 225
    const/4 v0, 0x1

    const/4 v2, 0x3

    invoke-direct {p0, v0, v2}, Lcom/example/webrtc/AudioActivity;->SetAGCStatus(ZI)I

    .line 227
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/example/webrtc/AudioActivity;->bWebRTCInitSuc:Z

    .line 228
    return-void

    .line 158
    :cond_2
    const-string v0, "WebRTC_Voice"

    const-string v2, " ####### CreateChannel() ######## "

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    invoke-direct {p0}, Lcom/example/webrtc/AudioActivity;->CreateChannel()I

    move-result v1

    .line 160
    .local v1, "iChannel":I
    if-gez v1, :cond_3

    .line 161
    const-string v0, " ##### VoE create channel failed ########"

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->WebrtcLog(Ljava/lang/String;)V

    .line 155
    :goto_1
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_0

    .line 164
    :cond_3
    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/webrtc/UserChannelBean;

    iput v1, v0, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    .line 166
    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/webrtc/UserChannelBean;

    iget v0, v0, Lcom/example/webrtc/UserChannelBean;->user_id:I

    invoke-direct {p0, v1, v0}, Lcom/example/webrtc/AudioActivity;->ConfigureUserID(II)V

    .line 168
    const-string v0, "WebRTC_Voice"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, " ### IP = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v3

    invoke-virtual {v3}, Lcom/boyaa/videodemo/utils/CacheRef;->getProxyIP()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ###"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    const-string v0, "WebRTC_Voice"

    const-string v2, " ####### setConnectInfo ######## "

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    const-string v0, "WebRTC_Voice"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, " ####### setConnectInfo ########  Channel num is"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " _receivePort is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/example/webrtc/AudioActivity;->_receivePort:[I

    aget v3, v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->_receivePort:[I

    aget v2, v0, v1

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->getProxyIP()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->getProxyPort()I

    move-result v4

    const/16 v5, 0x67

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/example/webrtc/AudioActivity;->SetConnectInfo(IILjava/lang/String;II)I

    move-result v0

    if-eqz v0, :cond_4

    .line 174
    const-string v0, "VoE set setConnectInfo failed"

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->WebrtcLog(Ljava/lang/String;)V

    .line 178
    :cond_4
    const-string v0, "WebRTC_Voice"

    const-string v2, " ####### StartListen(_channel) ######## "

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    invoke-direct {p0, v1}, Lcom/example/webrtc/AudioActivity;->StartListen(I)I

    move-result v0

    if-eqz v0, :cond_5

    .line 180
    const-string v0, "VoE start listen failed"

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->WebrtcLog(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 187
    :cond_5
    iget-boolean v0, p0, Lcom/example/webrtc/AudioActivity;->bEnableSendTag:Z

    if-eqz v0, :cond_6

    .line 190
    invoke-direct {p0, v1}, Lcom/example/webrtc/AudioActivity;->StartSend(I)I

    .line 191
    invoke-direct {p0, v1}, Lcom/example/webrtc/AudioActivity;->StartPlayout(I)I

    .line 192
    invoke-direct {p0}, Lcom/example/webrtc/AudioActivity;->getSendStatus()V

    goto/16 :goto_1

    .line 199
    :cond_6
    invoke-direct {p0, v1}, Lcom/example/webrtc/AudioActivity;->StopSend(I)I

    .line 200
    invoke-direct {p0, v1}, Lcom/example/webrtc/AudioActivity;->StopPlayout(I)I

    goto/16 :goto_1
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 403
    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 404
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/example/webrtc/AudioActivity;->bWebRTCInitSuc:Z

    .line 405
    invoke-direct {p0}, Lcom/example/webrtc/AudioActivity;->Delete()Z

    .line 406
    return-void
.end method

.method public release()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 124
    const-string v0, "WebRTC_Voice"

    const-string v1, "\u95b2\u5a43\u6581webrtc\u7487\ue162\u7176\u95ab\u6c36\u4ebe\u74a7\u52ec\u7c2e"

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    const/4 v0, 0x0

    sput-object v0, Lcom/example/webrtc/AudioActivity;->mInstance:Lcom/example/webrtc/AudioActivity;

    .line 126
    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 127
    iput-boolean v2, p0, Lcom/example/webrtc/AudioActivity;->bWebRTCInitSuc:Z

    .line 129
    iput-boolean v2, p0, Lcom/example/webrtc/AudioActivity;->bEnableSendTag:Z

    .line 131
    invoke-direct {p0}, Lcom/example/webrtc/AudioActivity;->Delete()Z

    .line 132
    const-string v0, " ############ onDestroy() finish ############ "

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->WebrtcLog(Ljava/lang/String;)V

    .line 133
    return-void
.end method

.method public setAudioSend(Z)V
    .locals 2
    .param p1, "bSend"    # Z

    .prologue
    .line 411
    iput-boolean p1, p0, Lcom/example/webrtc/AudioActivity;->bEnableSendTag:Z

    .line 413
    if-eqz p1, :cond_2

    .line 415
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_1

    .line 430
    :cond_0
    return-void

    .line 417
    :cond_1
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/example/webrtc/UserChannelBean;

    iget v1, v1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    invoke-direct {p0, v1}, Lcom/example/webrtc/AudioActivity;->StartSend(I)I

    .line 418
    invoke-direct {p0}, Lcom/example/webrtc/AudioActivity;->getSendStatus()V

    .line 419
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/example/webrtc/UserChannelBean;

    iget v1, v1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    invoke-direct {p0, v1}, Lcom/example/webrtc/AudioActivity;->StartPlayout(I)I

    .line 415
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 424
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 426
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/example/webrtc/UserChannelBean;

    iget v1, v1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    invoke-direct {p0, v1}, Lcom/example/webrtc/AudioActivity;->StopSend(I)I

    .line 427
    iget-object v1, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/example/webrtc/UserChannelBean;

    iget v1, v1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    invoke-direct {p0, v1}, Lcom/example/webrtc/AudioActivity;->StopPlayout(I)I

    .line 424
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public startWebRtcAudio()V
    .locals 3

    .prologue
    .line 85
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v2

    iget-object v2, v2, Lcom/boyaa/videodemo/utils/CacheRef;->playInfoList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 93
    invoke-virtual {p0}, Lcom/example/webrtc/AudioActivity;->initWebRtcVoice()V

    .line 94
    return-void

    .line 87
    :cond_0
    new-instance v0, Lcom/example/webrtc/UserChannelBean;

    invoke-direct {v0}, Lcom/example/webrtc/UserChannelBean;-><init>()V

    .line 88
    .local v0, "bean":Lcom/example/webrtc/UserChannelBean;
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v2

    iget-object v2, v2, Lcom/boyaa/videodemo/utils/CacheRef;->playInfoList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v2

    iput v2, v0, Lcom/example/webrtc/UserChannelBean;->user_id:I

    .line 90
    iget-object v2, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public stopIndexWebrtcVoice(Lcom/example/webrtc/UserChannelBean;)V
    .locals 10
    .param p1, "bean"    # Lcom/example/webrtc/UserChannelBean;

    .prologue
    const/4 v1, 0x0

    .line 350
    iget v0, p1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->StopListen(I)I

    move-result v0

    if-eqz v0, :cond_1

    .line 351
    const-string v0, "VoE stop listen failed"

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->WebrtcLog(Ljava/lang/String;)V

    .line 399
    :cond_0
    :goto_0
    return-void

    .line 369
    :cond_1
    iget v0, p1, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->DeleteChannel(I)I

    move-result v0

    if-eqz v0, :cond_2

    .line 370
    const-string v0, "VoE delete channel failed"

    invoke-direct {p0, v0}, Lcom/example/webrtc/AudioActivity;->WebrtcLog(Ljava/lang/String;)V

    .line 378
    :cond_2
    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 380
    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_3

    .line 382
    invoke-virtual {p0}, Lcom/example/webrtc/AudioActivity;->onDestroy()V

    goto :goto_0

    .line 387
    :cond_3
    invoke-direct {p0}, Lcom/example/webrtc/AudioActivity;->OrderChannelUserID()V

    .line 389
    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/webrtc/UserChannelBean;

    iget v0, v0, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    if-ltz v0, :cond_0

    .line 391
    iget-object v0, p0, Lcom/example/webrtc/AudioActivity;->channelList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/webrtc/UserChannelBean;

    iget v2, v0, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    .line 392
    .local v2, "iMainConnect":I
    invoke-virtual {p0, v2, v2}, Lcom/example/webrtc/AudioActivity;->SetMainConnect(II)I

    .line 394
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->getUserID()I

    move-result v1

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->getFUserID()I

    move-result v3

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->getSUserID()I

    move-result v4

    .line 395
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->get3UserID()I

    move-result v5

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->get4UserID()I

    move-result v6

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->get5UserID()I

    move-result v7

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->get6UserID()I

    move-result v8

    .line 396
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->get7UserID()I

    move-result v9

    move-object v0, p0

    .line 394
    invoke-virtual/range {v0 .. v9}, Lcom/example/webrtc/AudioActivity;->SetParam(IIIIIIIII)I

    goto/16 :goto_0
.end method
