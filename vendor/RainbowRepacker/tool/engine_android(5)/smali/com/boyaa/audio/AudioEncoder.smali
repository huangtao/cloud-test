.class public Lcom/boyaa/audio/AudioEncoder;
.super Ljava/lang/Object;
.source "AudioEncoder.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static encoder:Lcom/boyaa/audio/AudioEncoder;


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

.field private isEncoding:Z


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const-string v0, "AudioEncoder"

    iput-object v0, p0, Lcom/boyaa/audio/AudioEncoder;->LOG:Ljava/lang/String;

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/audio/AudioEncoder;->isEncoding:Z

    .line 26
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v1, 0xc8

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lcom/boyaa/audio/AudioEncoder;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 37
    return-void
.end method

.method public static getInstance()Lcom/boyaa/audio/AudioEncoder;
    .locals 1

    .prologue
    .line 29
    sget-object v0, Lcom/boyaa/audio/AudioEncoder;->encoder:Lcom/boyaa/audio/AudioEncoder;

    if-nez v0, :cond_0

    .line 30
    new-instance v0, Lcom/boyaa/audio/AudioEncoder;

    invoke-direct {v0}, Lcom/boyaa/audio/AudioEncoder;-><init>()V

    sput-object v0, Lcom/boyaa/audio/AudioEncoder;->encoder:Lcom/boyaa/audio/AudioEncoder;

    .line 32
    :cond_0
    sget-object v0, Lcom/boyaa/audio/AudioEncoder;->encoder:Lcom/boyaa/audio/AudioEncoder;

    return-object v0
.end method


# virtual methods
.method public addData([BI)V
    .locals 3
    .param p1, "data"    # [B
    .param p2, "size"    # I

    .prologue
    const/4 v2, 0x0

    .line 40
    new-instance v0, Lcom/boyaa/audio/AudioData;

    invoke-direct {v0}, Lcom/boyaa/audio/AudioData;-><init>()V

    .line 41
    .local v0, "rawData":Lcom/boyaa/audio/AudioData;
    invoke-virtual {v0, p2}, Lcom/boyaa/audio/AudioData;->setSize(I)V

    .line 42
    new-array v1, p2, [B

    .line 43
    .local v1, "tempData":[B
    invoke-static {p1, v2, v1, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    invoke-virtual {v0, v1}, Lcom/boyaa/audio/AudioData;->setRealData([B)V

    .line 45
    iget-object v2, p0, Lcom/boyaa/audio/AudioEncoder;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/ArrayBlockingQueue;->add(Ljava/lang/Object;)Z

    .line 46
    return-void
.end method

.method public run()V
    .locals 9

    .prologue
    .line 70
    new-instance v4, Lcom/boyaa/audio/AudioSender;

    invoke-direct {v4}, Lcom/boyaa/audio/AudioSender;-><init>()V

    .line 71
    .local v4, "sender":Lcom/boyaa/audio/AudioSender;
    invoke-virtual {v4}, Lcom/boyaa/audio/AudioSender;->startSending()V

    .line 73
    const/4 v1, 0x0

    .line 74
    .local v1, "encodeSize":I
    const/16 v5, 0x32

    new-array v2, v5, [B

    .line 77
    .local v2, "encodedData":[B
    const/16 v5, 0x1e

    invoke-static {v5}, Lcom/boyaa/audio/AudioCodec;->audio_codec_init(I)I

    .line 79
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/boyaa/audio/AudioEncoder;->isEncoding:Z

    .line 80
    :cond_0
    :goto_0
    iget-boolean v5, p0, Lcom/boyaa/audio/AudioEncoder;->isEncoding:Z

    if-nez v5, :cond_1

    .line 110
    const-string v5, "ILBC"

    const-string v6, "end encoding"

    invoke-static {v5, v6}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    invoke-virtual {v4}, Lcom/boyaa/audio/AudioSender;->stopSending()V

    .line 112
    return-void

    .line 81
    :cond_1
    iget-object v5, p0, Lcom/boyaa/audio/AudioEncoder;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v5}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v5

    if-nez v5, :cond_2

    .line 83
    const-wide/16 v5, 0x14

    :try_start_0
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 84
    :catch_0
    move-exception v0

    .line 85
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 91
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_2
    :try_start_1
    iget-boolean v5, p0, Lcom/boyaa/audio/AudioEncoder;->isEncoding:Z

    if-eqz v5, :cond_0

    .line 92
    iget-object v5, p0, Lcom/boyaa/audio/AudioEncoder;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    const-wide/16 v6, 0x1

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v5, v6, v7, v8}, Ljava/util/concurrent/ArrayBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/boyaa/audio/AudioData;

    .line 93
    .local v3, "rawData":Lcom/boyaa/audio/AudioData;
    invoke-virtual {v3}, Lcom/boyaa/audio/AudioData;->getSize()I

    move-result v5

    new-array v2, v5, [B

    .line 95
    invoke-virtual {v3}, Lcom/boyaa/audio/AudioData;->getRealData()[B

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v3}, Lcom/boyaa/audio/AudioData;->getSize()I

    move-result v7

    const/4 v8, 0x0

    invoke-static {v5, v6, v7, v2, v8}, Lcom/boyaa/audio/AudioCodec;->audio_encode([BII[BI)I

    move-result v1

    .line 96
    const-string v5, "ILBC"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "\u7f16\u7801\u524d: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/boyaa/audio/AudioData;->getSize()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " \u7f16\u7801\u540e: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    if-lez v1, :cond_0

    .line 98
    invoke-virtual {v4, v2, v1}, Lcom/boyaa/audio/AudioSender;->addData([BI)V

    .line 100
    array-length v5, v2

    new-array v2, v5, [B
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 105
    .end local v3    # "rawData":Lcom/boyaa/audio/AudioData;
    :catch_1
    move-exception v5

    goto :goto_0
.end method

.method public startEncoding()V
    .locals 2

    .prologue
    .line 52
    const-string v0, "ILBC"

    const-string v1, "start encode thread"

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    iget-boolean v0, p0, Lcom/boyaa/audio/AudioEncoder;->isEncoding:Z

    if-eqz v0, :cond_0

    .line 54
    const-string v0, "ILBC"

    const-string v1, "encoder has been started  !!!"

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    :goto_0
    return-void

    .line 57
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public stopEncoding()V
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/boyaa/audio/AudioEncoder;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/audio/AudioEncoder;->isEncoding:Z

    .line 66
    return-void
.end method
