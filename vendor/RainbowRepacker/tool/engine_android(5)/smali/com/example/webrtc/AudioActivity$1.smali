.class Lcom/example/webrtc/AudioActivity$1;
.super Ljava/lang/Object;
.source "AudioActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/webrtc/AudioActivity;->getSendStatus()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/webrtc/AudioActivity;


# direct methods
.method constructor <init>(Lcom/example/webrtc/AudioActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/example/webrtc/AudioActivity$1;->this$0:Lcom/example/webrtc/AudioActivity;

    .line 434
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 439
    const/4 v1, 0x0

    .line 440
    .local v1, "iTag":I
    const/4 v0, 0x0

    .line 441
    .local v0, "iFailedTimes":I
    :goto_0
    const/4 v2, 0x5

    if-le v1, v2, :cond_1

    .line 451
    const/4 v2, 0x2

    if-lt v0, v2, :cond_0

    .line 453
    :try_start_0
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 455
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v2

    iget-object v2, v2, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v3, 0x57

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 461
    :cond_0
    :goto_1
    return-void

    .line 443
    :cond_1
    iget-object v2, p0, Lcom/example/webrtc/AudioActivity$1;->this$0:Lcom/example/webrtc/AudioActivity;

    invoke-virtual {v2}, Lcom/example/webrtc/AudioActivity;->getSendSuccValue()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_2

    .line 444
    add-int/lit8 v0, v0, 0x1

    .line 448
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 446
    :cond_2
    const-wide/16 v2, 0x32

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 459
    :catch_0
    move-exception v2

    goto :goto_1
.end method
