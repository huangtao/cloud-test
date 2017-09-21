.class public Lboyaa/speex/WebRTCAEC;
.super Ljava/lang/Object;
.source "WebRTCAEC.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lboyaa/speex/WebRTCAEC$AecmConfig;,
        Lboyaa/speex/WebRTCAEC$AggressiveMode;,
        Lboyaa/speex/WebRTCAEC$SamplingFrequency;
    }
.end annotation


# static fields
.field public static final AECM_ENABLE:S = 0x1s

.field public static final AECM_UNABLE:S


# instance fields
.field private mAecmConfig:Lboyaa/speex/WebRTCAEC$AecmConfig;

.field private mAecmHandler:I

.field private mIsInit:Z

.field private mSampFreq:Lboyaa/speex/WebRTCAEC$SamplingFrequency;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 6
    const-string v0, "webrtc_acem"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 20
    return-void
.end method

.method public constructor <init>(Lboyaa/speex/WebRTCAEC$SamplingFrequency;)V
    .locals 2
    .param p1, "sampFreqOfData"    # Lboyaa/speex/WebRTCAEC$SamplingFrequency;

    .prologue
    const/4 v1, 0x0

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    const/4 v0, -0x1

    iput v0, p0, Lboyaa/speex/WebRTCAEC;->mAecmHandler:I

    .line 104
    iput-object v1, p0, Lboyaa/speex/WebRTCAEC;->mAecmConfig:Lboyaa/speex/WebRTCAEC$AecmConfig;

    .line 105
    iput-object v1, p0, Lboyaa/speex/WebRTCAEC;->mSampFreq:Lboyaa/speex/WebRTCAEC$SamplingFrequency;

    .line 106
    const/4 v0, 0x0

    iput-boolean v0, p0, Lboyaa/speex/WebRTCAEC;->mIsInit:Z

    .line 119
    invoke-virtual {p0, p1}, Lboyaa/speex/WebRTCAEC;->setSampFreq(Lboyaa/speex/WebRTCAEC$SamplingFrequency;)V

    .line 120
    new-instance v0, Lboyaa/speex/WebRTCAEC$AecmConfig;

    invoke-direct {v0, p0}, Lboyaa/speex/WebRTCAEC$AecmConfig;-><init>(Lboyaa/speex/WebRTCAEC;)V

    iput-object v0, p0, Lboyaa/speex/WebRTCAEC;->mAecmConfig:Lboyaa/speex/WebRTCAEC$AecmConfig;

    .line 123
    invoke-static {}, Lboyaa/speex/WebRTCAEC;->nativeCreateAecmInstance()I

    move-result v0

    iput v0, p0, Lboyaa/speex/WebRTCAEC;->mAecmHandler:I

    .line 124
    return-void
.end method

.method private mInitAecmInstance(I)V
    .locals 2
    .param p1, "SampFreq"    # I

    .prologue
    .line 291
    iget-boolean v0, p0, Lboyaa/speex/WebRTCAEC;->mIsInit:Z

    if-nez v0, :cond_0

    .line 292
    iget v0, p0, Lboyaa/speex/WebRTCAEC;->mAecmHandler:I

    invoke-static {v0, p1}, Lboyaa/speex/WebRTCAEC;->nativeInitializeAecmInstance(II)I

    .line 295
    new-instance v0, Lboyaa/speex/WebRTCAEC$AecmConfig;

    invoke-direct {v0, p0}, Lboyaa/speex/WebRTCAEC$AecmConfig;-><init>(Lboyaa/speex/WebRTCAEC;)V

    iput-object v0, p0, Lboyaa/speex/WebRTCAEC;->mAecmConfig:Lboyaa/speex/WebRTCAEC$AecmConfig;

    .line 298
    iget v0, p0, Lboyaa/speex/WebRTCAEC;->mAecmHandler:I

    iget-object v1, p0, Lboyaa/speex/WebRTCAEC;->mAecmConfig:Lboyaa/speex/WebRTCAEC$AecmConfig;

    invoke-static {v0, v1}, Lboyaa/speex/WebRTCAEC;->nativeSetConfig(ILboyaa/speex/WebRTCAEC$AecmConfig;)I

    .line 300
    const/4 v0, 0x1

    iput-boolean v0, p0, Lboyaa/speex/WebRTCAEC;->mIsInit:Z

    .line 302
    :cond_0
    return-void
.end method

