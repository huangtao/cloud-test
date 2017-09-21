.class public Lcom/boyaa/videodemo/data/AudioUDP;
.super Ljava/lang/Object;
.source "AudioUDP.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataRunnable;,
        Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataSend;
    }
.end annotation


# static fields
.field public static final KEY_AUDIO_SOCKET:I = 0x2

.field private static final TAG:Ljava/lang/String; = "AudioUDP"

.field private static mInstance:Lcom/boyaa/videodemo/data/AudioUDP;

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

.field private mAudioSendRunnable:Ljava/lang/Thread;

.field private mAudioUDPDataRunnable:Ljava/lang/Thread;

.field private mListener:Lcom/boyaa/videodemo/listener/AudioUdpListener;

.field private receiveBuffer:[B

.field private serverAddr:Ljava/net/InetAddress;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 41
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/boyaa/videodemo/data/AudioUDP;->mSynLock:[B

    .line 55
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v1, 0xc8

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    sput-object v0, Lcom/boyaa/videodemo/data/AudioUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object v2, p0, Lcom/boyaa/videodemo/data/AudioUDP;->ds:Ljava/net/DatagramSocket;

    .line 43
    iput-object v2, p0, Lcom/boyaa/videodemo/data/AudioUDP;->mAudioUDPDataRunnable:Ljava/lang/Thread;

    .line 45
    iput-boolean v3, p0, Lcom/boyaa/videodemo/data/AudioUDP;->isUDPDataRunning:Z

    .line 47
    const/16 v1, 0x2800

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP;->receiveBuffer:[B

    .line 53
    iput-boolean v3, p0, Lcom/boyaa/videodemo/data/AudioUDP;->bSending:Z

    .line 57
    iput-object v2, p0, Lcom/boyaa/videodemo/data/AudioUDP;->mAudioSendRunnable:Ljava/lang/Thread;

    .line 61
    :try_start_0
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videodemo/utils/CacheRef;->mIP:Ljava/lang/String;

    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    iput-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP;->serverAddr:Ljava/net/InetAddress;

    .line 62
    new-instance v1, Ljava/net/DatagramSocket;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/net/DatagramSocket;-><init>(Ljava/net/SocketAddress;)V

    iput-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP;->ds:Ljava/net/DatagramSocket;

    .line 63
    iget-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP;->ds:Ljava/net/DatagramSocket;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/net/DatagramSocket;->setReuseAddress(Z)V

    .line 64
    iget-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP;->ds:Ljava/net/DatagramSocket;

    new-instance v2, Ljava/net/InetSocketAddress;

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v3

    invoke-virtual {v3}, Lcom/boyaa/videodemo/utils/CacheRef;->getAudioProt()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/net/InetSocketAddress;-><init>(I)V

    invoke-virtual {v1, v2}, Ljava/net/DatagramSocket;->bind(Ljava/net/SocketAddress;)V

    .line 68
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataSend;

    invoke-direct {v2, p0}, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataSend;-><init>(Lcom/boyaa/videodemo/data/AudioUDP;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP;->mAudioSendRunnable:Ljava/lang/Thread;

    .line 69
    iget-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP;->mAudioSendRunnable:Ljava/lang/Thread;

    const-string v2, "AudioUDPDataSend"

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 70
    iget-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP;->mAudioSendRunnable:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 72
    new-instance v1, Lcom/boyaa/videodemo/listener/AudioUdpListener;

    invoke-direct {v1}, Lcom/boyaa/videodemo/listener/AudioUdpListener;-><init>()V

    iput-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP;->mListener:Lcom/boyaa/videodemo/listener/AudioUdpListener;

    .line 75
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataRunnable;

    invoke-direct {v2, p0}, Lcom/boyaa/videodemo/data/AudioUDP$AudioUDPDataRunnable;-><init>(Lcom/boyaa/videodemo/data/AudioUDP;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP;->mAudioUDPDataRunnable:Ljava/lang/Thread;

    .line 76
    iget-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP;->mAudioUDPDataRunnable:Ljava/lang/Thread;

    const-string v2, "AudioUDPDataRunnable"

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 77
    iget-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP;->mAudioUDPDataRunnable:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    :goto_0
    return-void

    .line 79
    :catch_0
    move-exception v0

    .line 81
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method static synthetic access$0(Lcom/boyaa/videodemo/data/AudioUDP;Z)V
    .locals 0

    .prologue
    .line 53
    iput-boolean p1, p0, Lcom/boyaa/videodemo/data/AudioUDP;->bSending:Z

    return-void
.end method

.method static synthetic access$1(Lcom/boyaa/videodemo/data/AudioUDP;)Ljava/net/DatagramSocket;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/boyaa/videodemo/data/AudioUDP;->ds:Ljava/net/DatagramSocket;

    return-object v0
.end method

.method static synthetic access$2(Lcom/boyaa/videodemo/data/AudioUDP;)Z
    .locals 1

    .prologue
    .line 53
    iget-boolean v0, p0, Lcom/boyaa/videodemo/data/AudioUDP;->bSending:Z

    return v0
.end method

.method static synthetic access$3(Lcom/boyaa/videodemo/data/AudioUDP;)Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/boyaa/videodemo/data/AudioUDP;->serverAddr:Ljava/net/InetAddress;

    return-object v0
.end method

.method static synthetic access$4(Lcom/boyaa/videodemo/data/AudioUDP;Z)V
    .locals 0

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/boyaa/videodemo/data/AudioUDP;->isUDPDataRunning:Z

    return-void
.end method

.method static synthetic access$5(Lcom/boyaa/videodemo/data/AudioUDP;)[B
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/boyaa/videodemo/data/AudioUDP;->receiveBuffer:[B

    return-object v0
.end method

.method static synthetic access$6(Lcom/boyaa/videodemo/data/AudioUDP;)Z
    .locals 1

    .prologue
    .line 45
    iget-boolean v0, p0, Lcom/boyaa/videodemo/data/AudioUDP;->isUDPDataRunning:Z

    return v0
.end method

.method public static getInstance()Lcom/boyaa/videodemo/data/AudioUDP;
    .locals 2

    .prologue
    .line 86
    sget-object v0, Lcom/boyaa/videodemo/data/AudioUDP;->mInstance:Lcom/boyaa/videodemo/data/AudioUDP;

    if-nez v0, :cond_1

    .line 87
    sget-object v1, Lcom/boyaa/videodemo/data/AudioUDP;->mSynLock:[B

    monitor-enter v1

    .line 88
    :try_start_0
    sget-object v0, Lcom/boyaa/videodemo/data/AudioUDP;->mInstance:Lcom/boyaa/videodemo/data/AudioUDP;

    if-nez v0, :cond_0

    .line 89
    new-instance v0, Lcom/boyaa/videodemo/data/AudioUDP;

    invoke-direct {v0}, Lcom/boyaa/videodemo/data/AudioUDP;-><init>()V

    sput-object v0, Lcom/boyaa/videodemo/data/AudioUDP;->mInstance:Lcom/boyaa/videodemo/data/AudioUDP;

    .line 87
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    :cond_1
    sget-object v0, Lcom/boyaa/videodemo/data/AudioUDP;->mInstance:Lcom/boyaa/videodemo/data/AudioUDP;

    return-object v0

    .line 87
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public CheckAudioData([B)V
    .locals 7
    .param p1, "data"    # [B

    .prologue
    const/4 v6, 0x0

    .line 198
    invoke-static {p1, v6}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->bytesToInt([BI)I

    move-result v0

    .line 199
    .local v0, "iPackageLength":I
    add-int/lit8 v1, v0, -0x4

    .line 200
    .local v1, "iProLen":I
    if-lez v1, :cond_0

    array-length v3, p1

    if-gt v1, v3, :cond_0

    .line 202
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

    .line 204
    new-array v2, v1, [B

    .line 205
    .local v2, "packData":[B
    const/4 v3, 0x4

    invoke-static {p1, v3, v2, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 207
    iget-object v3, p0, Lcom/boyaa/videodemo/data/AudioUDP;->mListener:Lcom/boyaa/videodemo/listener/AudioUdpListener;

    invoke-virtual {v3, v2}, Lcom/boyaa/videodemo/listener/AudioUdpListener;->success([B)V

    .line 210
    .end local v2    # "packData":[B
    :cond_0
    return-void
.end method

.method public Release()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 183
    iput-boolean v0, p0, Lcom/boyaa/videodemo/data/AudioUDP;->bSending:Z

    .line 184
    iput-boolean v0, p0, Lcom/boyaa/videodemo/data/AudioUDP;->isUDPDataRunning:Z

    .line 185
    iput-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP;->mListener:Lcom/boyaa/videodemo/listener/AudioUdpListener;

    .line 187
    sget-object v0, Lcom/boyaa/videodemo/data/AudioUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 189
    iget-object v0, p0, Lcom/boyaa/videodemo/data/AudioUDP;->ds:Ljava/net/DatagramSocket;

    if-eqz v0, :cond_0

    .line 191
    iget-object v0, p0, Lcom/boyaa/videodemo/data/AudioUDP;->ds:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->disconnect()V

    .line 192
    iput-object v1, p0, Lcom/boyaa/videodemo/data/AudioUDP;->ds:Ljava/net/DatagramSocket;

    .line 194
    :cond_0
    return-void
.end method
