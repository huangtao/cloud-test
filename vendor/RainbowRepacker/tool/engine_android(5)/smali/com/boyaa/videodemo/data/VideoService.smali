.class public Lcom/boyaa/videodemo/data/VideoService;
.super Ljava/lang/Object;
.source "VideoService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/videodemo/data/VideoService$VideoHearBeatThread;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoService"

.field private static mInstance:Lcom/boyaa/videodemo/data/VideoService;

.field private static mLock:[B


# instance fields
.field private bBeating:Z

.field private mHearBeatThread:Ljava/lang/Thread;

.field private mVideoUDP:Lcom/boyaa/videodemo/data/VideoUDP;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/boyaa/videodemo/data/VideoService;->mLock:[B

    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/data/VideoService;->mHearBeatThread:Ljava/lang/Thread;

    .line 15
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/videodemo/data/VideoService;->bBeating:Z

    .line 18
    new-instance v0, Lcom/boyaa/videodemo/data/VideoUDP;

    invoke-direct {v0}, Lcom/boyaa/videodemo/data/VideoUDP;-><init>()V

    iput-object v0, p0, Lcom/boyaa/videodemo/data/VideoService;->mVideoUDP:Lcom/boyaa/videodemo/data/VideoUDP;

    .line 20
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/boyaa/videodemo/data/VideoService$VideoHearBeatThread;

    invoke-direct {v1, p0}, Lcom/boyaa/videodemo/data/VideoService$VideoHearBeatThread;-><init>(Lcom/boyaa/videodemo/data/VideoService;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/boyaa/videodemo/data/VideoService;->mHearBeatThread:Ljava/lang/Thread;

    .line 21
    iget-object v0, p0, Lcom/boyaa/videodemo/data/VideoService;->mHearBeatThread:Ljava/lang/Thread;

    const-string v1, "VideoHearBeatThread"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 22
    iget-object v0, p0, Lcom/boyaa/videodemo/data/VideoService;->mHearBeatThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 23
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/videodemo/data/VideoService;Z)V
    .locals 0

    .prologue
    .line 15
    iput-boolean p1, p0, Lcom/boyaa/videodemo/data/VideoService;->bBeating:Z

    return-void
.end method

.method static synthetic access$1(Lcom/boyaa/videodemo/data/VideoService;)Z
    .locals 1

    .prologue
    .line 15
    iget-boolean v0, p0, Lcom/boyaa/videodemo/data/VideoService;->bBeating:Z

    return v0
.end method

.method public static getInstance()Lcom/boyaa/videodemo/data/VideoService;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lcom/boyaa/videodemo/data/VideoService;->mInstance:Lcom/boyaa/videodemo/data/VideoService;

    return-object v0
.end method

.method public static startService()V
    .locals 2

    .prologue
    .line 30
    sget-object v0, Lcom/boyaa/videodemo/data/VideoService;->mInstance:Lcom/boyaa/videodemo/data/VideoService;

    if-nez v0, :cond_1

    .line 31
    sget-object v1, Lcom/boyaa/videodemo/data/VideoService;->mLock:[B

    monitor-enter v1

    .line 32
    :try_start_0
    sget-object v0, Lcom/boyaa/videodemo/data/VideoService;->mInstance:Lcom/boyaa/videodemo/data/VideoService;

    if-nez v0, :cond_0

    .line 33
    new-instance v0, Lcom/boyaa/videodemo/data/VideoService;

    invoke-direct {v0}, Lcom/boyaa/videodemo/data/VideoService;-><init>()V

    sput-object v0, Lcom/boyaa/videodemo/data/VideoService;->mInstance:Lcom/boyaa/videodemo/data/VideoService;

    .line 31
    :cond_0
    monitor-exit v1

    .line 37
    :cond_1
    return-void

    .line 31
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
    .line 61
    const-string v0, "VideoService"

    const-string v1, "\u5173\u95ed\u89c6\u9891UDP\u8fde\u63a5\uff0c\u91ca\u653e\u8d44\u6e90"

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/videodemo/data/VideoService;->mInstance:Lcom/boyaa/videodemo/data/VideoService;

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/videodemo/data/VideoService;->bBeating:Z

    .line 66
    iget-object v0, p0, Lcom/boyaa/videodemo/data/VideoService;->mVideoUDP:Lcom/boyaa/videodemo/data/VideoUDP;

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/boyaa/videodemo/data/VideoService;->mVideoUDP:Lcom/boyaa/videodemo/data/VideoUDP;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/data/VideoUDP;->Release()V

    .line 69
    :cond_0
    return-void
.end method
