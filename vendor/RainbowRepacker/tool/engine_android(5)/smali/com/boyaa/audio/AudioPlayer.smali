.class public Lcom/boyaa/audio/AudioPlayer;
.super Ljava/lang/Object;
.source "AudioPlayer.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static player:Lcom/boyaa/audio/AudioPlayer;


# instance fields
.field LOG:Ljava/lang/String;

.field private audioTrack:Landroid/media/AudioTrack;

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

.field private isPlaying:Z

.field private playData:Lcom/boyaa/audio/AudioData;


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const-string v0, "AudioPlayer "

    iput-object v0, p0, Lcom/boyaa/audio/AudioPlayer;->LOG:Ljava/lang/String;

    .line 25
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v1, 0xc8

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lcom/boyaa/audio/AudioPlayer;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 27
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/audio/AudioPlayer;->isPlaying:Z

    .line 33
    return-void
.end method

.method public static getInstance()Lcom/boyaa/audio/AudioPlayer;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/boyaa/audio/AudioPlayer;->player:Lcom/boyaa/audio/AudioPlayer;

    if-nez v0, :cond_0

    .line 37
    new-instance v0, Lcom/boyaa/audio/AudioPlayer;

    invoke-direct {v0}, Lcom/boyaa/audio/AudioPlayer;-><init>()V

    sput-object v0, Lcom/boyaa/audio/AudioPlayer;->player:Lcom/boyaa/audio/AudioPlayer;

    .line 39
    :cond_0
    sget-object v0, Lcom/boyaa/audio/AudioPlayer;->player:Lcom/boyaa/audio/AudioPlayer;

    return-object v0
.end method

.method private initAudioTrack()Z
    .locals 8

    .prologue
    const/16 v2, 0x1f40

    const/4 v6, 0x1

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v3, 0x2

    .line 56
    invoke-static {v2, v3, v3}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v5

    .line 59
    .local v5, "bufferSize":I
    if-gez v5, :cond_0

    .line 60
    iget-object v0, p0, Lcom/boyaa/audio/AudioPlayer;->LOG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/boyaa/audio/AudioPlayer;->LOG:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "initialize error!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    const/4 v6, 0x0

    .line 70
    :goto_0
    return v6

    .line 63
    :cond_0
    const-string v0, "ILBC"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "Player\u521d\u59cb\u5316\u7684 buffersize\u662f "

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    new-instance v0, Landroid/media/AudioTrack;

    const/4 v1, 0x3

    move v4, v3

    .line 66
    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 64
    iput-object v0, p0, Lcom/boyaa/audio/AudioPlayer;->audioTrack:Landroid/media/AudioTrack;

    .line 68
    iget-object v0, p0, Lcom/boyaa/audio/AudioPlayer;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0, v7, v7}, Landroid/media/AudioTrack;->setStereoVolume(FF)I

    .line 69
    iget-object v0, p0, Lcom/boyaa/audio/AudioPlayer;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    goto :goto_0
.end method

