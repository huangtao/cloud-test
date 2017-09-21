.class Lcom/boyaa/videodemo/utils/ThreadExecutorSocket$1;
.super Ljava/lang/Object;
.source "ThreadExecutorSocket.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;


# direct methods
.method constructor <init>(Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/videodemo/utils/ThreadExecutorSocket$1;->this$0:Lcom/boyaa/videodemo/utils/ThreadExecutorSocket;

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 2
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 17
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 18
    .local v0, "t":Ljava/lang/Thread;
    const-string v1, "socketThread"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 19
    return-object v0
.end method
