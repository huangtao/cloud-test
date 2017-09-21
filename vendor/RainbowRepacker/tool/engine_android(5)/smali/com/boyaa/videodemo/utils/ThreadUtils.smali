.class public Lcom/boyaa/videodemo/utils/ThreadUtils;
.super Ljava/lang/Object;
.source "ThreadUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/videodemo/utils/ThreadUtils$BlockingOperation;,
        Lcom/boyaa/videodemo/utils/ThreadUtils$ThreadChecker;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;)V
    .locals 1
    .param p0, "latch"    # Ljava/util/concurrent/CountDownLatch;

    .prologue
    .line 98
    new-instance v0, Lcom/boyaa/videodemo/utils/ThreadUtils$2;

    invoke-direct {v0, p0}, Lcom/boyaa/videodemo/utils/ThreadUtils$2;-><init>(Ljava/util/concurrent/CountDownLatch;)V

    invoke-static {v0}, Lcom/boyaa/videodemo/utils/ThreadUtils;->executeUninterruptibly(Lcom/boyaa/videodemo/utils/ThreadUtils$BlockingOperation;)V

    .line 104
    return-void
.end method

.method public static awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;J)Z
    .locals 11
    .param p0, "barrier"    # Ljava/util/concurrent/CountDownLatch;
    .param p1, "timeoutMs"    # J

    .prologue
    .line 107
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    .line 108
    .local v4, "startTimeMs":J
    move-wide v6, p1

    .line 109
    .local v6, "timeRemainingMs":J
    const/4 v8, 0x0

    .line 110
    .local v8, "wasInterrupted":Z
    const/4 v3, 0x0

    .line 113
    .local v3, "result":Z
    :cond_0
    :try_start_0
    sget-object v9, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v6, v7, v9}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 124
    :goto_0
    if-eqz v8, :cond_1

    .line 125
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->interrupt()V

    .line 127
    :cond_1
    return v3

    .line 115
    :catch_0
    move-exception v0

    .line 118
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v8, 0x1

    .line 119
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v9

    sub-long v1, v9, v4

    .line 120
    .local v1, "elapsedTimeMs":J
    sub-long v6, p1, v1

    .line 122
    const-wide/16 v9, 0x0

    .line 111
    cmp-long v9, v6, v9

    if-gtz v9, :cond_0

    goto :goto_0
.end method

.method public static executeUninterruptibly(Lcom/boyaa/videodemo/utils/ThreadUtils$BlockingOperation;)V
    .locals 3
    .param p0, "operation"    # Lcom/boyaa/videodemo/utils/ThreadUtils$BlockingOperation;

    .prologue
    .line 48
    const/4 v1, 0x0

    .line 51
    .local v1, "wasInterrupted":Z
    :goto_0
    :try_start_0
    invoke-interface {p0}, Lcom/boyaa/videodemo/utils/ThreadUtils$BlockingOperation;->run()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    if-eqz v1, :cond_0

    .line 61
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 63
    :cond_0
    return-void

    .line 53
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v1, 0x1

    .line 49
    goto :goto_0
.end method

