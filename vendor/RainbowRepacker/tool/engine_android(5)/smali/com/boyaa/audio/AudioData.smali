.class public Lcom/boyaa/audio/AudioData;
.super Ljava/lang/Object;
.source "AudioData.java"


# instance fields
.field realData:[B

.field size:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getRealData()[B
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/boyaa/audio/AudioData;->realData:[B

    return-object v0
.end method

.method public getSize()I
    .locals 1

    .prologue
    .line 8
    iget v0, p0, Lcom/boyaa/audio/AudioData;->size:I

    return v0
.end method

.method public setRealData([B)V
    .locals 0
    .param p1, "realData"    # [B

    .prologue
    .line 20
    iput-object p1, p0, Lcom/boyaa/audio/AudioData;->realData:[B

    .line 21
    return-void
.end method

.method public setSize(I)V
    .locals 0
    .param p1, "size"    # I

    .prologue
    .line 12
    iput p1, p0, Lcom/boyaa/audio/AudioData;->size:I

    .line 13
    return-void
.end method
