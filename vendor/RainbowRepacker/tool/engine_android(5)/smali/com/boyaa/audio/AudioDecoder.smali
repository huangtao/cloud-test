.class public Lcom/boyaa/audio/AudioDecoder;
.super Ljava/lang/Object;
.source "AudioDecoder.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final MAX_BUFFER_SIZE:I = 0x800

.field private static decoder:Lcom/boyaa/audio/AudioDecoder;


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

.field private decodedData:[B

.field private isDecoding:Z


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const-string v0, "AudioDecoder"

    iput-object v0, p0, Lcom/boyaa/audio/AudioDecoder;->LOG:Ljava/lang/String;

    .line 21
    const/16 v0, 0x400

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/boyaa/audio/AudioDecoder;->decodedData:[B

    .line 22
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/audio/AudioDecoder;->isDecoding:Z

    .line 24
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v1, 0xc8

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lcom/boyaa/audio/AudioDecoder;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 35
    return-void
.end method

.method public static getInstance()Lcom/boyaa/audio/AudioDecoder;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/boyaa/audio/AudioDecoder;->decoder:Lcom/boyaa/audio/AudioDecoder;

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Lcom/boyaa/audio/AudioDecoder;

    invoke-direct {v0}, Lcom/boyaa/audio/AudioDecoder;-><init>()V

    sput-object v0, Lcom/boyaa/audio/AudioDecoder;->decoder:Lcom/boyaa/audio/AudioDecoder;

    .line 30
    :cond_0
    sget-object v0, Lcom/boyaa/audio/AudioDecoder;->decoder:Lcom/boyaa/audio/AudioDecoder;

    return-object v0
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
    .local v0, "adata":Lcom/boyaa/audio/AudioData;
    invoke-virtual {v0, p2}, Lcom/boyaa/audio/AudioData;->setSize(I)V

    .line 40
    new-array v1, p2, [B

    .line 41
    .local v1, "tempData":[B
    invoke-static {p1, v2, v1, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 42
    invoke-virtual {v0, v1}, Lcom/boyaa/audio/AudioData;->setRealData([B)V

    .line 43
    iget-object v2, p0, Lcom/boyaa/audio/AudioDecoder;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/ArrayBlockingQueue;->add(Ljava/lang/Object;)Z

    .line 45
    return-void
.end method

.method public run()V
    .locals 9

    .prologue
    .line 60
    invoke-static {}, Lcom/boyaa/audio/AudioPlayer;->getInstance()Lcom/boyaa/audio/AudioPlayer;

    move-result-object v4

    .line 61
    .local v4, "player":Lcom/boyaa/audio/AudioPlayer;
    invoke-virtual {v4}, Lcom/boyaa/audio/AudioPlayer;->startPlaying()V

    .line 63
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/boyaa/audio/AudioDecoder;->isDecoding:Z

    .line 65
    const/16 v5, 0x1e

    invoke-static {v5}, Lcom/boyaa/audio/AudioCodec;->audio_codec_init(I)I

    .line 67
    iget-object v5, p0, Lcom/boyaa/audio/AudioDecoder;->LOG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/boyaa/audio/AudioDecoder;->LOG:Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "initialized decoder"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    const/4 v1, 0x0

    .line 69
    .local v1, "decodeSize":I
    :goto_0
    iget-boolean v5, p0, Lcom/boyaa/audio/AudioDecoder;->isDecoding:Z

    if-nez v5, :cond_1

    .line 94
    const-string v5, "ILBC"

    const-string v6, "stop decoder"

    invoke-static {v5, v6}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    invoke-virtual {v4}, Lcom/boyaa/audio/AudioPlayer;->stopPlaying()V

    .line 97
    return-void

    .line 74
    :cond_0
    :try_start_0
    iget-object v5, p0, Lcom/boyaa/audio/AudioDecoder;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    const-wide/16 v6, 0x1

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v5, v6, v7, v8}, Ljava/util/concurrent/ArrayBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/boyaa/audio/AudioData;

    .line 75
    .local v3, "encodedData":Lcom/boyaa/audio/AudioData;
    const/16 v5, 0x800

    new-array v5, v5, [B

    iput-object v5, p0, Lcom/boyaa/audio/AudioDecoder;->decodedData:[B

    .line 76
    invoke-virtual {v3}, Lcom/boyaa/audio/AudioData;->getRealData()[B

    move-result-object v0

    .line 78
    .local v0, "data":[B
    const/4 v5, 0x0

    invoke-virtual {v3}, Lcom/boyaa/audio/AudioData;->getSize()I

    move-result v6

    iget-object v7, p0, Lcom/boyaa/audio/AudioDecoder;->decodedData:[B

    const/4 v8, 0x0

    invoke-static {v0, v5, v6, v7, v8}, Lcom/boyaa/audio/AudioCodec;->audio_decode([BII[BI)I

    move-result v1

    .line 79
    const-string v5, "ILBC"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "\u89e3\u7801\u4e00\u6b21  "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v7, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " \u89e3\u7801\u540e\u7684\u957f\u5ea6  "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    if-lez v1, :cond_1

    .line 82
    iget-object v5, p0, Lcom/boyaa/audio/AudioDecoder;->decodedData:[B

    invoke-virtual {v4, v5, v1}, Lcom/boyaa/audio/AudioPlayer;->addData([BI)V

    .line 84
    iget-object v5, p0, Lcom/boyaa/audio/AudioDecoder;->decodedData:[B

    array-length v5, v5

    new-array v5, v5, [B

    iput-object v5, p0, Lcom/boyaa/audio/AudioDecoder;->decodedData:[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .end local v0    # "data":[B
    .end local v3    # "encodedData":Lcom/boyaa/audio/AudioData;
    :cond_1
    iget-object v5, p0, Lcom/boyaa/audio/AudioDecoder;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v5}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v5

    if-gtz v5, :cond_0

    goto :goto_0

    .line 87
    :catch_0
    move-exception v2

    .line 89
    .local v2, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method public startDecoding()V
    .locals 2

    .prologue
    .line 51
    const-string v0, "ILBC"

    const-string v1, "\u5f00\u59cb\u89e3\u7801"

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    iget-boolean v0, p0, Lcom/boyaa/audio/AudioDecoder;->isDecoding:Z

    if-eqz v0, :cond_0

    .line 56
    :goto_0
    return-void

    .line 55
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public stopDecoding()V
    .locals 1

    .prologue
    .line 100
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/audio/AudioDecoder;->isDecoding:Z

    .line 101
    iget-object v0, p0, Lcom/boyaa/audio/AudioDecoder;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 102
    return-void
.end method
