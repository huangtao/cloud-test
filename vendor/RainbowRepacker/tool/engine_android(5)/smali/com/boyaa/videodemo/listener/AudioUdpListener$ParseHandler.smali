.class Lcom/boyaa/videodemo/listener/AudioUdpListener$ParseHandler;
.super Landroid/os/Handler;
.source "AudioUdpListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videodemo/listener/AudioUdpListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ParseHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videodemo/listener/AudioUdpListener;


# direct methods
.method private constructor <init>(Lcom/boyaa/videodemo/listener/AudioUdpListener;)V
    .locals 0

    .prologue
    .line 63
    iput-object p1, p0, Lcom/boyaa/videodemo/listener/AudioUdpListener$ParseHandler;->this$0:Lcom/boyaa/videodemo/listener/AudioUdpListener;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/boyaa/videodemo/listener/AudioUdpListener;Lcom/boyaa/videodemo/listener/AudioUdpListener$ParseHandler;)V
    .locals 0

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/boyaa/videodemo/listener/AudioUdpListener$ParseHandler;-><init>(Lcom/boyaa/videodemo/listener/AudioUdpListener;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 69
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 70
    iget v3, p1, Landroid/os/Message;->what:I

    packed-switch v3, :pswitch_data_0

    .line 91
    :cond_0
    :goto_0
    return-void

    .line 73
    :pswitch_0
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/example/tutorial/VideoProto$VideoMessage;

    .line 74
    .local v1, "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    if-eqz v1, :cond_0

    .line 77
    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageHead()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    .line 78
    .local v0, "head":Lcom/example/tutorial/VideoProto$MessageHead;
    if-eqz v0, :cond_0

    .line 81
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MessageHead;->getMessageBodyName()Ljava/lang/String;

    move-result-object v2

    .line 83
    .local v2, "messageName":Ljava/lang/String;
    invoke-static {v2}, Lcom/boyaa/videodemo/utils/ProbufTag;->GetMessageName(Ljava/lang/String;)I

    move-result v3

    packed-switch v3, :pswitch_data_1

    goto :goto_0

    .line 86
    :pswitch_1
    const-string v3, "AudioUdpListener"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " --"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioUdpListener$ParseHandler;->this$0:Lcom/boyaa/videodemo/listener/AudioUdpListener;

    invoke-virtual {v3, v1}, Lcom/boyaa/videodemo/listener/AudioUdpListener;->audioNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V

    goto :goto_0

    .line 70
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch

    .line 83
    :pswitch_data_1
    .packed-switch 0x7
        :pswitch_1
    .end packed-switch
.end method
