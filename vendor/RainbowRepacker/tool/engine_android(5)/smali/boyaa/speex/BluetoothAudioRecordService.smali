.class public Lboyaa/speex/BluetoothAudioRecordService;
.super Ljava/lang/Thread;
.source "BluetoothAudioRecordService.java"


# static fields
.field public static m:I


# instance fields
.field private bRunning:Z

.field last_tx_time:J

.field private mAudioEncoder:Lboyaa/speex/AudioEncoder;

.field public mAudioManager:Landroid/media/AudioManager;

.field protected mFramePeriod:I

.field protected mFrameRate:I

.field protected mFrameSize:I

.field protected mSampleRate:I

.field protected m_in_rec:Landroid/media/AudioRecord;

.field protected muteflag:Z

.field next_tx_delay:J

.field now:J

.field private volatile runner:Ljava/lang/Thread;

.field sync_adj:I


# direct methods
.method public constructor <init>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 49
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 29
    iput-boolean v4, p0, Lboyaa/speex/BluetoothAudioRecordService;->bRunning:Z

    .line 31
    const/16 v0, 0x1f40

    iput v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->mSampleRate:I

    .line 32
    const/16 v0, 0xa0

    iput v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->mFrameSize:I

    .line 33
    const/16 v0, 0x32

    iput v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->mFrameRate:I

    .line 35
    const/16 v0, 0x14

    iput v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->mFramePeriod:I

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->mAudioManager:Landroid/media/AudioManager;

    .line 40
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->last_tx_time:J

    .line 43
    const/4 v0, 0x2

    iput v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->sync_adj:I

    .line 55
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    iget-object v0, v0, Lcom/boyaa/videosdk/BoyaaVoice;->mActivity:Landroid/app/Activity;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->mAudioManager:Landroid/media/AudioManager;

    .line 57
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    iget-object v0, v0, Lcom/boyaa/videosdk/BoyaaVoice;->mActivity:Landroid/app/Activity;

    new-instance v1, Lboyaa/speex/BluetoothAudioRecordService$1;

    invoke-direct {v1, p0}, Lboyaa/speex/BluetoothAudioRecordService$1;-><init>(Lboyaa/speex/BluetoothAudioRecordService;)V

    .line 87
    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.media.SCO_AUDIO_STATE_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 57
    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 91
    iput-boolean v4, p0, Lboyaa/speex/BluetoothAudioRecordService;->muteflag:Z

    .line 93
    return-void
.end method

.method static synthetic access$0(Lboyaa/speex/BluetoothAudioRecordService;Z)V
    .locals 0

    .prologue
    .line 29
    iput-boolean p1, p0, Lboyaa/speex/BluetoothAudioRecordService;->bRunning:Z

    return-void
.end method

.method private free()V
    .locals 1

    .prologue
    .line 251
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->m_in_rec:Landroid/media/AudioRecord;

    if-eqz v0, :cond_0

    .line 252
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->m_in_rec:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    .line 254
    :cond_0
    return-void
.end method


