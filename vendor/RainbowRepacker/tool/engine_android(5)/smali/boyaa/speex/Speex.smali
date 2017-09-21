.class public Lboyaa/speex/Speex;
.super Ljava/lang/Object;
.source "Speex.java"


# static fields
.field private static final DEFAULT_COMPRESSION:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native echocapture([S[S)I
.end method

.method public static native echoclose()V
.end method

.method public static native echoinit(II)I
.end method

.method public static native echoplayback([S)I
.end method


# virtual methods
.method public native close()V
.end method

.method public native decode([B[SI)I
.end method

.method public native encode([SI[BI)I
.end method

.method public native getFrameSize()I
.end method

.method public init()V
    .locals 2

    .prologue
    .line 29
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lboyaa/speex/Speex;->open(I)I

    move-result v0

    .line 30
    .local v0, "iValue":I
    return-void
.end method

.method public native open(I)I
.end method
