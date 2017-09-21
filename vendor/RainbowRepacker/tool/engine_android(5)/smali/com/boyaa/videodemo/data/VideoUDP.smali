.class public Lcom/boyaa/videodemo/data/VideoUDP;
.super Ljava/lang/Object;
.source "VideoUDP.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataRunnable;,
        Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataSend;
    }
.end annotation


# static fields
.field public static final KEY_AUDIO_SOCKET:I = 0x2

.field private static final TAG:Ljava/lang/String; = "VideoUDP"

.field private static mInstance:Lcom/boyaa/videodemo/data/VideoUDP;

.field public static mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ArrayBlockingQueue",
            "<[B>;"
        }
    .end annotation
.end field

.field private static mSynLock:[B


# instance fields
.field private bSending:Z

.field private ds:Ljava/net/DatagramSocket;

.field private isUDPDataRunning:Z

.field private mListener:Lcom/boyaa/videodemo/listener/VideoUdpListener;

.field private mVideoSendRunnable:Ljava/lang/Thread;

.field private mVideoUDPDataRunnable:Ljava/lang/Thread;

.field private receiveBuffer:[B

.field private serverAddr:Ljava/net/InetAddress;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 28
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/boyaa/videodemo/data/VideoUDP;->mSynLock:[B

    .line 42
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v1, 0xc8

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    sput-object v0, Lcom/boyaa/videodemo/data/VideoUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object v2, p0, Lcom/boyaa/videodemo/data/VideoUDP;->ds:Ljava/net/DatagramSocket;

    .line 30
    iput-object v2, p0, Lcom/boyaa/videodemo/data/VideoUDP;->mVideoUDPDataRunnable:Ljava/lang/Thread;

    .line 32
    iput-boolean v3, p0, Lcom/boyaa/videodemo/data/VideoUDP;->isUDPDataRunning:Z

    .line 34
    const/16 v1, 0x2800

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP;->receiveBuffer:[B

    .line 40
    iput-boolean v3, p0, Lcom/boyaa/videodemo/data/VideoUDP;->bSending:Z

    .line 44
    iput-object v2, p0, Lcom/boyaa/videodemo/data/VideoUDP;->mVideoSendRunnable:Ljava/lang/Thread;

    .line 48
    :try_start_0
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videodemo/utils/CacheRef;->mIP:Ljava/lang/String;

    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    iput-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP;->serverAddr:Ljava/net/InetAddress;

    .line 49
    new-instance v1, Ljava/net/DatagramSocket;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/net/DatagramSocket;-><init>(Ljava/net/SocketAddress;)V

    iput-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP;->ds:Ljava/net/DatagramSocket;

    .line 50
    iget-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP;->ds:Ljava/net/DatagramSocket;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/net/DatagramSocket;->setReuseAddress(Z)V

    .line 51
    iget-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP;->ds:Ljava/net/DatagramSocket;

    new-instance v2, Ljava/net/InetSocketAddress;

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v3

    invoke-virtual {v3}, Lcom/boyaa/videodemo/utils/CacheRef;->getVideoProt()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/net/InetSocketAddress;-><init>(I)V

    invoke-virtual {v1, v2}, Ljava/net/DatagramSocket;->bind(Ljava/net/SocketAddress;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    :goto_0
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataSend;

    invoke-direct {v2, p0}, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataSend;-><init>(Lcom/boyaa/videodemo/data/VideoUDP;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP;->mVideoSendRunnable:Ljava/lang/Thread;

    .line 61
    iget-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP;->mVideoSendRunnable:Ljava/lang/Thread;

    const-string v2, "VideoUDPDataSend"

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 62
    iget-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP;->mVideoSendRunnable:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 64
    new-instance v1, Lcom/boyaa/videodemo/listener/VideoUdpListener;

    invoke-direct {v1}, Lcom/boyaa/videodemo/listener/VideoUdpListener;-><init>()V

    iput-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP;->mListener:Lcom/boyaa/videodemo/listener/VideoUdpListener;

    .line 67
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataRunnable;

    invoke-direct {v2, p0}, Lcom/boyaa/videodemo/data/VideoUDP$VideoUDPDataRunnable;-><init>(Lcom/boyaa/videodemo/data/VideoUDP;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP;->mVideoUDPDataRunnable:Ljava/lang/Thread;

    .line 68
    iget-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP;->mVideoUDPDataRunnable:Ljava/lang/Thread;

    const-string v2, "VideoUDPDataRunnable"

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 69
    iget-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP;->mVideoUDPDataRunnable:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 70
    return-void

    .line 52
    :catch_0
    move-exception v0

    .line 54
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method static synthetic access$0(Lcom/boyaa/videodemo/data/VideoUDP;Z)V
    .locals 0

    .prologue
    .line 40
    iput-boolean p1, p0, Lcom/boyaa/videodemo/data/VideoUDP;->bSending:Z

    return-void
.end method

.method static synthetic access$1(Lcom/boyaa/videodemo/data/VideoUDP;)Ljava/net/DatagramSocket;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/boyaa/videodemo/data/VideoUDP;->ds:Ljava/net/DatagramSocket;

    return-object v0
.end method

.method static synthetic access$2(Lcom/boyaa/videodemo/data/VideoUDP;)Z
    .locals 1

    .prologue
    .line 40
    iget-boolean v0, p0, Lcom/boyaa/videodemo/data/VideoUDP;->bSending:Z

    return v0
.end method

.method static synthetic access$3(Lcom/boyaa/videodemo/data/VideoUDP;)Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/boyaa/videodemo/data/VideoUDP;->serverAddr:Ljava/net/InetAddress;

    return-object v0
.end method

.method static synthetic access$4(Lcom/boyaa/videodemo/data/VideoUDP;Z)V
    .locals 0

    .prologue
    .line 32
    iput-boolean p1, p0, Lcom/boyaa/videodemo/data/VideoUDP;->isUDPDataRunning:Z

    return-void
.end method

.method static synthetic access$5(Lcom/boyaa/videodemo/data/VideoUDP;)Z
    .locals 1

    .prologue
    .line 32
    iget-boolean v0, p0, Lcom/boyaa/videodemo/data/VideoUDP;->isUDPDataRunning:Z

    return v0
.end method

.method static synthetic access$6(Lcom/boyaa/videodemo/data/VideoUDP;)[B
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/boyaa/videodemo/data/VideoUDP;->receiveBuffer:[B

    return-object v0
.end method

.method public static getInstance()Lcom/boyaa/videodemo/data/VideoUDP;
    .locals 2

    .prologue
    .line 73
    sget-object v0, Lcom/boyaa/videodemo/data/VideoUDP;->mInstance:Lcom/boyaa/videodemo/data/VideoUDP;

    if-nez v0, :cond_1

    .line 74
    sget-object v1, Lcom/boyaa/videodemo/data/VideoUDP;->mSynLock:[B

    monitor-enter v1

    .line 75
    :try_start_0
    sget-object v0, Lcom/boyaa/videodemo/data/VideoUDP;->mInstance:Lcom/boyaa/videodemo/data/VideoUDP;

    if-nez v0, :cond_0

    .line 76
    new-instance v0, Lcom/boyaa/videodemo/data/VideoUDP;

    invoke-direct {v0}, Lcom/boyaa/videodemo/data/VideoUDP;-><init>()V

    sput-object v0, Lcom/boyaa/videodemo/data/VideoUDP;->mInstance:Lcom/boyaa/videodemo/data/VideoUDP;

    .line 74
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    :cond_1
    sget-object v0, Lcom/boyaa/videodemo/data/VideoUDP;->mInstance:Lcom/boyaa/videodemo/data/VideoUDP;

    return-object v0

    .line 74
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public CheckVideoData([B)V
    .locals 7
    .param p1, "data"    # [B

    .prologue
    const/4 v6, 0x0

    .line 178
    invoke-static {p1, v6}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->bytesToInt([BI)I

    move-result v0

    .line 179
    .local v0, "iPackageLength":I
    add-int/lit8 v1, v0, -0x4

    .line 180
    .local v1, "iProLen":I
    if-lez v1, :cond_0

    array-length v3, p1

    if-gt v1, v3, :cond_0

    .line 182
    const-string v3, "AUDIO Data"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "len="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " packLen="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    new-array v2, v1, [B

    .line 185
    .local v2, "packData":[B
    const/4 v3, 0x4

    invoke-static {p1, v3, v2, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 187
    iget-object v3, p0, Lcom/boyaa/videodemo/data/VideoUDP;->mListener:Lcom/boyaa/videodemo/listener/VideoUdpListener;

    invoke-virtual {v3, v2}, Lcom/boyaa/videodemo/listener/VideoUdpListener;->success([B)V

    .line 190
    .end local v2    # "packData":[B
    :cond_0
    return-void
.end method

.method public Release()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 163
    iput-boolean v0, p0, Lcom/boyaa/videodemo/data/VideoUDP;->bSending:Z

    .line 164
    iput-boolean v0, p0, Lcom/boyaa/videodemo/data/VideoUDP;->isUDPDataRunning:Z

    .line 165
    iput-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP;->mListener:Lcom/boyaa/videodemo/listener/VideoUdpListener;

    .line 167
    sget-object v0, Lcom/boyaa/videodemo/data/VideoUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 169
    iget-object v0, p0, Lcom/boyaa/videodemo/data/VideoUDP;->ds:Ljava/net/DatagramSocket;

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/boyaa/videodemo/data/VideoUDP;->ds:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->disconnect()V

    .line 172
    iput-object v1, p0, Lcom/boyaa/videodemo/data/VideoUDP;->ds:Ljava/net/DatagramSocket;

    .line 174
    :cond_0
    return-void
.end method
