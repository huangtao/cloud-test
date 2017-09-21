.class Lcom/boyaa/androidim/voice/VoiceService$1;
.super Landroid/os/Handler;
.source "VoiceService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/androidim/voice/VoiceService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/androidim/voice/VoiceService;


# direct methods
.method constructor <init>(Lcom/boyaa/androidim/voice/VoiceService;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/androidim/voice/VoiceService$1;->this$0:Lcom/boyaa/androidim/voice/VoiceService;

    .line 212
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 217
    if-eqz p1, :cond_0

    .line 218
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 244
    :cond_0
    :goto_0
    return-void

    .line 220
    :pswitch_0
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService$1;->this$0:Lcom/boyaa/androidim/voice/VoiceService;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/boyaa/androidim/voice/RecordOnCompleleListener;

    invoke-static {v1, v0}, Lcom/boyaa/androidim/voice/VoiceService;->access$0(Lcom/boyaa/androidim/voice/VoiceService;Lcom/boyaa/androidim/voice/RecordOnCompleleListener;)V

    .line 221
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoiceService$1;->this$0:Lcom/boyaa/androidim/voice/VoiceService;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/boyaa/androidim/voice/VoiceService;->access$1(Lcom/boyaa/androidim/voice/VoiceService;Z)V

    .line 222
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoiceService$1;->this$0:Lcom/boyaa/androidim/voice/VoiceService;

    iget v1, p1, Landroid/os/Message;->arg1:I

    # invokes: Lcom/boyaa/androidim/voice/VoiceService;->initRecorder(I)V
    invoke-static {v0, v1}, Lcom/boyaa/androidim/voice/VoiceService;->access$2(Lcom/boyaa/androidim/voice/VoiceService;I)V

    .line 223
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoiceService$1;->this$0:Lcom/boyaa/androidim/voice/VoiceService;

    # invokes: Lcom/boyaa/androidim/voice/VoiceService;->startRecord()V
    invoke-static {v0}, Lcom/boyaa/androidim/voice/VoiceService;->access$3(Lcom/boyaa/androidim/voice/VoiceService;)V

    goto :goto_0

    .line 227
    :pswitch_1
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceService$1;->this$0:Lcom/boyaa/androidim/voice/VoiceService;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/boyaa/androidim/voice/RecordOnCompleleListener;

    invoke-virtual {v1, v0}, Lcom/boyaa/androidim/voice/VoiceService;->stopRecord(Lcom/boyaa/androidim/voice/RecordOnCompleleListener;)V

    goto :goto_0

    .line 218
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
