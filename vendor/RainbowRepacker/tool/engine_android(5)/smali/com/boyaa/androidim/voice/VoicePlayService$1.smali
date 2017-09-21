.class Lcom/boyaa/androidim/voice/VoicePlayService$1;
.super Landroid/os/Handler;
.source "VoicePlayService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/androidim/voice/VoicePlayService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/androidim/voice/VoicePlayService;


# direct methods
.method constructor <init>(Lcom/boyaa/androidim/voice/VoicePlayService;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/androidim/voice/VoicePlayService$1;->this$0:Lcom/boyaa/androidim/voice/VoicePlayService;

    .line 128
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 133
    if-eqz p1, :cond_0

    .line 134
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 145
    :cond_0
    :goto_0
    return-void

    .line 136
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/boyaa/androidim/voice/VoiceBeanPlay;

    .line 137
    .local v0, "bean":Lcom/boyaa/androidim/voice/VoiceBeanPlay;
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService$1;->this$0:Lcom/boyaa/androidim/voice/VoicePlayService;

    iget-object v2, v0, Lcom/boyaa/androidim/voice/VoiceBeanPlay;->path:Ljava/lang/String;

    iget-object v3, v0, Lcom/boyaa/androidim/voice/VoiceBeanPlay;->listener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    # invokes: Lcom/boyaa/androidim/voice/VoicePlayService;->playAudio(Ljava/lang/String;Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;)V
    invoke-static {v1, v2, v3}, Lcom/boyaa/androidim/voice/VoicePlayService;->access$0(Lcom/boyaa/androidim/voice/VoicePlayService;Ljava/lang/String;Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;)V

    goto :goto_0

    .line 141
    .end local v0    # "bean":Lcom/boyaa/androidim/voice/VoiceBeanPlay;
    :pswitch_1
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoicePlayService$1;->this$0:Lcom/boyaa/androidim/voice/VoicePlayService;

    # invokes: Lcom/boyaa/androidim/voice/VoicePlayService;->stopAudio()V
    invoke-static {v1}, Lcom/boyaa/androidim/voice/VoicePlayService;->access$1(Lcom/boyaa/androidim/voice/VoicePlayService;)V

    goto :goto_0

    .line 134
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
