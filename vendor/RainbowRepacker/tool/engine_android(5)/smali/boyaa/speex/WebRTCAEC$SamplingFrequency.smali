.class public final Lboyaa/speex/WebRTCAEC$SamplingFrequency;
.super Ljava/lang/Object;
.source "WebRTCAEC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lboyaa/speex/WebRTCAEC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SamplingFrequency"
.end annotation


# static fields
.field public static final FS_16000Hz:Lboyaa/speex/WebRTCAEC$SamplingFrequency;

.field public static final FS_8000Hz:Lboyaa/speex/WebRTCAEC$SamplingFrequency;


# instance fields
.field private final mSamplingFrequency:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 37
    new-instance v0, Lboyaa/speex/WebRTCAEC$SamplingFrequency;

    .line 38
    const-wide/16 v1, 0x1f40

    .line 37
    invoke-direct {v0, v1, v2}, Lboyaa/speex/WebRTCAEC$SamplingFrequency;-><init>(J)V

    sput-object v0, Lboyaa/speex/WebRTCAEC$SamplingFrequency;->FS_8000Hz:Lboyaa/speex/WebRTCAEC$SamplingFrequency;

    .line 43
    new-instance v0, Lboyaa/speex/WebRTCAEC$SamplingFrequency;

    .line 44
    const-wide/16 v1, 0x3e80

    .line 43
    invoke-direct {v0, v1, v2}, Lboyaa/speex/WebRTCAEC$SamplingFrequency;-><init>(J)V

    sput-object v0, Lboyaa/speex/WebRTCAEC$SamplingFrequency;->FS_16000Hz:Lboyaa/speex/WebRTCAEC$SamplingFrequency;

    .line 44
    return-void
.end method

.method private constructor <init>(J)V
    .locals 0
    .param p1, "fs"    # J

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-wide p1, p0, Lboyaa/speex/WebRTCAEC$SamplingFrequency;->mSamplingFrequency:J

    .line 50
    return-void
.end method


# virtual methods
.method public getFS()J
    .locals 2

    .prologue
    .line 31
    iget-wide v0, p0, Lboyaa/speex/WebRTCAEC$SamplingFrequency;->mSamplingFrequency:J

    return-wide v0
.end method
