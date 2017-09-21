.class Lorg/webrtc/voiceengine/AudioDeviceAndroid;
.super Ljava/lang/Object;
.source "AudioDeviceAndroid.java"


# instance fields
.field private _audioManager:Landroid/media/AudioManager;

.field private _audioRecord:Landroid/media/AudioRecord;

.field private _audioTrack:Landroid/media/AudioTrack;

.field private _bufferedPlaySamples:I

.field private _bufferedRecSamples:I

.field private _context:Landroid/content/Context;

.field private _doPlayInit:Z

.field private _doRecInit:Z

.field private _isPlaying:Z

.field private _isRecording:Z

.field private _playBuffer:Ljava/nio/ByteBuffer;

.field private final _playLock:Ljava/util/concurrent/locks/ReentrantLock;

.field private _playPosition:I

.field private _recBuffer:Ljava/nio/ByteBuffer;

.field private final _recLock:Ljava/util/concurrent/locks/ReentrantLock;

.field private _tempBufPlay:[B

.field private _tempBufRec:[B

.field final logTag:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 5

    .prologue
    const/4 v1, 0x0

    const/4 v4, 0x1

    const/16 v3, 0x3c0

    const/4 v2, 0x0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioTrack:Landroid/media/AudioTrack;

    .line 30
    iput-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioRecord:Landroid/media/AudioRecord;

    .line 40
    new-instance v1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 41
    new-instance v1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_recLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 43
    iput-boolean v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_doPlayInit:Z

    .line 44
    iput-boolean v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_doRecInit:Z

    .line 45
    iput-boolean v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_isRecording:Z

    .line 46
    iput-boolean v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_isPlaying:Z

    .line 48
    iput v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_bufferedRecSamples:I

    .line 49
    iput v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_bufferedPlaySamples:I

    .line 50
    iput v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playPosition:I

    .line 500
    const-string v1, "WebRTC AD java"

    iput-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->logTag:Ljava/lang/String;

    .line 54
    const/16 v1, 0x3c0

    :try_start_0
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playBuffer:Ljava/nio/ByteBuffer;

    .line 56
    const/16 v1, 0x3c0

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_recBuffer:Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    :goto_0
    new-array v1, v3, [B

    iput-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_tempBufPlay:[B

    .line 63
    new-array v1, v3, [B

    iput-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_tempBufRec:[B

    .line 64
    return-void

    .line 58
    :catch_0
    move-exception v0

    .line 59
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->DoLog(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private DoLog(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 503
    const-string v0, "WebRTC AD java"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 504
    return-void
.end method

.method private DoLogErr(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 507
    const-string v0, "WebRTC AD java"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 508
    return-void
.end method

.method private GetPlayoutVolume()I
    .locals 3

    .prologue
    .line 456
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_context:Landroid/content/Context;

    if-eqz v1, :cond_0

    .line 458
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_context:Landroid/content/Context;

    const-string v2, "audio"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 457
    check-cast v1, Landroid/media/AudioManager;

    iput-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    .line 461
    :cond_0
    const/4 v0, -0x1

    .line 463
    .local v0, "level":I
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    if-eqz v1, :cond_1

    .line 464
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    .line 465
    const/4 v2, 0x0

    .line 464
    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    .line 468
    :cond_1
    return v0
.end method

.method private InitPlayback(I)I
    .locals 12
    .param p1, "sampleRate"    # I

    .prologue
    const/4 v11, 0x1

    const/4 v9, -0x1

    const/4 v0, 0x2

    const/4 v10, 0x0

    .line 134
    invoke-static {p1, v0, v0}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v8

    .line 140
    .local v8, "minPlayBufSize":I
    move v5, v8

    .line 141
    .local v5, "playBufSize":I
    const/16 v0, 0x1770

    if-ge v5, v0, :cond_0

    .line 142
    mul-int/lit8 v5, v5, 0x2

    .line 144
    :cond_0
    iput v10, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_bufferedPlaySamples:I

    .line 148
    iget-object v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioTrack:Landroid/media/AudioTrack;

    if-eqz v0, :cond_1

    .line 149
    iget-object v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    .line 150
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioTrack:Landroid/media/AudioTrack;

    .line 154
    :cond_1
    :try_start_0
    new-instance v0, Landroid/media/AudioTrack;

    .line 155
    const/4 v1, 0x0

    .line 157
    const/4 v3, 0x2

    .line 158
    const/4 v4, 0x2

    .line 159
    const/4 v6, 0x1

    move v2, p1

    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 154
    iput-object v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioTrack:Landroid/media/AudioTrack;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    iget-object v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getState()I

    move-result v0

    if-eq v0, v11, :cond_2

    move v0, v9

    .line 184
    :goto_0
    return v0

    .line 160
    :catch_0
    move-exception v7

    .line 161
    .local v7, "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->DoLog(Ljava/lang/String;)V

    move v0, v9

    .line 162
    goto :goto_0

    .line 173
    .end local v7    # "e":Ljava/lang/Exception;
    :cond_2
    iget-object v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_context:Landroid/content/Context;

    if-eqz v0, :cond_3

    .line 175
    iget-object v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_context:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 174
    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    .line 179
    :cond_3
    iget-object v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    if-nez v0, :cond_4

    move v0, v10

    .line 182
    goto :goto_0

    .line 184
    :cond_4
    iget-object v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, v10}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    goto :goto_0
.end method

.method private InitRecording(II)I
    .locals 9
    .param p1, "audioSource"    # I
    .param p2, "sampleRate"    # I

    .prologue
    const/4 v8, -0x1

    const/4 v0, 0x2

    .line 70
    invoke-static {p2, v0, v0}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v7

    .line 77
    .local v7, "minRecBufSize":I
    mul-int/lit8 v5, v7, 0x2

    .line 78
    .local v5, "recBufSize":I
    mul-int/lit8 v0, p2, 0x5

    div-int/lit16 v0, v0, 0xc8

    iput v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_bufferedRecSamples:I

    .line 82
    iget-object v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioRecord:Landroid/media/AudioRecord;

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 84
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioRecord:Landroid/media/AudioRecord;

    .line 88
    :cond_0
    :try_start_0
    new-instance v0, Landroid/media/AudioRecord;

    .line 91
    const/4 v3, 0x2

    .line 92
    const/4 v4, 0x2

    move v1, p1

    move v2, p2

    .line 93
    invoke-direct/range {v0 .. v5}, Landroid/media/AudioRecord;-><init>(IIIII)V

    .line 88
    iput-object v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioRecord:Landroid/media/AudioRecord;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    iget-object v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->getState()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    move v0, v8

    .line 108
    :goto_0
    return v0

    .line 95
    :catch_0
    move-exception v6

    .line 96
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->DoLog(Ljava/lang/String;)V

    move v0, v8

    .line 97
    goto :goto_0

    .line 108
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_1
    iget v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_bufferedRecSamples:I

    goto :goto_0
.end method

.method private PlayAudio(I)I
    .locals 7
    .param p1, "lengthInBytes"    # I

    .prologue
    .line 281
    const/4 v0, 0x0

    .line 283
    .local v0, "bufferedSamples":I
    iget-object v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 285
    :try_start_0
    iget-object v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioTrack:Landroid/media/AudioTrack;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_0

    .line 332
    iget-object v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 286
    const/4 v4, -0x2

    .line 335
    :goto_0
    return v4

    .line 291
    :cond_0
    :try_start_1
    iget-boolean v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_doPlayInit:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v4, :cond_1

    .line 294
    const/16 v4, -0x13

    .line 293
    :try_start_2
    invoke-static {v4}, Landroid/os/Process;->setThreadPriority(I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 298
    :goto_1
    const/4 v4, 0x0

    :try_start_3
    iput-boolean v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_doPlayInit:Z

    .line 301
    :cond_1
    const/4 v3, 0x0

    .line 302
    .local v3, "written":I
    iget-object v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playBuffer:Ljava/nio/ByteBuffer;

    iget-object v5, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_tempBufPlay:[B

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 303
    iget-object v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioTrack:Landroid/media/AudioTrack;

    iget-object v5, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_tempBufPlay:[B

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6, p1}, Landroid/media/AudioTrack;->write([BII)I

    move-result v3

    .line 304
    iget-object v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 309
    iget v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_bufferedPlaySamples:I

    shr-int/lit8 v5, v3, 0x1

    add-int/2addr v4, v5

    iput v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_bufferedPlaySamples:I

    .line 312
    iget-object v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v4}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    move-result v2

    .line 313
    .local v2, "pos":I
    iget v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playPosition:I

    if-ge v2, v4, :cond_2

    .line 314
    const/4 v4, 0x0

    iput v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playPosition:I

    .line 316
    :cond_2
    iget v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_bufferedPlaySamples:I

    iget v5, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playPosition:I

    sub-int v5, v2, v5

    sub-int/2addr v4, v5

    iput v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_bufferedPlaySamples:I

    .line 317
    iput v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playPosition:I

    .line 319
    iget-boolean v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_isRecording:Z

    if-nez v4, :cond_3

    .line 320
    iget v0, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_bufferedPlaySamples:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 323
    :cond_3
    if-eq v3, p1, :cond_4

    .line 332
    iget-object v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 326
    const/4 v4, -0x1

    goto :goto_0

    .line 295
    .end local v2    # "pos":I
    .end local v3    # "written":I
    :catch_0
    move-exception v1

    .line 296
    .local v1, "e":Ljava/lang/Exception;
    :try_start_4
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Set play thread priority failed: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->DoLog(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 329
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    .line 332
    iget-object v5, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 333
    throw v4

    .line 332
    .restart local v2    # "pos":I
    .restart local v3    # "written":I
    :cond_4
    iget-object v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    move v4, v0

    .line 335
    goto :goto_0
.end method

.method private RecordAudio(I)I
    .locals 5
    .param p1, "lengthInBytes"    # I

    .prologue
    .line 340
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_recLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 343
    :try_start_0
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioRecord:Landroid/media/AudioRecord;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 377
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_recLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 344
    const/4 v2, -0x2

    .line 380
    :goto_0
    return v2

    .line 349
    :cond_0
    :try_start_1
    iget-boolean v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_doRecInit:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_1

    .line 352
    const/16 v2, -0x13

    .line 351
    :try_start_2
    invoke-static {v2}, Landroid/os/Process;->setThreadPriority(I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 356
    :goto_1
    const/4 v2, 0x0

    :try_start_3
    iput-boolean v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_doRecInit:Z

    .line 359
    :cond_1
    const/4 v1, 0x0

    .line 360
    .local v1, "readBytes":I
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_recBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 361
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioRecord:Landroid/media/AudioRecord;

    iget-object v3, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_tempBufRec:[B

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, p1}, Landroid/media/AudioRecord;->read([BII)I

    move-result v1

    .line 363
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_recBuffer:Ljava/nio/ByteBuffer;

    iget-object v3, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_tempBufRec:[B

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 365
    if-eq v1, p1, :cond_2

    .line 377
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_recLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 368
    const/4 v2, -0x1

    goto :goto_0

    .line 353
    .end local v1    # "readBytes":I
    :catch_0
    move-exception v0

    .line 354
    .local v0, "e":Ljava/lang/Exception;
    :try_start_4
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Set rec thread priority failed: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->DoLog(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 371
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 372
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_5
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "RecordAudio try failed: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->DoLogErr(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 377
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_recLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 380
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_2
    iget v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_bufferedPlaySamples:I

    goto :goto_0

    .line 374
    :catchall_0
    move-exception v2

    .line 377
    iget-object v3, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_recLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 378
    throw v2

    .line 377
    .restart local v1    # "readBytes":I
    :cond_2
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_recLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_2
.end method

.method private SetAudioMode(Z)V
    .locals 4
    .param p1, "startCall"    # Z

    .prologue
    .line 472
    sget-object v2, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 474
    .local v0, "apiLevel":I
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    if-nez v2, :cond_0

    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_context:Landroid/content/Context;

    if-eqz v2, :cond_0

    .line 476
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_context:Landroid/content/Context;

    const-string v3, "audio"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 475
    check-cast v2, Landroid/media/AudioManager;

    iput-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    .line 479
    :cond_0
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    if-nez v2, :cond_2

    .line 480
    const-string v2, "Could not set audio mode - no audio manager"

    invoke-direct {p0, v2}, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->DoLogErr(Ljava/lang/String;)V

    .line 498
    :cond_1
    :goto_0
    return-void

    .line 487
    :cond_2
    sget-object v2, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v3, "Samsung"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    sget-object v2, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 488
    const-string v3, "samsung"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_3
    const/16 v2, 0x8

    if-ne v2, v0, :cond_1

    .line 491
    if-eqz p1, :cond_4

    const/4 v1, 0x4

    .line 493
    .local v1, "mode":I
    :goto_1
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v2, v1}, Landroid/media/AudioManager;->setMode(I)V

    .line 494
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v2}, Landroid/media/AudioManager;->getMode()I

    move-result v2

    if-eq v2, v1, :cond_1

    .line 495
    const-string v2, "Could not set audio mode for Samsung device"

    invoke-direct {p0, v2}, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->DoLogErr(Ljava/lang/String;)V

    goto :goto_0

    .line 492
    .end local v1    # "mode":I
    :cond_4
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private SetPlayoutSpeaker(Z)I
    .locals 5
    .param p1, "loudspeakerOn"    # Z

    .prologue
    const/4 v4, 0x2

    const/4 v2, 0x0

    .line 386
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_context:Landroid/content/Context;

    if-eqz v1, :cond_0

    .line 388
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_context:Landroid/content/Context;

    const-string v3, "audio"

    invoke-virtual {v1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 387
    check-cast v1, Landroid/media/AudioManager;

    iput-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    .line 391
    :cond_0
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    if-nez v1, :cond_1

    .line 392
    const-string v1, "Could not change audio routing - no audio manager"

    invoke-direct {p0, v1}, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->DoLogErr(Ljava/lang/String;)V

    .line 393
    const/4 v1, -0x1

    .line 429
    :goto_0
    return v1

    .line 396
    :cond_1
    sget-object v1, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 398
    .local v0, "apiLevel":I
    const/4 v1, 0x3

    if-eq v1, v0, :cond_2

    const/4 v1, 0x4

    if-ne v1, v0, :cond_4

    .line 400
    :cond_2
    if-eqz p1, :cond_3

    .line 402
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->setMode(I)V

    :goto_1
    move v1, v2

    .line 429
    goto :goto_0

    .line 405
    :cond_3
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, v4}, Landroid/media/AudioManager;->setMode(I)V

    goto :goto_1

    .line 409
    :cond_4
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v3, "Samsung"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 410
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v3, "samsung"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 411
    :cond_5
    const/4 v1, 0x5

    if-eq v1, v0, :cond_6

    const/4 v1, 0x6

    if-eq v1, v0, :cond_6

    .line 412
    const/4 v1, 0x7

    if-ne v1, v0, :cond_8

    .line 414
    :cond_6
    if-eqz p1, :cond_7

    .line 416
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, v4}, Landroid/media/AudioManager;->setMode(I)V

    .line 417
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, p1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    goto :goto_1

    .line 420
    :cond_7
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, p1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 421
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->setMode(I)V

    goto :goto_1

    .line 425
    :cond_8
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, p1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    goto :goto_1
.end method

.method private SetPlayoutVolume(I)I
    .locals 4
    .param p1, "level"    # I

    .prologue
    const/4 v3, 0x0

    .line 436
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_context:Landroid/content/Context;

    if-eqz v1, :cond_0

    .line 438
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_context:Landroid/content/Context;

    const-string v2, "audio"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 437
    check-cast v1, Landroid/media/AudioManager;

    iput-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    .line 441
    :cond_0
    const/4 v0, -0x1

    .line 443
    .local v0, "retVal":I
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    if-eqz v1, :cond_1

    .line 444
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, v3, p1, v3}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 446
    const/4 v0, 0x0

    .line 449
    :cond_1
    return v0
.end method

.method private StartPlayback()I
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 189
    iget-boolean v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_isRecording:Z

    if-nez v1, :cond_0

    .line 190
    invoke-direct {p0, v2}, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->SetAudioMode(Z)V

    .line 195
    :cond_0
    :try_start_0
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->play()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 202
    iput-boolean v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_isPlaying:Z

    .line 203
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 197
    :catch_0
    move-exception v0

    .line 198
    .local v0, "e":Ljava/lang/IllegalStateException;
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 199
    const/4 v1, -0x1

    goto :goto_0
.end method

.method private StartRecording()I
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 113
    iget-boolean v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_isPlaying:Z

    if-nez v1, :cond_0

    .line 114
    invoke-direct {p0, v2}, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->SetAudioMode(Z)V

    .line 119
    :cond_0
    :try_start_0
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v1}, Landroid/media/AudioRecord;->startRecording()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    iput-boolean v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_isRecording:Z

    .line 127
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 121
    :catch_0
    move-exception v0

    .line 122
    .local v0, "e":Ljava/lang/IllegalStateException;
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 123
    const/4 v1, -0x1

    goto :goto_0
.end method

.method private StopPlayback()I
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v1, 0x0

    .line 243
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 246
    :try_start_0
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v2}, Landroid/media/AudioTrack;->getPlayState()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    .line 249
    :try_start_1
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v2}, Landroid/media/AudioTrack;->stop()V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 256
    :try_start_2
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v2}, Landroid/media/AudioTrack;->flush()V

    .line 260
    :cond_0
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v2}, Landroid/media/AudioTrack;->release()V

    .line 261
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioTrack:Landroid/media/AudioTrack;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 266
    iput-boolean v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_doPlayInit:Z

    .line 267
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 270
    iget-boolean v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_isRecording:Z

    if-nez v2, :cond_1

    .line 271
    invoke-direct {p0, v1}, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->SetAudioMode(Z)V

    .line 274
    :cond_1
    iput-boolean v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_isPlaying:Z

    .line 275
    :goto_0
    return v1

    .line 250
    :catch_0
    move-exception v0

    .line 251
    .local v0, "e":Ljava/lang/IllegalStateException;
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 266
    iput-boolean v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_doPlayInit:Z

    .line 267
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 252
    const/4 v1, -0x1

    goto :goto_0

    .line 263
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    :catchall_0
    move-exception v1

    .line 266
    iput-boolean v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_doPlayInit:Z

    .line 267
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_playLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 268
    throw v1
.end method

.method private StopRecording()I
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v1, 0x0

    .line 208
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_recLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 211
    :try_start_0
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v2}, Landroid/media/AudioRecord;->getRecordingState()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 212
    const/4 v3, 0x3

    .line 211
    if-ne v2, v3, :cond_0

    .line 215
    :try_start_1
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v2}, Landroid/media/AudioRecord;->stop()V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 223
    :cond_0
    :try_start_2
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v2}, Landroid/media/AudioRecord;->release()V

    .line 224
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_audioRecord:Landroid/media/AudioRecord;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 229
    iput-boolean v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_doRecInit:Z

    .line 230
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_recLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 233
    iget-boolean v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_isPlaying:Z

    if-nez v2, :cond_1

    .line 234
    invoke-direct {p0, v1}, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->SetAudioMode(Z)V

    .line 237
    :cond_1
    iput-boolean v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_isRecording:Z

    .line 238
    :goto_0
    return v1

    .line 216
    :catch_0
    move-exception v0

    .line 217
    .local v0, "e":Ljava/lang/IllegalStateException;
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 229
    iput-boolean v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_doRecInit:Z

    .line 230
    iget-object v1, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_recLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 218
    const/4 v1, -0x1

    goto :goto_0

    .line 226
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    :catchall_0
    move-exception v1

    .line 229
    iput-boolean v4, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_doRecInit:Z

    .line 230
    iget-object v2, p0, Lorg/webrtc/voiceengine/AudioDeviceAndroid;->_recLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 231
    throw v1
.end method