.method private static native nativeAecmProcess(I[S[S[SSS)I
.end method

.method private static native nativeBufferFarend(I[SI)I
.end method

.method private static native nativeCreateAecmInstance()I
.end method

.method private static native nativeFreeAecmInstance(I)I
.end method

.method private static native nativeInitializeAecmInstance(II)I
.end method

.method private static native nativeSetConfig(ILboyaa/speex/WebRTCAEC$AecmConfig;)I
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 263
    iget-boolean v0, p0, Lboyaa/speex/WebRTCAEC;->mIsInit:Z

    if-eqz v0, :cond_0

    .line 264
    iget v0, p0, Lboyaa/speex/WebRTCAEC;->mAecmHandler:I

    invoke-static {v0}, Lboyaa/speex/WebRTCAEC;->nativeFreeAecmInstance(I)I

    .line 265
    const/4 v0, -0x1

    iput v0, p0, Lboyaa/speex/WebRTCAEC;->mAecmHandler:I

    .line 266
    const/4 v0, 0x0

    iput-boolean v0, p0, Lboyaa/speex/WebRTCAEC;->mIsInit:Z

    .line 268
    :cond_0
    return-void
.end method

.method public echoCancellation([S[S[SSS)I
    .locals 8
    .param p1, "nearendNoisy"    # [S
    .param p2, "nearendClean"    # [S
    .param p3, "out"    # [S
    .param p4, "numOfSamples"    # S
    .param p5, "delay"    # S

    .prologue
    const/4 v7, -0x1

    .line 202
    :try_start_0
    iget-boolean v0, p0, Lboyaa/speex/WebRTCAEC;->mIsInit:Z

    if-nez v0, :cond_0

    .line 214
    :goto_0
    return v7

    .line 206
    :cond_0
    iget v0, p0, Lboyaa/speex/WebRTCAEC;->mAecmHandler:I

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v5}, Lboyaa/speex/WebRTCAEC;->nativeAecmProcess(I[S[S[SSS)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    .line 209
    .local v7, "iRet":I
    goto :goto_0

    .line 211
    .end local v7    # "iRet":I
    :catch_0
    move-exception v6

    .line 213
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public farendBuffer([SI)I
    .locals 1
    .param p1, "farendBuf"    # [S
    .param p2, "numOfSamples"    # I

    .prologue
    .line 155
    iget-boolean v0, p0, Lboyaa/speex/WebRTCAEC;->mIsInit:Z

    if-nez v0, :cond_0

    .line 159
    const/4 v0, -0x1

    .line 168
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lboyaa/speex/WebRTCAEC;->mAecmHandler:I

    invoke-static {v0, p1, p2}, Lboyaa/speex/WebRTCAEC;->nativeBufferFarend(I[SI)I

    move-result v0

    goto :goto_0
.end method

.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 275
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 277
    iget-boolean v0, p0, Lboyaa/speex/WebRTCAEC;->mIsInit:Z

    if-eqz v0, :cond_0

    .line 278
    invoke-virtual {p0}, Lboyaa/speex/WebRTCAEC;->close()V

    .line 280
    :cond_0
    return-void
.end method

.method public prepare()Lboyaa/speex/WebRTCAEC;
    .locals 2

    .prologue
    .line 244
    iget-boolean v0, p0, Lboyaa/speex/WebRTCAEC;->mIsInit:Z

    if-eqz v0, :cond_0

    .line 245
    invoke-virtual {p0}, Lboyaa/speex/WebRTCAEC;->close()V

    .line 246
    invoke-static {}, Lboyaa/speex/WebRTCAEC;->nativeCreateAecmInstance()I

    move-result v0

    iput v0, p0, Lboyaa/speex/WebRTCAEC;->mAecmHandler:I

    .line 249
    :cond_0
    iget-object v0, p0, Lboyaa/speex/WebRTCAEC;->mSampFreq:Lboyaa/speex/WebRTCAEC$SamplingFrequency;

    invoke-virtual {v0}, Lboyaa/speex/WebRTCAEC$SamplingFrequency;->getFS()J

    move-result-wide v0

    long-to-int v0, v0

    invoke-direct {p0, v0}, Lboyaa/speex/WebRTCAEC;->mInitAecmInstance(I)V

    .line 250
    const/4 v0, 0x1

    iput-boolean v0, p0, Lboyaa/speex/WebRTCAEC;->mIsInit:Z

    .line 253
    iget v0, p0, Lboyaa/speex/WebRTCAEC;->mAecmHandler:I

    iget-object v1, p0, Lboyaa/speex/WebRTCAEC;->mAecmConfig:Lboyaa/speex/WebRTCAEC$AecmConfig;

    invoke-static {v0, v1}, Lboyaa/speex/WebRTCAEC;->nativeSetConfig(ILboyaa/speex/WebRTCAEC$AecmConfig;)I

    .line 254
    return-object p0
.end method

.method public setAecmMode(Lboyaa/speex/WebRTCAEC$AggressiveMode;)Lboyaa/speex/WebRTCAEC;
    .locals 2
    .param p1, "mode"    # Lboyaa/speex/WebRTCAEC$AggressiveMode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .prologue
    .line 229
    if-nez p1, :cond_0

    .line 230
    new-instance v0, Ljava/lang/NullPointerException;

    .line 231
    const-string v1, "setAecMode() failed due to null argument."

    .line 230
    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 233
    :cond_0
    iget-object v0, p0, Lboyaa/speex/WebRTCAEC;->mAecmConfig:Lboyaa/speex/WebRTCAEC$AecmConfig;

    invoke-virtual {p1}, Lboyaa/speex/WebRTCAEC$AggressiveMode;->getMode()I

    move-result v1

    int-to-short v1, v1

    invoke-static {v0, v1}, Lboyaa/speex/WebRTCAEC$AecmConfig;->access$0(Lboyaa/speex/WebRTCAEC$AecmConfig;S)V

    .line 234
    return-object p0
.end method

.method public setSampFreq(Lboyaa/speex/WebRTCAEC$SamplingFrequency;)V
    .locals 1
    .param p1, "fs"    # Lboyaa/speex/WebRTCAEC$SamplingFrequency;

    .prologue
    .line 137
    if-nez p1, :cond_0

    .line 138
    sget-object v0, Lboyaa/speex/WebRTCAEC$SamplingFrequency;->FS_8000Hz:Lboyaa/speex/WebRTCAEC$SamplingFrequency;

    iput-object v0, p0, Lboyaa/speex/WebRTCAEC;->mSampFreq:Lboyaa/speex/WebRTCAEC$SamplingFrequency;

    .line 141
    :goto_0
    return-void

    .line 140
    :cond_0
    iput-object p1, p0, Lboyaa/speex/WebRTCAEC;->mSampFreq:Lboyaa/speex/WebRTCAEC$SamplingFrequency;

    goto :goto_0
.end method
