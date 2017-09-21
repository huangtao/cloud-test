.class public Lboyaa/speex/VoiceManager;
.super Ljava/lang/Object;
.source "VoiceManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioManager"

.field private static mInstance:Lboyaa/speex/VoiceManager;

.field private static mLock:[B

.field public static mRecvBuffer:Ljava/util/concurrent/ArrayBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ArrayBlockingQueue",
            "<",
            "Lcom/boyaa/videodemo/bean/AudioBean;",
            ">;"
        }
    .end annotation
.end field

.field public static mRecvBufferExt:Ljava/util/concurrent/ArrayBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ArrayBlockingQueue",
            "<",
            "Lcom/boyaa/videodemo/bean/AudioBean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAudioPlay:Lboyaa/speex/AudioPlayService;

.field private mAudioRecord:Lboyaa/speex/AudioRecordService;

.field private mBlueAudioRecord:Lboyaa/speex/BluetoothAudioRecordService;

.field public m_echo:Lboyaa/speex/EchoCancellation;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/16 v1, 0xc8

    .line 11
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    sput-object v0, Lboyaa/speex/VoiceManager;->mRecvBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 13
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    sput-object v0, Lboyaa/speex/VoiceManager;->mRecvBufferExt:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 17
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lboyaa/speex/VoiceManager;->mLock:[B

    .line 18
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method public static getInstance()Lboyaa/speex/VoiceManager;
    .locals 2

    .prologue
    .line 27
    sget-object v0, Lboyaa/speex/VoiceManager;->mInstance:Lboyaa/speex/VoiceManager;

    if-nez v0, :cond_1

    .line 28
    sget-object v1, Lboyaa/speex/VoiceManager;->mLock:[B

    monitor-enter v1

    .line 29
    :try_start_0
    sget-object v0, Lboyaa/speex/VoiceManager;->mInstance:Lboyaa/speex/VoiceManager;

    if-nez v0, :cond_0

    .line 30
    new-instance v0, Lboyaa/speex/VoiceManager;

    invoke-direct {v0}, Lboyaa/speex/VoiceManager;-><init>()V

    sput-object v0, Lboyaa/speex/VoiceManager;->mInstance:Lboyaa/speex/VoiceManager;

    .line 28
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    :cond_1
    sget-object v0, Lboyaa/speex/VoiceManager;->mInstance:Lboyaa/speex/VoiceManager;

    return-object v0

    .line 28
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public ReleaseAudioPlay()V
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lboyaa/speex/VoiceManager;->mAudioPlay:Lboyaa/speex/AudioPlayService;

    if-nez v0, :cond_0

    .line 79
    :goto_0
    return-void

    .line 77
    :cond_0
    iget-object v0, p0, Lboyaa/speex/VoiceManager;->mAudioPlay:Lboyaa/speex/AudioPlayService;

    invoke-virtual {v0}, Lboyaa/speex/AudioPlayService;->release()V

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lboyaa/speex/VoiceManager;->mAudioPlay:Lboyaa/speex/AudioPlayService;

    goto :goto_0
.end method

.method public ReleaseAudioRecord()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 110
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    iget-boolean v0, v0, Lcom/boyaa/videosdk/BoyaaVoice;->mIsBlue:Z

    if-eqz v0, :cond_2

    .line 112
    iget-object v0, p0, Lboyaa/speex/VoiceManager;->mBlueAudioRecord:Lboyaa/speex/BluetoothAudioRecordService;

    if-nez v0, :cond_1

    .line 129
    :cond_0
    :goto_0
    return-void

    .line 115
    :cond_1
    iget-object v0, p0, Lboyaa/speex/VoiceManager;->mBlueAudioRecord:Lboyaa/speex/BluetoothAudioRecordService;

    invoke-virtual {v0}, Lboyaa/speex/BluetoothAudioRecordService;->release()V

    .line 116
    iput-object v1, p0, Lboyaa/speex/VoiceManager;->mBlueAudioRecord:Lboyaa/speex/BluetoothAudioRecordService;

    goto :goto_0

    .line 120
    :cond_2
    iget-object v0, p0, Lboyaa/speex/VoiceManager;->mAudioRecord:Lboyaa/speex/AudioRecordService;

    if-eqz v0, :cond_0

    .line 123
    iget-object v0, p0, Lboyaa/speex/VoiceManager;->mAudioRecord:Lboyaa/speex/AudioRecordService;

    invoke-virtual {v0}, Lboyaa/speex/AudioRecordService;->release()V

    .line 124
    iput-object v1, p0, Lboyaa/speex/VoiceManager;->mAudioRecord:Lboyaa/speex/AudioRecordService;

    goto :goto_0
.end method

.method public StartAudioPlay()V
    .locals 1

    .prologue
    .line 64
    sget-object v0, Lboyaa/speex/VoiceManager;->mRecvBufferExt:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 65
    sget-object v0, Lboyaa/speex/VoiceManager;->mRecvBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 66
    iget-object v0, p0, Lboyaa/speex/VoiceManager;->mAudioPlay:Lboyaa/speex/AudioPlayService;

    if-nez v0, :cond_0

    .line 67
    new-instance v0, Lboyaa/speex/AudioPlayService;

    invoke-direct {v0}, Lboyaa/speex/AudioPlayService;-><init>()V

    iput-object v0, p0, Lboyaa/speex/VoiceManager;->mAudioPlay:Lboyaa/speex/AudioPlayService;

    .line 69
    :cond_0
    iget-object v0, p0, Lboyaa/speex/VoiceManager;->mAudioPlay:Lboyaa/speex/AudioPlayService;

    invoke-virtual {v0}, Lboyaa/speex/AudioPlayService;->startThread()V

    .line 70
    return-void
.end method

.method public StartAudioRecord()V
    .locals 1

    .prologue
    .line 83
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    iget-boolean v0, v0, Lcom/boyaa/videosdk/BoyaaVoice;->mIsBlue:Z

    if-eqz v0, :cond_1

    .line 85
    iget-object v0, p0, Lboyaa/speex/VoiceManager;->mBlueAudioRecord:Lboyaa/speex/BluetoothAudioRecordService;

    if-nez v0, :cond_0

    .line 86
    new-instance v0, Lboyaa/speex/BluetoothAudioRecordService;

    invoke-direct {v0}, Lboyaa/speex/BluetoothAudioRecordService;-><init>()V

    iput-object v0, p0, Lboyaa/speex/VoiceManager;->mBlueAudioRecord:Lboyaa/speex/BluetoothAudioRecordService;

    .line 97
    :cond_0
    :goto_0
    return-void

    .line 92
    :cond_1
    iget-object v0, p0, Lboyaa/speex/VoiceManager;->mAudioRecord:Lboyaa/speex/AudioRecordService;

    if-nez v0, :cond_2

    .line 93
    new-instance v0, Lboyaa/speex/AudioRecordService;

    invoke-direct {v0}, Lboyaa/speex/AudioRecordService;-><init>()V

    iput-object v0, p0, Lboyaa/speex/VoiceManager;->mAudioRecord:Lboyaa/speex/AudioRecordService;

    .line 95
    :cond_2
    iget-object v0, p0, Lboyaa/speex/VoiceManager;->mAudioRecord:Lboyaa/speex/AudioRecordService;

    invoke-virtual {v0}, Lboyaa/speex/AudioRecordService;->startThread()V

    goto :goto_0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 44
    sget-object v0, Lboyaa/speex/VoiceManager;->mRecvBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 46
    sget-object v0, Lboyaa/speex/VoiceManager;->mRecvBufferExt:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 53
    invoke-virtual {p0}, Lboyaa/speex/VoiceManager;->ReleaseAudioRecord()V

    .line 54
    invoke-virtual {p0}, Lboyaa/speex/VoiceManager;->ReleaseAudioPlay()V

    .line 56
    const/4 v0, 0x0

    sput-object v0, Lboyaa/speex/VoiceManager;->mInstance:Lboyaa/speex/VoiceManager;

    .line 59
    return-void
.end method
