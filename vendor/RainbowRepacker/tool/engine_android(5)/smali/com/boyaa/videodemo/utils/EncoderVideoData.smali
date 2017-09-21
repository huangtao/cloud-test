.class public Lcom/boyaa/videodemo/utils/EncoderVideoData;
.super Ljava/lang/Object;
.source "EncoderVideoData.java"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# static fields
.field private static synthetic $SWITCH_TABLE$android$os$AsyncTask$Status:[I

.field public static mTask:Lcom/boyaa/videodemo/utils/EncoderTask;


# instance fields
.field dataExt:[B

.field delta:I

.field encoder:J

.field h264Buff:[B

.field iCount:I

.field iH:I

.field iW:I

.field private mFrameType:I

.field private mFrameValue:I

.field result:I


# direct methods
.method static synthetic $SWITCH_TABLE$android$os$AsyncTask$Status()[I
    .locals 3

    .prologue
    .line 9
    sget-object v0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->$SWITCH_TABLE$android$os$AsyncTask$Status:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Landroid/os/AsyncTask$Status;->values()[Landroid/os/AsyncTask$Status;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Landroid/os/AsyncTask$Status;->FINISHED:Landroid/os/AsyncTask$Status;

    invoke-virtual {v1}, Landroid/os/AsyncTask$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_1
    :try_start_1
    sget-object v1, Landroid/os/AsyncTask$Status;->PENDING:Landroid/os/AsyncTask$Status;

    invoke-virtual {v1}, Landroid/os/AsyncTask$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_2
    :try_start_2
    sget-object v1, Landroid/os/AsyncTask$Status;->RUNNING:Landroid/os/AsyncTask$Status;

    invoke-virtual {v1}, Landroid/os/AsyncTask$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_3
    sput-object v0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->$SWITCH_TABLE$android$os$AsyncTask$Status:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>(IIII)V
    .locals 4
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "type"    # I
    .param p4, "value"    # I

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput v2, p0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->iCount:I

    .line 12
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->encoder:J

    .line 13
    iput v2, p0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->result:I

    .line 14
    iput-object v3, p0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->h264Buff:[B

    .line 15
    iput v2, p0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->delta:I

    .line 16
    iput v2, p0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->mFrameValue:I

    .line 17
    const/16 v0, 0x64

    iput v0, p0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->mFrameType:I

    .line 18
    iput-object v3, p0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->dataExt:[B

    .line 19
    iput v2, p0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->iW:I

    .line 20
    iput v2, p0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->iH:I

    .line 34
    iput p3, p0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->mFrameType:I

    .line 35
    iput p4, p0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->mFrameValue:I

    .line 37
    const/16 v0, 0x3e8

    iget v1, p0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->mFrameValue:I

    div-int/2addr v0, v1

    iput v0, p0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->delta:I

    .line 38
    return-void
.end method


# virtual methods
.method YUV420spRotateNegative90([B[BII)V
    .locals 10
    .param p1, "dst"    # [B
    .param p2, "src"    # [B
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 246
    const/4 v5, 0x0

    .local v5, "nWidth":I
    const/4 v3, 0x0

    .line 247
    .local v3, "nHeight":I
    const/4 v7, 0x0

    .line 248
    .local v7, "wh":I
    const/4 v6, 0x0

    .line 249
    .local v6, "uvHeight":I
    if-ne p3, v5, :cond_0

    if-eq p4, v3, :cond_1

    .line 251
    :cond_0
    move v5, p3

    .line 252
    move v3, p4

    .line 253
    mul-int v7, p3, p4

    .line 254
    shr-int/lit8 v6, p4, 0x1

    .line 258
    :cond_1
    const/4 v2, 0x0

    .line 259
    .local v2, "k":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p3, :cond_2

    .line 269
    const/4 v0, 0x0

    :goto_1
    if-lt v0, p3, :cond_4

    .line 279
    return-void

    .line 260
    :cond_2
    add-int/lit8 v4, p3, -0x1

    .line 261
    .local v4, "nPos":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_2
    if-lt v1, p4, :cond_3

    .line 259
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 263
    :cond_3
    sub-int v8, v4, v0

    aget-byte v8, p2, v8

    aput-byte v8, p1, v2

    .line 264
    add-int/lit8 v2, v2, 0x1

    .line 265
    add-int/2addr v4, p3

    .line 261
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 270
    .end local v1    # "j":I
    .end local v4    # "nPos":I
    :cond_4
    add-int v8, v7, p3

    add-int/lit8 v4, v8, -0x1

    .line 271
    .restart local v4    # "nPos":I
    const/4 v1, 0x0

    .restart local v1    # "j":I
    :goto_3
    if-lt v1, v6, :cond_5

    .line 269
    add-int/lit8 v0, v0, 0x2

    goto :goto_1

    .line 272
    :cond_5
    sub-int v8, v4, v0

    add-int/lit8 v8, v8, -0x1

    aget-byte v8, p2, v8

    aput-byte v8, p1, v2

    .line 273
    add-int/lit8 v8, v2, 0x1

    sub-int v9, v4, v0

    aget-byte v9, p2, v9

    aput-byte v9, p1, v8

    .line 274
    add-int/lit8 v2, v2, 0x2

    .line 275
    add-int/2addr v4, p3

    .line 271
    add-int/lit8 v1, v1, 0x1

    goto :goto_3
.end method

.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 234
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 239
    :goto_0
    return-void

    .line 235
    :catch_0
    move-exception v0

    .line 237
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 4
    .param p1, "data"    # [B
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    const/4 v3, 0x0

    .line 47
    sget-object v0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->mTask:Lcom/boyaa/videodemo/utils/EncoderTask;

    if-eqz v0, :cond_0

    .line 48
    invoke-static {}, Lcom/boyaa/videodemo/utils/EncoderVideoData;->$SWITCH_TABLE$android$os$AsyncTask$Status()[I

    move-result-object v0

    sget-object v1, Lcom/boyaa/videodemo/utils/EncoderVideoData;->mTask:Lcom/boyaa/videodemo/utils/EncoderTask;

    invoke-virtual {v1}, Lcom/boyaa/videodemo/utils/EncoderTask;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/AsyncTask$Status;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 56
    :cond_0
    :goto_0
    new-instance v0, Lcom/boyaa/videodemo/utils/EncoderTask;

    iget v1, p0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->delta:I

    invoke-direct {v0, p1, v1}, Lcom/boyaa/videodemo/utils/EncoderTask;-><init>([BI)V

    sput-object v0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->mTask:Lcom/boyaa/videodemo/utils/EncoderTask;

    .line 57
    sget-object v0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->mTask:Lcom/boyaa/videodemo/utils/EncoderTask;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Void;

    const/4 v2, 0x0

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/boyaa/videodemo/utils/EncoderTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 226
    :pswitch_0
    return-void

    .line 52
    :pswitch_1
    sget-object v0, Lcom/boyaa/videodemo/utils/EncoderVideoData;->mTask:Lcom/boyaa/videodemo/utils/EncoderTask;

    invoke-virtual {v0, v3}, Lcom/boyaa/videodemo/utils/EncoderTask;->cancel(Z)Z

    goto :goto_0

    .line 48
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
