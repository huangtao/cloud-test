.class public Lcom/boyaa/videodemo/videobuffer/VideoBuffer;
.super Ljava/lang/Object;
.source "VideoBuffer.java"


# static fields
.field public static mInstance:Lcom/boyaa/videodemo/videobuffer/VideoBuffer;


# instance fields
.field public jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ArrayBlockingQueue",
            "<",
            "Lcom/boyaa/videodemo/bean/ShowBean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 18
    return-void
.end method

.method public static getInstance()Lcom/boyaa/videodemo/videobuffer/VideoBuffer;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->mInstance:Lcom/boyaa/videodemo/videobuffer/VideoBuffer;

    if-nez v0, :cond_0

    .line 23
    new-instance v0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;

    invoke-direct {v0}, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;-><init>()V

    sput-object v0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->mInstance:Lcom/boyaa/videodemo/videobuffer/VideoBuffer;

    .line 25
    :cond_0
    sget-object v0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->mInstance:Lcom/boyaa/videodemo/videobuffer/VideoBuffer;

    return-object v0
.end method


# virtual methods
.method public Clean()V
    .locals 1

    .prologue
    .line 75
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->mInstance:Lcom/boyaa/videodemo/videobuffer/VideoBuffer;

    .line 76
    iget-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 77
    iget-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 82
    :cond_0
    return-void
.end method

.method public getVedioBufferSize()I
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v0

    .line 66
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getVedioData()Lcom/boyaa/videodemo/bean/ShowBean;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 53
    iget-object v0, p0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/videodemo/bean/ShowBean;

    .line 55
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public pushVedioData(Lcom/boyaa/videodemo/bean/ShowBean;)V
    .locals 3
    .param p1, "data"    # Lcom/boyaa/videodemo/bean/ShowBean;

    .prologue
    .line 34
    :try_start_0
    iget-object v1, p0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    if-eqz v1, :cond_0

    .line 36
    iget-object v1, p0, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->jetterBuffer:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ArrayBlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    :cond_0
    :goto_0
    return-void

    .line 40
    :catch_0
    move-exception v0

    .line 42
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Vedio Buffer"

    const-string v2, "InterruptedException e"

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
