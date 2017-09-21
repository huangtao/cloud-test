.class public Lboyaa/speex/WebRTCNS;
.super Ljava/lang/Object;
.source "WebRTCNS.java"


# instance fields
.field private mIsInit:Z

.field private mNSHandler:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const-string v0, "webrtc_ns"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/4 v0, -0x1

    iput v0, p0, Lboyaa/speex/WebRTCNS;->mNSHandler:I

    .line 12
    const/4 v0, 0x0

    iput-boolean v0, p0, Lboyaa/speex/WebRTCNS;->mIsInit:Z

    .line 18
    invoke-static {}, Lboyaa/speex/WebRTCNS;->nativeCreateNSInstance()I

    move-result v0

    iput v0, p0, Lboyaa/speex/WebRTCNS;->mNSHandler:I

    .line 19
    return-void
.end method

.method private mInitNSInstance(I)V
    .locals 1
    .param p1, "iMode"    # I

    .prologue
    .line 65
    iget-boolean v0, p0, Lboyaa/speex/WebRTCNS;->mIsInit:Z

    if-nez v0, :cond_0

    .line 66
    iget v0, p0, Lboyaa/speex/WebRTCNS;->mNSHandler:I

    invoke-static {v0}, Lboyaa/speex/WebRTCNS;->nativeInitializeNSInstance(I)I

    .line 69
    iget v0, p0, Lboyaa/speex/WebRTCNS;->mNSHandler:I

    invoke-static {v0, p1}, Lboyaa/speex/WebRTCNS;->nativeSetNSConfig(II)I

    .line 71
    const/4 v0, 0x1

    iput-boolean v0, p0, Lboyaa/speex/WebRTCNS;->mIsInit:Z

    .line 73
    :cond_0
    return-void
.end method

.method private static native nativeCreateNSInstance()I
.end method

.method private static native nativeFreeNSInstance(I)I
.end method

.method private static native nativeInitializeNSInstance(I)I
.end method

.method private static native nativeNSProcess(I[S[S)I
.end method

.method private static native nativeSetNSConfig(II)I
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 52
    iget-boolean v0, p0, Lboyaa/speex/WebRTCNS;->mIsInit:Z

    if-eqz v0, :cond_0

    .line 53
    iget v0, p0, Lboyaa/speex/WebRTCNS;->mNSHandler:I

    invoke-static {v0}, Lboyaa/speex/WebRTCNS;->nativeFreeNSInstance(I)I

    .line 54
    const/4 v0, -0x1

    iput v0, p0, Lboyaa/speex/WebRTCNS;->mNSHandler:I

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lboyaa/speex/WebRTCNS;->mIsInit:Z

    .line 57
    :cond_0
    return-void
.end method

.method public echoNS([S[S)I
    .locals 5
    .param p1, "frame"    # [S
    .param p2, "out"    # [S

    .prologue
    const/4 v2, -0x1

    .line 79
    :try_start_0
    iget-boolean v3, p0, Lboyaa/speex/WebRTCNS;->mIsInit:Z

    if-nez v3, :cond_1

    move v1, v2

    .line 96
    :cond_0
    :goto_0
    return v1

    .line 84
    :cond_1
    iget v3, p0, Lboyaa/speex/WebRTCNS;->mNSHandler:I

    invoke-static {v3, p1, p2}, Lboyaa/speex/WebRTCNS;->nativeNSProcess(I[S[S)I

    move-result v1

    .line 86
    .local v1, "iRet":I
    if-ne v1, v2, :cond_0

    .line 88
    const-string v3, "RECORD"

    const-string v4, "nativeNSProcess nativeNSProcess nativeNSProcess Failed !!!!!!!!!!!"

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

.method public prepare()Lboyaa/speex/WebRTCNS;
    .locals 1

    .prologue
    .line 35
    iget-boolean v0, p0, Lboyaa/speex/WebRTCNS;->mIsInit:Z

    if-eqz v0, :cond_0

    .line 36
    invoke-virtual {p0}, Lboyaa/speex/WebRTCNS;->close()V

    .line 37
    invoke-static {}, Lboyaa/speex/WebRTCNS;->nativeCreateNSInstance()I

    move-result v0

    iput v0, p0, Lboyaa/speex/WebRTCNS;->mNSHandler:I

    .line 40
    :cond_0
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lboyaa/speex/WebRTCNS;->mInitNSInstance(I)V

    .line 41
    const/4 v0, 0x1

    iput-boolean v0, p0, Lboyaa/speex/WebRTCNS;->mIsInit:Z

    .line 43
    return-object p0
.end method
