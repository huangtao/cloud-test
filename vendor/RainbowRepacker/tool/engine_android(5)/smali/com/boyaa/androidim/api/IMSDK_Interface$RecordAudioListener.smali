.class Lcom/boyaa/androidim/api/IMSDK_Interface$RecordAudioListener;
.super Ljava/lang/Object;
.source "IMSDK_Interface.java"

# interfaces
.implements Lcom/boyaa/androidim/voice/RecordOnCompleleListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/androidim/api/IMSDK_Interface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RecordAudioListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;


# direct methods
.method constructor <init>(Lcom/boyaa/androidim/api/IMSDK_Interface;)V
    .locals 0

    .prologue
    .line 217
    iput-object p1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$RecordAudioListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(IJLjava/lang/String;)V
    .locals 3
    .param p1, "size"    # I
    .param p2, "arg1"    # J
    .param p4, "arg2"    # Ljava/lang/String;

    .prologue
    .line 223
    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$RecordAudioListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    invoke-static {v1, p4}, Lcom/boyaa/androidim/api/IMSDK_Interface;->access$0(Lcom/boyaa/androidim/api/IMSDK_Interface;Ljava/lang/String;)V

    .line 224
    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$RecordAudioListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    long-to-int v2, p2

    invoke-static {v1, v2}, Lcom/boyaa/androidim/api/IMSDK_Interface;->access$1(Lcom/boyaa/androidim/api/IMSDK_Interface;I)V

    .line 225
    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$RecordAudioListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    invoke-static {v1, p1}, Lcom/boyaa/androidim/api/IMSDK_Interface;->access$2(Lcom/boyaa/androidim/api/IMSDK_Interface;I)V

    .line 227
    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$RecordAudioListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    iget-object v1, v1, Lcom/boyaa/androidim/api/IMSDK_Interface;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 228
    .local v0, "msg":Landroid/os/Message;
    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$RecordAudioListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    # getter for: Lcom/boyaa/androidim/api/IMSDK_Interface;->mAudioFilePath:Ljava/lang/String;
    invoke-static {v1}, Lcom/boyaa/androidim/api/IMSDK_Interface;->access$3(Lcom/boyaa/androidim/api/IMSDK_Interface;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 229
    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$RecordAudioListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    # getter for: Lcom/boyaa/androidim/api/IMSDK_Interface;->mAudioTimeLong:I
    invoke-static {v1}, Lcom/boyaa/androidim/api/IMSDK_Interface;->access$4(Lcom/boyaa/androidim/api/IMSDK_Interface;)I

    move-result v1

    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 230
    iget-object v1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$RecordAudioListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    # getter for: Lcom/boyaa/androidim/api/IMSDK_Interface;->mAudioFileSize:I
    invoke-static {v1}, Lcom/boyaa/androidim/api/IMSDK_Interface;->access$5(Lcom/boyaa/androidim/api/IMSDK_Interface;)I

    move-result v1

    iput v1, v0, Landroid/os/Message;->arg2:I

    .line 231
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 232
    return-void
.end method

.method public onMaxDuration()V
    .locals 0

    .prologue
    .line 238
    return-void
.end method
