.class Lcom/boyaa/videodemo/data/VideoService$VideoHearBeatThread;
.super Ljava/lang/Object;
.source "VideoService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videodemo/data/VideoService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "VideoHearBeatThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videodemo/data/VideoService;


# direct methods
.method constructor <init>(Lcom/boyaa/videodemo/data/VideoService;)V
    .locals 0

    .prologue
    .line 39
    iput-object p1, p0, Lcom/boyaa/videodemo/data/VideoService$VideoHearBeatThread;->this$0:Lcom/boyaa/videodemo/data/VideoService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 45
    :try_start_0
    iget-object v1, p0, Lcom/boyaa/videodemo/data/VideoService$VideoHearBeatThread;->this$0:Lcom/boyaa/videodemo/data/VideoService;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/data/VideoService;->access$0(Lcom/boyaa/videodemo/data/VideoService;Z)V

    .line 47
    :goto_0
    iget-object v1, p0, Lcom/boyaa/videodemo/data/VideoService$VideoHearBeatThread;->this$0:Lcom/boyaa/videodemo/data/VideoService;

    # getter for: Lcom/boyaa/videodemo/data/VideoService;->bBeating:Z
    invoke-static {v1}, Lcom/boyaa/videodemo/data/VideoService;->access$1(Lcom/boyaa/videodemo/data/VideoService;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 56
    :goto_1
    return-void

    .line 49
    :cond_0
    const/4 v1, 0x5

    new-array v0, v1, [B

    .line 50
    .local v0, "data":[B
    const/4 v1, 0x1

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v0 .. v7}, Lcom/boyaa/videodemo/utils/ApiUtils;->SendVideoData([BIIJIII)V

    .line 51
    const-wide/16 v1, 0x7530

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 54
    .end local v0    # "data":[B
    :catch_0
    move-exception v1

    goto :goto_1
.end method
