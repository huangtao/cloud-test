.class Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue$PollBufferDataRunnable;
.super Ljava/lang/Object;
.source "VideoRecvQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PollBufferDataRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;


# direct methods
.method constructor <init>(Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;)V
    .locals 0

    .prologue
    .line 82
    iput-object p1, p0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue$PollBufferDataRunnable;->this$0:Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 87
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue$PollBufferDataRunnable;->this$0:Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;

    # getter for: Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->isStart:Z
    invoke-static {v2}, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->access$0(Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 127
    return-void

    .line 91
    :cond_1
    :try_start_0
    sget-object v2, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v2, :cond_2

    sget-object v2, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v2

    if-nez v2, :cond_2

    .line 93
    const-wide/16 v2, 0x2

    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 122
    :catch_0
    move-exception v0

    .line 124
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 98
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_1
    sget-object v2, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v2, :cond_0

    .line 100
    sget-object v2, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    const-wide/16 v3, 0x1

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3, v4, v5}, Ljava/util/concurrent/ArrayBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/example/tutorial/VideoProto$VideoNotify;

    .line 101
    .local v1, "jetterData":Lcom/example/tutorial/VideoProto$VideoNotify;
    if-eqz v1, :cond_0

    .line 105
    const-string v3, "Client Recv Queue"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v2, "Recv AudioClientRecvQueue to deal with: jitterSize:"

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v2, :cond_3

    sget-object v2, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v2

    :goto_1
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :cond_3
    const/4 v2, 0x0

    goto :goto_1
.end method
