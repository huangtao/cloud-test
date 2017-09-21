.class public Lcom/dtr/zxing/decode/DecodeHandler;
.super Landroid/os/Handler;
.source "DecodeHandler.java"


# instance fields
.field private final activity:Lcom/dtr/zxing/activity/CaptureActivity;

.field private final multiFormatReader:Lcom/google/zxing/MultiFormatReader;

.field private running:Z


# direct methods
.method public constructor <init>(Lcom/dtr/zxing/activity/CaptureActivity;Ljava/util/Map;)V
    .locals 1
    .param p1, "activity"    # Lcom/dtr/zxing/activity/CaptureActivity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dtr/zxing/activity/CaptureActivity;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;Ljava/lang/Object;>;"
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 28
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/dtr/zxing/decode/DecodeHandler;->running:Z

    .line 31
    new-instance v0, Lcom/google/zxing/MultiFormatReader;

    invoke-direct {v0}, Lcom/google/zxing/MultiFormatReader;-><init>()V

    iput-object v0, p0, Lcom/dtr/zxing/decode/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    .line 32
    iget-object v0, p0, Lcom/dtr/zxing/decode/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v0, p2}, Lcom/google/zxing/MultiFormatReader;->setHints(Ljava/util/Map;)V

    .line 33
    iput-object p1, p0, Lcom/dtr/zxing/decode/DecodeHandler;->activity:Lcom/dtr/zxing/activity/CaptureActivity;

    .line 34
    return-void
.end method

