.class public Lcom/boyaa/audio/AudioSender;
.super Ljava/lang/Object;
.source "AudioSender.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field LOG:Ljava/lang/String;

.field private dataList:Ljava/util/concurrent/ArrayBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ArrayBlockingQueue",
            "<",
            "Lcom/boyaa/audio/AudioData;",
            ">;"
        }
    .end annotation
.end field

.field dataPacket:Ljava/net/DatagramPacket;

.field private ip:Ljava/net/InetAddress;

.field private isSendering:Z

.field private port:I

.field socket:Ljava/net/DatagramSocket;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const-string v0, "AudioSender "

    iput-object v0, p0, Lcom/boyaa/audio/AudioSender;->LOG:Ljava/lang/String;

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/audio/AudioSender;->isSendering:Z

    .line 25
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v1, 0xc8

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lcom/boyaa/audio/AudioSender;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 35
    return-void
.end method

.method private sendData([BI)V
    .locals 2
    .param p1, "data"    # [B
    .param p2, "size"    # I

    .prologue
    .line 50
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 51
    .local v0, "timestamp":J
    invoke-static {p1, v0, v1}, Lcom/boyaa/videodemo/utils/ApiUtils;->SendAudioData([BJ)V

    .line 52
    return-void
.end method


# virtual methods
.method public addData([BI)V
    .locals 3
    .param p1, "data"    # [B
    .param p2, "size"    # I

    .prologue
    const/4 v2, 0x0

    .line 38
    new-instance v0, Lcom/boyaa/audio/AudioData;

    invoke-direct {v0}, Lcom/boyaa/audio/AudioData;-><init>()V

    .line 39
    .local v0, "encodedData":Lcom/boyaa/audio/AudioData;
    invoke-virtual {v0, p2}, Lcom/boyaa/audio/AudioData;->setSize(I)V

    .line 40
    new-array v1, p2, [B

    .line 41
    .local v1, "tempData":[B
    invoke-static {p1, v2, v1, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 42
    invoke-virtual {v0, v1}, Lcom/boyaa/audio/AudioData;->setRealData([B)V

    .line 43
    iget-object v2, p0, Lcom/boyaa/audio/AudioSender;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/ArrayBlockingQueue;->add(Ljava/lang/Object;)Z

    .line 44
    return-void
.end method

.method public run()V
    .locals 6

    .prologue
    .line 71
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/boyaa/audio/AudioSender;->isSendering:Z

    .line 72
    const-string v2, "ILBC"

    const-string v3, "start...."

    invoke-static {v2, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    :cond_0
    :goto_0
    iget-boolean v2, p0, Lcom/boyaa/audio/AudioSender;->isSendering:Z

    if-nez v2, :cond_1

    .line 87
    :goto_1
    const-string v2, "ILBC"

    const-string v3, "audio send stop!!!!"

    invoke-static {v2, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    return-void

    .line 74
    :cond_1
    iget-object v2, p0, Lcom/boyaa/audio/AudioSender;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 77
    :try_start_0
    iget-object v2, p0, Lcom/boyaa/audio/AudioSender;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    const-wide/16 v3, 0x1

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3, v4, v5}, Ljava/util/concurrent/ArrayBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/boyaa/audio/AudioData;

    .line 79
    .local v1, "encodedData":Lcom/boyaa/audio/AudioData;
    invoke-virtual {v1}, Lcom/boyaa/audio/AudioData;->getRealData()[B

    move-result-object v2

    invoke-virtual {v1}, Lcom/boyaa/audio/AudioData;->getSize()I

    move-result v3

    invoke-direct {p0, v2, v3}, Lcom/boyaa/audio/AudioSender;->sendData([BI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 81
    .end local v1    # "encodedData":Lcom/boyaa/audio/AudioData;
    :catch_0
    move-exception v0

    .line 83
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_1
.end method

.method public startSending()V
    .locals 1

    .prologue
    .line 58
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 59
    return-void
.end method

.method public stopSending()V
    .locals 1

    .prologue
    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/audio/AudioSender;->isSendering:Z

    .line 66
    iget-object v0, p0, Lcom/boyaa/audio/AudioSender;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 67
    return-void
.end method
