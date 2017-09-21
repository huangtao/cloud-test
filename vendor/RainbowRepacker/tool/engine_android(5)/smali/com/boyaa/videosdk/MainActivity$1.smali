.class Lcom/boyaa/videosdk/MainActivity$1;
.super Landroid/os/Handler;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videosdk/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videosdk/MainActivity;


# direct methods
.method constructor <init>(Lcom/boyaa/videosdk/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/videosdk/MainActivity$1;->this$0:Lcom/boyaa/videosdk/MainActivity;

    .line 85
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v5, 0x0

    .line 88
    iget v2, p1, Landroid/os/Message;->what:I

    sparse-switch v2, :sswitch_data_0

    .line 126
    :goto_0
    return-void

    .line 91
    :sswitch_0
    invoke-static {}, Lboyaa/speex/VoiceManager;->getInstance()Lboyaa/speex/VoiceManager;

    move-result-object v2

    invoke-virtual {v2}, Lboyaa/speex/VoiceManager;->StartAudioRecord()V

    goto :goto_0

    .line 96
    :sswitch_1
    new-instance v0, Lcom/boyaa/videodemo/utils/LocalVideoView;

    iget-object v2, p0, Lcom/boyaa/videosdk/MainActivity$1;->this$0:Lcom/boyaa/videosdk/MainActivity;

    iget-object v3, p0, Lcom/boyaa/videosdk/MainActivity$1;->this$0:Lcom/boyaa/videosdk/MainActivity;

    iget v3, v3, Lcom/boyaa/videosdk/MainActivity;->iFarmeType:I

    iget-object v4, p0, Lcom/boyaa/videosdk/MainActivity$1;->this$0:Lcom/boyaa/videosdk/MainActivity;

    iget v4, v4, Lcom/boyaa/videosdk/MainActivity;->iFrameValue:I

    invoke-direct {v0, v2, v3, v4}, Lcom/boyaa/videodemo/utils/LocalVideoView;-><init>(Landroid/content/Context;II)V

    .line 97
    .local v0, "localView":Lcom/boyaa/videodemo/utils/LocalVideoView;
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v2, 0x12c

    const/16 v3, 0x104

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 98
    .local v1, "local_view":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v2, 0xa

    invoke-virtual {v1, v2, v5, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 99
    invoke-virtual {v0, v1}, Lcom/boyaa/videodemo/utils/LocalVideoView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    iget-object v2, p0, Lcom/boyaa/videosdk/MainActivity$1;->this$0:Lcom/boyaa/videosdk/MainActivity;

    iget-object v2, v2, Lcom/boyaa/videosdk/MainActivity;->mLayoutVideo:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 105
    .end local v0    # "localView":Lcom/boyaa/videodemo/utils/LocalVideoView;
    .end local v1    # "local_view":Landroid/widget/LinearLayout$LayoutParams;
    :sswitch_2
    iget-object v2, p0, Lcom/boyaa/videosdk/MainActivity$1;->this$0:Lcom/boyaa/videosdk/MainActivity;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/boyaa/videosdk/MainActivity;->AddView(I)V

    goto :goto_0

    .line 108
    :sswitch_3
    iget-object v2, p0, Lcom/boyaa/videosdk/MainActivity$1;->this$0:Lcom/boyaa/videosdk/MainActivity;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/boyaa/videosdk/MainActivity;->AddView(I)V

    goto :goto_0

    .line 111
    :sswitch_4
    iget-object v2, p0, Lcom/boyaa/videosdk/MainActivity$1;->this$0:Lcom/boyaa/videosdk/MainActivity;

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Lcom/boyaa/videosdk/MainActivity;->AddView(I)V

    goto :goto_0

    .line 114
    :sswitch_5
    iget-object v2, p0, Lcom/boyaa/videosdk/MainActivity$1;->this$0:Lcom/boyaa/videosdk/MainActivity;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lcom/boyaa/videosdk/MainActivity;->AddView(I)V

    goto :goto_0

    .line 117
    :sswitch_6
    iget-object v2, p0, Lcom/boyaa/videosdk/MainActivity$1;->this$0:Lcom/boyaa/videosdk/MainActivity;

    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Lcom/boyaa/videosdk/MainActivity;->AddView(I)V

    goto :goto_0

    .line 120
    :sswitch_7
    iget-object v2, p0, Lcom/boyaa/videosdk/MainActivity$1;->this$0:Lcom/boyaa/videosdk/MainActivity;

    const/4 v3, 0x6

    invoke-virtual {v2, v3}, Lcom/boyaa/videosdk/MainActivity;->AddView(I)V

    goto :goto_0

    .line 123
    :sswitch_8
    iget-object v2, p0, Lcom/boyaa/videosdk/MainActivity$1;->this$0:Lcom/boyaa/videosdk/MainActivity;

    const/4 v3, 0x7

    invoke-virtual {v2, v3}, Lcom/boyaa/videosdk/MainActivity;->AddView(I)V

    goto :goto_0

    .line 88
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x8 -> :sswitch_2
        0x12 -> :sswitch_3
        0x16 -> :sswitch_4
        0x20 -> :sswitch_5
        0x24 -> :sswitch_6
        0x28 -> :sswitch_7
        0x32 -> :sswitch_8
        0x35 -> :sswitch_1
    .end sparse-switch
.end method
