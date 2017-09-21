.class public Lboyaa/speex/WebRTCAEC$AecmConfig;
.super Ljava/lang/Object;
.source "WebRTCAEC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lboyaa/speex/WebRTCAEC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AecmConfig"
.end annotation


# instance fields
.field private mAecmMode:S

.field private mCngMode:S

.field final synthetic this$0:Lboyaa/speex/WebRTCAEC;


# direct methods
.method public constructor <init>(Lboyaa/speex/WebRTCAEC;)V
    .locals 1

    .prologue
    .line 314
    iput-object p1, p0, Lboyaa/speex/WebRTCAEC$AecmConfig;->this$0:Lboyaa/speex/WebRTCAEC;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 315
    sget-object v0, Lboyaa/speex/WebRTCAEC$AggressiveMode;->AGGRESSIVE:Lboyaa/speex/WebRTCAEC$AggressiveMode;

    invoke-virtual {v0}, Lboyaa/speex/WebRTCAEC$AggressiveMode;->getMode()I

    move-result v0

    int-to-short v0, v0

    iput-short v0, p0, Lboyaa/speex/WebRTCAEC$AecmConfig;->mAecmMode:S

    .line 316
    const/4 v0, 0x1

    iput-short v0, p0, Lboyaa/speex/WebRTCAEC$AecmConfig;->mCngMode:S

    return-void
.end method

.method static synthetic access$0(Lboyaa/speex/WebRTCAEC$AecmConfig;S)V
    .locals 0

    .prologue
    .line 315
    iput-short p1, p0, Lboyaa/speex/WebRTCAEC$AecmConfig;->mAecmMode:S

    return-void
.end method