# virtual methods
.method calc2([SII)V
    .locals 4
    .param p1, "lin"    # [S
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 221
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p3, :cond_0

    .line 232
    return-void

    .line 222
    :cond_0
    add-int v2, v0, p2

    aget-short v1, p1, v2

    .line 224
    .local v1, "j":I
    const/16 v2, 0x18ce

    if-le v1, v2, :cond_1

    .line 225
    add-int v2, v0, p2

    shr-int/lit8 v3, v1, 0x2

    int-to-short v3, v3

    aput-short v3, p1, v2

    .line 221
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 226
    :cond_1
    const/16 v2, -0x18ce

    if-ge v1, v2, :cond_2

    .line 227
    add-int v2, v0, p2

    shr-int/lit8 v3, v1, 0x2

    int-to-short v3, v3

    aput-short v3, p1, v2

    goto :goto_1

    .line 229
    :cond_2
    add-int v2, v0, p2

    shr-int/lit8 v3, v1, 0x1

    int-to-short v3, v3

    aput-short v3, p1, v2

    goto :goto_1
.end method

.method calc3([SII)V
    .locals 4
    .param p1, "lin"    # [S
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 237
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p3, :cond_0

    .line 247
    return-void

    .line 238
    :cond_0
    add-int v2, v0, p2

    aget-short v1, p1, v2

    .line 239
    .local v1, "j":I
    const/16 v2, 0x18ce

    if-le v1, v2, :cond_1

    .line 240
    add-int v2, v0, p2

    const/16 v3, 0x319c

    aput-short v3, p1, v2

    .line 237
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 241
    :cond_1
    const/16 v2, -0x18ce

    if-ge v1, v2, :cond_2

    .line 242
    add-int v2, v0, p2

    const/16 v3, -0x319c

    aput-short v3, p1, v2

    goto :goto_1

    .line 244
    :cond_2
    add-int v2, v0, p2

    shl-int/lit8 v3, v1, 0x1

    int-to-short v3, v3

    aput-short v3, p1, v2

    goto :goto_1
.end method

.method public demute()V
    .locals 1

    .prologue
    .line 215
    const/4 v0, 0x0

    iput-boolean v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->muteflag:Z

    .line 216
    return-void
.end method

.method public mute()V
    .locals 1

    .prologue
    .line 211
    const/4 v0, 0x1

    iput-boolean v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->muteflag:Z

    .line 212
    return-void
.end method

.method public release()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 261
    const-string v0, "Audio Record"

    const-string v1, "\u5173\u95ed\u8bed\u97f3\u7f16\u7801\u8d44\u6e90"

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    iput-boolean v2, p0, Lboyaa/speex/BluetoothAudioRecordService;->bRunning:Z

    .line 264
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->mAudioEncoder:Lboyaa/speex/AudioEncoder;

    if-eqz v0, :cond_0

    .line 265
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->mAudioEncoder:Lboyaa/speex/AudioEncoder;

    invoke-virtual {v0}, Lboyaa/speex/AudioEncoder;->release()V

    .line 270
    :cond_0
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 271
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    .line 272
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->stopBluetoothSco()V

    .line 278
    :cond_1
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->m_in_rec:Landroid/media/AudioRecord;

    if-eqz v0, :cond_2

    .line 279
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->m_in_rec:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 280
    const/4 v0, 0x0

    iput-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->m_in_rec:Landroid/media/AudioRecord;

    .line 282
    :cond_2
    return-void
.end method

.method public run()V
    .locals 24

    .prologue
    .line 105
    move-object/from16 v0, p0

    iget v3, v0, Lboyaa/speex/BluetoothAudioRecordService;->mFrameSize:I

    new-array v14, v3, [B

    .line 107
    .local v14, "buffer":[B
    move-object/from16 v0, p0

    iget v3, v0, Lboyaa/speex/BluetoothAudioRecordService;->mFrameSize:I

    new-array v10, v3, [S

    .line 109
    .local v10, "Audio_in":[S
    move-object/from16 v0, p0

    iget v3, v0, Lboyaa/speex/BluetoothAudioRecordService;->mFrameSize:I

    div-int/lit8 v3, v3, 0x2

    new-array v0, v3, [S

    move-object/from16 v20, v0

    .line 110
    .local v20, "temp1":[S
    move-object/from16 v0, p0

    iget v3, v0, Lboyaa/speex/BluetoothAudioRecordService;->mFrameSize:I

    div-int/lit8 v3, v3, 0x2

    new-array v0, v3, [S

    move-object/from16 v21, v0

    .line 111
    .local v21, "temp2":[S
    move-object/from16 v0, p0

    iget v3, v0, Lboyaa/speex/BluetoothAudioRecordService;->mFrameSize:I

    new-array v13, v3, [S

    .line 112
    .local v13, "Audio_in_ext":[S
    move-object/from16 v0, p0

    iget v3, v0, Lboyaa/speex/BluetoothAudioRecordService;->mFrameSize:I

    new-array v6, v3, [S

    .line 114
    .local v6, "buffer_ext":[S
    new-instance v3, Lboyaa/speex/AudioEncoder;

    invoke-direct {v3}, Lboyaa/speex/AudioEncoder;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lboyaa/speex/BluetoothAudioRecordService;->mAudioEncoder:Lboyaa/speex/AudioEncoder;

    .line 115
    move-object/from16 v0, p0

    iget-object v3, v0, Lboyaa/speex/BluetoothAudioRecordService;->mAudioEncoder:Lboyaa/speex/AudioEncoder;

    invoke-virtual {v3}, Lboyaa/speex/AudioEncoder;->startThread()V

    .line 116
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lboyaa/speex/BluetoothAudioRecordService;->bRunning:Z

    if-eqz v3, :cond_0

    .line 117
    move-object/from16 v0, p0

    iget-object v3, v0, Lboyaa/speex/BluetoothAudioRecordService;->m_in_rec:Landroid/media/AudioRecord;

    invoke-virtual {v3}, Landroid/media/AudioRecord;->startRecording()V

    .line 119
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lboyaa/speex/BluetoothAudioRecordService;->bRunning:Z

    if-nez v3, :cond_1

    .line 208
    return-void

    .line 122
    :cond_1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sput-wide v3, Lboyaa/speex/WebRtcUtils;->t_capture:J

    .line 124
    move-object/from16 v0, p0

    iget-object v3, v0, Lboyaa/speex/BluetoothAudioRecordService;->m_in_rec:Landroid/media/AudioRecord;

    const/4 v4, 0x0

    const/16 v5, 0xa0

    invoke-virtual {v3, v10, v4, v5}, Landroid/media/AudioRecord;->read([SII)I

    move-result v18

    .line 125
    .local v18, "len":I
    if-gtz v18, :cond_2

    .line 127
    const-wide/16 v3, 0xa

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 201
    .end local v18    # "len":I
    :catch_0
    move-exception v17

    .line 203
    .local v17, "e":Ljava/lang/Exception;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 130
    .end local v17    # "e":Ljava/lang/Exception;
    .restart local v18    # "len":I
    :cond_2
    :try_start_1
    const-string v3, "AudioRecord"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "record len = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " audio_in ="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    array-length v5, v10

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v22

    .line 134
    .local v22, "timestamp":J
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v3

    invoke-virtual {v3}, Lcom/boyaa/videodemo/utils/CacheRef;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v3

    sget-object v4, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    if-eq v3, v4, :cond_4

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v3

    invoke-virtual {v3}, Lcom/boyaa/videodemo/utils/CacheRef;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v3

    sget-object v4, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    if-eq v3, v4, :cond_4

    .line 138
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sput-wide v3, Lboyaa/speex/WebRtcUtils;->t_process:J

    .line 140
    sget-wide v3, Lboyaa/speex/WebRtcUtils;->t_value:J

    sget-wide v7, Lboyaa/speex/WebRtcUtils;->t_process:J

    sget-wide v11, Lboyaa/speex/WebRtcUtils;->t_capture:J

    sub-long/2addr v7, v11

    add-long v15, v3, v7

    .line 141
    .local v15, "delay":J
    const-string v3, "AudioDelay"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "t_value="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-wide v7, Lboyaa/speex/WebRtcUtils;->t_value:J

    invoke-virtual {v4, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " t_="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-wide v7, Lboyaa/speex/WebRtcUtils;->t_process:J

    sget-wide v11, Lboyaa/speex/WebRtcUtils;->t_capture:J

    sub-long/2addr v7, v11

    invoke-virtual {v4, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    const-string v3, "AudioDelay"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "delay timelong is "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-wide v0, v15

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    move-object/from16 v0, p0

    iget-object v3, v0, Lboyaa/speex/BluetoothAudioRecordService;->mAudioEncoder:Lboyaa/speex/AudioEncoder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 v7, 0x0

    array-length v8, v6

    invoke-virtual/range {v3 .. v8}, Lboyaa/speex/AudioEncoder;->putData(J[SII)V

    .line 174
    .end local v15    # "delay":J
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lboyaa/speex/BluetoothAudioRecordService;->muteflag:Z

    if-nez v3, :cond_3

    .line 176
    move-object/from16 v0, p0

    iget-object v3, v0, Lboyaa/speex/BluetoothAudioRecordService;->mAudioEncoder:Lboyaa/speex/AudioEncoder;

    invoke-virtual {v3}, Lboyaa/speex/AudioEncoder;->isGetData()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v3

    if-eqz v3, :cond_3

    .line 179
    :try_start_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lboyaa/speex/BluetoothAudioRecordService;->mAudioEncoder:Lboyaa/speex/AudioEncoder;

    invoke-virtual {v3}, Lboyaa/speex/AudioEncoder;->getData()[B

    move-result-object v19

    .line 187
    .local v19, "temp":[B
    move-object/from16 v0, v19

    move-wide/from16 v1, v22

    invoke-static {v0, v1, v2}, Lcom/boyaa/videodemo/utils/ApiUtils;->SendAudioData([BJ)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 197
    .end local v19    # "temp":[B
    :cond_3
    :goto_2
    const-wide/16 v3, 0xa

    :try_start_3
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 198
    const-string v3, "AudioRecord"

    const-string v4, "FIN"

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 172
    :cond_4
    move-object/from16 v0, p0

    iget-object v7, v0, Lboyaa/speex/BluetoothAudioRecordService;->mAudioEncoder:Lboyaa/speex/AudioEncoder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const/4 v11, 0x0

    array-length v12, v10

    invoke-virtual/range {v7 .. v12}, Lboyaa/speex/AudioEncoder;->putData(J[SII)V

    goto :goto_1

    .line 190
    :catch_1
    move-exception v17

    .line 191
    .restart local v17    # "e":Ljava/lang/Exception;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2
.end method

.method public startThread()V
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->runner:Ljava/lang/Thread;

    if-nez v0, :cond_0

    .line 97
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->runner:Ljava/lang/Thread;

    .line 98
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService;->runner:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 100
    :cond_0
    return-void
.end method
