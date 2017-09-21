.class public Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;
.super Ljava/lang/Object;
.source "VideoRecvQueue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue$PollBufferDataRunnable;
    }
.end annotation


# static fields
.field public static jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ArrayBlockingQueue",
            "<",
            "Lcom/example/tutorial/VideoProto$VideoNotify;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final TAG:Ljava/lang/String;

.field private getJetterService:Ljava/util/concurrent/ExecutorService;

.field private volatile isBuffer:Z

.field private volatile isStart:Z


# direct methods
.method public constructor <init>(II)V
    .locals 2
    .param p1, "vedioBufferCount"    # I
    .param p2, "jetterBufferCount"    # I

    .prologue
    const/4 v1, 0x1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const-string v0, "VedioQueue"

    iput-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->TAG:Ljava/lang/String;

    .line 19
    iput-boolean v1, p0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->isStart:Z

    .line 22
    iput-boolean v1, p0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->isBuffer:Z

    .line 26
    new-instance v0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue$1;

    invoke-direct {v0, p0}, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue$1;-><init>(Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->getJetterService:Ljava/util/concurrent/ExecutorService;

    .line 37
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-direct {v0, p2}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    sput-object v0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 38
    iget-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->getJetterService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue$PollBufferDataRunnable;

    invoke-direct {v1, p0}, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue$PollBufferDataRunnable;-><init>(Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 42
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;)Z
    .locals 1

    .prologue
    .line 19
    iget-boolean v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->isStart:Z

    return v0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 45
    sget-object v0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v0, :cond_0

    .line 46
    sget-object v0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 48
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->isBuffer:Z

    .line 51
    return-void
.end method

.method public destroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 55
    invoke-static {}, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;->getInstance()Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;->getVedioFrame()Lcom/boyaa/videodemo/bean/VedioFrameBean;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videodemo/bean/VedioFrameBean;->Clean()V

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->isStart:Z

    .line 58
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->isBuffer:Z

    .line 59
    iget-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->getJetterService:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_0

    .line 60
    iget-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->getJetterService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 62
    :cond_0
    sget-object v0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v0, :cond_1

    .line 63
    sget-object v0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 65
    :cond_1
    sput-object v1, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 66
    iput-object v1, p0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->getJetterService:Ljava/util/concurrent/ExecutorService;

    .line 67
    return-void
.end method

.method public pushVedioJetterData(Lcom/example/tutorial/VideoProto$VideoNotify;)V
    .locals 2
    .param p1, "dataPackage"    # Lcom/example/tutorial/VideoProto$VideoNotify;

    .prologue
    .line 73
    :try_start_0
    sget-object v1, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v1, :cond_0

    .line 74
    sget-object v1, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ArrayBlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    :cond_0
    :goto_0
    return-void

    .line 76
    :catch_0
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method
