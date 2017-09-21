.class public Lboyaa/speex/WebRTCVAD;
.super Ljava/lang/Object;
.source "WebRTCVAD.java"


# instance fields
.field private mIsInit:Z

.field private mVADHandler:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const-string v0, "webrtc_vad"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 26
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const/4 v0, -0x1

    iput v0, p0, Lboyaa/speex/WebRTCVAD;->mVADHandler:I

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lboyaa/speex/WebRTCVAD;->mIsInit:Z

    .line 29
    invoke-static {}, Lboyaa/speex/WebRTCVAD;->nativeCreateVADInstance()I

    move-result v0

    iput v0, p0, Lboyaa/speex/WebRTCVAD;->mVADHandler:I

    .line 30
    return-void
.end method

.method private InitVADInstance(I)V
    .locals 1
    .param p1, "iMode"    # I

    .prologue
    .line 64
    iget-boolean v0, p0, Lboyaa/speex/WebRTCVAD;->mIsInit:Z

    if-nez v0, :cond_0

    .line 65
    iget v0, p0, Lboyaa/speex/WebRTCVAD;->mVADHandler:I

    invoke-static {v0}, Lboyaa/speex/WebRTCVAD;->nativeInitializeVADInstance(I)I

    .line 69
    iget v0, p0, Lboyaa/speex/WebRTCVAD;->mVADHandler:I

    invoke-static {v0, p1}, Lboyaa/speex/WebRTCVAD;->nativeSetVADConfig(II)I

    .line 71
    const/4 v0, 0x1

    iput-boolean v0, p0, Lboyaa/speex/WebRTCVAD;->mIsInit:Z

    .line 73
    :cond_0
    return-void
.end method

.method private static native nativeCreateVADInstance()I
.end method

.method public static native nativeFilter([S)I
.end method

.method private static native nativeFreeVADInstance(I)I
.end method

.method private static native nativeInitializeVADInstance(I)I
.end method

.method private static native nativeSetVADConfig(II)I
.end method

.method private static native nativeVADProcess(I[SII)I
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 51
    iget-boolean v0, p0, Lboyaa/speex/WebRTCVAD;->mIsInit:Z

    if-eqz v0, :cond_0

    .line 52
    iget v0, p0, Lboyaa/speex/WebRTCVAD;->mVADHandler:I

    invoke-static {v0}, Lboyaa/speex/WebRTCVAD;->nativeFreeVADInstance(I)I

    .line 53
    const/4 v0, -0x1

    iput v0, p0, Lboyaa/speex/WebRTCVAD;->mVADHandler:I

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lboyaa/speex/WebRTCVAD;->mIsInit:Z

    .line 56
    :cond_0
    return-void
.end method

.method public echoVAD([SII)I
    .locals 5
    .param p1, "frame"    # [S
    .param p2, "iFrameLength"    # I
    .param p3, "iSample"    # I

    .prologue
    const/4 v2, -0x1

    .line 79
    :try_start_0
    iget-boolean v3, p0, Lboyaa/speex/WebRTCVAD;->mIsInit:Z

    if-nez v3, :cond_1

    move v1, v2

    .line 96
    :cond_0
    :goto_0
    return v1

    .line 84
    :cond_1
    iget v3, p0, Lboyaa/speex/WebRTCVAD;->mVADHandler:I

    invoke-static {v3, p1, p2, p3}, Lboyaa/speex/WebRTCVAD;->nativeVADProcess(I[SII)I

    move-result v1

    .line 86
    .local v1, "iRet":I
    if-ne v1, v2, :cond_0

    .line 88
    const-string v3, "RECORD"

    const-string v4, "nativeVADProcess nativeVADProcess nativeVADProcess Failed !!!!!!!!!!!"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v1, v2

    .line 89
    goto :goto_0

    .line 94
    .end local v1    # "iRet":I
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    move v1, v2

    .line 96
    goto :goto_0
.end method

.method public prepare()Lboyaa/speex/WebRTCVAD;
    .locals 1

    .prologue
    .line 34
    iget-boolean v0, p0, Lboyaa/speex/WebRTCVAD;->mIsInit:Z

    if-eqz v0, :cond_0

    .line 35
    invoke-virtual {p0}, Lboyaa/speex/WebRTCVAD;->close()V

    .line 36
    invoke-static {}, Lboyaa/speex/WebRTCVAD;->nativeCreateVADInstance()I

    move-result v0

    iput v0, p0, Lboyaa/speex/WebRTCVAD;->mVADHandler:I

    .line 39
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lboyaa/speex/WebRTCVAD;->InitVADInstance(I)V

    .line 40
    const/4 v0, 0x1

    iput-boolean v0, p0, Lboyaa/speex/WebRTCVAD;->mIsInit:Z

    .line 42
    return-object p0
.end method