.method public static invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    .locals 7
    .param p0, "handler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/os/Handler;",
            "Ljava/util/concurrent/Callable",
            "<TV;>;)TV;"
        }
    .end annotation

    .prologue
    .line 144
    .local p1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TV;>;"
    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-virtual {v5}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    if-ne v5, v6, :cond_0

    .line 147
    :try_start_0
    invoke-interface {p1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 175
    :goto_0
    return-object v4

    .line 148
    :catch_0
    move-exception v1

    .line 150
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Callable threw exception: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 151
    .local v3, "runtimeException":Ljava/lang/RuntimeException;
    invoke-virtual {v1}, Ljava/lang/Exception;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/RuntimeException;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 152
    throw v3

    .line 159
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "runtimeException":Ljava/lang/RuntimeException;
    :cond_0
    new-instance v2, Lcom/boyaa/videodemo/utils/ThreadUtils$1Result;

    invoke-direct {v2}, Lcom/boyaa/videodemo/utils/ThreadUtils$1Result;-><init>()V

    .line 160
    .local v2, "result":Lcom/boyaa/videodemo/utils/ThreadUtils$1Result;
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v5, 0x1

    invoke-direct {v0, v5}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 161
    .local v0, "barrier":Ljava/util/concurrent/CountDownLatch;
    new-instance v5, Lcom/boyaa/videodemo/utils/ThreadUtils$4;

    invoke-direct {v5, v2, p1, v0}, Lcom/boyaa/videodemo/utils/ThreadUtils$4;-><init>(Lcom/boyaa/videodemo/utils/ThreadUtils$1Result;Ljava/util/concurrent/Callable;Ljava/util/concurrent/CountDownLatch;)V

    invoke-virtual {p0, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 174
    invoke-static {v0}, Lcom/boyaa/videodemo/utils/ThreadUtils;->awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;)V

    .line 175
    iget-object v4, v2, Lcom/boyaa/videodemo/utils/ThreadUtils$1Result;->value:Ljava/lang/Object;

    goto :goto_0
.end method

.method public static invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V
    .locals 3
    .param p0, "handler"    # Landroid/os/Handler;
    .param p1, "runner"    # Ljava/lang/Runnable;

    .prologue
    .line 183
    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    if-ne v1, v2, :cond_0

    .line 184
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 196
    :goto_0
    return-void

    .line 187
    :cond_0
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 188
    .local v0, "barrier":Ljava/util/concurrent/CountDownLatch;
    new-instance v1, Lcom/boyaa/videodemo/utils/ThreadUtils$5;

    invoke-direct {v1, p1, v0}, Lcom/boyaa/videodemo/utils/ThreadUtils$5;-><init>(Ljava/lang/Runnable;Ljava/util/concurrent/CountDownLatch;)V

    invoke-virtual {p0, v1}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 195
    invoke-static {v0}, Lcom/boyaa/videodemo/utils/ThreadUtils;->awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;)V

    goto :goto_0
.end method

.method public static joinUninterruptibly(Ljava/lang/Thread;)V
    .locals 1
    .param p0, "thread"    # Ljava/lang/Thread;

    .prologue
    .line 89
    new-instance v0, Lcom/boyaa/videodemo/utils/ThreadUtils$1;

    invoke-direct {v0, p0}, Lcom/boyaa/videodemo/utils/ThreadUtils$1;-><init>(Ljava/lang/Thread;)V

    invoke-static {v0}, Lcom/boyaa/videodemo/utils/ThreadUtils;->executeUninterruptibly(Lcom/boyaa/videodemo/utils/ThreadUtils$BlockingOperation;)V

    .line 95
    return-void
.end method

.method public static joinUninterruptibly(Ljava/lang/Thread;J)Z
    .locals 10
    .param p0, "thread"    # Ljava/lang/Thread;
    .param p1, "timeoutMs"    # J

    .prologue
    .line 66
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    .line 67
    .local v3, "startTimeMs":J
    move-wide v5, p1

    .line 68
    .local v5, "timeRemainingMs":J
    const/4 v7, 0x0

    .line 69
    .local v7, "wasInterrupted":Z
    :goto_0
    const-wide/16 v8, 0x0

    cmp-long v8, v5, v8

    if-gtz v8, :cond_1

    .line 82
    :goto_1
    if-eqz v7, :cond_0

    .line 83
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->interrupt()V

    .line 85
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Thread;->isAlive()Z

    move-result v8

    if-eqz v8, :cond_2

    const/4 v8, 0x0

    :goto_2
    return v8

    .line 71
    :cond_1
    :try_start_0
    invoke-virtual {p0, v5, v6}, Ljava/lang/Thread;->join(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 73
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v7, 0x1

    .line 77
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    sub-long v1, v8, v3

    .line 78
    .local v1, "elapsedTimeMs":J
    sub-long v5, p1, v1

    goto :goto_0

    .line 85
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .end local v1    # "elapsedTimeMs":J
    :cond_2
    const/4 v8, 0x1

    goto :goto_2
.end method

.method public static waitUninterruptibly(Ljava/lang/Object;)V
    .locals 1
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    .line 131
    new-instance v0, Lcom/boyaa/videodemo/utils/ThreadUtils$3;

    invoke-direct {v0, p0}, Lcom/boyaa/videodemo/utils/ThreadUtils$3;-><init>(Ljava/lang/Object;)V

    invoke-static {v0}, Lcom/boyaa/videodemo/utils/ThreadUtils;->executeUninterruptibly(Lcom/boyaa/videodemo/utils/ThreadUtils$BlockingOperation;)V

    .line 137
    return-void
.end method
