.class public Lboyaa/speex/WebRtcUtils;
.super Ljava/lang/Object;
.source "WebRtcUtils.java"


# static fields
.field private static mInstance:Lboyaa/speex/WebRtcUtils;

.field public static t_analyze:J

.field public static t_capture:J

.field public static t_process:J

.field public static t_render:J

.field public static t_value:J

.field public static webrtc_aecm:Lboyaa/speex/WebRTCAEC;

.field public static webrtc_ns:Lboyaa/speex/WebRTCNS;

.field public static webrtc_vad:Lboyaa/speex/WebRTCVAD;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const-wide/16 v0, 0x0

    .line 15
    sput-wide v0, Lboyaa/speex/WebRtcUtils;->t_capture:J

    .line 16
    sput-wide v0, Lboyaa/speex/WebRtcUtils;->t_process:J

    .line 17
    sput-wide v0, Lboyaa/speex/WebRtcUtils;->t_analyze:J

    .line 18
    sput-wide v0, Lboyaa/speex/WebRtcUtils;->t_render:J

    .line 20
    sput-wide v0, Lboyaa/speex/WebRtcUtils;->t_value:J

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    sput-object p0, Lboyaa/speex/WebRtcUtils;->mInstance:Lboyaa/speex/WebRtcUtils;

    .line 26
    new-instance v0, Lboyaa/speex/WebRTCNS;

    invoke-direct {v0}, Lboyaa/speex/WebRTCNS;-><init>()V

    invoke-virtual {v0}, Lboyaa/speex/WebRTCNS;->prepare()Lboyaa/speex/WebRTCNS;

    move-result-object v0

    sput-object v0, Lboyaa/speex/WebRtcUtils;->webrtc_ns:Lboyaa/speex/WebRTCNS;

    .line 36
    return-void
.end method

.method public static getInstance()Lboyaa/speex/WebRtcUtils;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lboyaa/speex/WebRtcUtils;->mInstance:Lboyaa/speex/WebRtcUtils;

    if-eqz v0, :cond_0

    .line 41
    sget-object v0, Lboyaa/speex/WebRtcUtils;->mInstance:Lboyaa/speex/WebRtcUtils;

    .line 43
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lboyaa/speex/WebRtcUtils;

    invoke-direct {v0}, Lboyaa/speex/WebRtcUtils;-><init>()V

    goto :goto_0
.end method


# virtual methods
.method public Free()V
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lboyaa/speex/WebRtcUtils;->mInstance:Lboyaa/speex/WebRtcUtils;

    if-eqz v0, :cond_0

    .line 51
    sget-object v0, Lboyaa/speex/WebRtcUtils;->webrtc_ns:Lboyaa/speex/WebRTCNS;

    invoke-virtual {v0}, Lboyaa/speex/WebRTCNS;->close()V

    .line 63
    const/4 v0, 0x0

    sput-object v0, Lboyaa/speex/WebRtcUtils;->mInstance:Lboyaa/speex/WebRtcUtils;

    .line 65
    :cond_0
    return-void
.end method

.method public native capture([SI[SI)I
.end method

.method public native deinit()V
.end method

.method public native init()I
.end method

.method public native playback([SI)I
.end method
