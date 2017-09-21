.class public Lcom/boyaa/audio/AudioCodec;
.super Ljava/lang/Object;
.source "AudioCodec.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 6
    const-string v0, "boyaa_ilbc"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native audio_codec_init(I)I
.end method

.method public static native audio_decode([BII[BI)I
.end method

.method public static native audio_encode([BII[BI)I
.end method
