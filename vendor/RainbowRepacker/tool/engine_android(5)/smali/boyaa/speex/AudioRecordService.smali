.class public Lboyaa/speex/AudioRecordService;
.super Ljava/lang/Thread;
.source "AudioRecordService.java"


# static fields
.field public static m:I


# instance fields
.field private bRunning:Z

.field last_tx_time:J

.field private mAudioEncoder:Lboyaa/speex/AudioEncoder;

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
    .locals 8

    .prologue
    const/4 v1, 0x1

    const/4 v7, 0x0

    const/4 v3, 0x2

    .line 47
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 29
    iput-boolean v7, p0, Lboyaa/speex/AudioRecordService;->bRunning:Z

    .line 31
    const/16 v0, 0x1f40

    iput v0, p0, Lboyaa/speex/AudioRecordService;->mSampleRate:I

    .line 32
    const/16 v0, 0xa0

    iput v0, p0, Lboyaa/speex/AudioRecordService;->mFrameSize:I

    .line 33
    const/16 v0, 0x32

    iput v0, p0, Lboyaa/speex/AudioRecordService;->mFrameRate:I

    .line 35
    const/16 v0, 0x14

    iput v0, p0, Lboyaa/speex/AudioRecordService;->mFramePeriod:I

    .line 38
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lboyaa/speex/AudioRecordService;->last_tx_time:J

    .line 41
    iput v3, p0, Lboyaa/speex/AudioRecordService;->sync_adj:I

    .line 50
    iget v0, p0, Lboyaa/speex/AudioRecordService;->mSampleRate:I

    invoke-static {v0, v3, v3}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v6

    .line 51
    .local v6, "m_in_buf_size":I
    new-instance v0, Landroid/media/AudioRecord;

    iget v2, p0, Lboyaa/speex/AudioRecordService;->mSampleRate:I

    mul-int/lit8 v5, v6, 0xa

    move v4, v3

    invoke-direct/range {v0 .. v5}, Landroid/media/AudioRecord;-><init>(IIIII)V

    iput-object v0, p0, Lboyaa/speex/AudioRecordService;->m_in_rec:Landroid/media/AudioRecord;

    .line 53
    const-string v0, "Record Params"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "m_in_buf_size="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " m_in_rec="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lboyaa/speex/AudioRecordService;->m_in_rec:Landroid/media/AudioRecord;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    iput-boolean v7, p0, Lboyaa/speex/AudioRecordService;->muteflag:Z

    .line 56
    iput-boolean v1, p0, Lboyaa/speex/AudioRecordService;->bRunning:Z

    .line 57
    return-void
.end method

