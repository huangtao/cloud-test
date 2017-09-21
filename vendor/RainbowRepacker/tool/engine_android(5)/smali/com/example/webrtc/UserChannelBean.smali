.class public Lcom/example/webrtc/UserChannelBean;
.super Ljava/lang/Object;
.source "UserChannelBean.java"


# instance fields
.field public channel_num:I

.field public user_id:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/webrtc/UserChannelBean;->user_id:I

    .line 6
    const/16 v0, 0x64

    iput v0, p0, Lcom/example/webrtc/UserChannelBean;->channel_num:I

    .line 3
    return-void
.end method
