.class public Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;
.super Ljava/lang/Object;
.source "ThreadExecutorSocket.java"


# static fields
.field private static mInstance:Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;

.field private static mLock:[B


# instance fields
.field private mExecutor:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->mLock:[B

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket$1;

    invoke-direct {v0, p0}, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket$1;-><init>(Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->mExecutor:Ljava/util/concurrent/ExecutorService;

    .line 23
    return-void
.end method

.method public static getInstance()Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;
    .locals 2

    .prologue
    .line 26
    sget-object v0, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->mInstance:Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;

    if-nez v0, :cond_1

    .line 27
    sget-object v1, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->mLock:[B

    monitor-enter v1

    .line 28
    :try_start_0
    sget-object v0, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->mInstance:Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;

    invoke-direct {v0}, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;-><init>()V

    sput-object v0, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->mInstance:Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;

    .line 27
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    :cond_1
    sget-object v0, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->mInstance:Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;

    return-object v0

    .line 27
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "task"    # Ljava/lang/Runnable;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 39
    return-void
.end method

.method public shutdown()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 42
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 43
    iput-object v1, p0, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->mExecutor:Ljava/util/concurrent/ExecutorService;

    .line 44
    sput-object v1, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->mInstance:Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;

    .line 45
    return-void
.end method

.method public shutdownNow()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 48
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 49
    iput-object v1, p0, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->mExecutor:Ljava/util/concurrent/ExecutorService;

    .line 50
    sput-object v1, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;->mInstance:Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;

    .line 51
    return-void
.end method
