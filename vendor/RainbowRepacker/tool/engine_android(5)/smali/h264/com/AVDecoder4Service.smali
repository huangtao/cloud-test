.class public Lh264/com/AVDecoder4Service;
.super Ljava/lang/Object;
.source "AVDecoder4Service.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lh264/com/AVDecoder4Service$AVDecodeVedioRunnableExt;
    }
.end annotation


# static fields
.field public static final MSG_VEDIO_DATA:Ljava/lang/String; = "vedio"

.field public static final START_ENCODE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "AVDecoderOtherService"

.field public static mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;


# instance fields
.field private bDataInit:Z

.field public delta:J

.field private iLength:I

.field private isDecoderVedioThread:Z

.field private mDecodeVedioThread:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    new-instance v0, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-direct {v0}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;-><init>()V

    sput-object v0, Lh264/com/AVDecoder4Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    return-void
.end method

.method public constructor <init>()V
    .locals 7

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v3, 0x0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-boolean v3, p0, Lh264/com/AVDecoder4Service;->isDecoderVedioThread:Z

    .line 27
    iput-boolean v3, p0, Lh264/com/AVDecoder4Service;->bDataInit:Z

    .line 28
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Lh264/com/AVDecoder4Service;->delta:J

    .line 34
    iput-boolean v5, p0, Lh264/com/AVDecoder4Service;->isDecoderVedioThread:Z

    .line 36
    sget-object v3, Lh264/com/AVDecoder4Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    if-eqz v3, :cond_0

    .line 37
    sget-object v3, Lh264/com/AVDecoder4Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v3}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 39
    :cond_0
    const/4 v1, 0x0

    .line 40
    .local v1, "iRet":I
    const/16 v3, 0x3e8

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v4

    iget v4, v4, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue4:I

    div-int/2addr v3, v4

    int-to-long v3, v3

    iput-wide v3, p0, Lh264/com/AVDecoder4Service;->delta:J

    .line 52
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v3

    iget v3, v3, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType4:I

    if-nez v3, :cond_2

    .line 54
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v3

    iget v3, v3, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri4:I

    if-ne v3, v6, :cond_1

    .line 56
    const/16 v0, 0x120

    .local v0, "iH":I
    const/16 v2, 0x160

    .line 57
    .local v2, "iW":I
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v3

    invoke-virtual {v3, v2, v0}, Lh264/com/H264Android;->InitDecoder4(II)I

    move-result v1

    .line 92
    :goto_0
    if-eq v1, v5, :cond_4

    .line 94
    invoke-virtual {p0}, Lh264/com/AVDecoder4Service;->release()V

    .line 101
    :goto_1
    return-void

    .line 61
    .end local v0    # "iH":I
    .end local v2    # "iW":I
    :cond_1
    const/16 v0, 0x160

    .restart local v0    # "iH":I
    const/16 v2, 0x120

    .line 62
    .restart local v2    # "iW":I
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v3

    invoke-virtual {v3, v2, v0}, Lh264/com/H264Android;->InitDecoder4(II)I

    move-result v1

    .line 64
    goto :goto_0

    .line 78
    .end local v0    # "iH":I
    .end local v2    # "iW":I
    :cond_2
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v3

    iget v3, v3, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri4:I

    if-ne v3, v6, :cond_3

    .line 80
    const/16 v0, 0xf0

    .restart local v0    # "iH":I
    const/16 v2, 0x140

    .line 81
    .restart local v2    # "iW":I
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v3

    invoke-virtual {v3, v2, v0}, Lh264/com/H264Android;->InitDecoder4(II)I

    move-result v1

    .line 82
    goto :goto_0

    .line 85
    .end local v0    # "iH":I
    .end local v2    # "iW":I
    :cond_3
    const/16 v0, 0x140

    .restart local v0    # "iH":I
    const/16 v2, 0xf0

    .line 86
    .restart local v2    # "iW":I
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v3

    invoke-virtual {v3, v2, v0}, Lh264/com/H264Android;->InitDecoder4(II)I

    move-result v1

    goto :goto_0

    .line 98
    :cond_4
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lh264/com/AVDecoder4Service$AVDecodeVedioRunnableExt;

    invoke-direct {v4, p0}, Lh264/com/AVDecoder4Service$AVDecodeVedioRunnableExt;-><init>(Lh264/com/AVDecoder4Service;)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v3, p0, Lh264/com/AVDecoder4Service;->mDecodeVedioThread:Ljava/lang/Thread;

    .line 99
    iget-object v3, p0, Lh264/com/AVDecoder4Service;->mDecodeVedioThread:Ljava/lang/Thread;

    const-string v4, "AVDecodeVedioRunnableExt"

    invoke-virtual {v3, v4}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 100
    iget-object v3, p0, Lh264/com/AVDecoder4Service;->mDecodeVedioThread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto :goto_1
.end method

.method static synthetic access$0(Lh264/com/AVDecoder4Service;)Z
    .locals 1

    .prologue
    .line 26
    iget-boolean v0, p0, Lh264/com/AVDecoder4Service;->isDecoderVedioThread:Z

    return v0
.end method

.method static synthetic access$1(Lh264/com/AVDecoder4Service;Z)V
    .locals 0

    .prologue
    .line 26
    iput-boolean p1, p0, Lh264/com/AVDecoder4Service;->isDecoderVedioThread:Z

    return-void
.end method


# virtual methods
.method public release()V
    .locals 1

    .prologue
    .line 269
    invoke-static {}, Lh264/com/H264Android;->getInstance()Lh264/com/H264Android;

    move-result-object v0

    invoke-virtual {v0}, Lh264/com/H264Android;->UninitDecoder4()I

    .line 271
    const/4 v0, 0x0

    iput-boolean v0, p0, Lh264/com/AVDecoder4Service;->isDecoderVedioThread:Z

    .line 272
    return-void
.end method
