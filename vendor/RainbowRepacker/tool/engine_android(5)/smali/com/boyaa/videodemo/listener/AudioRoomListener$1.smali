.class Lcom/boyaa/videodemo/listener/AudioRoomListener$1;
.super Landroid/os/Handler;
.source "AudioRoomListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videodemo/listener/AudioRoomListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videodemo/listener/AudioRoomListener;


# direct methods
.method constructor <init>(Lcom/boyaa/videodemo/listener/AudioRoomListener;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener$1;->this$0:Lcom/boyaa/videodemo/listener/AudioRoomListener;

    .line 88
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 94
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 95
    iget v3, p1, Landroid/os/Message;->what:I

    packed-switch v3, :pswitch_data_0

    .line 164
    :cond_0
    :goto_0
    return-void

    .line 98
    :pswitch_0
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/example/tutorial/VideoProto$VideoMessage;

    .line 99
    .local v1, "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    if-eqz v1, :cond_0

    .line 102
    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageHead()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    .line 103
    .local v0, "head":Lcom/example/tutorial/VideoProto$MessageHead;
    if-eqz v0, :cond_0

    .line 106
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MessageHead;->getMessageBodyName()Ljava/lang/String;

    move-result-object v2

    .line 108
    .local v2, "messageName":Ljava/lang/String;
    invoke-static {v2}, Lcom/boyaa/videodemo/utils/ProbufTag;->GetMessageName(Ljava/lang/String;)I

    move-result v3

    packed-switch v3, :pswitch_data_1

    :pswitch_1
    goto :goto_0

    .line 111
    :pswitch_2
    const-string v3, "AudioRoomListener1"

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

    .line 112
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener$1;->this$0:Lcom/boyaa/videodemo/listener/AudioRoomListener;

    invoke-virtual {v3, v1}, Lcom/boyaa/videodemo/listener/AudioRoomListener;->getLoginAudioRoomResponse(Lcom/example/tutorial/VideoProto$VideoMessage;)V

    goto :goto_0

    .line 115
    :pswitch_3
    const-string v3, "AudioRoomListener1"

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

    .line 116
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener$1;->this$0:Lcom/boyaa/videodemo/listener/AudioRoomListener;

    invoke-virtual {v3, v1}, Lcom/boyaa/videodemo/listener/AudioRoomListener;->getVedioNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V

    goto :goto_0

    .line 119
    :pswitch_4
    const-string v3, "AudioRoomListener1"

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

    .line 120
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener$1;->this$0:Lcom/boyaa/videodemo/listener/AudioRoomListener;

    invoke-virtual {v3, v1}, Lcom/boyaa/videodemo/listener/AudioRoomListener;->getEnterRoomNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V

    goto :goto_0

    .line 123
    :pswitch_5
    const-string v3, "AudioRoomListener1"

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

    .line 124
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener$1;->this$0:Lcom/boyaa/videodemo/listener/AudioRoomListener;

    invoke-virtual {v3, v1}, Lcom/boyaa/videodemo/listener/AudioRoomListener;->getLeaveRoomNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V

    goto/16 :goto_0

    .line 127
    :pswitch_6
    const-string v3, "AudioRoomListener1"

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

    .line 128
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener$1;->this$0:Lcom/boyaa/videodemo/listener/AudioRoomListener;

    invoke-virtual {v3, v1}, Lcom/boyaa/videodemo/listener/AudioRoomListener;->upMicResponse(Lcom/example/tutorial/VideoProto$VideoMessage;)V

    goto/16 :goto_0

    .line 131
    :pswitch_7
    const-string v3, "AudioRoomListener1"

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

    .line 132
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener$1;->this$0:Lcom/boyaa/videodemo/listener/AudioRoomListener;

    invoke-virtual {v3, v1}, Lcom/boyaa/videodemo/listener/AudioRoomListener;->downMicResponse(Lcom/example/tutorial/VideoProto$VideoMessage;)V

    goto/16 :goto_0

    .line 135
    :pswitch_8
    const-string v3, "AudioRoomListener1"

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

    .line 136
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener$1;->this$0:Lcom/boyaa/videodemo/listener/AudioRoomListener;

    invoke-virtual {v3, v1}, Lcom/boyaa/videodemo/listener/AudioRoomListener;->audioNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V

    goto/16 :goto_0

    .line 139
    :pswitch_9
    const-string v3, "AudioRoomListener1"

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

    .line 140
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener$1;->this$0:Lcom/boyaa/videodemo/listener/AudioRoomListener;

    invoke-virtual {v3, v1}, Lcom/boyaa/videodemo/listener/AudioRoomListener;->upMicNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V

    goto/16 :goto_0

    .line 143
    :pswitch_a
    const-string v3, "AudioRoomListener1"

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

    .line 144
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener$1;->this$0:Lcom/boyaa/videodemo/listener/AudioRoomListener;

    invoke-virtual {v3, v1}, Lcom/boyaa/videodemo/listener/AudioRoomListener;->downMicNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V

    goto/16 :goto_0

    .line 147
    :pswitch_b
    const-string v3, "AudioRoomListener1"

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

    .line 148
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener$1;->this$0:Lcom/boyaa/videodemo/listener/AudioRoomListener;

    invoke-virtual {v3, v1}, Lcom/boyaa/videodemo/listener/AudioRoomListener;->meiaControlResponse(Lcom/example/tutorial/VideoProto$VideoMessage;)V

    goto/16 :goto_0

    .line 151
    :pswitch_c
    const-string v3, "AudioRoomListener1"

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

    .line 152
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener$1;->this$0:Lcom/boyaa/videodemo/listener/AudioRoomListener;

    invoke-virtual {v3, v1}, Lcom/boyaa/videodemo/listener/AudioRoomListener;->audioControlNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V

    goto/16 :goto_0

    .line 155
    :pswitch_d
    const-string v3, "AudioRoomListener1"

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

    .line 156
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener$1;->this$0:Lcom/boyaa/videodemo/listener/AudioRoomListener;

    invoke-virtual {v3, v1}, Lcom/boyaa/videodemo/listener/AudioRoomListener;->audioControlResponse(Lcom/example/tutorial/VideoProto$VideoMessage;)V

    goto/16 :goto_0

    .line 95
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch

    .line 108
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_b
        :pswitch_c
        :pswitch_d
    .end packed-switch
.end method
