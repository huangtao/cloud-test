.class public Lcom/boyaa/androidim/voice/VoicePlayService;
.super Ljava/lang/Object;
.source "VoicePlayService.java"


# static fields
.field public static final PLAY_AUDIO:I = 0x3

.field public static final STOP_AUDIO:I = 0x4

.field private static final TAG:Ljava/lang/String; = "VoicePlayService"


# instance fields
.field public mHandler:Landroid/os/Handler;

.field private mListener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

.field private mMediaPlayer:Landroid/media/MediaPlayer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    new-instance v0, Lcom/boyaa/androidim/voice/VoicePlayService$1;

    invoke-direct {v0, p0}, Lcom/boyaa/androidim/voice/VoicePlayService$1;-><init>(Lcom/boyaa/androidim/voice/VoicePlayService;)V

    iput-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mHandler:Landroid/os/Handler;

    .line 33
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/androidim/voice/VoicePlayService;Ljava/lang/String;Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;)V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Lcom/boyaa/androidim/voice/VoicePlayService;->playAudio(Ljava/lang/String;Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;)V

    return-void
.end method

.method static synthetic access$1(Lcom/boyaa/androidim/voice/VoicePlayService;)V
    .locals 0

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/boyaa/androidim/voice/VoicePlayService;->stopAudio()V

    return-void
.end method

.method static synthetic access$2(Lcom/boyaa/androidim/voice/VoicePlayService;Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;)V
    .locals 0

    .prologue
    .line 31
    iput-object p1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mListener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    return-void
.end method

.method private playAudio(Ljava/lang/String;Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;)V
    .locals 5
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    .prologue
    const/4 v4, 0x0

    .line 41
    const-string v1, "VoicePlayService"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u5f00\u59cb\u64ad\u653e\u5f55\u97f3 \u8def\u5f84\uff1a"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/boyaa/androidim/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    const/4 v1, 0x1

    :try_start_0
    sput-boolean v1, Lcom/boyaa/androidim/utils/Constants;->stopPlay:Z

    .line 46
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v1, :cond_0

    .line 47
    new-instance v1, Landroid/media/MediaPlayer;

    invoke-direct {v1}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 49
    :cond_0
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 50
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->stop()V

    .line 51
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->reset()V

    .line 52
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mListener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    if-eqz v1, :cond_1

    .line 53
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mListener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    invoke-interface {v1}, Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;->playCompletion()V

    .line 54
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mListener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    .line 56
    :cond_1
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    .line 57
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 58
    new-instance v1, Landroid/media/MediaPlayer;

    invoke-direct {v1}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 61
    :cond_2
    iput-object p2, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mListener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    .line 63
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 64
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    new-instance v2, Ljava/io/FileInputStream;

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v2}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 66
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V

    .line 67
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 69
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    new-instance v2, Lcom/boyaa/androidim/voice/VoicePlayService$2;

    invoke-direct {v2, p0, p2}, Lcom/boyaa/androidim/voice/VoicePlayService$2;-><init>(Lcom/boyaa/androidim/voice/VoicePlayService;Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;)V

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    :goto_0
    return-void

    .line 85
    :catch_0
    move-exception v0

    .line 86
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 87
    iput-object v4, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mListener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    .line 88
    if-eqz p2, :cond_3

    .line 89
    invoke-interface {p2}, Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;->playCompletion()V

    .line 92
    :cond_3
    const/4 v1, 0x0

    sput-boolean v1, Lcom/boyaa/androidim/utils/Constants;->stopPlay:Z

    goto :goto_0
.end method

.method private stopAudio()V
    .locals 2

    .prologue
    .line 97
    const-string v0, "VoicePlayService"

    const-string v1, "\u505c\u6b62\u64ad\u653e\u5f55\u97f3"

    invoke-static {v0, v1}, Lcom/boyaa/androidim/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 110
    :goto_0
    return-void

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 102
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 103
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 104
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mListener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    if-eqz v0, :cond_1

    .line 105
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mListener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    invoke-interface {v0}, Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;->playCompletion()V

    .line 106
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mListener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    .line 109
    :cond_1
    const/4 v0, 0x0

    sput-boolean v0, Lcom/boyaa/androidim/utils/Constants;->stopPlay:Z

    goto :goto_0
.end method


# virtual methods
.method public getVoiceHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    .line 114
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 117
    :cond_0
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 118
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 123
    :cond_1
    const/4 v0, 0x0

    sput-boolean v0, Lcom/boyaa/androidim/utils/Constants;->stopPlay:Z

    .line 124
    return-void
.end method