.method private free()V
    .locals 1

    .prologue
    .line 262
    :try_start_0
    iget-object v0, p0, Lboyaa/speex/AudioRecordService;->m_in_rec:Landroid/media/AudioRecord;

    if-eqz v0, :cond_0

    .line 264
    iget-object v0, p0, Lboyaa/speex/AudioRecordService;->m_in_rec:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    .line 266
    iget-object v0, p0, Lboyaa/speex/AudioRecordService;->m_in_rec:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 268
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lboyaa/speex/AudioRecordService;->m_in_rec:Landroid/media/AudioRecord;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 274
    :goto_0
    return-void

    .line 270
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method WaveScalse([SIF)V
    .locals 6
    .param p1, "buff"    # [S
    .param p2, "len"    # I
    .param p3, "scale"    # F

    .prologue
    .line 243
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, p2, :cond_0

    .line 256
    return-void

    .line 245
    :cond_0
    aget-short v2, p1, v1

    int-to-float v2, v2

    mul-float v0, v2, p3

    .line 246
    .local v0, "floatdata":F
    float-to-double v2, v0

    const-wide v4, -0x3f20002000000000L    # -32767.5

    cmpg-double v2, v2, v4

    if-gez v2, :cond_2

    .line 248
    const/high16 v0, -0x39000000    # -32768.0f

    .line 254
    :cond_1
    :goto_1
    float-to-int v2, v0

    int-to-short v2, v2

    aput-short v2, p1, v1

    .line 243
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 250
    :cond_2
    float-to-double v2, v0

    const-wide v4, 0x40dfffa000000000L    # 32766.5

    cmpl-double v2, v2, v4

    if-lez v2, :cond_1

    .line 252
    const v0, 0x46fffe00    # 32767.0f

    goto :goto_1
.end method

.method calc2([SII)V
    .locals 4
    .param p1, "lin"    # [S
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 211
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p3, :cond_0

    .line 222
    return-void

    .line 212
    :cond_0
    add-int v2, v0, p2

    aget-short v1, p1, v2

    .line 214
    .local v1, "j":I
    const/16 v2, 0x18ce

    if-le v1, v2, :cond_1

    .line 215
    add-int v2, v0, p2

    shr-int/lit8 v3, v1, 0x2

    int-to-short v3, v3

    aput-short v3, p1, v2

    .line 211
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 216
    :cond_1
    const/16 v2, -0x18ce

    if-ge v1, v2, :cond_2

    .line 217
    add-int v2, v0, p2

    shr-int/lit8 v3, v1, 0x2

    int-to-short v3, v3

    aput-short v3, p1, v2

    goto :goto_1

    .line 219
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
    .line 227
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p3, :cond_0

    .line 237
    return-void

    .line 228
    :cond_0
    add-int v2, v0, p2

    aget-short v1, p1, v2

    .line 229
    .local v1, "j":I
    const/16 v2, 0x18ce

    if-le v1, v2, :cond_1

    .line 230
    add-int v2, v0, p2

    const/16 v3, 0x319c

    aput-short v3, p1, v2

    .line 227
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 231
    :cond_1
    const/16 v2, -0x18ce

    if-ge v1, v2, :cond_2

    .line 232
    add-int v2, v0, p2

    const/16 v3, -0x319c

    aput-short v3, p1, v2

    goto :goto_1

    .line 234
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
    .line 205
    const/4 v0, 0x0

    iput-boolean v0, p0, Lboyaa/speex/AudioRecordService;->muteflag:Z

    .line 206
    return-void
.end method

.method public mute()V
    .locals 1

    .prologue
    .line 201
    const/4 v0, 0x1

    iput-boolean v0, p0, Lboyaa/speex/AudioRecordService;->muteflag:Z

    .line 202
    return-void
.end method

.method public release()V
    .locals 2

    .prologue
    .line 281
    const-string v0, "Audio Record"

    const-string v1, "\u5173\u95ed\u8bed\u97f3\u7f16\u7801\u8d44\u6e90"

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    const/4 v0, 0x0

    iput-boolean v0, p0, Lboyaa/speex/AudioRecordService;->bRunning:Z

    .line 284
    iget-object v0, p0, Lboyaa/speex/AudioRecordService;->mAudioEncoder:Lboyaa/speex/AudioEncoder;

    if-eqz v0, :cond_0

    .line 285
    iget-object v0, p0, Lboyaa/speex/AudioRecordService;->mAudioEncoder:Lboyaa/speex/AudioEncoder;

    invoke-virtual {v0}, Lboyaa/speex/AudioEncoder;->release()V

    .line 288
    :cond_0
    invoke-direct {p0}, Lboyaa/speex/AudioRecordService;->free()V

    .line 289
    return-void
.end method

.method public run()V
    .locals 25

    .prologue
    .line 69
    move-object/from16 v0, p0

    iget v3, v0, Lboyaa/speex/AudioRecordService;->mFrameSize:I

    new-array v14, v3, [B

    .line 70
    .local v14, "buffer":[B
    const/16 v18, 0x0

    .line 71
    .local v18, "iFailedTimes":I
    move-object/from16 v0, p0

    iget v3, v0, Lboyaa/speex/AudioRecordService;->mFrameSize:I

    new-array v13, v3, [S

    .line 73
    .local v13, "Audio_in":[S
    move-object/from16 v0, p0

    iget v3, v0, Lboyaa/speex/AudioRecordService;->mFrameSize:I

    div-int/lit8 v3, v3, 0x2

    new-array v0, v3, [S

    move-object/from16 v21, v0

    .line 74
    .local v21, "temp1":[S
    move-object/from16 v0, p0

    iget v3, v0, Lboyaa/speex/AudioRecordService;->mFrameSize:I

    div-int/lit8 v3, v3, 0x2

    new-array v0, v3, [S

    move-object/from16 v22, v0

    .line 75
    .local v22, "temp2":[S
    move-object/from16 v0, p0

    iget v3, v0, Lboyaa/speex/AudioRecordService;->mFrameSize:I

    new-array v10, v3, [S

    .line 76
    .local v10, "Audio_in_ext":[S
    move-object/from16 v0, p0

    iget v3, v0, Lboyaa/speex/AudioRecordService;->mFrameSize:I

    new-array v6, v3, [S

    .line 79
    .local v6, "buffer_ext":[S
    new-instance v3, Lboyaa/speex/AudioEncoder;

    invoke-direct {v3}, Lboyaa/speex/AudioEncoder;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lboyaa/speex/AudioRecordService;->mAudioEncoder:Lboyaa/speex/AudioEncoder;

    .line 80
    move-object/from16 v0, p0

    iget-object v3, v0, Lboyaa/speex/AudioRecordService;->mAudioEncoder:Lboyaa/speex/AudioEncoder;

    invoke-virtual {v3}, Lboyaa/speex/AudioEncoder;->startThread()V

    .line 82
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lboyaa/speex/AudioRecordService;->m_in_rec:Landroid/media/AudioRecord;

    if-eqz v3, :cond_0

    .line 83
    move-object/from16 v0, p0

    iget-object v3, v0, Lboyaa/speex/AudioRecordService;->m_in_rec:Landroid/media/AudioRecord;

    invoke-virtual {v3}, Landroid/media/AudioRecord;->startRecording()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lboyaa/speex/AudioRecordService;->bRunning:Z

    if-nez v3, :cond_1

    .line 198
    :cond_0
    :goto_1
    return-void

    .line 87
    :catch_0
    move-exception v17

    .line 89
    .local v17, "e":Ljava/lang/IllegalStateException;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/IllegalStateException;->printStackTrace()V

    goto :goto_0

    .line 95
    .end local v17    # "e":Ljava/lang/IllegalStateException;
    :cond_1
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sput-wide v3, Lboyaa/speex/WebRtcUtils;->t_capture:J

    .line 97
    move-object/from16 v0, p0

    iget-object v3, v0, Lboyaa/speex/AudioRecordService;->m_in_rec:Landroid/media/AudioRecord;

    const/4 v4, 0x0

    const/16 v5, 0xa0

    invoke-virtual {v3, v13, v4, v5}, Landroid/media/AudioRecord;->read([SII)I

    move-result v19

    .line 98
    .local v19, "len":I
    if-gtz v19, :cond_3

    .line 100
    const-string v3, "AudioRecord"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "audio record len = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    const-wide/16 v3, 0xa

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 103
    const/16 v3, 0x14

    move/from16 v0, v18

    if-lt v0, v3, :cond_2

    .line 105
    const/16 v18, 0x0

    .line 106
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v3

    iget-object v3, v3, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    if-eqz v3, :cond_0

    .line 107
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v3

    iget-object v3, v3, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v4, 0x57

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 191
    .end local v19    # "len":I
    :catch_1
    move-exception v17

    .line 193
    .local v17, "e":Ljava/lang/Exception;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 111
    .end local v17    # "e":Ljava/lang/Exception;
    .restart local v19    # "len":I
    :cond_2
    add-int/lit8 v18, v18, 0x1

    goto :goto_0

    .line 115
    :cond_3
    const/16 v18, 0x0

    .line 116
    :try_start_2
    const-string v3, "AudioRecord"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "record len = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " audio_in ="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    array-length v5, v13

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v23

    .line 119
    .local v23, "timestamp":J
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget v5, v0, Lboyaa/speex/AudioRecordService;->mFrameSize:I

    div-int/lit8 v5, v5, 0x2

    move-object/from16 v0, v21

    invoke-static {v13, v3, v0, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 120
    invoke-static {}, Lboyaa/speex/WebRtcUtils;->getInstance()Lboyaa/speex/WebRtcUtils;

    sget-object v3, Lboyaa/speex/WebRtcUtils;->webrtc_ns:Lboyaa/speex/WebRTCNS;

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v3, v0, v1}, Lboyaa/speex/WebRTCNS;->echoNS([S[S)I

    .line 121
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, v22

    array-length v5, v0

    move-object/from16 v0, v22

    invoke-static {v0, v3, v10, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 122
    move-object/from16 v0, p0

    iget v3, v0, Lboyaa/speex/AudioRecordService;->mFrameSize:I

    div-int/lit8 v3, v3, 0x2

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget v5, v0, Lboyaa/speex/AudioRecordService;->mFrameSize:I

    div-int/lit8 v5, v5, 0x2

    move-object/from16 v0, v21

    invoke-static {v13, v3, v0, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 123
    invoke-static {}, Lboyaa/speex/WebRtcUtils;->getInstance()Lboyaa/speex/WebRtcUtils;

    sget-object v3, Lboyaa/speex/WebRtcUtils;->webrtc_ns:Lboyaa/speex/WebRTCNS;

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v3, v0, v1}, Lboyaa/speex/WebRTCNS;->echoNS([S[S)I

    .line 124
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget v4, v0, Lboyaa/speex/AudioRecordService;->mFrameSize:I

    div-int/lit8 v4, v4, 0x2

    move-object/from16 v0, p0

    iget v5, v0, Lboyaa/speex/AudioRecordService;->mFrameSize:I

    div-int/lit8 v5, v5, 0x2

    move-object/from16 v0, v22

    invoke-static {v0, v3, v10, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 127
    move-object/from16 v0, p0

    iget v3, v0, Lboyaa/speex/AudioRecordService;->mFrameSize:I

    const v4, 0x3f99999a    # 1.2f

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v3, v4}, Lboyaa/speex/AudioRecordService;->WaveScalse([SIF)V

    .line 129
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v3

    invoke-virtual {v3}, Lcom/boyaa/videodemo/utils/CacheRef;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v3

    sget-object v4, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    if-eq v3, v4, :cond_5

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v3

    invoke-virtual {v3}, Lcom/boyaa/videodemo/utils/CacheRef;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v3

    sget-object v4, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    if-eq v3, v4, :cond_5

    .line 133
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sput-wide v3, Lboyaa/speex/WebRtcUtils;->t_process:J

    .line 135
    sget-wide v3, Lboyaa/speex/WebRtcUtils;->t_value:J

    sget-wide v7, Lboyaa/speex/WebRtcUtils;->t_process:J

    sget-wide v11, Lboyaa/speex/WebRtcUtils;->t_capture:J

    sub-long/2addr v7, v11

    add-long v15, v3, v7

    .line 136
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

    .line 137
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

    .line 163
    move-object/from16 v0, p0

    iget-object v3, v0, Lboyaa/speex/AudioRecordService;->mAudioEncoder:Lboyaa/speex/AudioEncoder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 v7, 0x0

    array-length v8, v6

    invoke-virtual/range {v3 .. v8}, Lboyaa/speex/AudioEncoder;->putData(J[SII)V

    .line 169
    .end local v15    # "delay":J
    :goto_2
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lboyaa/speex/AudioRecordService;->muteflag:Z

    if-nez v3, :cond_4

    .line 171
    move-object/from16 v0, p0

    iget-object v3, v0, Lboyaa/speex/AudioRecordService;->mAudioEncoder:Lboyaa/speex/AudioEncoder;

    invoke-virtual {v3}, Lboyaa/speex/AudioEncoder;->isGetData()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result v3

    if-eqz v3, :cond_4

    .line 174
    :try_start_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lboyaa/speex/AudioRecordService;->mAudioEncoder:Lboyaa/speex/AudioEncoder;

    invoke-virtual {v3}, Lboyaa/speex/AudioEncoder;->getData()[B

    move-result-object v20

    .line 177
    .local v20, "temp":[B
    sget-boolean v3, Lcom/boyaa/videodemo/utils/Constants;->isCanPlayAudio:Z

    if-eqz v3, :cond_4

    .line 178
    move-object/from16 v0, v20

    move-wide/from16 v1, v23

    invoke-static {v0, v1, v2}, Lcom/boyaa/videodemo/utils/ApiUtils;->SendAudioData([BJ)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 187
    .end local v20    # "temp":[B
    :cond_4
    :goto_3
    const-wide/16 v3, 0xa

    :try_start_4
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 188
    const-string v3, "AudioRecord"

    const-string v4, "FIN"

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 167
    :cond_5
    move-object/from16 v0, p0

    iget-object v7, v0, Lboyaa/speex/AudioRecordService;->mAudioEncoder:Lboyaa/speex/AudioEncoder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const/4 v11, 0x0

    array-length v12, v10

    invoke-virtual/range {v7 .. v12}, Lboyaa/speex/AudioEncoder;->putData(J[SII)V

    goto :goto_2

    .line 180
    :catch_2
    move-exception v17

    .line 181
    .restart local v17    # "e":Ljava/lang/Exception;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_3
.end method

.method public startThread()V
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lboyaa/speex/AudioRecordService;->runner:Ljava/lang/Thread;

    if-nez v0, :cond_0

    .line 61
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lboyaa/speex/AudioRecordService;->runner:Ljava/lang/Thread;

    .line 62
    iget-object v0, p0, Lboyaa/speex/AudioRecordService;->runner:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 64
    :cond_0
    return-void
.end method
