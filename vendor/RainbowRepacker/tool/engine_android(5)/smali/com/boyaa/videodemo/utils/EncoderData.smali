.class public Lcom/boyaa/videodemo/utils/EncoderData;
.super Ljava/lang/Object;
.source "EncoderData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "EncoderVedioThread"

.field public static mCarmeData:Ljava/util/concurrent/ArrayBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ArrayBlockingQueue",
            "<[B>;"
        }
    .end annotation
.end field


# instance fields
.field private bEncoderVedioThread:Z

.field dataExt:[B

.field public delta:J

.field encoder:J

.field h264Buff:[B

.field iCount:I

.field iH:I

.field private iLength:I

.field iResult:I

.field iW:I

.field private mEncoderVedioThread:Ljava/lang/Thread;

.field private mFrameType:I

.field private mFrameValue:I

.field result:I

.field public start:J

.field yuv420p:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 40
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v1, 0xc8

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    sput-object v0, Lcom/boyaa/videodemo/utils/EncoderData;->mCarmeData:Ljava/util/concurrent/ArrayBlockingQueue;

    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 5
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "type"    # I
    .param p4, "value"    # I

    .prologue
    const-wide/16 v3, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-boolean v2, p0, Lcom/boyaa/videodemo/utils/EncoderData;->bEncoderVedioThread:Z

    .line 25
    iput-wide v3, p0, Lcom/boyaa/videodemo/utils/EncoderData;->delta:J

    .line 26
    iput-wide v3, p0, Lcom/boyaa/videodemo/utils/EncoderData;->start:J

    .line 27
    iput v2, p0, Lcom/boyaa/videodemo/utils/EncoderData;->iResult:I

    .line 29
    iput v2, p0, Lcom/boyaa/videodemo/utils/EncoderData;->iCount:I

    .line 30
    iput-wide v3, p0, Lcom/boyaa/videodemo/utils/EncoderData;->encoder:J

    .line 31
    iput v2, p0, Lcom/boyaa/videodemo/utils/EncoderData;->result:I

    .line 32
    iput-object v1, p0, Lcom/boyaa/videodemo/utils/EncoderData;->h264Buff:[B

    .line 33
    iput v2, p0, Lcom/boyaa/videodemo/utils/EncoderData;->mFrameValue:I

    .line 34
    const/16 v0, 0x64

    iput v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->mFrameType:I

    .line 35
    iput-object v1, p0, Lcom/boyaa/videodemo/utils/EncoderData;->dataExt:[B

    .line 36
    iput-object v1, p0, Lcom/boyaa/videodemo/utils/EncoderData;->yuv420p:[B

    .line 37
    iput v2, p0, Lcom/boyaa/videodemo/utils/EncoderData;->iW:I

    .line 38
    iput v2, p0, Lcom/boyaa/videodemo/utils/EncoderData;->iH:I

    .line 44
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    iget v0, v0, Lcom/boyaa/videosdk/BoyaaVoice;->mOrientation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 45
    invoke-static {}, Lh264/com/H264Encoder;->getInstance()Lh264/com/H264Encoder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lh264/com/H264Encoder;->CompressBegin(II)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->encoder:J

    .line 49
    :goto_0
    mul-int v0, p1, p2

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->h264Buff:[B

    .line 53
    iput p1, p0, Lcom/boyaa/videodemo/utils/EncoderData;->iW:I

    .line 54
    iput p2, p0, Lcom/boyaa/videodemo/utils/EncoderData;->iH:I

    .line 55
    iput p3, p0, Lcom/boyaa/videodemo/utils/EncoderData;->mFrameType:I

    .line 56
    iput p4, p0, Lcom/boyaa/videodemo/utils/EncoderData;->mFrameValue:I

    .line 57
    iput v2, p0, Lcom/boyaa/videodemo/utils/EncoderData;->iCount:I

    .line 58
    const/16 v0, 0x3e8

    iget v1, p0, Lcom/boyaa/videodemo/utils/EncoderData;->mFrameValue:I

    div-int/2addr v0, v1

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->delta:J

    .line 59
    iget-wide v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->delta:J

    iput-wide v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->delta:J

    .line 60
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->bEncoderVedioThread:Z

    .line 61
    sget-object v0, Lcom/boyaa/videodemo/utils/EncoderData;->mCarmeData:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 63
    iget v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->iW:I

    iget v1, p0, Lcom/boyaa/videodemo/utils/EncoderData;->iH:I

    mul-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->yuv420p:[B

    .line 65
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;

    invoke-direct {v1, p0}, Lcom/boyaa/videodemo/utils/EncoderData$AVEncodeVedioRunnable;-><init>(Lcom/boyaa/videodemo/utils/EncoderData;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->mEncoderVedioThread:Ljava/lang/Thread;

    .line 66
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->mEncoderVedioThread:Ljava/lang/Thread;

    const-string v1, "AVEncodeVedioRunnable"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 67
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->mEncoderVedioThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 68
    return-void

    .line 47
    :cond_0
    invoke-static {}, Lh264/com/H264Encoder;->getInstance()Lh264/com/H264Encoder;

    move-result-object v0

    invoke-virtual {v0, p2, p1}, Lh264/com/H264Encoder;->CompressBegin(II)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->encoder:J

    goto :goto_0
.end method

.method private YV12ToI420([B[BII)V
    .locals 3
    .param p1, "yv12"    # [B
    .param p2, "i420"    # [B
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    const/4 v1, 0x0

    .line 282
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 287
    :cond_0
    :goto_0
    return-void

    .line 284
    :cond_1
    mul-int v0, p3, p4

    invoke-static {p1, v1, p2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 285
    mul-int v0, p3, p4

    mul-int v1, p3, p4

    mul-int v2, p3, p4

    div-int/lit8 v2, v2, 0x4

    add-int/2addr v1, v2

    mul-int v2, p3, p4

    div-int/lit8 v2, v2, 0x4

    invoke-static {p1, v0, p2, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 286
    mul-int v0, p3, p4

    mul-int v1, p3, p4

    div-int/lit8 v1, v1, 0x4

    add-int/2addr v0, v1

    mul-int v1, p3, p4

    mul-int v2, p3, p4

    div-int/lit8 v2, v2, 0x4

    invoke-static {p1, v0, p2, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method static synthetic access$0(Lcom/boyaa/videodemo/utils/EncoderData;)Z
    .locals 1

    .prologue
    .line 23
    iget-boolean v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->bEncoderVedioThread:Z

    return v0
.end method

.method static synthetic access$1(Lcom/boyaa/videodemo/utils/EncoderData;Z)V
    .locals 0

    .prologue
    .line 23
    iput-boolean p1, p0, Lcom/boyaa/videodemo/utils/EncoderData;->bEncoderVedioThread:Z

    return-void
.end method

.method static synthetic access$2(Lcom/boyaa/videodemo/utils/EncoderData;)I
    .locals 1

    .prologue
    .line 34
    iget v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->mFrameType:I

    return v0
.end method

.method static synthetic access$3(Lcom/boyaa/videodemo/utils/EncoderData;)I
    .locals 1

    .prologue
    .line 33
    iget v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->mFrameValue:I

    return v0
.end method


# virtual methods
.method YUV420spRotateNegative90([B[BII)V
    .locals 10
    .param p1, "dst"    # [B
    .param p2, "src"    # [B
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 243
    const/4 v5, 0x0

    .local v5, "nWidth":I
    const/4 v3, 0x0

    .line 244
    .local v3, "nHeight":I
    const/4 v7, 0x0

    .line 245
    .local v7, "wh":I
    const/4 v6, 0x0

    .line 246
    .local v6, "uvHeight":I
    if-ne p3, v5, :cond_0

    if-eq p4, v3, :cond_1

    .line 248
    :cond_0
    move v5, p3

    .line 249
    move v3, p4

    .line 250
    mul-int v7, p3, p4

    .line 251
    shr-int/lit8 v6, p4, 0x1

    .line 255
    :cond_1
    const/4 v2, 0x0

    .line 256
    .local v2, "k":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p3, :cond_2

    .line 266
    const/4 v0, 0x0

    :goto_1
    if-lt v0, p3, :cond_4

    .line 276
    return-void

    .line 257
    :cond_2
    add-int/lit8 v4, p3, -0x1

    .line 258
    .local v4, "nPos":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_2
    if-lt v1, p4, :cond_3

    .line 256
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 260
    :cond_3
    sub-int v8, v4, v0

    aget-byte v8, p2, v8

    aput-byte v8, p1, v2

    .line 261
    add-int/lit8 v2, v2, 0x1

    .line 262
    add-int/2addr v4, p3

    .line 258
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 267
    .end local v1    # "j":I
    .end local v4    # "nPos":I
    :cond_4
    add-int v8, v7, p3

    add-int/lit8 v4, v8, -0x1

    .line 268
    .restart local v4    # "nPos":I
    const/4 v1, 0x0

    .restart local v1    # "j":I
    :goto_3
    if-lt v1, v6, :cond_5

    .line 266
    add-int/lit8 v0, v0, 0x2

    goto :goto_1

    .line 269
    :cond_5
    sub-int v8, v4, v0

    add-int/lit8 v8, v8, -0x1

    aget-byte v8, p2, v8

    aput-byte v8, p1, v2

    .line 270
    add-int/lit8 v8, v2, 0x1

    sub-int v9, v4, v0

    aget-byte v9, p2, v9

    aput-byte v9, p1, v8

    .line 271
    add-int/lit8 v2, v2, 0x2

    .line 272
    add-int/2addr v4, p3

    .line 268
    add-int/lit8 v1, v1, 0x1

    goto :goto_3
.end method

.method public release()V
    .locals 3

    .prologue
    .line 233
    invoke-static {}, Lh264/com/H264Encoder;->getInstance()Lh264/com/H264Encoder;

    move-result-object v0

    iget-wide v1, p0, Lcom/boyaa/videodemo/utils/EncoderData;->encoder:J

    invoke-virtual {v0, v1, v2}, Lh264/com/H264Encoder;->CompressEnd(J)I

    .line 235
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/videodemo/utils/EncoderData;->bEncoderVedioThread:Z

    .line 237
    return-void
.end method
