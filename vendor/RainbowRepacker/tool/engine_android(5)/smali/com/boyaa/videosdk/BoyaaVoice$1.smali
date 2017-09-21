.class Lcom/boyaa/videosdk/BoyaaVoice$1;
.super Landroid/os/Handler;
.source "BoyaaVoice.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videosdk/BoyaaVoice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videosdk/BoyaaVoice;


# direct methods
.method constructor <init>(Lcom/boyaa/videosdk/BoyaaVoice;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    .line 630
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/videosdk/BoyaaVoice$1;)Lcom/boyaa/videosdk/BoyaaVoice;
    .locals 1

    .prologue
    .line 630
    iget-object v0, p0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    return-object v0
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 17
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 633
    move-object/from16 v0, p1

    iget v1, v0, Landroid/os/Message;->what:I

    sparse-switch v1, :sswitch_data_0

    .line 1035
    :cond_0
    :goto_0
    return-void

    .line 635
    :sswitch_0
    invoke-static {}, Lcom/boyaa/videodemo/data/ClientVedio;->getInstance()Lcom/boyaa/videodemo/data/ClientVedio;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v5

    iget-object v5, v5, Lcom/boyaa/videodemo/utils/CacheRef;->mIP:Ljava/lang/String;

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v6

    iget v6, v6, Lcom/boyaa/videodemo/utils/CacheRef;->mPort:I

    new-instance v7, Lcom/boyaa/videodemo/listener/AudioRoomListener;

    invoke-direct {v7}, Lcom/boyaa/videodemo/listener/AudioRoomListener;-><init>()V

    invoke-virtual {v1, v2, v5, v6, v7}, Lcom/boyaa/videodemo/data/ClientVedio;->connectAsyn(ILjava/lang/String;ILcom/boyaa/videodemo/listener/TaskListener;)V

    goto :goto_0

    .line 701
    :sswitch_1
    if-eqz p1, :cond_0

    .line 703
    const/4 v1, 0x1

    sput-boolean v1, Lcom/boyaa/videodemo/utils/Constants;->loginRoom:Z

    .line 704
    const-string v1, "BoyaaReceiver"

    const-string v2, " \u767b\u9646\u623f\u95f4\u6210\u529f,\u91cd\u65b0\u521d\u59cb\u5316 \u97f3\u9891\u670d\u52a1"

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 706
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mActivity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/boyaa/videodemo/utils/NetUtils;->GetNetworkType(Landroid/content/Context;)I

    move-result v13

    .line 708
    .local v13, "ivalue":I
    const/4 v1, 0x2

    if-ne v13, v1, :cond_1

    sget-boolean v1, Lcom/boyaa/videodemo/utils/Constants;->bSupport2G:Z

    if-nez v1, :cond_1

    .line 710
    const-string v1, "BoyaaReceiver"

    const-string v2, " \u5f53\u524d\u7f51\u7edc\u4e3a2G\u72b6\u6001\uff0c\u4e14\u4e0d\u652f\u63012G,\u5904\u7406\u4e3a\u767b\u9646\u5931\u8d25"

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 711
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x40

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 716
    :cond_1
    invoke-static {}, Lcom/boyaa/videodemo/data/AudioService;->getInstance()Lcom/boyaa/videodemo/data/AudioService;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 717
    invoke-static {}, Lcom/boyaa/videodemo/data/AudioService;->getInstance()Lcom/boyaa/videodemo/data/AudioService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/boyaa/videodemo/data/AudioService;->release()V

    .line 719
    :cond_2
    invoke-static {}, Lcom/boyaa/videodemo/data/AudioService;->startService()V

    .line 722
    invoke-static {}, Lboyaa/speex/VoiceManager;->getInstance()Lboyaa/speex/VoiceManager;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 723
    invoke-static {}, Lboyaa/speex/VoiceManager;->getInstance()Lboyaa/speex/VoiceManager;

    move-result-object v1

    invoke-virtual {v1}, Lboyaa/speex/VoiceManager;->release()V

    .line 725
    :cond_3
    invoke-static {}, Lboyaa/speex/VoiceManager;->getInstance()Lboyaa/speex/VoiceManager;

    move-result-object v1

    invoke-virtual {v1}, Lboyaa/speex/VoiceManager;->StartAudioPlay()V

    .line 727
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x34

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 730
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x56

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v15

    .line 731
    .local v15, "msg_speaking":Landroid/os/Message;
    move-object/from16 v0, p1

    iget v1, v0, Landroid/os/Message;->arg2:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v15, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 732
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const-wide/16 v5, 0x5dc

    invoke-virtual {v1, v15, v5, v6}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto/16 :goto_0

    .line 765
    .end local v13    # "ivalue":I
    .end local v15    # "msg_speaking":Landroid/os/Message;
    :sswitch_2
    sget-boolean v1, Lcom/boyaa/videodemo/utils/Constants;->loginRoom:Z

    if-nez v1, :cond_0

    .line 767
    const/4 v1, 0x1

    sput-boolean v1, Lcom/boyaa/videodemo/utils/Constants;->loginRoom:Z

    .line 770
    invoke-static {}, Lcom/example/webrtc/AudioActivity;->getInstance()Lcom/example/webrtc/AudioActivity;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 771
    invoke-static {}, Lcom/example/webrtc/AudioActivity;->getInstance()Lcom/example/webrtc/AudioActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/example/webrtc/AudioActivity;->release()V

    .line 782
    :cond_4
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/boyaa/videosdk/BoyaaVoice;->SetLoudspeakerStatus(Z)V

    .line 784
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget-object v2, v2, Lcom/boyaa/videosdk/BoyaaVoice;->mActivity:Landroid/app/Activity;

    new-instance v5, Lcom/boyaa/videosdk/BoyaaVoice$1$1;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/boyaa/videosdk/BoyaaVoice$1$1;-><init>(Lcom/boyaa/videosdk/BoyaaVoice$1;)V

    invoke-static {v2, v5}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->create(Landroid/content/Context;Ljava/lang/Runnable;)Lcom/boyaa/videodemo/utils/AppRTCAudioManager;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/boyaa/videosdk/BoyaaVoice;->access$1(Lcom/boyaa/videosdk/BoyaaVoice;Lcom/boyaa/videodemo/utils/AppRTCAudioManager;)V

    .line 795
    const-string v1, "BoyaaVoice"

    const-string v2, "Initializing the audio manager..."

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 796
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    # getter for: Lcom/boyaa/videosdk/BoyaaVoice;->audioManager:Lcom/boyaa/videodemo/utils/AppRTCAudioManager;
    invoke-static {v1}, Lcom/boyaa/videosdk/BoyaaVoice;->access$2(Lcom/boyaa/videosdk/BoyaaVoice;)Lcom/boyaa/videodemo/utils/AppRTCAudioManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager;->init()V

    .line 799
    invoke-static {}, Lcom/example/webrtc/AudioActivity;->getInstance()Lcom/example/webrtc/AudioActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/example/webrtc/AudioActivity;->startWebRtcAudio()V

    .line 801
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x36

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 948
    :sswitch_3
    const-string v1, "BoyaaReceiver"

    const-string v2, " \u8fde\u63a5\u6210\u529f\uff0c\u5f00\u59cb\u767b\u9646\u623f\u95f4"

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 951
    const/4 v3, 0x0

    .local v3, "iW":I
    const/4 v4, 0x0

    .line 952
    .local v4, "iH":I
    :try_start_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mVideoFrameType:I

    if-nez v1, :cond_5

    .line 954
    const/16 v3, 0x160

    const/16 v4, 0x120

    .line 961
    :goto_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mAppId:I

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget v2, v2, Lcom/boyaa/videosdk/BoyaaVoice;->mUID:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget v5, v5, Lcom/boyaa/videosdk/BoyaaVoice;->mRoomID:I

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    # getter for: Lcom/boyaa/videosdk/BoyaaVoice;->mRoomType:I
    invoke-static {v6}, Lcom/boyaa/videosdk/BoyaaVoice;->access$3(Lcom/boyaa/videosdk/BoyaaVoice;)I

    move-result v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget v7, v7, Lcom/boyaa/videosdk/BoyaaVoice;->mNetWorkType:I

    sget-boolean v8, Lcom/boyaa/videodemo/utils/Constants;->bOpenAudio:Z

    sget-boolean v9, Lcom/boyaa/videodemo/utils/Constants;->bOpenVideo:Z

    invoke-static/range {v1 .. v9}, Lcom/boyaa/videodemo/utils/ApiUtils;->loginVideoRoom(IIIIIIIZZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 963
    :catch_0
    move-exception v1

    goto/16 :goto_0

    .line 958
    :cond_5
    const/16 v3, 0x140

    const/16 v4, 0xf0

    goto :goto_1

    .line 975
    .end local v3    # "iW":I
    .end local v4    # "iH":I
    :sswitch_4
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x40

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 979
    :sswitch_5
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x42

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 982
    :sswitch_6
    invoke-static {}, Lcom/boyaa/videodemo/utils/ApiUtils;->reconnectControlConnection()V

    goto/16 :goto_0

    .line 985
    :sswitch_7
    if-eqz p1, :cond_0

    .line 987
    move-object/from16 v0, p1

    iget-object v12, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v12, Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 988
    .local v12, "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v16

    .line 990
    .local v16, "user_id":I
    new-instance v11, Lcom/example/webrtc/UserChannelBean;

    invoke-direct {v11}, Lcom/example/webrtc/UserChannelBean;-><init>()V

    .line 991
    .local v11, "bean":Lcom/example/webrtc/UserChannelBean;
    move/from16 v0, v16

    iput v0, v11, Lcom/example/webrtc/UserChannelBean;->user_id:I

    .line 992
    invoke-static {}, Lcom/example/webrtc/AudioActivity;->getInstance()Lcom/example/webrtc/AudioActivity;

    move-result-object v1

    invoke-virtual {v1, v11}, Lcom/example/webrtc/AudioActivity;->addIndexWebrtcVoice(Lcom/example/webrtc/UserChannelBean;)V

    .line 994
    const/4 v10, 0x0

    .line 995
    .local v10, "bSpeakEnable":Z
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getAudioControl()Lcom/example/tutorial/VideoProto$AudioCtrol;

    move-result-object v1

    sget-object v2, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    if-ne v1, v2, :cond_6

    .line 996
    const/4 v10, 0x0

    .line 1000
    :goto_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x61

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v14

    .line 1001
    .local v14, "messageIn":Landroid/os/Message;
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v14, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1002
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v1

    iput v1, v14, Landroid/os/Message;->arg1:I

    .line 1003
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getSeatId()I

    move-result v1

    iput v1, v14, Landroid/os/Message;->arg2:I

    .line 1004
    invoke-virtual {v14}, Landroid/os/Message;->sendToTarget()V

    goto/16 :goto_0

    .line 998
    .end local v14    # "messageIn":Landroid/os/Message;
    :cond_6
    const/4 v10, 0x1

    goto :goto_2

    .line 1009
    .end local v10    # "bSpeakEnable":Z
    .end local v11    # "bean":Lcom/example/webrtc/UserChannelBean;
    .end local v12    # "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    .end local v16    # "user_id":I
    :sswitch_8
    if-eqz p1, :cond_0

    .line 1011
    move-object/from16 v0, p1

    iget-object v12, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v12, Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 1012
    .restart local v12    # "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v16

    .line 1014
    .restart local v16    # "user_id":I
    invoke-static {}, Lcom/example/webrtc/AudioActivity;->getInstance()Lcom/example/webrtc/AudioActivity;

    move-result-object v1

    move/from16 v0, v16

    invoke-virtual {v1, v0}, Lcom/example/webrtc/AudioActivity;->getUserChannelBean(I)Lcom/example/webrtc/UserChannelBean;

    move-result-object v11

    .line 1015
    .restart local v11    # "bean":Lcom/example/webrtc/UserChannelBean;
    if-eqz v11, :cond_7

    .line 1017
    invoke-static {}, Lcom/example/webrtc/AudioActivity;->getInstance()Lcom/example/webrtc/AudioActivity;

    move-result-object v1

    invoke-virtual {v1, v11}, Lcom/example/webrtc/AudioActivity;->stopIndexWebrtcVoice(Lcom/example/webrtc/UserChannelBean;)V

    .line 1020
    :cond_7
    const/4 v10, 0x0

    .line 1021
    .restart local v10    # "bSpeakEnable":Z
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getAudioControl()Lcom/example/tutorial/VideoProto$AudioCtrol;

    move-result-object v1

    sget-object v2, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    if-ne v1, v2, :cond_8

    .line 1022
    const/4 v10, 0x0

    .line 1026
    :goto_3
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x62

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v14

    .line 1027
    .restart local v14    # "messageIn":Landroid/os/Message;
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v14, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1028
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v1

    iput v1, v14, Landroid/os/Message;->arg1:I

    .line 1029
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getSeatId()I

    move-result v1

    iput v1, v14, Landroid/os/Message;->arg2:I

    .line 1030
    invoke-virtual {v14}, Landroid/os/Message;->sendToTarget()V

    goto/16 :goto_0

    .line 1024
    .end local v14    # "messageIn":Landroid/os/Message;
    :cond_8
    const/4 v10, 0x1

    goto :goto_3

    .line 633
    :sswitch_data_0
    .sparse-switch
        0x34 -> :sswitch_1
        0x36 -> :sswitch_2
        0x39 -> :sswitch_3
        0x40 -> :sswitch_4
        0x42 -> :sswitch_5
        0x55 -> :sswitch_0
        0x59 -> :sswitch_6
        0x61 -> :sswitch_7
        0x62 -> :sswitch_8
    .end sparse-switch
.end method
