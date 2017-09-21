.class Lcom/boyaa/videodemo/utils/BoyaaReceiver$1;
.super Landroid/telephony/PhoneStateListener;
.source "BoyaaReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videodemo/utils/BoyaaReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videodemo/utils/BoyaaReceiver;


# direct methods
.method constructor <init>(Lcom/boyaa/videodemo/utils/BoyaaReceiver;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/videodemo/utils/BoyaaReceiver$1;->this$0:Lcom/boyaa/videodemo/utils/BoyaaReceiver;

    .line 95
    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 4
    .param p1, "state"    # I
    .param p2, "incomingNumber"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 100
    invoke-super {p0, p1, p2}, Landroid/telephony/PhoneStateListener;->onCallStateChanged(ILjava/lang/String;)V

    .line 101
    packed-switch p1, :pswitch_data_0

    .line 125
    :goto_0
    return-void

    .line 103
    :pswitch_0
    const-string v0, "BoyaaReceiver"

    const-string v1, "\u6302\u65ad"

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    const/4 v0, 0x1

    sput-boolean v0, Lcom/boyaa/videodemo/utils/Constants;->isCanPlayAudio:Z

    goto :goto_0

    .line 111
    :pswitch_1
    const-string v0, "BoyaaReceiver"

    const-string v1, "\u63a5\u542c"

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    sput-boolean v3, Lcom/boyaa/videodemo/utils/Constants;->isCanPlayAudio:Z

    goto :goto_0

    .line 118
    :pswitch_2
    const-string v0, "BoyaaReceiver"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u54cd\u94c3:\u6765\u7535\u53f7\u7801"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    sput-boolean v3, Lcom/boyaa/videodemo/utils/Constants;->isCanPlayAudio:Z

    goto :goto_0

    .line 101
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
