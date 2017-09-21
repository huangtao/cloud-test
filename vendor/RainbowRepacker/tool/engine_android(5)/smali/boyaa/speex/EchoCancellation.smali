.class public Lboyaa/speex/EchoCancellation;
.super Ljava/lang/Object;
.source "EchoCancellation.java"


# static fields
.field static final filterlength:I = 0x64

.field static final framesize:I = 0xa0


# instance fields
.field private played:[S

.field private speex_echo:Lboyaa/speex/Speex;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/16 v2, 0xa0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    new-instance v1, Lboyaa/speex/Speex;

    invoke-direct {v1}, Lboyaa/speex/Speex;-><init>()V

    iput-object v1, p0, Lboyaa/speex/EchoCancellation;->speex_echo:Lboyaa/speex/Speex;

    .line 13
    new-array v1, v2, [S

    iput-object v1, p0, Lboyaa/speex/EchoCancellation;->played:[S

    .line 15
    const/16 v1, 0x64

    invoke-static {v2, v1}, Lboyaa/speex/Speex;->echoinit(II)I

    move-result v0

    .line 16
    .local v0, "iRet":I
    if-nez v0, :cond_0

    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public echo_ns([S)I
    .locals 1
    .param p1, "capture"    # [S

    .prologue
    .line 24
    const/4 v0, 0x0

    return v0
.end method

.method public echo_playback([S)V
    .locals 3
    .param p1, "play"    # [S

    .prologue
    const/4 v2, 0x0

    .line 29
    iget-object v0, p0, Lboyaa/speex/EchoCancellation;->played:[S

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 34
    return-void
.end method

.method public free()V
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lboyaa/speex/EchoCancellation;->speex_echo:Lboyaa/speex/Speex;

    if-eqz v0, :cond_0

    .line 39
    invoke-static {}, Lboyaa/speex/Speex;->echoclose()V

    .line 40
    :cond_0
    return-void
.end method
