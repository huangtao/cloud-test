.class Lcom/boyaa/videodemo/utils/AppRTCAudioManager$2;
.super Landroid/content/BroadcastReceiver;
.source "AppRTCAudioManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->registerForWiredHeadsetIntentBroadcast()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final HAS_MIC:I = 0x1

.field private static final HAS_NO_MIC:I = 0x0

.field private static final STATE_PLUGGED:I = 0x1

.field private static final STATE_UNPLUGGED:I


# instance fields
.field final synthetic this$0:Lcom/boyaa/videodemo/utils/AppRTCAudioManager;


# direct methods
.method constructor <init>(Lcom/boyaa/videodemo/utils/AppRTCAudioManager;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$2;->this$0:Lcom/boyaa/videodemo/utils/AppRTCAudioManager;

    .line 243
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v0, 0x1

    const/4 v5, 0x0

    .line 251
    const-string v4, "state"

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 252
    .local v3, "state":I
    const-string v4, "microphone"

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 253
    .local v1, "microphone":I
    const-string v4, "name"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 254
    .local v2, "name":Ljava/lang/String;
    const-string v6, "AppRTCAudioManager"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v7, "BroadcastReceiver.onReceive"

    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/boyaa/videodemo/utils/AppRTCUtils;->getThreadInfo()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 255
    const-string v7, ": "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 256
    const-string v7, "a="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 257
    const-string v7, ", s="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-nez v3, :cond_1

    const-string v4, "unplugged"

    :goto_0
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 258
    const-string v7, ", m="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-ne v1, v0, :cond_2

    const-string v4, "mic"

    :goto_1
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 259
    const-string v7, ", n="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 260
    const-string v7, ", sb="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$2;->isInitialStickyBroadcast()Z

    move-result v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 254
    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    if-ne v3, v0, :cond_3

    .line 263
    .local v0, "hasWiredHeadset":Z
    :goto_2
    packed-switch v3, :pswitch_data_0

    .line 273
    const-string v4, "AppRTCAudioManager"

    const-string v5, "Invalid state"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    :cond_0
    :goto_3
    return-void

    .line 257
    .end local v0    # "hasWiredHeadset":Z
    :cond_1
    const-string v4, "plugged"

    goto :goto_0

    .line 258
    :cond_2
    const-string v4, "no mic"

    goto :goto_1

    :cond_3
    move v0, v5

    .line 262
    goto :goto_2

    .line 265
    .restart local v0    # "hasWiredHeadset":Z
    :pswitch_0
    iget-object v4, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$2;->this$0:Lcom/boyaa/videodemo/utils/AppRTCAudioManager;

    # invokes: Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->updateAudioDeviceState(Z)V
    invoke-static {v4, v0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->access$2(Lcom/boyaa/videodemo/utils/AppRTCAudioManager;Z)V

    goto :goto_3

    .line 268
    :pswitch_1
    iget-object v4, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$2;->this$0:Lcom/boyaa/videodemo/utils/AppRTCAudioManager;

    # getter for: Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->selectedAudioDevice:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;
    invoke-static {v4}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->access$3(Lcom/boyaa/videodemo/utils/AppRTCAudioManager;)Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    move-result-object v4

    sget-object v5, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->WIRED_HEADSET:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    if-eq v4, v5, :cond_0

    .line 269
    iget-object v4, p0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$2;->this$0:Lcom/boyaa/videodemo/utils/AppRTCAudioManager;

    # invokes: Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->updateAudioDeviceState(Z)V
    invoke-static {v4, v0}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->access$2(Lcom/boyaa/videodemo/utils/AppRTCAudioManager;Z)V

    goto :goto_3

    .line 263
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