.method private static bundleThumbnail(Lcom/google/zxing/PlanarYUVLuminanceSource;Landroid/os/Bundle;)V
    .locals 8
    .param p0, "source"    # Lcom/google/zxing/PlanarYUVLuminanceSource;
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 96
    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->renderThumbnail()[I

    move-result-object v0

    .line 97
    .local v0, "pixels":[I
    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getThumbnailWidth()I

    move-result v2

    .line 98
    .local v2, "width":I
    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getThumbnailHeight()I

    move-result v4

    .line 99
    .local v4, "height":I
    const/4 v1, 0x0

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move v3, v2

    invoke-static/range {v0 .. v5}, Landroid/graphics/Bitmap;->createBitmap([IIIIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 100
    .local v6, "bitmap":Landroid/graphics/Bitmap;
    new-instance v7, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v7}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 101
    .local v7, "out":Ljava/io/ByteArrayOutputStream;
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x32

    invoke-virtual {v6, v1, v3, v7}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 102
    const-string v1, "barcode_bitmap"

    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-virtual {p1, v1, v3}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 103
    return-void
.end method

.method private decode([BII)V
    .locals 9
    .param p1, "data"    # [B
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 62
    iget-object v7, p0, Lcom/dtr/zxing/decode/DecodeHandler;->activity:Lcom/dtr/zxing/activity/CaptureActivity;

    invoke-virtual {v7}, Lcom/dtr/zxing/activity/CaptureActivity;->getCameraManager()Lcom/dtr/zxing/camera/CameraManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/dtr/zxing/camera/CameraManager;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v5

    .line 63
    .local v5, "size":Landroid/hardware/Camera$Size;
    const/4 v4, 0x0

    .line 64
    .local v4, "rawResult":Lcom/google/zxing/Result;
    iget v7, v5, Landroid/hardware/Camera$Size;->width:I

    iget v8, v5, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {p0, p1, v7, v8}, Lcom/dtr/zxing/decode/DecodeHandler;->buildLuminanceSource([BII)Lcom/google/zxing/PlanarYUVLuminanceSource;

    move-result-object v6

    .line 65
    .local v6, "source":Lcom/google/zxing/PlanarYUVLuminanceSource;
    if-eqz v6, :cond_0

    .line 66
    new-instance v0, Lcom/google/zxing/BinaryBitmap;

    new-instance v7, Lcom/google/zxing/common/HybridBinarizer;

    invoke-direct {v7, v6}, Lcom/google/zxing/common/HybridBinarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    invoke-direct {v0, v7}, Lcom/google/zxing/BinaryBitmap;-><init>(Lcom/google/zxing/Binarizer;)V

    .line 68
    .local v0, "bitmap":Lcom/google/zxing/BinaryBitmap;
    :try_start_0
    iget-object v7, p0, Lcom/dtr/zxing/decode/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v7, v0}, Lcom/google/zxing/MultiFormatReader;->decodeWithState(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    :try_end_0
    .catch Lcom/google/zxing/ReaderException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 72
    iget-object v7, p0, Lcom/dtr/zxing/decode/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v7}, Lcom/google/zxing/MultiFormatReader;->reset()V

    .line 76
    .end local v0    # "bitmap":Lcom/google/zxing/BinaryBitmap;
    :cond_0
    :goto_0
    iget-object v7, p0, Lcom/dtr/zxing/decode/DecodeHandler;->activity:Lcom/dtr/zxing/activity/CaptureActivity;

    invoke-virtual {v7}, Lcom/dtr/zxing/activity/CaptureActivity;->getHandler()Landroid/os/Handler;

    move-result-object v2

    .line 77
    .local v2, "handler":Landroid/os/Handler;
    if-eqz v4, :cond_2

    .line 79
    if-eqz v2, :cond_1

    .line 80
    sget v7, Lcom/dtr/zxing/R$id;->decode_succeeded:I

    invoke-static {v2, v7, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    .line 81
    .local v3, "message":Landroid/os/Message;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 82
    .local v1, "bundle":Landroid/os/Bundle;
    invoke-static {v6, v1}, Lcom/dtr/zxing/decode/DecodeHandler;->bundleThumbnail(Lcom/google/zxing/PlanarYUVLuminanceSource;Landroid/os/Bundle;)V

    .line 83
    invoke-virtual {v3, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 84
    invoke-virtual {v3}, Landroid/os/Message;->sendToTarget()V

    .line 93
    .end local v1    # "bundle":Landroid/os/Bundle;
    .end local v3    # "message":Landroid/os/Message;
    :cond_1
    :goto_1
    return-void

    .line 69
    .end local v2    # "handler":Landroid/os/Handler;
    .restart local v0    # "bitmap":Lcom/google/zxing/BinaryBitmap;
    :catch_0
    move-exception v7

    .line 72
    iget-object v7, p0, Lcom/dtr/zxing/decode/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v7}, Lcom/google/zxing/MultiFormatReader;->reset()V

    goto :goto_0

    .line 71
    :catchall_0
    move-exception v7

    .line 72
    iget-object v8, p0, Lcom/dtr/zxing/decode/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v8}, Lcom/google/zxing/MultiFormatReader;->reset()V

    .line 73
    throw v7

    .line 87
    .end local v0    # "bitmap":Lcom/google/zxing/BinaryBitmap;
    .restart local v2    # "handler":Landroid/os/Handler;
    :cond_2
    if-eqz v2, :cond_1

    .line 88
    sget v7, Lcom/dtr/zxing/R$id;->decode_failed:I

    invoke-static {v2, v7}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v3

    .line 89
    .restart local v3    # "message":Landroid/os/Message;
    invoke-virtual {v3}, Landroid/os/Message;->sendToTarget()V

    goto :goto_1
.end method


# virtual methods
.method public buildLuminanceSource([BII)Lcom/google/zxing/PlanarYUVLuminanceSource;
    .locals 10
    .param p1, "data"    # [B
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 118
    iget-object v0, p0, Lcom/dtr/zxing/decode/DecodeHandler;->activity:Lcom/dtr/zxing/activity/CaptureActivity;

    invoke-virtual {v0}, Lcom/dtr/zxing/activity/CaptureActivity;->getCropRect()Landroid/graphics/Rect;

    move-result-object v9

    .line 119
    .local v9, "rect":Landroid/graphics/Rect;
    if-nez v9, :cond_0

    .line 120
    const/4 v0, 0x0

    .line 123
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/google/zxing/PlanarYUVLuminanceSource;

    iget v4, v9, Landroid/graphics/Rect;->left:I

    iget v5, v9, Landroid/graphics/Rect;->top:I

    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    move-result v6

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v7

    const/4 v8, 0x0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v8}, Lcom/google/zxing/PlanarYUVLuminanceSource;-><init>([BIIIIIIZ)V

    goto :goto_0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    .line 38
    iget-boolean v0, p0, Lcom/dtr/zxing/decode/DecodeHandler;->running:Z

    if-nez v0, :cond_1

    .line 47
    :cond_0
    :goto_0
    return-void

    .line 41
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    sget v1, Lcom/dtr/zxing/R$id;->decode:I

    if-ne v0, v1, :cond_2

    .line 42
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [B

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget v2, p1, Landroid/os/Message;->arg2:I

    invoke-direct {p0, v0, v1, v2}, Lcom/dtr/zxing/decode/DecodeHandler;->decode([BII)V

    goto :goto_0

    .line 43
    :cond_2
    iget v0, p1, Landroid/os/Message;->what:I

    sget v1, Lcom/dtr/zxing/R$id;->quit:I

    if-ne v0, v1, :cond_0

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/dtr/zxing/decode/DecodeHandler;->running:Z

    .line 45
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    goto :goto_0
.end method
