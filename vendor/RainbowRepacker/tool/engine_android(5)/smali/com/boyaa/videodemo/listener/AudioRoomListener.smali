.class public Lcom/boyaa/videodemo/listener/AudioRoomListener;
.super Ljava/lang/Object;
.source "AudioRoomListener.java"

# interfaces
.implements Lcom/boyaa/videodemo/listener/TaskListener;


# instance fields
.field private final PARSE_WATH:I

.field private TAG:Ljava/lang/String;

.field private iLastIndex:I

.field private mParseHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput v1, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->PARSE_WATH:I

    .line 53
    const-string v0, "AudioRoomListener"

    iput-object v0, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->TAG:Ljava/lang/String;

    .line 88
    new-instance v0, Lcom/boyaa/videodemo/listener/AudioRoomListener$1;

    invoke-direct {v0, p0}, Lcom/boyaa/videodemo/listener/AudioRoomListener$1;-><init>(Lcom/boyaa/videodemo/listener/AudioRoomListener;)V

    iput-object v0, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->mParseHandler:Landroid/os/Handler;

    .line 1095
    iput v1, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    .line 56
    return-void
.end method

.method private CheckFrameData(Lcom/example/tutorial/VideoProto$FrameType;I)I
    .locals 7
    .param p1, "frameType"    # Lcom/example/tutorial/VideoProto$FrameType;
    .param p2, "frameVideoIndex"    # I

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, -0x1

    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 1002
    const/4 v0, -0x3

    .line 1003
    .local v0, "iR":I
    sget-object v2, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_I:Lcom/example/tutorial/VideoProto$FrameType;

    if-ne p1, v2, :cond_1

    .line 1005
    if-nez p2, :cond_0

    .line 1007
    iput v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    .line 1092
    :goto_0
    return v1

    .line 1012
    :cond_0
    iput v4, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    .line 1013
    const v1, -0x989298

    goto :goto_0

    .line 1018
    :cond_1
    sget-object v2, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_P:Lcom/example/tutorial/VideoProto$FrameType;

    if-eq p1, v2, :cond_2

    .line 1020
    iput v4, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    .line 1021
    const v1, -0x5f5e0ff

    goto :goto_0

    .line 1024
    :cond_2
    packed-switch p2, :pswitch_data_0

    :goto_1
    move v1, v0

    .line 1092
    goto :goto_0

    .line 1027
    :pswitch_0
    iget v2, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    if-nez v2, :cond_3

    .line 1029
    const/16 v0, 0x16

    .line 1030
    iput v1, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    goto :goto_1

    .line 1033
    :cond_3
    iput v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    goto :goto_1

    .line 1036
    :pswitch_1
    iget v2, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    if-ne v2, v1, :cond_4

    .line 1038
    const/16 v0, 0x14d

    .line 1039
    iput v5, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    goto :goto_1

    .line 1042
    :cond_4
    iput v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    goto :goto_1

    .line 1045
    :pswitch_2
    iget v1, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    if-ne v1, v5, :cond_5

    .line 1047
    const v0, 0x43d11c

    .line 1048
    iput v6, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    goto :goto_1

    .line 1051
    :cond_5
    iput v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    goto :goto_1

    .line 1054
    :pswitch_3
    iget v1, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    if-ne v1, v6, :cond_6

    .line 1056
    const/16 v0, 0x15b3

    .line 1057
    const/4 v1, 0x4

    iput v1, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    goto :goto_1

    .line 1060
    :cond_6
    iput v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    goto :goto_1

    .line 1063
    :pswitch_4
    iget v1, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_7

    .line 1065
    const/16 v0, 0x42

    .line 1066
    const/4 v1, 0x5

    iput v1, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    goto :goto_1

    .line 1069
    :cond_7
    iput v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    goto :goto_1

    .line 1072
    :pswitch_5
    iget v1, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    const/4 v2, 0x5

    if-ne v1, v2, :cond_8

    .line 1074
    const v0, 0xbde31

    .line 1075
    const/4 v1, 0x6

    iput v1, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    goto :goto_1

    .line 1078
    :cond_8
    iput v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    goto :goto_1

    .line 1081
    :pswitch_6
    iget v1, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    const/4 v2, 0x6

    if-ne v1, v2, :cond_9

    .line 1083
    const v0, 0xd9038

    .line 1084
    const/4 v1, 0x7

    iput v1, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    goto :goto_1

    .line 1087
    :cond_9
    iput v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->iLastIndex:I

    goto :goto_1

    .line 1024
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method private NotifyVideoView(Lcom/boyaa/videodemo/bean/VedioBean;II)V
    .locals 0
    .param p1, "bean"    # Lcom/boyaa/videodemo/bean/VedioBean;
    .param p2, "iFrameVideoType"    # I
    .param p3, "iFrameValue"    # I

    .prologue
    .line 979
    return-void
.end method


