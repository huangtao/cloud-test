.class public Lboyaa/speex/AudioPlayService;
.super Ljava/lang/Thread;
.source "AudioPlayService.java"


# static fields
.field public static good:F

.field public static late:F

.field public static loss:F

.field public static loss2:F

.field public static lost:F


# instance fields
.field protected final GO_TIMEOUT:I

.field protected SampleRate:I

.field public array:[S

.field private bRunning:Z

.field protected currentseq:I

.field protected expseq:I

.field protected gap:I

.field protected getseq:I

.field protected gseq:I

.field protected m:I

.field protected final mFrameSize:I

.field private mSpeex:Lboyaa/speex/SpeexUtils;

.field protected m_out_bytes:[B

.field protected m_out_trk:Landroid/media/AudioTrack;

.field private volatile runner:Ljava/lang/Thread;

.field protected vm:I


# direct methods
.method public constructor <init>()V
    .locals 9

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 40
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 23
    const/16 v0, 0x1f40

    iput v0, p0, Lboyaa/speex/AudioPlayService;->SampleRate:I

    .line 25
    const/16 v0, 0x140

    iput v0, p0, Lboyaa/speex/AudioPlayService;->mFrameSize:I

    .line 27
    const/16 v0, 0x3e8

    iput v0, p0, Lboyaa/speex/AudioPlayService;->GO_TIMEOUT:I

    .line 30
    iput v1, p0, Lboyaa/speex/AudioPlayService;->vm:I

    .line 32
    iput v2, p0, Lboyaa/speex/AudioPlayService;->gseq:I

    iput v2, p0, Lboyaa/speex/AudioPlayService;->currentseq:I

    .line 35
    iput-boolean v2, p0, Lboyaa/speex/AudioPlayService;->bRunning:Z

    .line 243
    const/16 v0, 0xa0

    new-array v0, v0, [S

    iput-object v0, p0, Lboyaa/speex/AudioPlayService;->array:[S

    .line 44
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lboyaa/speex/AudioPlayService;->bRunning:Z

    .line 45
    iget v0, p0, Lboyaa/speex/AudioPlayService;->SampleRate:I

    .line 46
    const/4 v1, 0x2

    .line 47
    const/4 v2, 0x2

    .line 45
    invoke-static {v0, v1, v2}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v8

    .line 48
    .local v8, "m_out_buf_size":I
    new-instance v0, Landroid/media/AudioTrack;

    const/4 v1, 0x3

    .line 49
    iget v2, p0, Lboyaa/speex/AudioPlayService;->SampleRate:I

    .line 50
    const/4 v3, 0x2

    .line 51
    const/4 v4, 0x2

    .line 52
    mul-int/lit8 v5, v8, 0xa

    .line 53
    const/4 v6, 0x1

    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 48
    iput-object v0, p0, Lboyaa/speex/AudioPlayService;->m_out_trk:Landroid/media/AudioTrack;

    .line 54
    new-instance v0, Lboyaa/speex/SpeexUtils;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lboyaa/speex/SpeexUtils;-><init>(I)V

    iput-object v0, p0, Lboyaa/speex/AudioPlayService;->mSpeex:Lboyaa/speex/SpeexUtils;

    .line 55
    iget-object v0, p0, Lboyaa/speex/AudioPlayService;->mSpeex:Lboyaa/speex/SpeexUtils;

    invoke-virtual {v0}, Lboyaa/speex/SpeexUtils;->init()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .end local v8    # "m_out_buf_size":I
    :goto_0
    return-void

    .line 58
    :catch_0
    move-exception v7

    .line 59
    .local v7, "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method WaveScalse([SIF)V
    .locals 6
    .param p1, "buff"    # [S
    .param p2, "len"    # I
    .param p3, "scale"    # F

    .prologue
    .line 307
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, p2, :cond_0

    .line 320
    return-void

    .line 309
    :cond_0
    aget-short v2, p1, v1

    int-to-float v2, v2

    mul-float v0, v2, p3

    .line 310
    .local v0, "floatdata":F
    float-to-double v2, v0

    const-wide v4, -0x3f20002000000000L    # -32767.5

    cmpg-double v2, v2, v4

    if-gez v2, :cond_2

    .line 312
    const/high16 v0, -0x39000000    # -32768.0f

    .line 318
    :cond_1
    :goto_1
    float-to-int v2, v0

    int-to-short v2, v2

    aput-short v2, p1, v1

    .line 307
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 314
    :cond_2
    float-to-double v2, v0

    const-wide v4, 0x40dfffa000000000L    # 32766.5

    cmpl-double v2, v2, v4

    if-lez v2, :cond_1

    .line 316
    const v0, 0x46fffe00    # 32767.0f

    goto :goto_1
.end method

.method calc2([SII)V
    .locals 4
    .param p1, "lin"    # [S
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 275
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p3, :cond_0

    .line 286
    return-void

    .line 276
    :cond_0
    add-int v2, v0, p2

    aget-short v1, p1, v2

    .line 278
    .local v1, "j":I
    const/16 v2, 0x18ce

    if-le v1, v2, :cond_1

    .line 279
    add-int v2, v0, p2

    shr-int/lit8 v3, v1, 0x2

    int-to-short v3, v3

    aput-short v3, p1, v2

    .line 275
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 280
    :cond_1
    const/16 v2, -0x18ce

    if-ge v1, v2, :cond_2

    .line 281
    add-int v2, v0, p2

    shr-int/lit8 v3, v1, 0x2

    int-to-short v3, v3

    aput-short v3, p1, v2

    goto :goto_1

    .line 283
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
    .line 291
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p3, :cond_0

    .line 301
    return-void

    .line 292
    :cond_0
    add-int v2, v0, p2

    aget-short v1, p1, v2

    .line 293
    .local v1, "j":I
    const/16 v2, 0x18ce

    if-le v1, v2, :cond_1

    .line 294
    add-int v2, v0, p2

    const/16 v3, 0x319c

    aput-short v3, p1, v2

    .line 291
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 295
    :cond_1
    const/16 v2, -0x18ce

    if-ge v1, v2, :cond_2

    .line 296
    add-int v2, v0, p2

    const/16 v3, -0x319c

    aput-short v3, p1, v2

    goto :goto_1

    .line 298
    :cond_2
    add-int v2, v0, p2

    shl-int/lit8 v3, v1, 0x1

    int-to-short v3, v3

    aput-short v3, p1, v2

    goto :goto_1
.end method

.method public free()V
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lboyaa/speex/AudioPlayService;->m_out_trk:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V

    .line 225
    iget-object v0, p0, Lboyaa/speex/AudioPlayService;->mSpeex:Lboyaa/speex/SpeexUtils;

    invoke-virtual {v0}, Lboyaa/speex/SpeexUtils;->close()V

    .line 226
    return-void
.end method

.method public get_abs(I)I
    .locals 0
    .param p1, "x"    # I

    .prologue
    .line 240
    if-gez p1, :cond_0

    neg-int p1, p1

    .end local p1    # "x":I
    :cond_0
    return p1
.end method

.method public get_min(II)I
    .locals 0
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 235
    if-ge p1, p2, :cond_0

    .end local p1    # "x":I
    :goto_0
    return p1

    .restart local p1    # "x":I
    :cond_0
    move p1, p2

    goto :goto_0
.end method

.method public mixVoice([S[SII)[S
    .locals 6
    .param p1, "lin"    # [S
    .param p2, "lin2"    # [S
    .param p3, "off"    # I
    .param p4, "len"    # I

    .prologue
    const/16 v5, 0x7fff

    const/16 v4, -0x8000

    .line 246
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p4, :cond_0

    .line 255
    iget-object v1, p0, Lboyaa/speex/AudioPlayService;->array:[S

    return-object v1

    .line 248
    :cond_0
    iget-object v1, p0, Lboyaa/speex/AudioPlayService;->array:[S

    aget-short v2, p1, v0

    aget-short v3, p2, v0

    add-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    int-to-short v2, v2

    aput-short v2, v1, v0

    .line 249
    iget-object v1, p0, Lboyaa/speex/AudioPlayService;->array:[S

    aget-short v1, v1, v0

    if-le v1, v5, :cond_2

    .line 250
    iget-object v1, p0, Lboyaa/speex/AudioPlayService;->array:[S

    aput-short v5, v1, v0

    .line 246
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 251
    :cond_2
    iget-object v1, p0, Lboyaa/speex/AudioPlayService;->array:[S

    aget-short v1, v1, v0

    if-ge v1, v4, :cond_1

    .line 252
    iget-object v1, p0, Lboyaa/speex/AudioPlayService;->array:[S

    aput-short v4, v1, v0

    goto :goto_1
.end method

.method public release()V
    .locals 2

    .prologue
    .line 262
    const-string v0, "AudioPlayService"

    const-string v1, "\u5173\u95ed\u8bed\u97f3\u89e3\u7801\u8d44\u6e90"

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    const/4 v0, 0x0

    iput-boolean v0, p0, Lboyaa/speex/AudioPlayService;->bRunning:Z

    .line 269
    invoke-virtual {p0}, Lboyaa/speex/AudioPlayService;->free()V

    .line 270
    return-void
.end method

.method public run()V
    .locals 14

    .prologue
    const/4 v13, 0x1

    const/16 v10, 0xa0

    .line 77
    iget-object v9, p0, Lboyaa/speex/AudioPlayService;->m_out_trk:Landroid/media/AudioTrack;

    invoke-virtual {v9}, Landroid/media/AudioTrack;->play()V

    .line 79
    new-array v7, v10, [S

    .line 80
    .local v7, "processedData":[S
    new-array v8, v10, [S

    .line 81
    .local v8, "processedDataExt":[S
    new-array v5, v10, [S

    .line 82
    .local v5, "mixVoice":[S
    new-array v6, v10, [S

    .line 83
    .local v6, "nullVoice":[S
    :goto_0
    iget-boolean v9, p0, Lboyaa/speex/AudioPlayService;->bRunning:Z

    if-nez v9, :cond_0

    .line 220
    return-void

    .line 86
    :cond_0
    :try_start_0
    const-string v9, "AudioDecode"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, " VoiceManager.mRecvBuffer size =  "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v11, Lboyaa/speex/VoiceManager;->mRecvBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v11}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    sget-object v9, Lboyaa/speex/VoiceManager;->mRecvBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v9, :cond_1

    sget-object v9, Lboyaa/speex/VoiceManager;->mRecvBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v9}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v9

    if-nez v9, :cond_1

    sget-object v9, Lboyaa/speex/VoiceManager;->mRecvBufferExt:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v9, :cond_1

    sget-object v9, Lboyaa/speex/VoiceManager;->mRecvBufferExt:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v9}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v9

    if-nez v9, :cond_1

    .line 91
    const/4 v9, 0x0

    sput v9, Lcom/boyaa/videodemo/utils/Constants;->iSpeakingUID:I

    .line 92
    const-wide/16 v9, 0x0

    sput-wide v9, Lboyaa/speex/WebRtcUtils;->t_value:J

    sput-wide v9, Lboyaa/speex/WebRtcUtils;->t_render:J

    sput-wide v9, Lboyaa/speex/WebRtcUtils;->t_analyze:J

    .line 94
    const-wide/16 v9, 0xa

    invoke-static {v9, v10}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 214
    :catch_0
    move-exception v2

    .line 216
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 113
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_1
    const/4 v0, 0x0

    .line 114
    .local v0, "bean":Lcom/boyaa/videodemo/bean/AudioBean;
    const/4 v1, 0x0

    .line 116
    .local v1, "beanExt":Lcom/boyaa/videodemo/bean/AudioBean;
    :try_start_1
    sget-object v9, Lboyaa/speex/VoiceManager;->mRecvBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v9, :cond_2

    sget-object v9, Lboyaa/speex/VoiceManager;->mRecvBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v9}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v9

    if-le v9, v13, :cond_2

    .line 118
    sget-object v9, Lboyaa/speex/VoiceManager;->mRecvBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    const-wide/16 v10, 0x1

    sget-object v12, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9, v10, v11, v12}, Ljava/util/concurrent/ArrayBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "bean":Lcom/boyaa/videodemo/bean/AudioBean;
    check-cast v0, Lcom/boyaa/videodemo/bean/AudioBean;

    .line 120
    .restart local v0    # "bean":Lcom/boyaa/videodemo/bean/AudioBean;
    if-eqz v0, :cond_2

    .line 121
    iget-object v9, p0, Lboyaa/speex/AudioPlayService;->mSpeex:Lboyaa/speex/SpeexUtils;

    iget-object v10, v0, Lcom/boyaa/videodemo/bean/AudioBean;->m_buffer:[B

    iget-object v11, v0, Lcom/boyaa/videodemo/bean/AudioBean;->m_buffer:[B

    array-length v11, v11

    invoke-virtual {v9, v10, v7, v11}, Lboyaa/speex/SpeexUtils;->decode([B[SI)I

    move-result v3

    .line 123
    .local v3, "getSize":I
    const-string v9, "AudioDecode"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, " decode len ="

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v11, v0, Lcom/boyaa/videodemo/bean/AudioBean;->m_buffer:[B

    array-length v11, v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " decoded len="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    if-gtz v3, :cond_2

    .line 126
    const-wide/16 v9, 0x0

    sput-wide v9, Lboyaa/speex/WebRtcUtils;->t_value:J

    sput-wide v9, Lboyaa/speex/WebRtcUtils;->t_render:J

    sput-wide v9, Lboyaa/speex/WebRtcUtils;->t_analyze:J

    .line 127
    const-wide/16 v9, 0xa

    invoke-static {v9, v10}, Ljava/lang/Thread;->sleep(J)V

    .line 128
    const/4 v9, 0x0

    sput v9, Lcom/boyaa/videodemo/utils/Constants;->iSpeakingUID:I

    goto/16 :goto_0

    .line 135
    .end local v3    # "getSize":I
    :cond_2
    sget-object v9, Lboyaa/speex/VoiceManager;->mRecvBufferExt:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v9, :cond_3

    sget-object v9, Lboyaa/speex/VoiceManager;->mRecvBufferExt:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v9}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v9

    if-le v9, v13, :cond_3

    .line 137
    sget-object v9, Lboyaa/speex/VoiceManager;->mRecvBufferExt:Ljava/util/concurrent/ArrayBlockingQueue;

    const-wide/16 v10, 0x1

    sget-object v12, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9, v10, v11, v12}, Ljava/util/concurrent/ArrayBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "beanExt":Lcom/boyaa/videodemo/bean/AudioBean;
    check-cast v1, Lcom/boyaa/videodemo/bean/AudioBean;

    .line 138
    .restart local v1    # "beanExt":Lcom/boyaa/videodemo/bean/AudioBean;
    if-eqz v1, :cond_3

    .line 140
    iget-object v9, p0, Lboyaa/speex/AudioPlayService;->mSpeex:Lboyaa/speex/SpeexUtils;

    iget-object v10, v1, Lcom/boyaa/videodemo/bean/AudioBean;->m_buffer:[B

    iget-object v11, v1, Lcom/boyaa/videodemo/bean/AudioBean;->m_buffer:[B

    array-length v11, v11

    invoke-virtual {v9, v10, v8, v11}, Lboyaa/speex/SpeexUtils;->decode([B[SI)I

    move-result v3

    .line 141
    .restart local v3    # "getSize":I
    if-gtz v3, :cond_3

    .line 143
    const-wide/16 v9, 0xa

    invoke-static {v9, v10}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_0

    .line 149
    .end local v3    # "getSize":I
    :cond_3
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/videodemo/utils/CacheRef;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v9

    sget-object v10, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    if-eq v9, v10, :cond_7

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/videodemo/utils/CacheRef;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v9

    sget-object v10, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    if-eq v9, v10, :cond_7

    .line 152
    const/4 v9, 0x0

    array-length v10, v8

    invoke-virtual {p0, v7, v8, v9, v10}, Lboyaa/speex/AudioPlayService;->mixVoice([S[SII)[S

    move-result-object v5

    .line 154
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sput-wide v9, Lboyaa/speex/WebRtcUtils;->t_analyze:J

    .line 156
    invoke-static {}, Lboyaa/speex/WebRtcUtils;->getInstance()Lboyaa/speex/WebRtcUtils;

    move-result-object v9

    array-length v10, v5

    invoke-virtual {v9, v5, v10}, Lboyaa/speex/WebRtcUtils;->playback([SI)I

    move-result v4

    .line 158
    .local v4, "iRet":I
    const/4 v9, -0x1

    if-ne v4, v9, :cond_4

    .line 160
    const-wide/16 v9, 0x0

    sput-wide v9, Lboyaa/speex/WebRtcUtils;->t_value:J

    sput-wide v9, Lboyaa/speex/WebRtcUtils;->t_render:J

    sput-wide v9, Lboyaa/speex/WebRtcUtils;->t_analyze:J

    .line 161
    const-string v9, "AudioDecode"

    const-string v10, " farendBuffer err"

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    const-wide/16 v9, 0xa

    invoke-static {v9, v10}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_0

    .line 166
    :cond_4
    if-eqz v0, :cond_6

    .line 168
    iget v9, v0, Lcom/boyaa/videodemo/bean/AudioBean;->speaking_uid:I

    sput v9, Lcom/boyaa/videodemo/utils/Constants;->iSpeakingUID:I

    .line 169
    iget-wide v9, v0, Lcom/boyaa/videodemo/bean/AudioBean;->timestamp:J

    sput-wide v9, Lcom/boyaa/videodemo/utils/Constants;->audio_play_time_stamp:J

    .line 170
    iget-object v9, p0, Lboyaa/speex/AudioPlayService;->m_out_trk:Landroid/media/AudioTrack;

    const/4 v10, 0x0

    array-length v11, v5

    invoke-virtual {v9, v5, v10, v11}, Landroid/media/AudioTrack;->write([SII)I

    .line 197
    .end local v4    # "iRet":I
    :cond_5
    :goto_1
    const-string v9, "AudioDecode"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, " audiodecode play len =  "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v11, v7

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sput-wide v9, Lboyaa/speex/WebRtcUtils;->t_render:J

    .line 199
    sget-wide v9, Lboyaa/speex/WebRtcUtils;->t_render:J

    sget-wide v11, Lboyaa/speex/WebRtcUtils;->t_analyze:J

    sub-long/2addr v9, v11

    sput-wide v9, Lboyaa/speex/WebRtcUtils;->t_value:J

    .line 200
    const-string v9, "AudioDecode"

    const-string v10, " Audio Finish = "

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 204
    const/4 v9, 0x0

    const/4 v10, 0x0

    const/16 v11, 0xa0

    :try_start_2
    invoke-static {v6, v9, v7, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 206
    const/4 v9, 0x0

    const/4 v10, 0x0

    const/16 v11, 0xa0

    invoke-static {v6, v9, v8, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 207
    const-wide/16 v9, 0x2

    invoke-static {v9, v10}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0

    .line 209
    :catch_1
    move-exception v2

    .line 211
    .restart local v2    # "e":Ljava/lang/Exception;
    :try_start_3
    const-string v9, "AudioDecode"

    const-string v10, "Thread.sleep error"

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 173
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v4    # "iRet":I
    :cond_6
    const/4 v9, 0x0

    sput v9, Lcom/boyaa/videodemo/utils/Constants;->iSpeakingUID:I

    goto :goto_1

    .line 178
    .end local v4    # "iRet":I
    :cond_7
    if-eqz v0, :cond_8

    .line 180
    sget-boolean v9, Lcom/boyaa/videodemo/utils/Constants;->isCanPlayAudio:Z

    if-eqz v9, :cond_5

    .line 182
    array-length v9, v7

    const/high16 v10, 0x40000000    # 2.0f

    invoke-virtual {p0, v7, v9, v10}, Lboyaa/speex/AudioPlayService;->WaveScalse([SIF)V

    .line 183
    iget v9, v0, Lcom/boyaa/videodemo/bean/AudioBean;->speaking_uid:I

    sput v9, Lcom/boyaa/videodemo/utils/Constants;->iSpeakingUID:I

    .line 184
    iget-wide v9, v0, Lcom/boyaa/videodemo/bean/AudioBean;->timestamp:J

    sput-wide v9, Lcom/boyaa/videodemo/utils/Constants;->audio_play_time_stamp:J

    .line 185
    iget-object v9, p0, Lboyaa/speex/AudioPlayService;->m_out_trk:Landroid/media/AudioTrack;

    const/4 v10, 0x0

    array-length v11, v7

    invoke-virtual {v9, v7, v10, v11}, Landroid/media/AudioTrack;->write([SII)I

    goto :goto_1

    .line 189
    :cond_8
    const/4 v9, 0x0

    sput v9, Lcom/boyaa/videodemo/utils/Constants;->iSpeakingUID:I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1
.end method

.method public startThread()V
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lboyaa/speex/AudioPlayService;->runner:Ljava/lang/Thread;

    if-nez v0, :cond_0

    .line 65
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lboyaa/speex/AudioPlayService;->runner:Ljava/lang/Thread;

    .line 66
    iget-object v0, p0, Lboyaa/speex/AudioPlayService;->runner:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 68
    :cond_0
    return-void
.end method
