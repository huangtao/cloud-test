.class public Lboyaa/speex/AudioEncoder;
.super Ljava/lang/Object;
.source "AudioEncoder.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static num_send:I


# instance fields
.field private bStartEncoder:Z

.field private dataLen:I

.field private frameSize:I

.field private volatile leftSize:I

.field private mSpeex:Lboyaa/speex/SpeexUtils;

.field m_in_q:Ljava/util/concurrent/ArrayBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ArrayBlockingQueue",
            "<[B>;"
        }
    .end annotation
.end field

.field private final mutex:Ljava/lang/Object;

.field private output:[S

.field private processedData:[B

.field private rawdata:[S

.field private volatile runner:Ljava/lang/Thread;

.field private tempData:[B

.field private ts:J


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lboyaa/speex/AudioEncoder;->mutex:Ljava/lang/Object;

    .line 12
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v1, 0x12c

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lboyaa/speex/AudioEncoder;->m_in_q:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 14
    const/16 v0, 0xa0

    iput v0, p0, Lboyaa/speex/AudioEncoder;->frameSize:I

    .line 15
    iput v2, p0, Lboyaa/speex/AudioEncoder;->leftSize:I

    .line 17
    iput v2, p0, Lboyaa/speex/AudioEncoder;->dataLen:I

    .line 19
    iput-boolean v2, p0, Lboyaa/speex/AudioEncoder;->bStartEncoder:Z

    .line 22
    iget v0, p0, Lboyaa/speex/AudioEncoder;->frameSize:I

    add-int/lit8 v0, v0, 0xc

    new-array v0, v0, [B

    iput-object v0, p0, Lboyaa/speex/AudioEncoder;->processedData:[B

    .line 23
    iget v0, p0, Lboyaa/speex/AudioEncoder;->frameSize:I

    new-array v0, v0, [S

    iput-object v0, p0, Lboyaa/speex/AudioEncoder;->rawdata:[S

    .line 24
    iget v0, p0, Lboyaa/speex/AudioEncoder;->frameSize:I

    new-array v0, v0, [S

    iput-object v0, p0, Lboyaa/speex/AudioEncoder;->output:[S

    .line 25
    const/16 v0, 0xa

    new-array v0, v0, [B

    iput-object v0, p0, Lboyaa/speex/AudioEncoder;->tempData:[B

    .line 28
    new-instance v0, Lboyaa/speex/SpeexUtils;

    invoke-direct {v0, v3}, Lboyaa/speex/SpeexUtils;-><init>(I)V

    iput-object v0, p0, Lboyaa/speex/AudioEncoder;->mSpeex:Lboyaa/speex/SpeexUtils;

    .line 29
    iget-object v0, p0, Lboyaa/speex/AudioEncoder;->mSpeex:Lboyaa/speex/SpeexUtils;

    invoke-virtual {v0}, Lboyaa/speex/SpeexUtils;->init()V

    .line 30
    iget-object v0, p0, Lboyaa/speex/AudioEncoder;->mSpeex:Lboyaa/speex/SpeexUtils;

    invoke-virtual {v0}, Lboyaa/speex/SpeexUtils;->getFrameSize()I

    move-result v0

    iput v0, p0, Lboyaa/speex/AudioEncoder;->frameSize:I

    .line 32
    iput-boolean v3, p0, Lboyaa/speex/AudioEncoder;->bStartEncoder:Z

    .line 34
    return-void
.end method

.method private free()V
    .locals 1

    .prologue
    .line 113
    const/4 v0, 0x0

    sput v0, Lboyaa/speex/AudioEncoder;->num_send:I

    .line 114
    iget-object v0, p0, Lboyaa/speex/AudioEncoder;->m_in_q:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 115
    iget-object v0, p0, Lboyaa/speex/AudioEncoder;->mSpeex:Lboyaa/speex/SpeexUtils;

    invoke-virtual {v0}, Lboyaa/speex/SpeexUtils;->close()V

    .line 116
    return-void
.end method


# virtual methods
.method public getData()[B
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 86
    :try_start_0
    iget-object v0, p0, Lboyaa/speex/AudioEncoder;->m_in_q:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 87
    iget-object v0, p0, Lboyaa/speex/AudioEncoder;->m_in_q:Ljava/util/concurrent/ArrayBlockingQueue;

    const-wide/16 v2, 0x1

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v4}, Ljava/util/concurrent/ArrayBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    :goto_0
    return-object v0

    :cond_0
    move-object v0, v1

    .line 89
    goto :goto_0

    .line 91
    :catch_0
    move-exception v0

    move-object v0, v1

    .line 94
    goto :goto_0
.end method

.method public getdataLen()I
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lboyaa/speex/AudioEncoder;->dataLen:I

    return v0
.end method

.method public isGetData()Z
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lboyaa/speex/AudioEncoder;->m_in_q:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isIdle()Z
    .locals 1

    .prologue
    .line 105
    iget v0, p0, Lboyaa/speex/AudioEncoder;->leftSize:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public putData(J[SII)V
    .locals 3
    .param p1, "ts"    # J
    .param p3, "data"    # [S
    .param p4, "off"    # I
    .param p5, "size"    # I

    .prologue
    .line 75
    iget-object v1, p0, Lboyaa/speex/AudioEncoder;->mutex:Ljava/lang/Object;

    monitor-enter v1

    .line 76
    :try_start_0
    iput-wide p1, p0, Lboyaa/speex/AudioEncoder;->ts:J

    .line 77
    iget-object v0, p0, Lboyaa/speex/AudioEncoder;->rawdata:[S

    const/4 v2, 0x0

    invoke-static {p3, p4, v0, v2, p5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 78
    iput p5, p0, Lboyaa/speex/AudioEncoder;->leftSize:I

    .line 79
    iget-object v0, p0, Lboyaa/speex/AudioEncoder;->mutex:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 75
    monitor-exit v1

    .line 81
    return-void

    .line 75
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x0

    iput-boolean v0, p0, Lboyaa/speex/AudioEncoder;->bStartEncoder:Z

    .line 122
    invoke-direct {p0}, Lboyaa/speex/AudioEncoder;->free()V

    .line 123
    return-void
.end method

.method public run()V
    .locals 8

    .prologue
    .line 46
    const/16 v2, -0x13

    invoke-static {v2}, Landroid/os/Process;->setThreadPriority(I)V

    .line 48
    const/4 v1, 0x0

    .line 49
    .local v1, "getSize":I
    :goto_0
    iget-boolean v2, p0, Lboyaa/speex/AudioEncoder;->bStartEncoder:Z

    if-nez v2, :cond_0

    .line 71
    invoke-direct {p0}, Lboyaa/speex/AudioEncoder;->free()V

    .line 72
    return-void

    .line 51
    :cond_0
    iget-object v3, p0, Lboyaa/speex/AudioEncoder;->mutex:Ljava/lang/Object;

    monitor-enter v3

    .line 52
    :goto_1
    :try_start_0
    invoke-virtual {p0}, Lboyaa/speex/AudioEncoder;->isIdle()Z

    move-result v2

    if-nez v2, :cond_1

    .line 51
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 60
    iget-object v3, p0, Lboyaa/speex/AudioEncoder;->mutex:Ljava/lang/Object;

    monitor-enter v3

    .line 61
    :try_start_1
    iget-object v2, p0, Lboyaa/speex/AudioEncoder;->rawdata:[S

    invoke-virtual {v2}, [S->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [S

    iput-object v2, p0, Lboyaa/speex/AudioEncoder;->output:[S

    .line 63
    iget-object v2, p0, Lboyaa/speex/AudioEncoder;->mSpeex:Lboyaa/speex/SpeexUtils;

    iget-object v4, p0, Lboyaa/speex/AudioEncoder;->output:[S

    const/4 v5, 0x0

    iget-object v6, p0, Lboyaa/speex/AudioEncoder;->processedData:[B

    iget v7, p0, Lboyaa/speex/AudioEncoder;->leftSize:I

    invoke-virtual {v2, v4, v5, v6, v7}, Lboyaa/speex/SpeexUtils;->encode([SI[BI)I

    move-result v1

    .line 64
    iput v1, p0, Lboyaa/speex/AudioEncoder;->dataLen:I

    .line 66
    iget-object v2, p0, Lboyaa/speex/AudioEncoder;->processedData:[B

    const/4 v4, 0x0

    iget-object v5, p0, Lboyaa/speex/AudioEncoder;->tempData:[B

    const/4 v6, 0x0

    invoke-static {v2, v4, v5, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 67
    iget-object v2, p0, Lboyaa/speex/AudioEncoder;->m_in_q:Ljava/util/concurrent/ArrayBlockingQueue;

    iget-object v4, p0, Lboyaa/speex/AudioEncoder;->tempData:[B

    invoke-virtual {v2, v4}, Ljava/util/concurrent/ArrayBlockingQueue;->add(Ljava/lang/Object;)Z

    .line 68
    invoke-virtual {p0}, Lboyaa/speex/AudioEncoder;->setIdle()V

    .line 60
    monitor-exit v3

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 54
    :cond_1
    :try_start_2
    iget-object v2, p0, Lboyaa/speex/AudioEncoder;->mutex:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1

    .line 51
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_1
    move-exception v2

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v2
.end method

.method public setIdle()V
    .locals 1

    .prologue
    .line 109
    const/4 v0, 0x0

    iput v0, p0, Lboyaa/speex/AudioEncoder;->leftSize:I

    .line 110
    return-void
.end method

.method public startThread()V
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lboyaa/speex/AudioEncoder;->runner:Ljava/lang/Thread;

    if-nez v0, :cond_0

    .line 38
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lboyaa/speex/AudioEncoder;->runner:Ljava/lang/Thread;

    .line 39
    iget-object v0, p0, Lboyaa/speex/AudioEncoder;->runner:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 41
    :cond_0
    return-void
.end method
