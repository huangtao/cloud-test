.class Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue$1;
.super Ljava/lang/Object;
.source "VideoRecvQueue.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;


# direct methods
.method constructor <init>(Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue$1;->this$0:Lcom/boyaa/videodemo/videobuffer/VideoRecvQueue;

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 2
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 29
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 30
    .local v0, "t":Ljava/lang/Thread;
    const-string v1, "get-jetter-thread-ext"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 31
    return-object v0
.end method
