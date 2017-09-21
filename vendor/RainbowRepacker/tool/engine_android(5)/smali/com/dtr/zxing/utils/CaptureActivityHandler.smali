.class public Lcom/dtr/zxing/utils/CaptureActivityHandler;
.super Landroid/os/Handler;
.source "CaptureActivityHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dtr/zxing/utils/CaptureActivityHandler$State;
    }
.end annotation


# instance fields
.field private final activity:Lcom/dtr/zxing/activity/CaptureActivity;

.field private final cameraManager:Lcom/dtr/zxing/camera/CameraManager;

.field private final decodeThread:Lcom/dtr/zxing/decode/DecodeThread;

.field private state:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;


# direct methods
.method public constructor <init>(Lcom/dtr/zxing/activity/CaptureActivity;Lcom/dtr/zxing/camera/CameraManager;I)V
    .locals 1
    .param p1, "activity"    # Lcom/dtr/zxing/activity/CaptureActivity;
    .param p2, "cameraManager"    # Lcom/dtr/zxing/camera/CameraManager;
    .param p3, "decodeMode"    # I

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->activity:Lcom/dtr/zxing/activity/CaptureActivity;

    .line 34
    new-instance v0, Lcom/dtr/zxing/decode/DecodeThread;

    invoke-direct {v0, p1}, Lcom/dtr/zxing/decode/DecodeThread;-><init>(Lcom/dtr/zxing/activity/CaptureActivity;)V

    iput-object v0, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->decodeThread:Lcom/dtr/zxing/decode/DecodeThread;

    .line 35
    iget-object v0, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->decodeThread:Lcom/dtr/zxing/decode/DecodeThread;

    invoke-virtual {v0}, Lcom/dtr/zxing/decode/DecodeThread;->start()V

    .line 36
    sget-object v0, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;->SUCCESS:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    iput-object v0, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->state:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    .line 39
    iput-object p2, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->cameraManager:Lcom/dtr/zxing/camera/CameraManager;

    .line 40
    invoke-virtual {p2}, Lcom/dtr/zxing/camera/CameraManager;->startPreview()V

    .line 41
    invoke-direct {p0}, Lcom/dtr/zxing/utils/CaptureActivityHandler;->restartPreviewAndDecode()V

    .line 42
    return-void
.end method

.method private restartPreviewAndDecode()V
    .locals 3

    .prologue
    .line 79
    iget-object v0, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->state:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    sget-object v1, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;->SUCCESS:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    if-ne v0, v1, :cond_0

    .line 80
    sget-object v0, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;->PREVIEW:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    iput-object v0, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->state:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    .line 81
    iget-object v0, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->cameraManager:Lcom/dtr/zxing/camera/CameraManager;

    iget-object v1, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->decodeThread:Lcom/dtr/zxing/decode/DecodeThread;

    invoke-virtual {v1}, Lcom/dtr/zxing/decode/DecodeThread;->getHandler()Landroid/os/Handler;

    move-result-object v1

    sget v2, Lcom/dtr/zxing/R$id;->decode:I

    invoke-virtual {v0, v1, v2}, Lcom/dtr/zxing/camera/CameraManager;->requestPreviewFrame(Landroid/os/Handler;I)V

    .line 83
    :cond_0
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    .line 46
    iget v1, p1, Landroid/os/Message;->what:I

    sget v2, Lcom/dtr/zxing/R$id;->restart_preview:I

    if-ne v1, v2, :cond_1

    .line 47
    invoke-direct {p0}, Lcom/dtr/zxing/utils/CaptureActivityHandler;->restartPreviewAndDecode()V

    .line 58
    :cond_0
    :goto_0
    return-void

    .line 48
    :cond_1
    iget v1, p1, Landroid/os/Message;->what:I

    sget v2, Lcom/dtr/zxing/R$id;->decode_succeeded:I

    if-ne v1, v2, :cond_2

    .line 49
    sget-object v1, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;->SUCCESS:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    iput-object v1, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->state:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    .line 50
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 51
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v2, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->activity:Lcom/dtr/zxing/activity/CaptureActivity;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/google/zxing/Result;

    invoke-virtual {v2, v1, v0}, Lcom/dtr/zxing/activity/CaptureActivity;->handleDecode(Lcom/google/zxing/Result;Landroid/os/Bundle;)V

    goto :goto_0

    .line 52
    .end local v0    # "bundle":Landroid/os/Bundle;
    :cond_2
    iget v1, p1, Landroid/os/Message;->what:I

    sget v2, Lcom/dtr/zxing/R$id;->decode_failed:I

    if-ne v1, v2, :cond_0

    .line 55
    sget-object v1, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;->PREVIEW:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    iput-object v1, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->state:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    .line 56
    iget-object v1, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->cameraManager:Lcom/dtr/zxing/camera/CameraManager;

    iget-object v2, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->decodeThread:Lcom/dtr/zxing/decode/DecodeThread;

    invoke-virtual {v2}, Lcom/dtr/zxing/decode/DecodeThread;->getHandler()Landroid/os/Handler;

    move-result-object v2

    sget v3, Lcom/dtr/zxing/R$id;->decode:I

    invoke-virtual {v1, v2, v3}, Lcom/dtr/zxing/camera/CameraManager;->requestPreviewFrame(Landroid/os/Handler;I)V

    goto :goto_0
.end method

.method public quitSynchronously()V
    .locals 4

    .prologue
    .line 61
    sget-object v1, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;->DONE:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    iput-object v1, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->state:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    .line 62
    iget-object v1, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->cameraManager:Lcom/dtr/zxing/camera/CameraManager;

    invoke-virtual {v1}, Lcom/dtr/zxing/camera/CameraManager;->stopPreview()V

    .line 63
    iget-object v1, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->decodeThread:Lcom/dtr/zxing/decode/DecodeThread;

    invoke-virtual {v1}, Lcom/dtr/zxing/decode/DecodeThread;->getHandler()Landroid/os/Handler;

    move-result-object v1

    sget v2, Lcom/dtr/zxing/R$id;->quit:I

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 64
    .local v0, "quit":Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 68
    :try_start_0
    iget-object v1, p0, Lcom/dtr/zxing/utils/CaptureActivityHandler;->decodeThread:Lcom/dtr/zxing/decode/DecodeThread;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v1, v2, v3}, Lcom/dtr/zxing/decode/DecodeThread;->join(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    :goto_0
    sget v1, Lcom/dtr/zxing/R$id;->decode_succeeded:I

    invoke-virtual {p0, v1}, Lcom/dtr/zxing/utils/CaptureActivityHandler;->removeMessages(I)V

    .line 75
    sget v1, Lcom/dtr/zxing/R$id;->decode_failed:I

    invoke-virtual {p0, v1}, Lcom/dtr/zxing/utils/CaptureActivityHandler;->removeMessages(I)V

    .line 76
    return-void

    .line 69
    :catch_0
    move-exception v1

    goto :goto_0
.end method
