.class public Lcom/boyaa/videodemo/data/ClientVedio;
.super Ljava/lang/Object;
.source "ClientVedio.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;,
        Lcom/boyaa/videodemo/data/ClientVedio$ReadTask;
    }
.end annotation


# static fields
.field public static final KEY_AUDIO_SOCKET:I = 0x2

.field private static final TAG:Ljava/lang/String; = "ClientAudio"

.field private static mInstance:Lcom/boyaa/videodemo/data/ClientVedio;

.field private static mSynLock:[B


# instance fields
.field private isFirstConnect:Z

.field socket:Ljava/net/Socket;

.field task:Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/boyaa/videodemo/data/ClientVedio;->mSynLock:[B

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->isFirstConnect:Z

    .line 46
    return-void
.end method

.method public static getInstance()Lcom/boyaa/videodemo/data/ClientVedio;
    .locals 2

    .prologue
    .line 49
    sget-object v0, Lcom/boyaa/videodemo/data/ClientVedio;->mInstance:Lcom/boyaa/videodemo/data/ClientVedio;

    if-nez v0, :cond_1

    .line 50
    sget-object v1, Lcom/boyaa/videodemo/data/ClientVedio;->mSynLock:[B

    monitor-enter v1

    .line 51
    :try_start_0
    sget-object v0, Lcom/boyaa/videodemo/data/ClientVedio;->mInstance:Lcom/boyaa/videodemo/data/ClientVedio;

    if-nez v0, :cond_0

    .line 52
    new-instance v0, Lcom/boyaa/videodemo/data/ClientVedio;

    invoke-direct {v0}, Lcom/boyaa/videodemo/data/ClientVedio;-><init>()V

    sput-object v0, Lcom/boyaa/videodemo/data/ClientVedio;->mInstance:Lcom/boyaa/videodemo/data/ClientVedio;

    .line 50
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    :cond_1
    sget-object v0, Lcom/boyaa/videodemo/data/ClientVedio;->mInstance:Lcom/boyaa/videodemo/data/ClientVedio;

    return-object v0

    .line 50
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public DealLeftData([BLcom/boyaa/videodemo/listener/TaskListener;)V
    .locals 10
    .param p1, "leftData"    # [B
    .param p2, "mListener"    # Lcom/boyaa/videodemo/listener/TaskListener;

    .prologue
    const/4 v8, 0x4

    .line 435
    :try_start_0
    array-length v7, p1

    if-gt v7, v8, :cond_1

    .line 437
    const-string v7, "Read Data"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "300 dataSize = "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v9, p1

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "  iRemain = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    array-length v9, p1

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 439
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataLength(I)V

    .line 440
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v7

    invoke-virtual {v7, p1}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setData([B)V

    .line 441
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    .line 489
    :cond_0
    :goto_0
    return-void

    .line 445
    :cond_1
    const/4 v4, 0x0

    .line 446
    .local v4, "iPackageLength":I
    const/4 v7, 0x0

    invoke-static {p1, v7}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->bytesToInt([BI)I

    move-result v4

    .line 447
    array-length v7, p1

    if-ne v4, v7, :cond_2

    .line 449
    const-string v7, "Read Data"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "311 dataSize = "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v9, p1

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "  PackageLength = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 451
    add-int/lit8 v7, v4, -0x4

    new-array v6, v7, [B

    .line 452
    .local v6, "packData":[B
    const/4 v7, 0x4

    const/4 v8, 0x0

    add-int/lit8 v9, v4, -0x4

    invoke-static {p1, v7, v6, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 454
    invoke-interface {p2, v6}, Lcom/boyaa/videodemo/listener/TaskListener;->success([B)V

    .line 455
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 485
    .end local v4    # "iPackageLength":I
    .end local v6    # "packData":[B
    :catch_0
    move-exception v1

    .line 487
    .local v1, "e":Ljava/lang/Exception;
    const-string v7, "ClientVedio"

    const-string v8, "error pa"

    invoke-static {v7, v8}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 457
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v4    # "iPackageLength":I
    :cond_2
    :try_start_1
    array-length v7, p1

    if-ge v4, v7, :cond_3

    .line 459
    array-length v2, p1

    .line 460
    .local v2, "iDataSize":I
    move v3, v4

    .line 461
    .local v3, "iLen":I
    const-string v7, "Read Data"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "312 dataSize = "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v9, p1

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "  PackageLength = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    add-int/lit8 v7, v4, -0x4

    new-array v6, v7, [B

    .line 464
    .restart local v6    # "packData":[B
    const/4 v7, 0x4

    const/4 v8, 0x0

    add-int/lit8 v9, v4, -0x4

    invoke-static {p1, v7, v6, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 465
    invoke-interface {p2, v6}, Lcom/boyaa/videodemo/listener/TaskListener;->success([B)V

    .line 466
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    .line 468
    array-length v7, p1

    sub-int/2addr v7, v4

    new-array v5, v7, [B

    .line 469
    .local v5, "leftData2":[B
    const/4 v7, 0x0

    array-length v8, p1

    sub-int/2addr v8, v4

    invoke-static {p1, v4, v5, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 471
    invoke-virtual {p0, v5, p2}, Lcom/boyaa/videodemo/data/ClientVedio;->DealLeftData([BLcom/boyaa/videodemo/listener/TaskListener;)V

    goto/16 :goto_0

    .line 473
    .end local v2    # "iDataSize":I
    .end local v3    # "iLen":I
    .end local v5    # "leftData2":[B
    .end local v6    # "packData":[B
    :cond_3
    array-length v7, p1

    if-le v4, v7, :cond_0

    .line 475
    const-string v7, "Read Data"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "313 dataSize = "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v9, p1

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "  PackageLength = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 477
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    .line 478
    array-length v7, p1

    add-int/lit8 v7, v7, -0x4

    new-array v0, v7, [B

    .line 479
    .local v0, "data":[B
    const/4 v7, 0x4

    const/4 v8, 0x0

    array-length v9, p1

    add-int/lit8 v9, v9, -0x4

    invoke-static {p1, v7, v0, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 480
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v7

    invoke-virtual {v7, v0}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setData([B)V

    .line 481
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v7

    invoke-virtual {v7, v4}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataLength(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public connectAsyn(ILjava/lang/String;ILcom/boyaa/videodemo/listener/TaskListener;)V
    .locals 8
    .param p1, "socketKey"    # I
    .param p2, "ip"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "listener"    # Lcom/boyaa/videodemo/listener/TaskListener;

    .prologue
    const/4 v0, 0x1

    .line 61
    iput-boolean v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->isFirstConnect:Z

    .line 63
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0}, Ljava/net/Socket;-><init>()V

    iput-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->socket:Ljava/net/Socket;

    .line 69
    :try_start_0
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->socket:Ljava/net/Socket;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setTcpNoDelay(Z)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    :goto_0
    new-instance v0, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;

    iget-object v2, p0, Lcom/boyaa/videodemo/data/ClientVedio;->socket:Ljava/net/Socket;

    move-object v1, p0

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;-><init>(Lcom/boyaa/videodemo/data/ClientVedio;Ljava/net/Socket;Ljava/lang/String;ILcom/boyaa/videodemo/listener/TaskListener;)V

    iput-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->task:Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;

    .line 79
    :try_start_1
    invoke-static {}, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->getInstance()Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/videodemo/data/ClientVedio;->task:Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;

    invoke-virtual {v0, v1}, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_1

    .line 87
    :cond_0
    :goto_1
    return-void

    .line 71
    :catch_0
    move-exception v6

    .line 73
    .local v6, "e":Ljava/net/SocketException;
    invoke-virtual {v6}, Ljava/net/SocketException;->printStackTrace()V

    goto :goto_0

    .line 80
    .end local v6    # "e":Ljava/net/SocketException;
    :catch_1
    move-exception v7

    .line 81
    .local v7, "ree":Ljava/util/concurrent/RejectedExecutionException;
    const-string v0, "ClientAudio"

    const-string v1, "RejectedExecutionException"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    if-eqz p4, :cond_0

    .line 83
    const/4 v0, 0x2

    invoke-interface {p4, v7, v0}, Lcom/boyaa/videodemo/listener/TaskListener;->failed(Ljava/lang/Exception;I)V

    .line 84
    const/4 v0, 0x0

    sput-boolean v0, Lcom/boyaa/videodemo/utils/Constants;->isOnRecontentAccess:Z

    goto :goto_1
.end method

.method public disconnect()V
    .locals 2

    .prologue
    .line 90
    const-string v0, "ClientAudio"

    const-string v1, "disconnect"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    :try_start_0
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->task:Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;

    if-eqz v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->task:Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->release()V

    .line 94
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->task:Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_1

    .line 98
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    .line 99
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->socket:Ljava/net/Socket;

    .line 101
    :cond_1
    invoke-static {}, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->getInstance()Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->shutdown()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    :goto_0
    return-void

    .line 103
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public isWriteReady()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 155
    iget-object v1, p0, Lcom/boyaa/videodemo/data/ClientVedio;->task:Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;

    if-nez v1, :cond_1

    .line 161
    :cond_0
    :goto_0
    return v0

    .line 158
    :cond_1
    iget-object v1, p0, Lcom/boyaa/videodemo/data/ClientVedio;->task:Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;

    invoke-virtual {v1}, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->isOutStreamReady()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 161
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public release()V
    .locals 2

    .prologue
    .line 112
    const-string v0, "ClientAudio"

    const-string v1, "socket disconnect"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    const/4 v0, 0x0

    :try_start_0
    sput-object v0, Lcom/boyaa/videodemo/data/ClientVedio;->mInstance:Lcom/boyaa/videodemo/data/ClientVedio;

    .line 115
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->task:Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;

    if-eqz v0, :cond_0

    .line 116
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->task:Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->release()V

    .line 117
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->task:Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;

    .line 120
    :cond_0
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_2

    .line 121
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->isClosed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 122
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    .line 124
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->socket:Ljava/net/Socket;

    .line 126
    :cond_2
    invoke-static {}, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->getInstance()Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->shutdown()V

    .line 128
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/CacheRef;->CleanPlayList()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    :goto_0
    return-void

    .line 130
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public writeData2Stream([B)V
    .locals 2
    .param p1, "param"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->task:Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;

    if-eqz v0, :cond_0

    .line 144
    iget-object v0, p0, Lcom/boyaa/videodemo/data/ClientVedio;->task:Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;

    invoke-virtual {v0, p1}, Lcom/boyaa/videodemo/data/ClientVedio$ConnectTask;->writeData2Stream([B)V

    .line 151
    :goto_0
    return-void

    .line 147
    :cond_0
    const-string v0, "ClientAudio"

    const-string v1, "\u8fde\u63a5\u670d\u52a1\u5668\u5931\u8d25,\u9700\u8981\u91cd\u8fde1.."

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    invoke-static {}, Lcom/boyaa/videodemo/utils/ApiUtils;->reconnectControlConnection()V

    goto :goto_0
.end method
