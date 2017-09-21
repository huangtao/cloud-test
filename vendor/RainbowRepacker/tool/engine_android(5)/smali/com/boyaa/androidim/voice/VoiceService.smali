.class public Lcom/boyaa/androidim/voice/VoiceService;
.super Ljava/lang/Object;
.source "VoiceService.java"

# interfaces
.implements Landroid/media/MediaRecorder$OnInfoListener;


# static fields
.field public static final START_RECORD:I = 0x1

.field public static final STOP_RECORD:I = 0x2

.field private static final TAG:Ljava/lang/String; = "VoiceService"


# instance fields
.field private bHasRelease:Z

.field private mEndTime:J

.field public mHandler:Landroid/os/Handler;

.field private mMediaRecorder:Landroid/media/MediaRecorder;

.field private mRecAudioDirPath:Ljava/io/File;

.field private mRecAudioFileName:Ljava/lang/String;

.field private mRecAudioTmpFile:Ljava/io/File;

.field private mRecordListener:Lcom/boyaa/androidim/voice/RecordOnCompleleListener;

.field private mStartTime:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const-string v0, "recaudio"

    iput-object v0, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecAudioFileName:Ljava/lang/String;

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/androidim/voice/VoiceService;->bHasRelease:Z

    .line 212
    new-instance v0, Lcom/boyaa/androidim/voice/VoiceService$1;

    invoke-direct {v0, p0}, Lcom/boyaa/androidim/voice/VoiceService$1;-><init>(Lcom/boyaa/androidim/voice/VoiceService;)V

    iput-object v0, p0, Lcom/boyaa/androidim/voice/VoiceService;->mHandler:Landroid/os/Handler;

    .line 48
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/androidim/voice/VoiceService;Lcom/boyaa/androidim/voice/RecordOnCompleleListener;)V
    .locals 0

    .prologue
    .line 43
    iput-object p1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecordListener:Lcom/boyaa/androidim/voice/RecordOnCompleleListener;

    return-void
.end method

.method static synthetic access$1(Lcom/boyaa/androidim/voice/VoiceService;Z)V
    .locals 0

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/boyaa/androidim/voice/VoiceService;->bHasRelease:Z

    return-void
.end method

.method static synthetic access$2(Lcom/boyaa/androidim/voice/VoiceService;I)V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/boyaa/androidim/voice/VoiceService;->initRecorder(I)V

    return-void
.end method

.method static synthetic access$3(Lcom/boyaa/androidim/voice/VoiceService;)V
    .locals 0

    .prologue
    .line 92
    invoke-direct {p0}, Lcom/boyaa/androidim/voice/VoiceService;->startRecord()V

    return-void
.end method

.method private deleteAudioTmpFile()V
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecAudioTmpFile:Ljava/io/File;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecAudioTmpFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecAudioTmpFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 170
    :cond_0
    return-void
.end method

