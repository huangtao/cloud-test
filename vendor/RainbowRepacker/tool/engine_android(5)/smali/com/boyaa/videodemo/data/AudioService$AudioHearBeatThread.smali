.class Lcom/boyaa/videodemo/data/AudioService$AudioHearBeatThread;
.super Ljava/lang/Object;
.source "AudioService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videodemo/data/AudioService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AudioHearBeatThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videodemo/data/AudioService;


# direct methods
.method constructor <init>(Lcom/boyaa/videodemo/data/AudioService;)V
    .locals 0

    .prologue
    .line 43
    iput-object p1, p0, Lcom/boyaa/videodemo/data/AudioService$AudioHearBeatThread;->this$0:Lcom/boyaa/videodemo/data/AudioService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 49
    :try_start_0
    iget-object v1, p0, Lcom/boyaa/videodemo/data/AudioService$AudioHearBeatThread;->this$0:Lcom/boyaa/videodemo/data/AudioService;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/data/AudioService;->access$0(Lcom/boyaa/videodemo/data/AudioService;Z)V

    .line 51
    :goto_0
    iget-object v1, p0, Lcom/boyaa/videodemo/data/AudioService$AudioHearBeatThread;->this$0:Lcom/boyaa/videodemo/data/AudioService;

    # getter for: Lcom/boyaa/videodemo/data/AudioService;->bBeating:Z
    invoke-static {v1}, Lcom/boyaa/videodemo/data/AudioService;->access$1(Lcom/boyaa/videodemo/data/AudioService;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 61
    :goto_1
    return-void

    .line 53
    :cond_0
    const/4 v1, 0x5

    new-array v0, v1, [B

    .line 54
    .local v0, "data":[B
    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2}, Lcom/boyaa/videodemo/utils/ApiUtils;->SendAudioData([BJ)V

    .line 56
    const-wide/16 v1, 0x7530

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 59
    .end local v0    # "data":[B
    :catch_0
    move-exception v1

    goto :goto_1
.end method
