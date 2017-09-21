.class Lboyaa/speex/BluetoothAudioRecordService$1;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothAudioRecordService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lboyaa/speex/BluetoothAudioRecordService;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lboyaa/speex/BluetoothAudioRecordService;


# direct methods
.method constructor <init>(Lboyaa/speex/BluetoothAudioRecordService;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lboyaa/speex/BluetoothAudioRecordService$1;->this$0:Lboyaa/speex/BluetoothAudioRecordService;

    .line 57
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x2

    const/4 v1, 0x1

    .line 60
    const-string v0, "android.media.extra.SCO_AUDIO_STATE"

    const/4 v2, -0x1

    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v8

    .line 62
    .local v8, "state":I
    if-ne v1, v8, :cond_0

    .line 63
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService$1;->this$0:Lboyaa/speex/BluetoothAudioRecordService;

    iget-object v0, v0, Lboyaa/speex/BluetoothAudioRecordService;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    .line 64
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService$1;->this$0:Lboyaa/speex/BluetoothAudioRecordService;

    iget-object v0, v0, Lboyaa/speex/BluetoothAudioRecordService;->mAudioManager:Landroid/media/AudioManager;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/media/AudioManager;->adjustVolume(II)V

    .line 67
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService$1;->this$0:Lboyaa/speex/BluetoothAudioRecordService;

    iget v0, v0, Lboyaa/speex/BluetoothAudioRecordService;->mSampleRate:I

    invoke-static {v0, v3, v3}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v7

    .line 68
    .local v7, "m_in_buf_size":I
    iget-object v9, p0, Lboyaa/speex/BluetoothAudioRecordService$1;->this$0:Lboyaa/speex/BluetoothAudioRecordService;

    new-instance v0, Landroid/media/AudioRecord;

    iget-object v2, p0, Lboyaa/speex/BluetoothAudioRecordService$1;->this$0:Lboyaa/speex/BluetoothAudioRecordService;

    iget v2, v2, Lboyaa/speex/BluetoothAudioRecordService;->mSampleRate:I

    mul-int/lit8 v5, v7, 0xa

    move v4, v3

    invoke-direct/range {v0 .. v5}, Landroid/media/AudioRecord;-><init>(IIIII)V

    iput-object v0, v9, Lboyaa/speex/BluetoothAudioRecordService;->m_in_rec:Landroid/media/AudioRecord;

    .line 70
    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 72
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    iget-object v0, v0, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x42

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 73
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService$1;->this$0:Lboyaa/speex/BluetoothAudioRecordService;

    invoke-static {v0, v1}, Lboyaa/speex/BluetoothAudioRecordService;->access$0(Lboyaa/speex/BluetoothAudioRecordService;Z)V

    .line 75
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService$1;->this$0:Lboyaa/speex/BluetoothAudioRecordService;

    invoke-virtual {v0}, Lboyaa/speex/BluetoothAudioRecordService;->startThread()V

    .line 86
    .end local v7    # "m_in_buf_size":I
    :goto_0
    return-void

    .line 79
    :cond_0
    const-wide/16 v0, 0x1f4

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    :goto_1
    iget-object v0, p0, Lboyaa/speex/BluetoothAudioRecordService$1;->this$0:Lboyaa/speex/BluetoothAudioRecordService;

    iget-object v0, v0, Lboyaa/speex/BluetoothAudioRecordService;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->startBluetoothSco()V

    goto :goto_0

    .line 80
    :catch_0
    move-exception v6

    .line 81
    .local v6, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v6}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1
.end method
