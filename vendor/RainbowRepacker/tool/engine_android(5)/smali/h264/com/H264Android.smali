.class public Lh264/com/H264Android;
.super Ljava/lang/Object;
.source "H264Android.java"


# static fields
.field public static mInstance:Lh264/com/H264Android;

.field private static mSynlock:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lh264/com/H264Android;->mSynlock:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lh264/com/H264Android;
    .locals 2

    .prologue
    .line 12
    sget-object v1, Lh264/com/H264Android;->mSynlock:[B

    monitor-enter v1

    .line 13
    :try_start_0
    sget-object v0, Lh264/com/H264Android;->mInstance:Lh264/com/H264Android;

    if-nez v0, :cond_0

    .line 14
    new-instance v0, Lh264/com/H264Android;

    invoke-direct {v0}, Lh264/com/H264Android;-><init>()V

    sput-object v0, Lh264/com/H264Android;->mInstance:Lh264/com/H264Android;

    .line 16
    :cond_0
    sget-object v0, Lh264/com/H264Android;->mInstance:Lh264/com/H264Android;

    monitor-exit v1

    return-object v0

    .line 12
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public native DecoderNal([BI[BI)I
.end method

.method public native DecoderNal3([BI[BI)I
.end method

.method public native DecoderNal4([BI[BI)I
.end method

.method public native DecoderNal5([BI[BI)I
.end method

.method public native DecoderNal6([BI[BI)I
.end method

.method public native DecoderNal7([BI[BI)I
.end method

.method public native DecoderNalExt([BI[BI)I
.end method

.method public native InitDecoder(II)I
.end method

.method public native InitDecoder3(II)I
.end method

.method public native InitDecoder4(II)I
.end method

.method public native InitDecoder5(II)I
.end method

.method public native InitDecoder6(II)I
.end method

.method public native InitDecoder7(II)I
.end method

.method public native InitDecoderExt(II)I
.end method

.method public native UninitDecoder()I
.end method

.method public native UninitDecoder3()I
.end method

.method public native UninitDecoder4()I
.end method

.method public native UninitDecoder5()I
.end method

.method public native UninitDecoder6()I
.end method

.method public native UninitDecoder7()I
.end method

.method public native UninitDecoderExt()I
.end method

.method public native setNativeSurface(Landroid/view/Surface;III)V
.end method

.method public native setNativeSurface3(Landroid/view/Surface;III)V
.end method

.method public native setNativeSurface4(Landroid/view/Surface;III)V
.end method

.method public native setNativeSurface5(Landroid/view/Surface;III)V
.end method

.method public native setNativeSurface6(Landroid/view/Surface;III)V
.end method

.method public native setNativeSurface7(Landroid/view/Surface;III)V
.end method

.method public native setNativeSurfaceExt(Landroid/view/Surface;III)V
.end method