# virtual methods
.method protected audioControlNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V
    .locals 8
    .param p1, "message"    # Lcom/example/tutorial/VideoProto$VideoMessage;

    .prologue
    .line 293
    :try_start_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageBody()Lcom/google/protobuf/ByteString;

    move-result-object v6

    invoke-static {v6}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    move-result-object v2

    .line 294
    .local v2, "notify":Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->getUserId()I

    move-result v4

    .line 295
    .local v4, "userID":I
    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->getSeatId()I

    move-result v3

    .line 296
    .local v3, "seatID":I
    const/4 v0, 0x0

    .line 297
    .local v0, "bSpeakEnable":Z
    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->getAudioControl()Lcom/example/tutorial/VideoProto$AudioCtrol;

    move-result-object v5

    .line 298
    .local v5, "value":Lcom/example/tutorial/VideoProto$AudioCtrol;
    sget-object v6, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    if-ne v5, v6, :cond_0

    .line 299
    const/4 v0, 0x0

    .line 303
    :goto_0
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v6

    iget-object v6, v6, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v7, 0x69

    invoke-virtual {v6, v7}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 304
    .local v1, "msg":Landroid/os/Message;
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    iput-object v6, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 305
    iput v4, v1, Landroid/os/Message;->arg1:I

    .line 306
    iput v3, v1, Landroid/os/Message;->arg2:I

    .line 307
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 318
    .end local v0    # "bSpeakEnable":Z
    .end local v1    # "msg":Landroid/os/Message;
    .end local v2    # "notify":Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .end local v3    # "seatID":I
    .end local v4    # "userID":I
    .end local v5    # "value":Lcom/example/tutorial/VideoProto$AudioCtrol;
    :goto_1
    return-void

    .line 301
    .restart local v0    # "bSpeakEnable":Z
    .restart local v2    # "notify":Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .restart local v3    # "seatID":I
    .restart local v4    # "userID":I
    .restart local v5    # "value":Lcom/example/tutorial/VideoProto$AudioCtrol;
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 314
    .end local v0    # "bSpeakEnable":Z
    .end local v2    # "notify":Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .end local v3    # "seatID":I
    .end local v4    # "userID":I
    .end local v5    # "value":Lcom/example/tutorial/VideoProto$AudioCtrol;
    :catch_0
    move-exception v6

    goto :goto_1
.end method

.method protected audioControlResponse(Lcom/example/tutorial/VideoProto$VideoMessage;)V
    .locals 3
    .param p1, "message"    # Lcom/example/tutorial/VideoProto$VideoMessage;

    .prologue
    .line 270
    :try_start_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageBody()Lcom/google/protobuf/ByteString;

    move-result-object v1

    invoke-static {v1}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    move-result-object v0

    .line 271
    .local v0, "response":Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->getResult()Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v1

    sget-object v2, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    if-ne v1, v2, :cond_1

    .line 273
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->getMediaControl()Lcom/example/tutorial/VideoProto$AudioCtrol;

    move-result-object v1

    sget-object v2, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    if-ne v1, v2, :cond_0

    .line 274
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x66

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 287
    .end local v0    # "response":Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    :goto_0
    return-void

    .line 276
    .restart local v0    # "response":Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    :cond_0
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x67

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 283
    .end local v0    # "response":Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    :catch_0
    move-exception v1

    goto :goto_0

    .line 280
    .restart local v0    # "response":Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    :cond_1
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x68

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method

