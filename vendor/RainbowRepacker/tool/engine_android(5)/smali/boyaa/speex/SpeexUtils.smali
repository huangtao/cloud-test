.class public Lboyaa/speex/SpeexUtils;
.super Ljava/lang/Object;
.source "SpeexUtils.java"


# instance fields
.field protected final DEFAULT_BITRATE:I

.field protected codeccode:I

.field protected final framesize:I

.field public speex:Lboyaa/speex/Speex;

.field protected final speex_pt:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "codeccode"    # I

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const/16 v0, 0x65

    iput v0, p0, Lboyaa/speex/SpeexUtils;->speex_pt:I

    .line 9
    const/16 v0, 0xa0

    iput v0, p0, Lboyaa/speex/SpeexUtils;->framesize:I

    .line 10
    const v0, 0xfa00

    iput v0, p0, Lboyaa/speex/SpeexUtils;->DEFAULT_BITRATE:I

    .line 13
    iput p1, p0, Lboyaa/speex/SpeexUtils;->codeccode:I

    .line 14
    invoke-virtual {p0}, Lboyaa/speex/SpeexUtils;->init()V

    .line 15
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lboyaa/speex/SpeexUtils;->speex:Lboyaa/speex/Speex;

    invoke-virtual {v0}, Lboyaa/speex/Speex;->close()V

    .line 50
    return-void
.end method

.method public decode([B[SI)I
    .locals 1
    .param p1, "encoded"    # [B
    .param p2, "lin"    # [S
    .param p3, "size"    # I

    .prologue
    .line 38
    iget-object v0, p0, Lboyaa/speex/SpeexUtils;->speex:Lboyaa/speex/Speex;

    invoke-virtual {v0, p1, p2, p3}, Lboyaa/speex/Speex;->decode([B[SI)I

    move-result v0

    return v0
.end method

.method public encode([SI[BI)I
    .locals 1
    .param p1, "lin"    # [S
    .param p2, "offset"    # I
    .param p3, "encoded"    # [B
    .param p4, "size"    # I

    .prologue
    .line 43
    iget-object v0, p0, Lboyaa/speex/SpeexUtils;->speex:Lboyaa/speex/Speex;

    invoke-virtual {v0, p1, p2, p3, p4}, Lboyaa/speex/Speex;->encode([SI[BI)I

    move-result v0

    return v0
.end method

.method public getFrameSize()I
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lboyaa/speex/SpeexUtils;->speex:Lboyaa/speex/Speex;

    invoke-virtual {v0}, Lboyaa/speex/Speex;->getFrameSize()I

    move-result v0

    return v0
.end method

.method public init()V
    .locals 1

    .prologue
    .line 19
    new-instance v0, Lboyaa/speex/Speex;

    invoke-direct {v0}, Lboyaa/speex/Speex;-><init>()V

    iput-object v0, p0, Lboyaa/speex/SpeexUtils;->speex:Lboyaa/speex/Speex;

    .line 20
    iget-object v0, p0, Lboyaa/speex/SpeexUtils;->speex:Lboyaa/speex/Speex;

    invoke-virtual {v0}, Lboyaa/speex/Speex;->init()V

    .line 22
    return-void
.end method

.method public open(I)I
    .locals 1
    .param p1, "compression"    # I

    .prologue
    .line 26
    iget-object v0, p0, Lboyaa/speex/SpeexUtils;->speex:Lboyaa/speex/Speex;

    invoke-virtual {v0, p1}, Lboyaa/speex/Speex;->open(I)I

    move-result v0

    return v0
.end method
