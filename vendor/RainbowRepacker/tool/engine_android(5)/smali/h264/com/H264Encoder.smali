.class public Lh264/com/H264Encoder;
.super Ljava/lang/Object;
.source "H264Encoder.java"


# static fields
.field public static mInstance:Lh264/com/H264Encoder;

.field private static mSynlock:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 8
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lh264/com/H264Encoder;->mSynlock:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lh264/com/H264Encoder;
    .locals 2

    .prologue
    .line 11
    sget-object v1, Lh264/com/H264Encoder;->mSynlock:[B

    monitor-enter v1

    .line 12
    :try_start_0
    sget-object v0, Lh264/com/H264Encoder;->mInstance:Lh264/com/H264Encoder;

    if-nez v0, :cond_0

    .line 13
    new-instance v0, Lh264/com/H264Encoder;

    invoke-direct {v0}, Lh264/com/H264Encoder;-><init>()V

    sput-object v0, Lh264/com/H264Encoder;->mInstance:Lh264/com/H264Encoder;

    .line 15
    :cond_0
    sget-object v0, Lh264/com/H264Encoder;->mInstance:Lh264/com/H264Encoder;

    monitor-exit v1

    return-object v0

    .line 11
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public native CompressBegin(II)J
.end method

.method public native CompressBuffer(JI[BI[B)I
.end method

.method public native CompressEnd(J)I
.end method

.method public native YUVRotate90([B[BII)I
.end method