.method private playFromList()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    :goto_0
    iget-boolean v1, p0, Lcom/boyaa/audio/AudioPlayer;->isPlaying:Z

    if-nez v1, :cond_1

    .line 87
    :goto_1
    return-void

    .line 77
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/boyaa/audio/AudioPlayer;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    const-wide/16 v2, 0x1

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/concurrent/ArrayBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/boyaa/audio/AudioData;

    iput-object v1, p0, Lcom/boyaa/audio/AudioPlayer;->playData:Lcom/boyaa/audio/AudioData;

    .line 78
    const-string v1, "ILBC"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u64ad\u653e\u4e00\u6b21\u6570\u636e \u5269\u4f59buffer size "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/boyaa/audio/AudioPlayer;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    iget-object v1, p0, Lcom/boyaa/audio/AudioPlayer;->audioTrack:Landroid/media/AudioTrack;

    iget-object v2, p0, Lcom/boyaa/audio/AudioPlayer;->playData:Lcom/boyaa/audio/AudioData;

    invoke-virtual {v2}, Lcom/boyaa/audio/AudioData;->getRealData()[B

    move-result-object v2

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/boyaa/audio/AudioPlayer;->playData:Lcom/boyaa/audio/AudioData;

    invoke-virtual {v4}, Lcom/boyaa/audio/AudioData;->getSize()I

    move-result v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/media/AudioTrack;->write([BII)I

    .line 76
    :cond_1
    iget-object v1, p0, Lcom/boyaa/audio/AudioPlayer;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v1

    const/16 v2, 0xa

    if-gt v1, v2, :cond_0

    .line 82
    const-wide/16 v1, 0x2

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 83
    :catch_0
    move-exception v0

    .line 84
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_1
.end method


# virtual methods
.method public addData([BI)V
    .locals 3
    .param p1, "rawData"    # [B
    .param p2, "size"    # I

    .prologue
    const/4 v2, 0x0

    .line 43
    new-instance v0, Lcom/boyaa/audio/AudioData;

    invoke-direct {v0}, Lcom/boyaa/audio/AudioData;-><init>()V

    .line 44
    .local v0, "decodedData":Lcom/boyaa/audio/AudioData;
    invoke-virtual {v0, p2}, Lcom/boyaa/audio/AudioData;->setSize(I)V

    .line 45
    new-array v1, p2, [B

    .line 46
    .local v1, "tempData":[B
    invoke-static {p1, v2, v1, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 47
    invoke-virtual {v0, v1}, Lcom/boyaa/audio/AudioData;->setRealData([B)V

    .line 48
    iget-object v2, p0, Lcom/boyaa/audio/AudioPlayer;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/ArrayBlockingQueue;->add(Ljava/lang/Object;)Z

    .line 50
    return-void
.end method

.method public run()V
    .locals 3

    .prologue
    .line 98
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/boyaa/audio/AudioPlayer;->isPlaying:Z

    .line 99
    invoke-direct {p0}, Lcom/boyaa/audio/AudioPlayer;->initAudioTrack()Z

    move-result v1

    if-nez v1, :cond_0

    .line 100
    const-string v1, "ILBC"

    const-string v2, "\u64ad\u653e\u5668\u521d\u59cb\u5316\u5931\u8d25"

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    :goto_0
    return-void

    .line 103
    :cond_0
    const-string v1, "ILBC"

    const-string v2, "\u5f00\u59cb\u64ad\u653e"

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/audio/AudioPlayer;->playFromList()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    :goto_1
    iget-object v1, p0, Lcom/boyaa/audio/AudioPlayer;->audioTrack:Landroid/media/AudioTrack;

    if-eqz v1, :cond_1

    .line 111
    iget-object v1, p0, Lcom/boyaa/audio/AudioPlayer;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    .line 112
    iget-object v1, p0, Lcom/boyaa/audio/AudioPlayer;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->stop()V

    .line 113
    iget-object v1, p0, Lcom/boyaa/audio/AudioPlayer;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->release()V

    .line 116
    :cond_1
    const-string v1, "ILBC"

    const-string v2, "end playing"

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 106
    :catch_0
    move-exception v0

    .line 107
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method public startPlaying()V
    .locals 3

    .prologue
    .line 90
    iget-boolean v0, p0, Lcom/boyaa/audio/AudioPlayer;->isPlaying:Z

    if-eqz v0, :cond_0

    .line 91
    const-string v0, "ILBC"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u9a8c\u8bc1\u64ad\u653e\u5668\u662f\u5426\u6253\u5f00"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lcom/boyaa/audio/AudioPlayer;->isPlaying:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    :goto_0
    return-void

    .line 94
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public stopPlaying()V
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/audio/AudioPlayer;->isPlaying:Z

    .line 121
    iget-object v0, p0, Lcom/boyaa/audio/AudioPlayer;->dataList:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 122
    return-void
.end method
