.class public Lh264/com/AVDecoder1Service;
.super Ljava/lang/Object;
.source "AVDecoder1Service.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;
    }
.end annotation


# static fields
.field public static final MSG_VEDIO_DATA:Ljava/lang/String; = "vedio"

.field public static final START_ENCODE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "AVCodeerService"

.field public static mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;


# instance fields
.field private bDataInit:Z

.field public delta:J

.field private iLength:I

.field iResult:I

.field private isDecoderVedioThread:Z

.field private mDecodeVedioThread:Ljava/lang/Thread;

.field public start:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    new-instance v0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-direct {v0}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;-><init>()V

    sput-object v0, Lh264/com/AVDecoder1Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    return-void
.end method

.method public constructor <init>()V
    .locals 9

    .prologue
    const-wide/16 v7, 0x0

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v3, 0x0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-boolean v3, p0, Lh264/com/AVDecoder1Service;->isDecoderVedioThread:Z

    .line 30
    iput-boolean v3, p0, Lh264/com/AVDecoder1Service;->bDataInit:Z

    .line 31
    iput-wide v7, p0, Lh264/com/AVDecoder1Service;->delta:J

    .line 32
    iput-wide v7, p0, Lh264/com/AVDecoder1Service;->start:J

    .line 33
    iput v3, p0, Lh264/com/AVDecoder1Service;->iResult:I

    .line 39
    iput-boolean v5, p0, Lh264/com/AVDecoder1Service;->isDecoderVedioThread:Z

    .line 43
    invoke-static {}, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;->getInstance()Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 44
    invoke-static {}, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;->getInstance()Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;->getVedioFrame()Lcom/boyaa/videodemo/bean/VedioFrameBean;

    move-result-object v3

    invoke-virtual {v3}, Lcom/boyaa/videodemo/bean/VedioFrameBean;->Clean()V

    .line 46
    :cond_0
    sget-object v3, Lh264/com/AVDecoder1Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    if-eqz v3, :cond_1

    .line 47
    sget-object v3, Lh264/com/AVDecoder1Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v3}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 49
    :cond_1
    invoke-static {}, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->getInstance()Lcom/boyaa/videodemo/videobuffer/VideoBuffer;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-static {}, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->getInstance()Lcom/boyaa/videodemo/videobuffer/VideoBuffer;

    move-result-object v3

    invoke-virtual {v3}, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->getVedioBufferSize()I

    move-result v3

    if-lez v3, :cond_2

    .line 51
    invoke-static {}, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->getInstance()Lcom/boyaa/videodemo/videobuffer/VideoBuffer;

    move-result-object v3

    invoke-virtual {v3}, Lcom/boyaa/videodemo/videobuffer/VideoBuffer;->Clean()V

    .line 53
    :cond_2
    const/4 v1, 0x0

    .line 54
    .local v1, "iRet":I
    const/16 v3, 0x3e8

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v4

    iget v4, v4, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue1:I

    div-int/2addr v3, v4

    int-to-long v3, v3

    iput-wide v3, p0, Lh264/com/AVDecoder1Service;->delta:J

    .line 56
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v3

    iget v3, v3, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType1:I

    if-nez v3, :cond_4

    .line 58
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v3

    iget v3, v3, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri1:I

    if-ne v3, v6, :cond_3

    .line 60
    const/16 v0, 0x120

    .local v0, "iH":I
    const/16 v2, 0x160

    .line 61
    .local v2, "iW":I
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v3

    invoke-virtual {v3, v2, v0}, Lh264/com/H264Android;->InitDecoder(II)I

    move-result v1

    .line 84
    :goto_0
    if-eq v1, v5, :cond_6

    .line 86
    invoke-virtual {p0}, Lh264/com/AVDecoder1Service;->release()V

    .line 93
    :goto_1
    return-void

    .line 65
    .end local v0    # "iH":I
    .end local v2    # "iW":I
    :cond_3
    const/16 v0, 0x160

    .restart local v0    # "iH":I
    const/16 v2, 0x120

    .line 66
    .restart local v2    # "iW":I
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v3

    invoke-virtual {v3, v2, v0}, Lh264/com/H264Android;->InitDecoder(II)I

    move-result v1

    .line 68
    goto :goto_0

    .line 71
    .end local v0    # "iH":I
    .end local v2    # "iW":I
    :cond_4
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v3

    iget v3, v3, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri1:I

    if-ne v3, v6, :cond_5

    .line 73
    const/16 v0, 0xf0

    .restart local v0    # "iH":I
    const/16 v2, 0x140

    .line 74
    .restart local v2    # "iW":I
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v3

    invoke-virtual {v3, v2, v0}, Lh264/com/H264Android;->InitDecoder(II)I

    move-result v1

    .line 75
    goto :goto_0

    .line 78
    .end local v0    # "iH":I
    .end local v2    # "iW":I
    :cond_5
    const/16 v0, 0x140

    .restart local v0    # "iH":I
    const/16 v2, 0xf0

    .line 79
    .restart local v2    # "iW":I
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v3

    invoke-virtual {v3, v2, v0}, Lh264/com/H264Android;->InitDecoder(II)I

    move-result v1

    goto :goto_0

    .line 90
    :cond_6
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;

    invoke-direct {v4, p0}, Lh264/com/AVDecoder1Service$AVDecodeVedioRunnable;-><init>(Lh264/com/AVDecoder1Service;)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v3, p0, Lh264/com/AVDecoder1Service;->mDecodeVedioThread:Ljava/lang/Thread;

    .line 91
    iget-object v3, p0, Lh264/com/AVDecoder1Service;->mDecodeVedioThread:Ljava/lang/Thread;

    const-string v4, "AVDecodeVedioRunnable"

    invoke-virtual {v3, v4}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 92
    iget-object v3, p0, Lh264/com/AVDecoder1Service;->mDecodeVedioThread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto :goto_1
.end method

.method static synthetic access$0(Lh264/com/AVDecoder1Service;)Z
    .locals 1

    .prologue
    .line 29
    iget-boolean v0, p0, Lh264/com/AVDecoder1Service;->isDecoderVedioThread:Z

    return v0
.end method

.method static synthetic access$1(Lh264/com/AVDecoder1Service;Z)V
    .locals 0

    .prologue
    .line 29
    iput-boolean p1, p0, Lh264/com/AVDecoder1Service;->isDecoderVedioThread:Z

    return-void
.end method


# virtual methods
.method public release()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 274
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v0

    invoke-virtual {v0}, Lh264/com/H264Android;->UninitDecoder()I

    .line 276
    iput-boolean v1, p0, Lh264/com/AVDecoder1Service;->isDecoderVedioThread:Z

    .line 278
    iput-boolean v1, p0, Lh264/com/AVDecoder1Service;->bDataInit:Z

    .line 279
    return-void
.end method