.method private initRecorder(I)V
    .locals 4
    .param p1, "type"    # I

    .prologue
    .line 56
    const-string v1, "VoiceService"

    const-string v2, "\u521d\u59cb\u5316\u5f55\u97f3"

    invoke-static {v1, v2}, Lcom/boyaa/androidim/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    :try_start_0
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    sget-object v3, Lcom/boyaa/androidim/utils/Constants;->IM_PATH:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "/data/voice_chat_temp"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecAudioDirPath:Ljava/io/File;

    .line 60
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecAudioDirPath:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 61
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecAudioDirPath:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 64
    :cond_0
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    if-nez v1, :cond_2

    .line 65
    new-instance v1, Landroid/media/MediaRecorder;

    invoke-direct {v1}, Landroid/media/MediaRecorder;-><init>()V

    iput-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    .line 73
    :goto_0
    iget-boolean v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->bHasRelease:Z

    if-eqz v1, :cond_1

    .line 74
    invoke-virtual {p0}, Lcom/boyaa/androidim/voice/VoiceService;->release()V

    .line 76
    :cond_1
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->reset()V

    .line 77
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/media/MediaRecorder;->setAudioSource(I)V

    .line 78
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/media/MediaRecorder;->setOutputFormat(I)V

    .line 79
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/media/MediaRecorder;->setAudioEncoder(I)V

    .line 80
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    const/16 v2, 0x15e0

    invoke-virtual {v1, v2}, Landroid/media/MediaRecorder;->setAudioEncodingBitRate(I)V

    .line 83
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1, p0}, Landroid/media/MediaRecorder;->setOnInfoListener(Landroid/media/MediaRecorder$OnInfoListener;)V

    .line 84
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, "-"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecAudioFileName:Ljava/lang/String;

    .line 85
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecAudioFileName:Ljava/lang/String;

    const-string v2, ".amr"

    iget-object v3, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecAudioDirPath:Ljava/io/File;

    invoke-virtual {p0, v1, v2, v3}, Lcom/boyaa/androidim/voice/VoiceService;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecAudioTmpFile:Ljava/io/File;

    .line 86
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    iget-object v2, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecAudioTmpFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/lang/String;)V

    .line 90
    :goto_1
    return-void

    .line 67
    :cond_2
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->reset()V

    .line 68
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->release()V

    .line 69
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    .line 70
    new-instance v1, Landroid/media/MediaRecorder;

    invoke-direct {v1}, Landroid/media/MediaRecorder;-><init>()V

    iput-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 87
    :catch_0
    move-exception v0

    .line 88
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private recordingTimeEnd(Lcom/boyaa/androidim/voice/RecordOnCompleleListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/boyaa/androidim/voice/RecordOnCompleleListener;

    .prologue
    .line 265
    const-string v0, "VoiceService"

    const-string v1, "\u5f55\u97f3\u5b8c\u6210"

    invoke-static {v0, v1}, Lcom/boyaa/androidim/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    return-void
.end method

.method private startRecord()V
    .locals 3

    .prologue
    .line 93
    const-string v1, "VoiceService"

    const-string v2, "\u5f00\u59cb\u5f55\u97f3"

    invoke-static {v1, v2}, Lcom/boyaa/androidim/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    const-wide/16 v1, 0x0

    :try_start_0
    iput-wide v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mStartTime:J

    .line 97
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    if-eqz v1, :cond_0

    .line 98
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->prepare()V

    .line 99
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->start()V

    .line 100
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/boyaa/androidim/voice/VoiceService;->mStartTime:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    :cond_0
    :goto_0
    return-void

    .line 102
    :catch_0
    move-exception v0

    .line 103
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;
    .locals 5
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "suffix"    # Ljava/lang/String;
    .param p3, "directory"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 276
    if-nez p2, :cond_0

    .line 277
    const-string p2, ".tmp"

    .line 279
    :cond_0
    move-object v2, p3

    .line 280
    .local v2, "tmpDirFile":Ljava/io/File;
    if-nez v2, :cond_1

    .line 281
    const-string v3, "java.io.tmpdir"

    const-string v4, "."

    invoke-static {v3, v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 282
    .local v1, "tmpDir":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    .end local v2    # "tmpDirFile":Ljava/io/File;
    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 287
    .end local v1    # "tmpDir":Ljava/lang/String;
    .restart local v2    # "tmpDirFile":Ljava/io/File;
    :cond_1
    new-instance v0, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 288
    .local v0, "result":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    move-result v3

    .line 286
    if-eqz v3, :cond_1

    .line 289
    return-object v0
.end method

.method public getAudioData()[B
    .locals 6

    .prologue
    .line 179
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 180
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v3, Ljava/io/FileInputStream;

    iget-object v4, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecAudioTmpFile:Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 181
    .local v3, "inStream":Ljava/io/InputStream;
    const/16 v4, 0x200

    new-array v1, v4, [B

    .line 182
    .local v1, "buf":[B
    :goto_0
    invoke-virtual {v3, v1}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_0

    .line 185
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 186
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    .line 194
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "buf":[B
    .end local v3    # "inStream":Ljava/io/InputStream;
    :goto_1
    return-object v4

    .line 183
    .restart local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "buf":[B
    .restart local v3    # "inStream":Ljava/io/InputStream;
    :cond_0
    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 188
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "buf":[B
    .end local v3    # "inStream":Ljava/io/InputStream;
    :catch_0
    move-exception v2

    .line 189
    .local v2, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v2}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 194
    .end local v2    # "e":Ljava/io/FileNotFoundException;
    :goto_2
    const/4 v4, 0x0

    goto :goto_1

    .line 190
    :catch_1
    move-exception v2

    .line 191
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2
.end method

.method public getVoiceHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoiceService;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public onInfo(Landroid/media/MediaRecorder;II)V
    .locals 3
    .param p1, "mr"    # Landroid/media/MediaRecorder;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    .line 252
    const-string v0, "VoiceService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "what:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " extra:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/boyaa/androidim/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    const/16 v0, 0x320

    if-ne p2, v0, :cond_0

    .line 254
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecordListener:Lcom/boyaa/androidim/voice/RecordOnCompleleListener;

    invoke-direct {p0, v0}, Lcom/boyaa/androidim/voice/VoiceService;->recordingTimeEnd(Lcom/boyaa/androidim/voice/RecordOnCompleleListener;)V

    .line 255
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecordListener:Lcom/boyaa/androidim/voice/RecordOnCompleleListener;

    .line 257
    :cond_0
    return-void
.end method

.method public release()V
    .locals 1

    .prologue
    .line 198
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    if-eqz v0, :cond_0

    .line 200
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v0}, Landroid/media/MediaRecorder;->release()V

    .line 201
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    .line 205
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/androidim/voice/VoiceService;->bHasRelease:Z

    .line 208
    return-void
.end method

.method public declared-synchronized stopRecord(Lcom/boyaa/androidim/voice/RecordOnCompleleListener;)V
    .locals 9
    .param p1, "listener"    # Lcom/boyaa/androidim/voice/RecordOnCompleleListener;

    .prologue
    .line 108
    monitor-enter p0

    :try_start_0
    const-string v5, "VoiceService"

    const-string v6, "\u505c\u6b62\u5f55\u97f3"

    invoke-static {v5, v6}, Lcom/boyaa/androidim/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    const-wide/16 v5, 0x1f4

    :try_start_1
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V

    .line 115
    const-wide/16 v5, 0x0

    iput-wide v5, p0, Lcom/boyaa/androidim/voice/VoiceService;->mEndTime:J

    .line 116
    iget-object v5, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    if-eqz v5, :cond_0

    .line 117
    iget-object v5, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v5}, Landroid/media/MediaRecorder;->stop()V

    .line 118
    iget-object v5, p0, Lcom/boyaa/androidim/voice/VoiceService;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v5}, Landroid/media/MediaRecorder;->release()V

    .line 120
    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/boyaa/androidim/voice/VoiceService;->mEndTime:J

    .line 125
    :cond_0
    iget-wide v5, p0, Lcom/boyaa/androidim/voice/VoiceService;->mEndTime:J

    iget-wide v7, p0, Lcom/boyaa/androidim/voice/VoiceService;->mStartTime:J

    sub-long v3, v5, v7

    .line 127
    .local v3, "voiceDuration":J
    const-wide/16 v5, 0x3e8

    cmp-long v5, v3, v5

    if-gez v5, :cond_3

    .line 129
    invoke-direct {p0}, Lcom/boyaa/androidim/voice/VoiceService;->deleteAudioTmpFile()V

    .line 130
    const/4 v2, 0x0

    check-cast v2, [B

    .line 132
    .local v2, "voiceData":[B
    if-eqz p1, :cond_1

    .line 133
    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    const-string v8, ""

    invoke-interface {p1, v5, v6, v7, v8}, Lcom/boyaa/androidim/voice/RecordOnCompleleListener;->onComplete(IJLjava/lang/String;)V

    .line 136
    :cond_1
    const-string v5, "VoiceService"

    const-string v6, "\u65e0\u6548\u6587\u4ef6"

    invoke-static {v5, v6}, Lcom/boyaa/androidim/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 160
    :cond_2
    :goto_0
    const/4 v5, 0x0

    :try_start_2
    iput-object v5, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecordListener:Lcom/boyaa/androidim/voice/RecordOnCompleleListener;

    .line 163
    .end local v2    # "voiceData":[B
    .end local v3    # "voiceDuration":J
    :goto_1
    invoke-virtual {p0}, Lcom/boyaa/androidim/voice/VoiceService;->release()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 164
    monitor-exit p0

    return-void

    .line 138
    .restart local v3    # "voiceDuration":J
    :cond_3
    :try_start_3
    invoke-virtual {p0}, Lcom/boyaa/androidim/voice/VoiceService;->getAudioData()[B

    move-result-object v2

    .line 139
    .restart local v2    # "voiceData":[B
    if-nez v2, :cond_5

    .line 140
    invoke-direct {p0}, Lcom/boyaa/androidim/voice/VoiceService;->deleteAudioTmpFile()V

    .line 142
    if-eqz p1, :cond_4

    .line 143
    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    const-string v8, ""

    invoke-interface {p1, v5, v6, v7, v8}, Lcom/boyaa/androidim/voice/RecordOnCompleleListener;->onComplete(IJLjava/lang/String;)V

    .line 146
    :cond_4
    const-string v5, "VoiceService"

    const-string v6, "\u65e0\u6548\u6587\u4ef6"

    invoke-static {v5, v6}, Lcom/boyaa/androidim/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    .line 157
    .end local v2    # "voiceData":[B
    .end local v3    # "voiceDuration":J
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Ljava/lang/Exception;
    :try_start_4
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 160
    const/4 v5, 0x0

    :try_start_5
    iput-object v5, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecordListener:Lcom/boyaa/androidim/voice/RecordOnCompleleListener;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 108
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5

    .line 150
    .restart local v2    # "voiceData":[B
    .restart local v3    # "voiceDuration":J
    :cond_5
    if-eqz p1, :cond_2

    .line 151
    :try_start_6
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecAudioDirPath:Ljava/io/File;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecAudioFileName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".amr"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 152
    .local v1, "filePath":Ljava/lang/String;
    array-length v5, v2

    invoke-interface {p1, v5, v3, v4, v1}, Lcom/boyaa/androidim/voice/RecordOnCompleleListener;->onComplete(IJLjava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_0

    .line 159
    .end local v1    # "filePath":Ljava/lang/String;
    .end local v2    # "voiceData":[B
    .end local v3    # "voiceDuration":J
    :catchall_1
    move-exception v5

    .line 160
    const/4 v6, 0x0

    :try_start_7
    iput-object v6, p0, Lcom/boyaa/androidim/voice/VoiceService;->mRecordListener:Lcom/boyaa/androidim/voice/RecordOnCompleleListener;

    .line 161
    throw v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
.end method