.method public audioNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V
    .locals 8
    .param p1, "message"    # Lcom/example/tutorial/VideoProto$VideoMessage;

    .prologue
    .line 412
    :try_start_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageBody()Lcom/google/protobuf/ByteString;

    move-result-object v5

    invoke-static {v5}, Lcom/example/tutorial/VideoProto$AudioNotify;->parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$AudioNotify;

    move-result-object v2

    .line 413
    .local v2, "notify":Lcom/example/tutorial/VideoProto$AudioNotify;
    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$AudioNotify;->getSendUserId()I

    move-result v4

    .line 414
    .local v4, "send_user_id":I
    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$AudioNotify;->getSeatId()I

    move-result v3

    .line 415
    .local v3, "seat_id":I
    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$AudioNotify;->getAudioDescript()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    .line 416
    .local v0, "audio_descript":Lcom/example/tutorial/VideoProto$AudioDescript;
    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$AudioNotify;->getAudioData()Lcom/google/protobuf/ByteString;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/protobuf/ByteString;->toByteArray()[B

    move-result-object v1

    .line 418
    .local v1, "data":[B
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v5

    invoke-virtual {v5}, Lcom/boyaa/videodemo/utils/CacheRef;->getUserID()I

    move-result v5

    if-ne v4, v5, :cond_0

    .line 420
    const-string v5, "AudioRoomListener"

    const-string v6, "\u63a5\u6536\u5230\u81ea\u5df1\u7684\u8bed\u97f3\u6570\u636e\uff0c\u65e0\u6548\u5904\u7406"

    invoke-static {v5, v6}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    .end local v0    # "audio_descript":Lcom/example/tutorial/VideoProto$AudioDescript;
    .end local v1    # "data":[B
    .end local v2    # "notify":Lcom/example/tutorial/VideoProto$AudioNotify;
    .end local v3    # "seat_id":I
    .end local v4    # "send_user_id":I
    :goto_0
    return-void

    .line 423
    .restart local v0    # "audio_descript":Lcom/example/tutorial/VideoProto$AudioDescript;
    .restart local v1    # "data":[B
    .restart local v2    # "notify":Lcom/example/tutorial/VideoProto$AudioNotify;
    .restart local v3    # "seat_id":I
    .restart local v4    # "send_user_id":I
    :cond_0
    const-string v5, "AudioRoomListener"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "audio send_user_id ="

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 443
    .end local v0    # "audio_descript":Lcom/example/tutorial/VideoProto$AudioDescript;
    .end local v1    # "data":[B
    .end local v2    # "notify":Lcom/example/tutorial/VideoProto$AudioNotify;
    .end local v3    # "seat_id":I
    .end local v4    # "send_user_id":I
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method protected downMicNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V
    .locals 5
    .param p1, "message"    # Lcom/example/tutorial/VideoProto$VideoMessage;

    .prologue
    .line 374
    :try_start_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageBody()Lcom/google/protobuf/ByteString;

    move-result-object v3

    invoke-static {v3}, Lcom/example/tutorial/VideoProto$DownMicNotify;->parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$DownMicNotify;

    move-result-object v1

    .line 375
    .local v1, "notify":Lcom/example/tutorial/VideoProto$DownMicNotify;
    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$DownMicNotify;->getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v2

    .line 376
    .local v2, "player":Lcom/example/tutorial/VideoProto$PlayerInfo;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v3

    if-lez v3, :cond_0

    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v3

    iget-object v3, v3, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    if-eqz v3, :cond_0

    .line 378
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v3

    iget-object v3, v3, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v4, 0x44

    invoke-virtual {v3, v4}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 379
    .local v0, "msg":Landroid/os/Message;
    iput-object v2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 380
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 387
    .end local v0    # "msg":Landroid/os/Message;
    .end local v1    # "notify":Lcom/example/tutorial/VideoProto$DownMicNotify;
    .end local v2    # "player":Lcom/example/tutorial/VideoProto$PlayerInfo;
    :cond_0
    :goto_0
    return-void

    .line 383
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public downMicResponse(Lcom/example/tutorial/VideoProto$VideoMessage;)V
    .locals 3
    .param p1, "message"    # Lcom/example/tutorial/VideoProto$VideoMessage;

    .prologue
    .line 452
    :try_start_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageBody()Lcom/google/protobuf/ByteString;

    move-result-object v1

    invoke-static {v1}, Lcom/example/tutorial/VideoProto$DownMicResponse;->parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$DownMicResponse;

    move-result-object v0

    .line 453
    .local v0, "response":Lcom/example/tutorial/VideoProto$DownMicResponse;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$DownMicResponse;->getResult()Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v1

    sget-object v2, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    if-ne v1, v2, :cond_0

    .line 455
    const-string v1, "AudioRoomListener"

    const-string v2, "\u4e0b\u9ea6\u6210\u529f"

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 457
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 469
    .end local v0    # "response":Lcom/example/tutorial/VideoProto$DownMicResponse;
    :goto_0
    return-void

    .line 461
    .restart local v0    # "response":Lcom/example/tutorial/VideoProto$DownMicResponse;
    :cond_0
    const-string v1, "AudioRoomListener"

    const-string v2, "\u4e0b\u9ea6\u5931\u8d25"

    invoke-static {v1, v2}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 466
    .end local v0    # "response":Lcom/example/tutorial/VideoProto$DownMicResponse;
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public failed(Ljava/lang/Exception;I)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "key"    # I

    .prologue
    .line 61
    invoke-static {}, Lcom/boyaa/videodemo/utils/ApiUtils;->reconnectControlConnection()V

    .line 62
    return-void
.end method

.method public getEnterRoomNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V
    .locals 7
    .param p1, "message"    # Lcom/example/tutorial/VideoProto$VideoMessage;

    .prologue
    .line 575
    :try_start_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageBody()Lcom/google/protobuf/ByteString;

    move-result-object v4

    invoke-static {v4}, Lcom/example/tutorial/VideoProto$EnterRoomNotify;->parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    move-result-object v3

    .line 576
    .local v3, "notify":Lcom/example/tutorial/VideoProto$EnterRoomNotify;
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$EnterRoomNotify;->getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    .line 577
    .local v0, "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    const-string v4, "AudioRoomListener"

    const-string v5, "\u6536\u5230\u8fdb\u5165\u623f\u95f4\u6d88\u606f"

    invoke-static {v4, v5}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 578
    const-string v4, "AudioRoomListener"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "\u7528\u6237ID: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " \u6635\u79f0:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " SeatID:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getSeatId()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 580
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v4

    invoke-virtual {v4}, Lcom/boyaa/videodemo/utils/CacheRef;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v4

    sget-object v5, Lcom/example/tutorial/VideoProto$RoomType;->M_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    if-ne v4, v5, :cond_1

    .line 582
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v4

    iget-object v4, v4, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v5, 0x63

    invoke-virtual {v4, v5}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    .line 583
    .local v2, "msg_webrtc":Landroid/os/Message;
    iput-object v0, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 584
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    .line 593
    .end local v2    # "msg_webrtc":Landroid/os/Message;
    :cond_0
    :goto_0
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/boyaa/videodemo/utils/CacheRef;->addPlayInfoList(Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    .line 594
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v4

    iget-object v4, v4, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v5, 0x60

    invoke-virtual {v4, v5}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 600
    .end local v0    # "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    .end local v3    # "notify":Lcom/example/tutorial/VideoProto$EnterRoomNotify;
    :goto_1
    return-void

    .line 586
    .restart local v0    # "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    .restart local v3    # "notify":Lcom/example/tutorial/VideoProto$EnterRoomNotify;
    :cond_1
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v4

    invoke-virtual {v4}, Lcom/boyaa/videodemo/utils/CacheRef;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v4

    sget-object v5, Lcom/example/tutorial/VideoProto$RoomType;->M_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    if-ne v4, v5, :cond_0

    .line 588
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v4

    iget-object v4, v4, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v5, 0x61

    invoke-virtual {v4, v5}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 589
    .local v1, "msg":Landroid/os/Message;
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 590
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 596
    .end local v0    # "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    .end local v1    # "msg":Landroid/os/Message;
    .end local v3    # "notify":Lcom/example/tutorial/VideoProto$EnterRoomNotify;
    :catch_0
    move-exception v4

    goto :goto_1
.end method

.method public getLeaveRoomNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V
    .locals 7
    .param p1, "message"    # Lcom/example/tutorial/VideoProto$VideoMessage;

    .prologue
    .line 539
    :try_start_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageBody()Lcom/google/protobuf/ByteString;

    move-result-object v4

    invoke-static {v4}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;->parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    move-result-object v3

    .line 540
    .local v3, "notify":Lcom/example/tutorial/VideoProto$LeaveRoomNotify;
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;->getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    .line 541
    .local v0, "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    const-string v4, "AudioRoomListener"

    const-string v5, "\u6536\u5230\u9000\u51fa\u623f\u95f4\u6d88\u606f"

    invoke-static {v4, v5}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 542
    const-string v4, "AudioRoomListener"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "\u7528\u6237ID: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " \u6635\u79f0:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " SeatID:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getSeatId()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 544
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/boyaa/videodemo/utils/CacheRef;->removePlayInfoList(Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    .line 546
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v4

    invoke-virtual {v4}, Lcom/boyaa/videodemo/utils/CacheRef;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v4

    sget-object v5, Lcom/example/tutorial/VideoProto$RoomType;->M_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    if-ne v4, v5, :cond_1

    .line 548
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v4

    iget-object v4, v4, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v5, 0x64

    invoke-virtual {v4, v5}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    .line 549
    .local v2, "msg_webrtc":Landroid/os/Message;
    iput-object v0, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 551
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    .line 560
    .end local v2    # "msg_webrtc":Landroid/os/Message;
    :cond_0
    :goto_0
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v4

    iget-object v4, v4, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v5, 0x33

    invoke-virtual {v4, v5}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 561
    .local v1, "msg":Landroid/os/Message;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v4

    iput v4, v1, Landroid/os/Message;->arg1:I

    .line 562
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 569
    .end local v0    # "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    .end local v1    # "msg":Landroid/os/Message;
    .end local v3    # "notify":Lcom/example/tutorial/VideoProto$LeaveRoomNotify;
    :goto_1
    return-void

    .line 553
    .restart local v0    # "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    .restart local v3    # "notify":Lcom/example/tutorial/VideoProto$LeaveRoomNotify;
    :cond_1
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v4

    invoke-virtual {v4}, Lcom/boyaa/videodemo/utils/CacheRef;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v4

    sget-object v5, Lcom/example/tutorial/VideoProto$RoomType;->M_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    if-ne v4, v5, :cond_0

    .line 555
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v4

    iget-object v4, v4, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v5, 0x62

    invoke-virtual {v4, v5}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 556
    .restart local v1    # "msg":Landroid/os/Message;
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 557
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 565
    .end local v0    # "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    .end local v1    # "msg":Landroid/os/Message;
    .end local v3    # "notify":Lcom/example/tutorial/VideoProto$LeaveRoomNotify;
    :catch_0
    move-exception v4

    goto :goto_1
.end method

.method public getLoginAudioRoomResponse(Lcom/example/tutorial/VideoProto$VideoMessage;)V
    .locals 17
    .param p1, "message"    # Lcom/example/tutorial/VideoProto$VideoMessage;

    .prologue
    .line 171
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageBody()Lcom/google/protobuf/ByteString;

    move-result-object v14

    invoke-static {v14}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-result-object v7

    .line 172
    .local v7, "response":Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getResult()Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v14

    invoke-virtual {v14}, Lcom/example/tutorial/VideoProto$ResultID;->getNumber()I

    move-result v8

    .line 175
    .local v8, "result":I
    if-nez v8, :cond_6

    .line 177
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getRoomId()I

    move-result v9

    .line 178
    .local v9, "room_id":I
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getHeartBeat()I

    move-result v2

    .line 179
    .local v2, "heart_bear":I
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getSeatId()I

    move-result v10

    .line 180
    .local v10, "seat_id":I
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getAudioPort()I

    move-result v0

    .line 181
    .local v0, "audio_port":I
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v14

    invoke-virtual {v14, v0}, Lcom/boyaa/videodemo/utils/CacheRef;->setAudioPort(I)V

    .line 182
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getVideoPort()I

    move-result v13

    .line 183
    .local v13, "video_port":I
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v14

    invoke-virtual {v14, v13}, Lcom/boyaa/videodemo/utils/CacheRef;->setVideoPort(I)V

    .line 185
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getUpMicroUserId()I

    move-result v11

    .line 187
    .local v11, "speaking_man":I
    const-string v14, "BoyaaReceiver"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, " \u767b\u9646\u623f\u95f4\u6210\u529f,\u6b63\u5728\u8bf4\u8bdd\u7684\u4eba\u7684ID\u662f"

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getOtherPlayersList()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v14

    if-eqz v14, :cond_0

    .line 190
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v14

    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getOtherPlayersList()Ljava/util/List;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/boyaa/videodemo/utils/CacheRef;->setPlayInfoList(Ljava/util/List;)V

    .line 192
    :cond_0
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v14

    invoke-virtual {v14, v9}, Lcom/boyaa/videodemo/utils/CacheRef;->setRoomID(I)V

    .line 193
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v14

    invoke-virtual {v14, v10}, Lcom/boyaa/videodemo/utils/CacheRef;->setSeatID(I)V

    .line 197
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v14

    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/boyaa/videodemo/utils/CacheRef;->setRoomType(Lcom/example/tutorial/VideoProto$RoomType;)V

    .line 199
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v14

    sget-object v15, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    if-ne v14, v15, :cond_2

    .line 201
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v14

    iget-object v14, v14, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v15, 0x34

    invoke-virtual {v14, v15}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    .line 202
    .local v5, "msg":Landroid/os/Message;
    iput v8, v5, Landroid/os/Message;->arg1:I

    .line 203
    iput v11, v5, Landroid/os/Message;->arg2:I

    .line 204
    invoke-virtual {v5}, Landroid/os/Message;->sendToTarget()V

    .line 264
    .end local v0    # "audio_port":I
    .end local v2    # "heart_bear":I
    .end local v5    # "msg":Landroid/os/Message;
    .end local v7    # "response":Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .end local v8    # "result":I
    .end local v9    # "room_id":I
    .end local v10    # "seat_id":I
    .end local v11    # "speaking_man":I
    .end local v13    # "video_port":I
    :cond_1
    :goto_0
    return-void

    .line 206
    .restart local v0    # "audio_port":I
    .restart local v2    # "heart_bear":I
    .restart local v7    # "response":Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .restart local v8    # "result":I
    .restart local v9    # "room_id":I
    .restart local v10    # "seat_id":I
    .restart local v11    # "speaking_man":I
    .restart local v13    # "video_port":I
    :cond_2
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v14

    sget-object v15, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    if-ne v14, v15, :cond_3

    .line 208
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v14

    iget-object v14, v14, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v15, 0x35

    invoke-virtual {v14, v15}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    .line 209
    .restart local v5    # "msg":Landroid/os/Message;
    iput v8, v5, Landroid/os/Message;->arg1:I

    .line 210
    iput v11, v5, Landroid/os/Message;->arg2:I

    .line 211
    invoke-virtual {v5}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 261
    .end local v0    # "audio_port":I
    .end local v2    # "heart_bear":I
    .end local v5    # "msg":Landroid/os/Message;
    .end local v7    # "response":Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .end local v8    # "result":I
    .end local v9    # "room_id":I
    .end local v10    # "seat_id":I
    .end local v11    # "speaking_man":I
    .end local v13    # "video_port":I
    :catch_0
    move-exception v14

    goto :goto_0

    .line 213
    .restart local v0    # "audio_port":I
    .restart local v2    # "heart_bear":I
    .restart local v7    # "response":Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .restart local v8    # "result":I
    .restart local v9    # "room_id":I
    .restart local v10    # "seat_id":I
    .restart local v11    # "speaking_man":I
    .restart local v13    # "video_port":I
    :cond_3
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v14

    sget-object v15, Lcom/example/tutorial/VideoProto$RoomType;->M_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    if-ne v14, v15, :cond_5

    .line 216
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getProxyserverIp()Ljava/lang/String;

    move-result-object v12

    .line 217
    .local v12, "strProxyIP":Ljava/lang/String;
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getProxyserverPort()I

    move-result v4

    .line 218
    .local v4, "iProxyPort":I
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v14

    invoke-virtual {v14, v12}, Lcom/boyaa/videodemo/utils/CacheRef;->setProxyIP(Ljava/lang/String;)V

    .line 219
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v14

    invoke-virtual {v14, v4}, Lcom/boyaa/videodemo/utils/CacheRef;->setProxyServerPort(I)V

    .line 221
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v14

    iget-object v14, v14, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v15, 0x36

    invoke-virtual {v14, v15}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    .line 222
    .restart local v5    # "msg":Landroid/os/Message;
    iput v8, v5, Landroid/os/Message;->arg1:I

    .line 223
    iput v11, v5, Landroid/os/Message;->arg2:I

    .line 224
    invoke-virtual {v5}, Landroid/os/Message;->sendToTarget()V

    .line 226
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getOtherPlayersList()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v14

    if-eqz v14, :cond_1

    .line 228
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getOtherPlayersList()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v14

    if-ge v3, v14, :cond_1

    .line 230
    const/4 v1, 0x0

    .line 231
    .local v1, "bSpeakEnable":Z
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getOtherPlayersList()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v14}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getAudioControl()Lcom/example/tutorial/VideoProto$AudioCtrol;

    move-result-object v14

    sget-object v15, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    if-ne v14, v15, :cond_4

    .line 232
    const/4 v1, 0x0

    .line 236
    :goto_2
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v14

    iget-object v14, v14, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v15, 0x70

    invoke-virtual {v14, v15}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v6

    .line 237
    .local v6, "msgInfo":Landroid/os/Message;
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    iput-object v14, v6, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 238
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getOtherPlayersList()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v14}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v14

    iput v14, v6, Landroid/os/Message;->arg1:I

    .line 239
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getOtherPlayersList()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v14}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getSeatId()I

    move-result v14

    iput v14, v6, Landroid/os/Message;->arg2:I

    .line 240
    invoke-virtual {v6}, Landroid/os/Message;->sendToTarget()V

    .line 228
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 234
    .end local v6    # "msgInfo":Landroid/os/Message;
    :cond_4
    const/4 v1, 0x1

    goto :goto_2

    .line 245
    .end local v1    # "bSpeakEnable":Z
    .end local v3    # "i":I
    .end local v4    # "iProxyPort":I
    .end local v5    # "msg":Landroid/os/Message;
    .end local v12    # "strProxyIP":Ljava/lang/String;
    :cond_5
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v14

    sget-object v15, Lcom/example/tutorial/VideoProto$RoomType;->M_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    if-ne v14, v15, :cond_1

    .line 252
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v14

    iget-object v14, v14, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v15, 0x37

    invoke-virtual {v14, v15}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    .line 253
    .restart local v5    # "msg":Landroid/os/Message;
    iput v8, v5, Landroid/os/Message;->arg1:I

    .line 254
    iput v11, v5, Landroid/os/Message;->arg2:I

    .line 255
    invoke-virtual {v5}, Landroid/os/Message;->sendToTarget()V

    goto/16 :goto_0

    .line 259
    .end local v0    # "audio_port":I
    .end local v2    # "heart_bear":I
    .end local v5    # "msg":Landroid/os/Message;
    .end local v9    # "room_id":I
    .end local v10    # "seat_id":I
    .end local v11    # "speaking_man":I
    .end local v13    # "video_port":I
    :cond_6
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v14

    iget-object v14, v14, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v15, 0x40

    invoke-virtual {v14, v15}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0
.end method

.method public getVedioNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V
    .locals 15
    .param p1, "message"    # Lcom/example/tutorial/VideoProto$VideoMessage;

    .prologue
    .line 606
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageBody()Lcom/google/protobuf/ByteString;

    move-result-object v11

    invoke-static {v11}, Lcom/example/tutorial/VideoProto$VideoNotify;->parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$VideoNotify;

    move-result-object v6

    .line 607
    .local v6, "notify":Lcom/example/tutorial/VideoProto$VideoNotify;
    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoNotify;->getSendUserId()I

    move-result v8

    .line 608
    .local v8, "send_user_id":I
    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoNotify;->getSeatId()I

    move-result v7

    .line 609
    .local v7, "seat_id":I
    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoNotify;->getVideoDescript()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v10

    .line 610
    .local v10, "video_descript":Lcom/example/tutorial/VideoProto$VideoDescript;
    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoNotify;->getVideoData()Lcom/google/protobuf/ByteString;

    move-result-object v11

    invoke-virtual {v11}, Lcom/google/protobuf/ByteString;->toByteArray()[B

    move-result-object v1

    .line 612
    .local v1, "data":[B
    const-string v11, "Vedio Recv"

    const-string v12, "\u6536\u5230\u89c6\u9891\u6d88\u606f"

    invoke-static {v11, v12}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 613
    const-string v11, "Vedio Recv"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "\u7528\u6237ID: "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 614
    const-string v11, "Vedio Recv"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "\u89c6\u9891\u5e27\u7c7b\uff1a "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoValue()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 615
    const-string v11, "Vedio Recv"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "\u65f6\u95f4\u6233:"

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$VideoDescript;->getTimeStamp()J

    move-result-wide v13

    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 617
    invoke-static {}, Lcom/boyaa/videodemo/utils/Constants;->getNowTime()Ljava/lang/String;

    move-result-object v9

    .line 618
    .local v9, "strTime":Ljava/lang/String;
    const-string v11, "Vedio Recv"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "\u5f53\u524d\u5e27\u63a5\u6536\u65f6\u95f4\uff1a "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 620
    const-string v11, "Vedio Recv"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "\u5e27\u7c7b\u578b: "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameType()Lcom/example/tutorial/VideoProto$FrameType;

    move-result-object v13

    invoke-virtual {v13}, Lcom/example/tutorial/VideoProto$FrameType;->getNumber()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 621
    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameType()Lcom/example/tutorial/VideoProto$FrameType;

    move-result-object v11

    invoke-virtual {v11}, Lcom/example/tutorial/VideoProto$FrameType;->getNumber()I

    move-result v4

    .line 622
    .local v4, "iDataType":I
    const/4 v11, 0x3

    if-ne v4, v11, :cond_1

    .line 714
    .end local v1    # "data":[B
    .end local v4    # "iDataType":I
    .end local v6    # "notify":Lcom/example/tutorial/VideoProto$VideoNotify;
    .end local v7    # "seat_id":I
    .end local v8    # "send_user_id":I
    .end local v9    # "strTime":Ljava/lang/String;
    .end local v10    # "video_descript":Lcom/example/tutorial/VideoProto$VideoDescript;
    :cond_0
    :goto_0
    return-void

    .line 624
    .restart local v1    # "data":[B
    .restart local v4    # "iDataType":I
    .restart local v6    # "notify":Lcom/example/tutorial/VideoProto$VideoNotify;
    .restart local v7    # "seat_id":I
    .restart local v8    # "send_user_id":I
    .restart local v9    # "strTime":Ljava/lang/String;
    .restart local v10    # "video_descript":Lcom/example/tutorial/VideoProto$VideoDescript;
    :cond_1
    const/4 v11, 0x4

    if-eq v4, v11, :cond_0

    .line 627
    const-string v11, "Vedio Recv"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "\u5e27\u5206\u8fa8\u7387\u7c7b\u578b: "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoType()Lcom/example/tutorial/VideoProto$FrameVideoType;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 628
    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoType()Lcom/example/tutorial/VideoProto$FrameVideoType;

    move-result-object v11

    invoke-virtual {v11}, Lcom/example/tutorial/VideoProto$FrameVideoType;->getNumber()I

    move-result v3

    .line 630
    .local v3, "iDataDisType":I
    const-string v11, "Vedio Recv"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "\u5e27\u7387: "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoValue()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 631
    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoValue()I

    move-result v11

    sput v11, Lcom/boyaa/videodemo/utils/Constants;->iVedioRatio:I

    .line 633
    const-string v11, "Vedio Recv"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "\u5e27\u5206\u5305\u6570: "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoCount()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 634
    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoCount()I

    move-result v5

    .line 636
    .local v5, "iPackageCount":I
    const-string v11, "Vedio Recv"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "\u5e27\u5206\u5305\u5e8f\uff1a "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoIndex()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 651
    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameType()Lcom/example/tutorial/VideoProto$FrameType;

    move-result-object v11

    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoIndex()I

    move-result v12

    invoke-direct {p0, v11, v12}, Lcom/boyaa/videodemo/listener/AudioRoomListener;->CheckFrameData(Lcom/example/tutorial/VideoProto$FrameType;I)I

    move-result v2

    .line 657
    .local v2, "errorCode":I
    new-instance v0, Lcom/boyaa/videodemo/bean/VedioBean;

    invoke-direct {v0}, Lcom/boyaa/videodemo/bean/VedioBean;-><init>()V

    .line 658
    .local v0, "bean":Lcom/boyaa/videodemo/bean/VedioBean;
    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$VideoDescript;->getTimeStamp()J

    move-result-wide v11

    iput-wide v11, v0, Lcom/boyaa/videodemo/bean/VedioBean;->timestamp:J

    .line 659
    iput-object v1, v0, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    .line 660
    iput v4, v0, Lcom/boyaa/videodemo/bean/VedioBean;->vedioType:I

    .line 661
    iput v8, v0, Lcom/boyaa/videodemo/bean/VedioBean;->recording_uid:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 711
    .end local v0    # "bean":Lcom/boyaa/videodemo/bean/VedioBean;
    .end local v1    # "data":[B
    .end local v2    # "errorCode":I
    .end local v3    # "iDataDisType":I
    .end local v4    # "iDataType":I
    .end local v5    # "iPackageCount":I
    .end local v6    # "notify":Lcom/example/tutorial/VideoProto$VideoNotify;
    .end local v7    # "seat_id":I
    .end local v8    # "send_user_id":I
    .end local v9    # "strTime":Ljava/lang/String;
    .end local v10    # "video_descript":Lcom/example/tutorial/VideoProto$VideoDescript;
    :catch_0
    move-exception v11

    goto/16 :goto_0
.end method

.method protected meiaControlResponse(Lcom/example/tutorial/VideoProto$VideoMessage;)V
    .locals 3
    .param p1, "message"    # Lcom/example/tutorial/VideoProto$VideoMessage;

    .prologue
    .line 324
    :try_start_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageBody()Lcom/google/protobuf/ByteString;

    move-result-object v1

    invoke-static {v1}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$MediaControlResponse;

    move-result-object v0

    .line 325
    .local v0, "response":Lcom/example/tutorial/VideoProto$MediaControlResponse;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getResult()Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v1

    sget-object v2, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    if-ne v1, v2, :cond_4

    .line 327
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getMediaControl()Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v1

    sget-object v2, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    if-ne v1, v2, :cond_1

    .line 329
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x46

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 368
    .end local v0    # "response":Lcom/example/tutorial/VideoProto$MediaControlResponse;
    :cond_0
    :goto_0
    return-void

    .line 331
    .restart local v0    # "response":Lcom/example/tutorial/VideoProto$MediaControlResponse;
    :cond_1
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getMediaControl()Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v1

    sget-object v2, Lcom/example/tutorial/VideoProto$MediaControl;->SHUTDOWN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    if-ne v1, v2, :cond_2

    .line 333
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x47

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 364
    .end local v0    # "response":Lcom/example/tutorial/VideoProto$MediaControlResponse;
    :catch_0
    move-exception v1

    goto :goto_0

    .line 335
    .restart local v0    # "response":Lcom/example/tutorial/VideoProto$MediaControlResponse;
    :cond_2
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getMediaControl()Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v1

    sget-object v2, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_VIDEO:Lcom/example/tutorial/VideoProto$MediaControl;

    if-ne v1, v2, :cond_3

    .line 337
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x48

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 339
    :cond_3
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getMediaControl()Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v1

    sget-object v2, Lcom/example/tutorial/VideoProto$MediaControl;->SHUTDOWN_VIDEO:Lcom/example/tutorial/VideoProto$MediaControl;

    if-ne v1, v2, :cond_0

    .line 341
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x49

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 346
    :cond_4
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getMediaControl()Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v1

    sget-object v2, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    if-ne v1, v2, :cond_5

    .line 348
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x50

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 350
    :cond_5
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getMediaControl()Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v1

    sget-object v2, Lcom/example/tutorial/VideoProto$MediaControl;->SHUTDOWN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    if-ne v1, v2, :cond_6

    .line 352
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x51

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 354
    :cond_6
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getMediaControl()Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v1

    sget-object v2, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_VIDEO:Lcom/example/tutorial/VideoProto$MediaControl;

    if-ne v1, v2, :cond_7

    .line 356
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x52

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 358
    :cond_7
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getMediaControl()Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v1

    sget-object v2, Lcom/example/tutorial/VideoProto$MediaControl;->SHUTDOWN_VIDEO:Lcom/example/tutorial/VideoProto$MediaControl;

    if-ne v1, v2, :cond_0

    .line 360
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v2, 0x53

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0
.end method

.method public release(I)V
    .locals 0
    .param p1, "type"    # I

    .prologue
    .line 68
    return-void
.end method

.method public success([B)V
    .locals 5
    .param p1, "data"    # [B

    .prologue
    .line 75
    :try_start_0
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->parseFrom([B)Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v1

    .line 77
    .local v1, "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->mParseHandler:Landroid/os/Handler;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    .line 78
    .local v2, "msg":Landroid/os/Message;
    const/4 v3, 0x0

    iput v3, v2, Landroid/os/Message;->arg1:I

    .line 79
    iput-object v1, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 80
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    .end local v1    # "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    .end local v2    # "msg":Landroid/os/Message;
    :goto_0
    return-void

    .line 82
    :catch_0
    move-exception v0

    .line 84
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/AudioRoomListener;->TAG:Ljava/lang/String;

    const-string v4, "parse video proto message err"

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected upMicNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V
    .locals 5
    .param p1, "message"    # Lcom/example/tutorial/VideoProto$VideoMessage;

    .prologue
    .line 393
    :try_start_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageBody()Lcom/google/protobuf/ByteString;

    move-result-object v3

    invoke-static {v3}, Lcom/example/tutorial/VideoProto$UpMicNotify;->parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$UpMicNotify;

    move-result-object v1

    .line 394
    .local v1, "notify":Lcom/example/tutorial/VideoProto$UpMicNotify;
    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$UpMicNotify;->getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v2

    .line 395
    .local v2, "player":Lcom/example/tutorial/VideoProto$PlayerInfo;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v3

    if-lez v3, :cond_0

    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v3

    iget-object v3, v3, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    if-eqz v3, :cond_0

    .line 397
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v3

    iget-object v3, v3, Lcom/boyaa/videosdk/BoyaaVoice;->mMessageHandler:Landroid/os/Handler;

    const/16 v4, 0x45

    invoke-virtual {v3, v4}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 398
    .local v0, "msg":Landroid/os/Message;
    iput-object v2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 399
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 406
    .end local v0    # "msg":Landroid/os/Message;
    .end local v1    # "notify":Lcom/example/tutorial/VideoProto$UpMicNotify;
    .end local v2    # "player":Lcom/example/tutorial/VideoProto$PlayerInfo;
    :cond_0
    :goto_0
    return-void

    .line 402
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public upMicResponse(Lcom/example/tutorial/VideoProto$VideoMessage;)V
    .locals 7
    .param p1, "message"    # Lcom/example/tutorial/VideoProto$VideoMessage;

    .prologue
    .line 475
    :try_start_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageBody()Lcom/google/protobuf/ByteString;

    move-result-object v4

    invoke-static {v4}, Lcom/example/tutorial/VideoProto$UpMicResponse;->parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$UpMicResponse;

    move-result-object v3

    .line 476
    .local v3, "response":Lcom/example/tutorial/VideoProto$UpMicResponse;
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$UpMicResponse;->getResult()Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v4

    invoke-virtual {v4}, Lcom/example/tutorial/VideoProto$ResultID;->getNumber()I

    move-result v0

    .line 477
    .local v0, "iResult":I
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$UpMicResponse;->getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    .line 478
    .local v1, "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    const-string v4, "AudioRoomListener"

    const-string v5, "\u6536\u5230\u4e0a\u9ea6\u8fd4\u56de"

    invoke-static {v4, v5}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 481
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$UpMicResponse;->getResult()Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v4

    sget-object v5, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    if-ne v4, v5, :cond_0

    .line 483
    const-string v4, "AudioRoomListener"

    const-string v5, "\u4e0a\u9ea6\u6210\u529f"

    invoke-static {v4, v5}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v4

    iget-object v4, v4, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 533
    .end local v0    # "iResult":I
    .end local v1    # "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    .end local v3    # "response":Lcom/example/tutorial/VideoProto$UpMicResponse;
    :goto_0
    return-void

    .line 504
    .restart local v0    # "iResult":I
    .restart local v1    # "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    .restart local v3    # "response":Lcom/example/tutorial/VideoProto$UpMicResponse;
    :cond_0
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$UpMicResponse;->getResult()Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v4

    sget-object v5, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_OTHRE_PICKING_UP_MIC:Lcom/example/tutorial/VideoProto$ResultID;

    if-ne v4, v5, :cond_1

    .line 506
    const-string v4, "AudioRoomListener"

    const-string v5, "\u4e0a\u9ea6\u5931\u8d25,\u5176\u4ed6\u4eba\u5728\u9ea6\u4e0a"

    invoke-static {v4, v5}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 507
    const-string v4, "AudioRoomListener"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "\u9ea6\u4e0a \u7528\u6237ID: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " \u6635\u79f0:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " SeatID:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getSeatId()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 514
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v4

    iget-object v4, v4, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v5, 0x38

    invoke-virtual {v4, v5}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    .line 515
    .local v2, "msg":Landroid/os/Message;
    iput-object v1, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 516
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 529
    .end local v0    # "iResult":I
    .end local v1    # "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    .end local v2    # "msg":Landroid/os/Message;
    .end local v3    # "response":Lcom/example/tutorial/VideoProto$UpMicResponse;
    :catch_0
    move-exception v4

    goto :goto_0

    .line 520
    .restart local v0    # "iResult":I
    .restart local v1    # "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    .restart local v3    # "response":Lcom/example/tutorial/VideoProto$UpMicResponse;
    :cond_1
    const-string v4, "AudioRoomListener"

    const-string v5, "\u4e0a\u9ea6\u5931\u8d25"

    invoke-static {v4, v5}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 524
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v4

    iget-object v4, v4, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    .line 525
    .restart local v2    # "msg":Landroid/os/Message;
    iput-object v1, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 526
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method
