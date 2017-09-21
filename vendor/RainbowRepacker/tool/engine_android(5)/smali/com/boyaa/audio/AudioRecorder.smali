.class public Lcom/boyaa/audio/AudioRecorder;
.super Ljava/lang/Object;
.source "AudioRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final BUFFER_FRAME_SIZE:I = 0x1e0


# instance fields
.field LOG:Ljava/lang/String;

.field private audioBufSize:I

.field private audioRecord:Landroid/media/AudioRecord;

.field private bufferRead:I

.field private bufferSize:I

.field private isRecording:Z

.field private samples:[B


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const-string v0, "Recorder "

    iput-object v0, p0, Lcom/boyaa/audio/AudioRecorder;->LOG:Ljava/lang/String;

    .line 12
    iput-boolean v1, p0, Lcom/boyaa/audio/AudioRecorder;->isRecording:Z

    .line 16
    iput v1, p0, Lcom/boyaa/audio/AudioRecorder;->audioBufSize:I

    .line 21
    iput v1, p0, Lcom/boyaa/audio/AudioRecorder;->bufferRead:I

    .line 23
    iput v1, p0, Lcom/boyaa/audio/AudioRecorder;->bufferSize:I

    .line 8
    return-void
.end method

.method private free()V
    .locals 1

    .prologue
    .line 91
    :try_start_0
    iget-object v0, p0, Lcom/boyaa/audio/AudioRecorder;->audioRecord:Landroid/media/AudioRecord;

    if-eqz v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/boyaa/audio/AudioRecorder;->audioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    .line 95
    iget-object v0, p0, Lcom/boyaa/audio/AudioRecorder;->audioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 97
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/audio/AudioRecorder;->audioRecord:Landroid/media/AudioRecord;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    :goto_0
    return-void

    .line 99
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public isRecording()Z
    .locals 1

    .prologue
    .line 56
    iget-boolean v0, p0, Lcom/boyaa/audio/AudioRecorder;->isRecording:Z

    return v0
.end method

.method public run()V
    .locals 6

    .prologue
    .line 61
    invoke-static {}, Lcom/boyaa/audio/AudioEncoder;->getInstance()Lcom/boyaa/audio/AudioEncoder;

    move-result-object v1

    .line 62
    .local v1, "encoder":Lcom/boyaa/audio/AudioEncoder;
    invoke-virtual {v1}, Lcom/boyaa/audio/AudioEncoder;->startEncoding()V

    .line 63
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/boyaa/audio/AudioRecorder;->LOG:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "audioRecord startRecording()"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 64
    iget-object v2, p0, Lcom/boyaa/audio/AudioRecorder;->audioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v2}, Landroid/media/AudioRecord;->startRecording()V

    .line 65
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/boyaa/audio/AudioRecorder;->LOG:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "start recording"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 67
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/boyaa/audio/AudioRecorder;->isRecording:Z

    .line 68
    :goto_0
    iget-boolean v2, p0, Lcom/boyaa/audio/AudioRecorder;->isRecording:Z

    if-nez v2, :cond_0

    .line 81
    const-string v2, "ILBC"

    const-string v3, "end recording"

    invoke-static {v2, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    invoke-direct {p0}, Lcom/boyaa/audio/AudioRecorder;->free()V

    .line 84
    invoke-virtual {v1}, Lcom/boyaa/audio/AudioEncoder;->stopEncoding()V

    .line 85
    return-void

    .line 69
    :cond_0
    iget-object v2, p0, Lcom/boyaa/audio/AudioRecorder;->audioRecord:Landroid/media/AudioRecord;

    iget-object v3, p0, Lcom/boyaa/audio/AudioRecorder;->samples:[B

    const/4 v4, 0x0

    iget v5, p0, Lcom/boyaa/audio/AudioRecorder;->bufferSize:I

    invoke-virtual {v2, v3, v4, v5}, Landroid/media/AudioRecord;->read([BII)I

    move-result v2

    iput v2, p0, Lcom/boyaa/audio/AudioRecorder;->bufferRead:I

    .line 70
    iget v2, p0, Lcom/boyaa/audio/AudioRecorder;->bufferRead:I

    if-lez v2, :cond_1

    .line 72
    iget-object v2, p0, Lcom/boyaa/audio/AudioRecorder;->samples:[B

    iget v3, p0, Lcom/boyaa/audio/AudioRecorder;->bufferRead:I

    invoke-virtual {v1, v2, v3}, Lcom/boyaa/audio/AudioEncoder;->addData([BI)V

    .line 75
    :cond_1
    const-wide/16 v2, 0x1

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 76
    :catch_0
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method

.method public startRecording()V
    .locals 6

    .prologue
    const/16 v2, 0x1f40

    const/16 v3, 0x10

    const/4 v4, 0x2

    .line 29
    const/16 v0, 0x1e0

    iput v0, p0, Lcom/boyaa/audio/AudioRecorder;->bufferSize:I

    .line 31
    invoke-static {v2, v3, v4}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v0

    iput v0, p0, Lcom/boyaa/audio/AudioRecorder;->audioBufSize:I

    .line 33
    iget v0, p0, Lcom/boyaa/audio/AudioRecorder;->audioBufSize:I

    const/4 v1, -0x2

    if-ne v0, v1, :cond_0

    .line 34
    const-string v0, "ILBC"

    const-string v1, "audioBufSize error"

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    :goto_0
    return-void

    .line 37
    :cond_0
    iget v0, p0, Lcom/boyaa/audio/AudioRecorder;->audioBufSize:I

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/boyaa/audio/AudioRecorder;->samples:[B

    .line 39
    iget-object v0, p0, Lcom/boyaa/audio/AudioRecorder;->audioRecord:Landroid/media/AudioRecord;

    if-nez v0, :cond_1

    .line 40
    new-instance v0, Landroid/media/AudioRecord;

    const/4 v1, 0x1

    .line 43
    iget v5, p0, Lcom/boyaa/audio/AudioRecorder;->audioBufSize:I

    invoke-direct/range {v0 .. v5}, Landroid/media/AudioRecord;-><init>(IIIII)V

    .line 40
    iput-object v0, p0, Lcom/boyaa/audio/AudioRecorder;->audioRecord:Landroid/media/AudioRecord;

    .line 45
    :cond_1
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public stopRecording()V
    .locals 1

    .prologue
    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/audio/AudioRecorder;->isRecording:Z

    .line 53
    return-void
.end method
