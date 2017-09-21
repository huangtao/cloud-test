.class public Lboyaa/speex/AudioDecoder;
.super Ljava/lang/Object;
.source "AudioDecoder.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static num_recv:I


# instance fields
.field private bStartDecoder:Z

.field private frameSize:I

.field protected head_size:I

.field private volatile leftSize:I

.field private mSpeex:Lboyaa/speex/SpeexUtils;

.field m_out_q:Ljava/util/concurrent/ArrayBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ArrayBlockingQueue",
            "<[S>;"
        }
    .end annotation
.end field

.field private final mutex:Ljava/lang/Object;

.field private processedData:[S

.field private rawdata:[B

.field private volatile runner:Ljava/lang/Thread;

.field private ts:J


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput v2, p0, Lboyaa/speex/AudioDecoder;->leftSize:I

    .line 12
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lboyaa/speex/AudioDecoder;->mutex:Ljava/lang/Object;

    .line 13
    const/16 v0, 0xa0

    iput v0, p0, Lboyaa/speex/AudioDecoder;->frameSize:I

    .line 16
    iget v0, p0, Lboyaa/speex/AudioDecoder;->frameSize:I

    new-array v0, v0, [S

    iput-object v0, p0, Lboyaa/speex/AudioDecoder;->processedData:[S

    .line 17
    iget v0, p0, Lboyaa/speex/AudioDecoder;->frameSize:I

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    iput-object v0, p0, Lboyaa/speex/AudioDecoder;->rawdata:[B

    .line 18
    iput-boolean v2, p0, Lboyaa/speex/AudioDecoder;->bStartDecoder:Z

    .line 19
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v1, 0x12c

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lboyaa/speex/AudioDecoder;->m_out_q:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 22
    iput v2, p0, Lboyaa/speex/AudioDecoder;->head_size:I

    .line 28
    new-instance v0, Lboyaa/speex/SpeexUtils;

    invoke-direct {v0, v3}, Lboyaa/speex/SpeexUtils;-><init>(I)V

    iput-object v0, p0, Lboyaa/speex/AudioDecoder;->mSpeex:Lboyaa/speex/SpeexUtils;

    .line 29
    iget-object v0, p0, Lboyaa/speex/AudioDecoder;->mSpeex:Lboyaa/speex/SpeexUtils;

    invoke-virtual {v0}, Lboyaa/speex/SpeexUtils;->init()V

    .line 30
    iput-boolean v3, p0, Lboyaa/speex/AudioDecoder;->bStartDecoder:Z

    .line 31
    return-void
.end method


# virtual methods
.method public free()V
    .locals 1

    .prologue
    .line 104
    const/4 v0, 0x0

    sput v0, Lboyaa/speex/AudioDecoder;->num_recv:I

    .line 105
    iget-object v0, p0, Lboyaa/speex/AudioDecoder;->mSpeex:Lboyaa/speex/SpeexUtils;

    invoke-virtual {v0}, Lboyaa/speex/SpeexUtils;->close()V

    .line 106
    return-void
.end method

.method public getData()[S
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 83
    :try_start_0
    iget-object v0, p0, Lboyaa/speex/AudioDecoder;->m_out_q:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 84
    iget-object v0, p0, Lboyaa/speex/AudioDecoder;->m_out_q:Ljava/util/concurrent/ArrayBlockingQueue;

    const-wide/16 v2, 0x1

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v4}, Ljava/util/concurrent/ArrayBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [S
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    :goto_0
    return-object v0

    :cond_0
    move-object v0, v1

    .line 86
    goto :goto_0

    .line 88
    :catch_0
    move-exception v0

    move-object v0, v1

    .line 92
    goto :goto_0
.end method

.method public isGetData()Z
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lboyaa/speex/AudioDecoder;->m_out_q:Ljava/util/concurrent/ArrayBlockingQueue;

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
    .line 96
    iget v0, p0, Lboyaa/speex/AudioDecoder;->leftSize:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public putData(J[BII)V
    .locals 3
    .param p1, "ts"    # J
    .param p3, "data"    # [B
    .param p4, "offset"    # I
    .param p5, "size"    # I

    .prologue
    .line 67
    iget-object v1, p0, Lboyaa/speex/AudioDecoder;->mutex:Ljava/lang/Object;

    monitor-enter v1

    .line 68
    :try_start_0
    iput-wide p1, p0, Lboyaa/speex/AudioDecoder;->ts:J

    .line 69
    iget-object v0, p0, Lboyaa/speex/AudioDecoder;->rawdata:[B

    const/4 v2, 0x0

    invoke-static {p3, p4, v0, v2, p5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 70
    iput p5, p0, Lboyaa/speex/AudioDecoder;->leftSize:I

    .line 71
    iget-object v0, p0, Lboyaa/speex/AudioDecoder;->mutex:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 67
    monitor-exit v1

    .line 73
    return-void

    .line 67
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
    .line 110
    const/4 v0, 0x0

    iput-boolean v0, p0, Lboyaa/speex/AudioDecoder;->bStartDecoder:Z

    .line 111
    invoke-virtual {p0}, Lboyaa/speex/AudioDecoder;->free()V

    .line 112
    return-void
.end method

.method public run()V
    .locals 8

    .prologue
    .line 44
    const/16 v3, -0x13

    invoke-static {v3}, Landroid/os/Process;->setThreadPriority(I)V

    .line 45
    const/4 v1, 0x0

    .line 46
    .local v1, "getSize":I
    :goto_0
    iget-boolean v3, p0, Lboyaa/speex/AudioDecoder;->bStartDecoder:Z

    if-nez v3, :cond_0

    .line 64
    return-void

    .line 47
    :cond_0
    iget-object v4, p0, Lboyaa/speex/AudioDecoder;->mutex:Ljava/lang/Object;

    monitor-enter v4

    .line 48
    :goto_1
    :try_start_0
    invoke-virtual {p0}, Lboyaa/speex/AudioDecoder;->isIdle()Z

    move-result v3

    if-nez v3, :cond_1

    .line 47
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 56
    iget-object v4, p0, Lboyaa/speex/AudioDecoder;->mutex:Ljava/lang/Object;

    monitor-enter v4

    .line 57
    :try_start_1
    iget v3, p0, Lboyaa/speex/AudioDecoder;->leftSize:I

    iget v5, p0, Lboyaa/speex/AudioDecoder;->head_size:I

    add-int/2addr v3, v5

    new-array v2, v3, [B

    .line 58
    .local v2, "raw_temp":[B
    iget-object v3, p0, Lboyaa/speex/AudioDecoder;->rawdata:[B

    const/4 v5, 0x0

    iget v6, p0, Lboyaa/speex/AudioDecoder;->head_size:I

    iget v7, p0, Lboyaa/speex/AudioDecoder;->leftSize:I

    invoke-static {v3, v5, v2, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 59
    iget-object v3, p0, Lboyaa/speex/AudioDecoder;->mSpeex:Lboyaa/speex/SpeexUtils;

    iget-object v5, p0, Lboyaa/speex/AudioDecoder;->processedData:[S

    iget v6, p0, Lboyaa/speex/AudioDecoder;->leftSize:I

    invoke-virtual {v3, v2, v5, v6}, Lboyaa/speex/SpeexUtils;->decode([B[SI)I

    move-result v1

    .line 60
    iget-object v3, p0, Lboyaa/speex/AudioDecoder;->m_out_q:Ljava/util/concurrent/ArrayBlockingQueue;

    iget-object v5, p0, Lboyaa/speex/AudioDecoder;->processedData:[S

    invoke-virtual {v3, v5}, Ljava/util/concurrent/ArrayBlockingQueue;->add(Ljava/lang/Object;)Z

    .line 61
    invoke-virtual {p0}, Lboyaa/speex/AudioDecoder;->setIdle()V

    .line 56
    monitor-exit v4

    goto :goto_0

    .end local v2    # "raw_temp":[B
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 50
    :cond_1
    :try_start_2
    iget-object v3, p0, Lboyaa/speex/AudioDecoder;->mutex:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    .line 51
    :catch_0
    move-exception v0

    .line 52
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1

    .line 47
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_1
    move-exception v3

    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v3
.end method

.method public setIdle()V
    .locals 1

    .prologue
    .line 100
    const/4 v0, 0x0

    iput v0, p0, Lboyaa/speex/AudioDecoder;->leftSize:I

    .line 101
    return-void
.end method

.method public startThread()V
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lboyaa/speex/AudioDecoder;->runner:Ljava/lang/Thread;

    if-nez v0, :cond_0

    .line 35
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lboyaa/speex/AudioDecoder;->runner:Ljava/lang/Thread;

    .line 36
    iget-object v0, p0, Lboyaa/speex/AudioDecoder;->runner:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 38
    :cond_0
    return-void
.end method
