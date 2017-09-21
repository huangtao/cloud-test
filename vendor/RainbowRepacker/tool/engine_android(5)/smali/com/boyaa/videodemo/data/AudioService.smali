.class public Lcom/boyaa/videodemo/data/AudioService;
.super Ljava/lang/Object;
.source "AudioService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/videodemo/data/AudioService$AudioHearBeatThread;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioService"

.field private static mInstance:Lcom/boyaa/videodemo/data/AudioService;

.field private static mLock:[B


# instance fields
.field private bBeating:Z

.field private mAudioUDP:Lcom/boyaa/videodemo/data/AudioUDP;

.field private mHearBeatThread:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/boyaa/videodemo/data/AudioService;->mLock:[B

    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/data/AudioService;->mHearBeatThread:Ljava/lang/Thread;

    .line 19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/videodemo/data/AudioService;->bBeating:Z

    .line 22
    new-instance v0, Lcom/boyaa/videodemo/data/AudioUDP;

    invoke-direct {v0}, Lcom/boyaa/videodemo/data/AudioUDP;-><init>()V

    iput-object v0, p0, Lcom/boyaa/videodemo/data/AudioService;->mAudioUDP:Lcom/boyaa/videodemo/data/AudioUDP;

    .line 24
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/boyaa/videodemo/data/AudioService$AudioHearBeatThread;

    invoke-direct {v1, p0}, Lcom/boyaa/videodemo/data/AudioService$AudioHearBeatThread;-><init>(Lcom/boyaa/videodemo/data/AudioService;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/boyaa/videodemo/data/AudioService;->mHearBeatThread:Ljava/lang/Thread;

    .line 25
    iget-object v0, p0, Lcom/boyaa/videodemo/data/AudioService;->mHearBeatThread:Ljava/lang/Thread;

    const-string v1, "AudioHearBeatThread"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 26
    iget-object v0, p0, Lcom/boyaa/videodemo/data/AudioService;->mHearBeatThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 27
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/videodemo/data/AudioService;Z)V
    .locals 0

    .prologue
    .line 19
    iput-boolean p1, p0, Lcom/boyaa/videodemo/data/AudioService;->bBeating:Z

    return-void
.end method

.method static synthetic access$1(Lcom/boyaa/videodemo/data/AudioService;)Z
    .locals 1

    .prologue
    .line 19
    iget-boolean v0, p0, Lcom/boyaa/videodemo/data/AudioService;->bBeating:Z

    return v0
.end method

.method public static getInstance()Lcom/boyaa/videodemo/data/AudioService;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/boyaa/videodemo/data/AudioService;->mInstance:Lcom/boyaa/videodemo/data/AudioService;

    return-object v0
.end method

.method public static startService()V
    .locals 2

    .prologue
    .line 34
    sget-object v0, Lcom/boyaa/videodemo/data/AudioService;->mInstance:Lcom/boyaa/videodemo/data/AudioService;

    if-nez v0, :cond_1

    .line 35
    sget-object v1, Lcom/boyaa/videodemo/data/AudioService;->mLock:[B

    monitor-enter v1

    .line 36
    :try_start_0
    sget-object v0, Lcom/boyaa/videodemo/data/AudioService;->mInstance:Lcom/boyaa/videodemo/data/AudioService;

    if-nez v0, :cond_0

    .line 37
    new-instance v0, Lcom/boyaa/videodemo/data/AudioService;

    invoke-direct {v0}, Lcom/boyaa/videodemo/data/AudioService;-><init>()V

    sput-object v0, Lcom/boyaa/videodemo/data/AudioService;->mInstance:Lcom/boyaa/videodemo/data/AudioService;

    .line 35
    :cond_0
    monitor-exit v1

    .line 41
    :cond_1
    return-void

    .line 35
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public release()V
    .locals 2

    .prologue
    .line 66
    const-string v0, "AudioService"

    const-string v1, "\u5173\u95ed\u97f3\u9891UDP\u8fde\u63a5\uff0c\u91ca\u653e\u8d44\u6e90"

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/videodemo/data/AudioService;->mInstance:Lcom/boyaa/videodemo/data/AudioService;

    .line 69
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/videodemo/data/AudioService;->bBeating:Z

    .line 71
    iget-object v0, p0, Lcom/boyaa/videodemo/data/AudioService;->mAudioUDP:Lcom/boyaa/videodemo/data/AudioUDP;

    if-eqz v0, :cond_0

    .line 72
    iget-object v0, p0, Lcom/boyaa/videodemo/data/AudioService;->mAudioUDP:Lcom/boyaa/videodemo/data/AudioUDP;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/data/AudioUDP;->Release()V

    .line 74
    :cond_0
    return-void
.end method
