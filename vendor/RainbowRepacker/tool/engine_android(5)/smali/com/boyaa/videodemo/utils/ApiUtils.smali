.class public Lcom/boyaa/videodemo/utils/ApiUtils;
.super Ljava/lang/Object;
.source "ApiUtils.java"


# static fields
.field public static mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/videodemo/utils/ApiUtils;->mContext:Landroid/content/Context;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static SendAudioData([BJ)V
    .locals 12
    .param p0, "audioData"    # [B
    .param p1, "timestamp"    # J

    .prologue
    .line 337
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->newBuilder()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v8

    const/16 v9, 0xa

    invoke-virtual {v8, v9}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setClientVersion(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v8

    .line 338
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/videodemo/utils/CacheRef;->getUserID()I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setUserId(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v8

    .line 339
    const-string v9, "1234"

    invoke-virtual {v8, v9}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setAuthKey(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v8

    .line 340
    const-string v9, "PublishAudioRequest"

    invoke-virtual {v8, v9}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setMessageBodyName(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v8

    .line 341
    invoke-virtual {v8}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->build()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v4

    .line 348
    .local v4, "head":Lcom/example/tutorial/VideoProto$MessageHead;
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->newBuilder()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v8

    invoke-virtual {v8, p1, p2}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->setTimeStamp(J)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v8

    .line 350
    invoke-virtual {v8}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->build()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v2

    .line 352
    .local v2, "descript":Lcom/example/tutorial/VideoProto$AudioDescript;
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->newBuilder()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v8

    invoke-virtual {v8, v2}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->setAudioDescript(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v8

    .line 353
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFrom([B)Lcom/google/protobuf/ByteString;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->setAudioData(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v8

    .line 354
    invoke-virtual {v8}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->build()Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    move-result-object v7

    .line 356
    .local v7, "request":Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoMessage;->newBuilder()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v8

    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->toByteString()Lcom/google/protobuf/ByteString;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->setMessageBody(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v8

    .line 357
    invoke-virtual {v8, v4}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->setMessageHead(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v8

    .line 358
    invoke-virtual {v8}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->build()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v6

    .line 362
    .local v6, "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    :try_start_0
    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v8

    array-length v8, v8

    add-int/lit8 v8, v8, 0x4

    invoke-static {v8}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->intToBytes2(I)[B

    move-result-object v1

    .line 363
    .local v1, "dataMessage":[B
    const/4 v8, 0x0

    invoke-static {v1, v8}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->bytesToInt([BI)I

    move-result v5

    .line 365
    .local v5, "iData":I
    array-length v8, v1

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v9

    array-length v9, v9

    add-int/2addr v8, v9

    new-array v0, v8, [B

    .line 366
    .local v0, "data3":[B
    const/4 v8, 0x0

    const/4 v9, 0x0

    array-length v10, v1

    invoke-static {v1, v8, v0, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 367
    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v8

    const/4 v9, 0x0

    array-length v10, v1

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v11

    array-length v11, v11

    invoke-static {v8, v9, v0, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 369
    const-string v8, "SendAudioData"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "PublishAudioRequest:head "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/example/tutorial/VideoProto$MessageHead;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ";body DataLen = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    sget-object v8, Lcom/boyaa/videodemo/data/AudioUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v8}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v8

    const/16 v9, 0x32

    if-lt v8, v9, :cond_0

    .line 373
    sget-object v8, Lcom/boyaa/videodemo/data/AudioUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v8}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 376
    :cond_0
    const-string v8, "AudioData"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "audio len = "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v10, v0

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    sget-object v8, Lcom/boyaa/videodemo/data/AudioUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v8, v0}, Ljava/util/concurrent/ArrayBlockingQueue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 386
    .end local v0    # "data3":[B
    .end local v1    # "dataMessage":[B
    .end local v5    # "iData":I
    :goto_0
    return-void

    .line 382
    :catch_0
    move-exception v3

    .line 384
    .local v3, "e":Ljava/lang/Exception;
    const-string v8, "SendAudio"

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static SendVideoData([BIIJIII)V
    .locals 16
    .param p0, "h264Data"    # [B
    .param p1, "iCount"    # I
    .param p2, "iIndex"    # I
    .param p3, "timestamp"    # J
    .param p5, "type"    # I
    .param p6, "videoType"    # I
    .param p7, "videovalue"    # I

    .prologue
    .line 33
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->newBuilder()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v12

    const/16 v13, 0xa

    invoke-virtual {v12, v13}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setClientVersion(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v12

    .line 34
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    invoke-virtual {v13}, Lcom/boyaa/videodemo/utils/CacheRef;->getUserID()I

    move-result v13

    invoke-virtual {v12, v13}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setUserId(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v12

    .line 35
    const-string v13, "1234"

    invoke-virtual {v12, v13}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setAuthKey(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v12

    .line 36
    const-string v13, "PublishVideoRequest"

    invoke-virtual {v12, v13}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setMessageBodyName(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v12

    .line 37
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->build()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v7

    .line 39
    .local v7, "head":Lcom/example/tutorial/VideoProto$MessageHead;
    const/4 v6, 0x0

    .line 40
    .local v6, "frameType":Lcom/example/tutorial/VideoProto$FrameType;
    sget-object v6, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_I:Lcom/example/tutorial/VideoProto$FrameType;

    .line 41
    packed-switch p5, :pswitch_data_0

    .line 53
    :goto_0
    const/4 v11, 0x0

    .line 54
    .local v11, "videotype":Lcom/example/tutorial/VideoProto$FrameVideoType;
    sget-object v11, Lcom/example/tutorial/VideoProto$FrameVideoType;->FRAME_192:Lcom/example/tutorial/VideoProto$FrameVideoType;

    .line 55
    packed-switch p6, :pswitch_data_1

    .line 68
    :goto_1
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->newBuilder()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->setFrameType(Lcom/example/tutorial/VideoProto$FrameType;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v12

    .line 69
    invoke-virtual {v12, v11}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->setFrameVideoType(Lcom/example/tutorial/VideoProto$FrameVideoType;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v12

    .line 70
    move/from16 v0, p7

    invoke-virtual {v12, v0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->setFrameVideoValue(I)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v12

    .line 71
    move/from16 v0, p1

    invoke-virtual {v12, v0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->setFrameVideoCount(I)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v12

    .line 72
    move/from16 v0, p2

    invoke-virtual {v12, v0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->setFrameVideoIndex(I)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v12

    .line 73
    move-wide/from16 v0, p3

    invoke-virtual {v12, v0, v1}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->setTimeStamp(J)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v12

    .line 74
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->build()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v4

    .line 76
    .local v4, "descript":Lcom/example/tutorial/VideoProto$VideoDescript;
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->newBuilder()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v12

    invoke-virtual {v12, v4}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->setVideoDescript(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v12

    .line 77
    invoke-static/range {p0 .. p0}, Lcom/google/protobuf/ByteString;->copyFrom([B)Lcom/google/protobuf/ByteString;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->setVideoData(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v12

    .line 78
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->build()Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    move-result-object v10

    .line 80
    .local v10, "request":Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoMessage;->newBuilder()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v12

    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->toByteString()Lcom/google/protobuf/ByteString;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->setMessageBody(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v12

    .line 81
    invoke-virtual {v12, v7}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->setMessageHead(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v12

    .line 82
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->build()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v9

    .line 86
    .local v9, "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    :try_start_0
    invoke-virtual {v9}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v12

    array-length v12, v12

    add-int/lit8 v12, v12, 0x4

    invoke-static {v12}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->intToBytes2(I)[B

    move-result-object v3

    .line 87
    .local v3, "dataMessage":[B
    const/4 v12, 0x0

    invoke-static {v3, v12}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->bytesToInt([BI)I

    move-result v8

    .line 89
    .local v8, "iData":I
    array-length v12, v3

    invoke-virtual {v9}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v13

    array-length v13, v13

    add-int/2addr v12, v13

    new-array v2, v12, [B

    .line 90
    .local v2, "data3":[B
    const/4 v12, 0x0

    const/4 v13, 0x0

    array-length v14, v3

    invoke-static {v3, v12, v2, v13, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 91
    invoke-virtual {v9}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v12

    const/4 v13, 0x0

    array-length v14, v3

    invoke-virtual {v9}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v15

    array-length v15, v15

    invoke-static {v12, v13, v2, v14, v15}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 93
    const-string v12, "SendVideoData"

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "PublishVideoRequest:head "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$MessageHead;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ";body DataLen = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    sget-object v12, Lcom/boyaa/videodemo/data/VideoUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v12}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    move-result v12

    const/16 v13, 0x32

    if-lt v12, v13, :cond_0

    .line 97
    sget-object v12, Lcom/boyaa/videodemo/data/VideoUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v12}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 100
    :cond_0
    sget-object v12, Lcom/boyaa/videodemo/data/VideoUDP;->mSendBuf:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v12, v2}, Ljava/util/concurrent/ArrayBlockingQueue;->add(Ljava/lang/Object;)Z

    .line 101
    const-string v12, "SendVideo"

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "encoder length===="

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    .end local v2    # "data3":[B
    .end local v3    # "dataMessage":[B
    .end local v8    # "iData":I
    :goto_2
    return-void

    .line 44
    .end local v4    # "descript":Lcom/example/tutorial/VideoProto$VideoDescript;
    .end local v9    # "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    .end local v10    # "request":Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    .end local v11    # "videotype":Lcom/example/tutorial/VideoProto$FrameVideoType;
    :pswitch_0
    sget-object v6, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_I:Lcom/example/tutorial/VideoProto$FrameType;

    .line 45
    goto/16 :goto_0

    .line 47
    :pswitch_1
    sget-object v6, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_P:Lcom/example/tutorial/VideoProto$FrameType;

    .line 48
    goto/16 :goto_0

    .line 58
    .restart local v11    # "videotype":Lcom/example/tutorial/VideoProto$FrameVideoType;
    :pswitch_2
    sget-object v11, Lcom/example/tutorial/VideoProto$FrameVideoType;->FRAME_192:Lcom/example/tutorial/VideoProto$FrameVideoType;

    .line 59
    goto/16 :goto_1

    .line 61
    :pswitch_3
    sget-object v11, Lcom/example/tutorial/VideoProto$FrameVideoType;->FRAME_320:Lcom/example/tutorial/VideoProto$FrameVideoType;

    .line 62
    goto/16 :goto_1

    .line 104
    .restart local v4    # "descript":Lcom/example/tutorial/VideoProto$VideoDescript;
    .restart local v9    # "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    .restart local v10    # "request":Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    :catch_0
    move-exception v5

    .line 107
    .local v5, "e":Ljava/lang/Exception;
    const-string v12, "SendVideo"

    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 41
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 55
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static abandonMicroPhone(IILjava/lang/String;)V
    .locals 13
    .param p0, "userID"    # I
    .param p1, "seatID"    # I
    .param p2, "string"    # Ljava/lang/String;

    .prologue
    .line 299
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->newBuilder()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v9

    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setClientVersion(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v9

    .line 300
    invoke-virtual {v9, p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setUserId(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v9

    .line 301
    const-string v10, "1234"

    invoke-virtual {v9, v10}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setAuthKey(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v9

    .line 302
    const-string v10, "DownMicRequest"

    invoke-virtual {v9, v10}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setMessageBodyName(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v9

    .line 303
    invoke-virtual {v9}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->build()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v3

    .line 305
    .local v3, "head":Lcom/example/tutorial/VideoProto$MessageHead;
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->newBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v9

    invoke-virtual {v9, p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->setUserId(I)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v9

    invoke-virtual {v9, p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->setSeatId(I)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v9

    invoke-virtual {v9, p2}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->setUserName(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v9

    invoke-virtual {v9}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v5

    .line 307
    .local v5, "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicRequest;->newBuilder()Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    move-result-object v9

    invoke-virtual {v9, v5}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    move-result-object v9

    invoke-virtual {v9}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->build()Lcom/example/tutorial/VideoProto$DownMicRequest;

    move-result-object v7

    .line 308
    .local v7, "request":Lcom/example/tutorial/VideoProto$DownMicRequest;
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$DownMicRequest;->toString()Ljava/lang/String;

    move-result-object v8

    .line 309
    .local v8, "strB":Ljava/lang/String;
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoMessage;->newBuilder()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v9

    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$DownMicRequest;->toByteString()Lcom/google/protobuf/ByteString;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->setMessageBody(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v9

    .line 310
    invoke-virtual {v9, v3}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->setMessageHead(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v9

    .line 311
    invoke-virtual {v9}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->build()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v6

    .line 316
    .local v6, "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    :try_start_0
    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v9

    array-length v9, v9

    add-int/lit8 v9, v9, 0x4

    invoke-static {v9}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->intToBytes2(I)[B

    move-result-object v0

    .line 317
    .local v0, "data":[B
    const/4 v9, 0x0

    invoke-static {v0, v9}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->bytesToInt([BI)I

    move-result v4

    .line 319
    .local v4, "iData":I
    array-length v9, v0

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v10

    array-length v10, v10

    add-int/2addr v9, v10

    new-array v1, v9, [B

    .line 320
    .local v1, "data3":[B
    const/4 v9, 0x0

    const/4 v10, 0x0

    array-length v11, v0

    invoke-static {v0, v9, v1, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 321
    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v9

    const/4 v10, 0x0

    array-length v11, v0

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v12

    array-length v12, v12

    invoke-static {v9, v10, v1, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 323
    const-string v9, "ClientVedio"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "DownMicRequest "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$MessageHead;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ";body"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    invoke-static {}, Lcom/boyaa/videodemo/data/ClientVedio;->getInstance()Lcom/boyaa/videodemo/data/ClientVedio;

    move-result-object v9

    invoke-virtual {v9, v1}, Lcom/boyaa/videodemo/data/ClientVedio;->writeData2Stream([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 332
    .end local v0    # "data":[B
    .end local v1    # "data3":[B
    .end local v4    # "iData":I
    :goto_0
    return-void

    .line 328
    :catch_0
    move-exception v2

    .line 330
    .local v2, "e":Ljava/lang/Exception;
    const-string v9, "ClientVedio"

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static applyMicroPhone()V
    .locals 0

    .prologue
    .line 391
    return-void
.end method

.method public static applyMicroPhone(IILjava/lang/String;)V
    .locals 13
    .param p0, "userID"    # I
    .param p1, "seatID"    # I
    .param p2, "string"    # Ljava/lang/String;

    .prologue
    .line 261
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->newBuilder()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v9

    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setClientVersion(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v9

    .line 262
    invoke-virtual {v9, p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setUserId(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v9

    .line 263
    const-string v10, "1234"

    invoke-virtual {v9, v10}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setAuthKey(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v9

    .line 264
    const-string v10, "UpMicRequest"

    invoke-virtual {v9, v10}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setMessageBodyName(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v9

    .line 265
    invoke-virtual {v9}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->build()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v3

    .line 267
    .local v3, "head":Lcom/example/tutorial/VideoProto$MessageHead;
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->newBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v9

    invoke-virtual {v9, p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->setUserId(I)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v9

    invoke-virtual {v9, p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->setSeatId(I)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v9

    invoke-virtual {v9, p2}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->setUserName(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v9

    invoke-virtual {v9}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v5

    .line 269
    .local v5, "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicRequest;->newBuilder()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v9

    invoke-virtual {v9, v5}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v9

    invoke-virtual {v9}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->build()Lcom/example/tutorial/VideoProto$UpMicRequest;

    move-result-object v7

    .line 270
    .local v7, "request":Lcom/example/tutorial/VideoProto$UpMicRequest;
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$UpMicRequest;->toString()Ljava/lang/String;

    move-result-object v8

    .line 271
    .local v8, "strB":Ljava/lang/String;
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoMessage;->newBuilder()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v9

    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$UpMicRequest;->toByteString()Lcom/google/protobuf/ByteString;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->setMessageBody(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v9

    .line 272
    invoke-virtual {v9, v3}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->setMessageHead(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v9

    .line 273
    invoke-virtual {v9}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->build()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v6

    .line 278
    .local v6, "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    :try_start_0
    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v9

    array-length v9, v9

    add-int/lit8 v9, v9, 0x4

    invoke-static {v9}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->intToBytes2(I)[B

    move-result-object v0

    .line 279
    .local v0, "data":[B
    const/4 v9, 0x0

    invoke-static {v0, v9}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->bytesToInt([BI)I

    move-result v4

    .line 281
    .local v4, "iData":I
    array-length v9, v0

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v10

    array-length v10, v10

    add-int/2addr v9, v10

    new-array v1, v9, [B

    .line 282
    .local v1, "data3":[B
    const/4 v9, 0x0

    const/4 v10, 0x0

    array-length v11, v0

    invoke-static {v0, v9, v1, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 283
    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v9

    const/4 v10, 0x0

    array-length v11, v0

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v12

    array-length v12, v12

    invoke-static {v9, v10, v1, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 285
    const-string v9, "ClientVedio"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "UpMicRequest "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$MessageHead;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ";body"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    invoke-static {}, Lcom/boyaa/videodemo/data/ClientVedio;->getInstance()Lcom/boyaa/videodemo/data/ClientVedio;

    move-result-object v9

    invoke-virtual {v9, v1}, Lcom/boyaa/videodemo/data/ClientVedio;->writeData2Stream([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 294
    .end local v0    # "data":[B
    .end local v1    # "data3":[B
    .end local v4    # "iData":I
    :goto_0
    return-void

    .line 290
    :catch_0
    move-exception v2

    .line 292
    .local v2, "e":Ljava/lang/Exception;
    const-string v9, "ClientVedio"

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static loginVideoRoom(IIIIIIIZZ)V
    .locals 17
    .param p0, "appid"    # I
    .param p1, "uid"    # I
    .param p2, "iHeight"    # I
    .param p3, "iWidth"    # I
    .param p4, "roomID"    # I
    .param p5, "iRoomType"    # I
    .param p6, "iNetWorkType"    # I
    .param p7, "bOpenAudio"    # Z
    .param p8, "bOpenVideo"    # Z

    .prologue
    .line 114
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->newBuilder()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v13

    const/16 v14, 0xa

    invoke-virtual {v13, v14}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setClientVersion(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v13

    .line 115
    move/from16 v0, p1

    invoke-virtual {v13, v0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setUserId(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v13

    .line 116
    const-string v14, "1234"

    invoke-virtual {v13, v14}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setAuthKey(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v13

    .line 117
    const-string v14, "LoginVideoRoomRequest"

    invoke-virtual {v13, v14}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setMessageBodyName(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v13

    .line 118
    invoke-virtual {v13}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->build()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v4

    .line 119
    .local v4, "head":Lcom/example/tutorial/VideoProto$MessageHead;
    const/4 v11, 0x0

    .line 121
    .local v11, "roomType":Lcom/example/tutorial/VideoProto$RoomType;
    sget-object v11, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    .line 122
    packed-switch p5, :pswitch_data_0

    .line 140
    :goto_0
    const/4 v9, 0x0

    .line 142
    .local v9, "netType":Lcom/example/tutorial/VideoProto$NetworkType;
    sget-object v9, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_2G:Lcom/example/tutorial/VideoProto$NetworkType;

    .line 143
    packed-switch p6, :pswitch_data_1

    .line 165
    :goto_1
    const/4 v6, 0x0

    .line 166
    .local v6, "mAudioType":Lcom/example/tutorial/VideoProto$MediaControl;
    if-eqz p7, :cond_0

    .line 167
    sget-object v6, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 171
    :goto_2
    const/4 v7, 0x0

    .line 172
    .local v7, "mVideoType":Lcom/example/tutorial/VideoProto$MediaControl;
    if-eqz p8, :cond_1

    .line 173
    sget-object v7, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_VIDEO:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 179
    :goto_3
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->newBuilder()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v13

    .line 180
    move/from16 v0, p2

    invoke-virtual {v13, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setHeight(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v13

    .line 181
    move/from16 v0, p3

    invoke-virtual {v13, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setWidth(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v13

    .line 182
    move/from16 v0, p4

    invoke-virtual {v13, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setRoomId(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v13

    .line 183
    invoke-virtual {v13, v11}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setRoomType(Lcom/example/tutorial/VideoProto$RoomType;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v13

    .line 184
    move/from16 v0, p0

    invoke-virtual {v13, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setAppId(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v13

    .line 185
    invoke-virtual {v13, v9}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setNetworkType(Lcom/example/tutorial/VideoProto$NetworkType;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v13

    .line 186
    invoke-virtual {v13, v6}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setAudioControl(Lcom/example/tutorial/VideoProto$MediaControl;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v13

    .line 187
    invoke-virtual {v13, v7}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setVideoControl(Lcom/example/tutorial/VideoProto$MediaControl;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v13

    .line 188
    invoke-virtual {v13}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->build()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    move-result-object v10

    .line 189
    .local v10, "request":Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->toString()Ljava/lang/String;

    move-result-object v12

    .line 190
    .local v12, "strB":Ljava/lang/String;
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoMessage;->newBuilder()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v13

    invoke-virtual {v10}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->toByteString()Lcom/google/protobuf/ByteString;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->setMessageBody(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v13

    .line 191
    invoke-virtual {v13, v4}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->setMessageHead(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v13

    .line 192
    invoke-virtual {v13}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->build()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v8

    .line 196
    .local v8, "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    :try_start_0
    invoke-virtual {v8}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v13

    array-length v13, v13

    add-int/lit8 v13, v13, 0x4

    invoke-static {v13}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->intToBytes2(I)[B

    move-result-object v1

    .line 197
    .local v1, "data":[B
    const/4 v13, 0x0

    invoke-static {v1, v13}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->bytesToInt([BI)I

    move-result v5

    .line 199
    .local v5, "iData":I
    array-length v13, v1

    invoke-virtual {v8}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v14

    array-length v14, v14

    add-int/2addr v13, v14

    new-array v2, v13, [B

    .line 200
    .local v2, "data3":[B
    const/4 v13, 0x0

    const/4 v14, 0x0

    array-length v15, v1

    invoke-static {v1, v13, v2, v14, v15}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 201
    invoke-virtual {v8}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v13

    const/4 v14, 0x0

    array-length v15, v1

    invoke-virtual {v8}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v16

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-static {v13, v14, v2, v15, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 203
    const-string v13, "ClientVedio"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "LoginVideoRoomRequest:head "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/example/tutorial/VideoProto$MessageHead;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ";body"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    invoke-static {}, Lcom/boyaa/videodemo/data/ClientVedio;->getInstance()Lcom/boyaa/videodemo/data/ClientVedio;

    move-result-object v13

    invoke-virtual {v13, v2}, Lcom/boyaa/videodemo/data/ClientVedio;->writeData2Stream([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 212
    .end local v1    # "data":[B
    .end local v2    # "data3":[B
    .end local v5    # "iData":I
    :goto_4
    return-void

    .line 125
    .end local v6    # "mAudioType":Lcom/example/tutorial/VideoProto$MediaControl;
    .end local v7    # "mVideoType":Lcom/example/tutorial/VideoProto$MediaControl;
    .end local v8    # "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    .end local v9    # "netType":Lcom/example/tutorial/VideoProto$NetworkType;
    .end local v10    # "request":Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .end local v12    # "strB":Ljava/lang/String;
    :pswitch_0
    sget-object v11, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    .line 126
    goto/16 :goto_0

    .line 128
    :pswitch_1
    sget-object v11, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    .line 129
    goto/16 :goto_0

    .line 131
    :pswitch_2
    sget-object v11, Lcom/example/tutorial/VideoProto$RoomType;->M_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    .line 132
    goto/16 :goto_0

    .line 134
    :pswitch_3
    sget-object v11, Lcom/example/tutorial/VideoProto$RoomType;->M_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    .line 135
    goto/16 :goto_0

    .line 146
    .restart local v9    # "netType":Lcom/example/tutorial/VideoProto$NetworkType;
    :pswitch_4
    sget-object v9, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_2G:Lcom/example/tutorial/VideoProto$NetworkType;

    .line 147
    goto/16 :goto_1

    .line 149
    :pswitch_5
    sget-object v9, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_3G:Lcom/example/tutorial/VideoProto$NetworkType;

    .line 150
    goto/16 :goto_1

    .line 152
    :pswitch_6
    sget-object v9, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_4G:Lcom/example/tutorial/VideoProto$NetworkType;

    .line 153
    goto/16 :goto_1

    .line 155
    :pswitch_7
    sget-object v9, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_5G:Lcom/example/tutorial/VideoProto$NetworkType;

    .line 156
    goto/16 :goto_1

    .line 158
    :pswitch_8
    sget-object v9, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_WIFI:Lcom/example/tutorial/VideoProto$NetworkType;

    .line 159
    goto/16 :goto_1

    .line 169
    .restart local v6    # "mAudioType":Lcom/example/tutorial/VideoProto$MediaControl;
    :cond_0
    sget-object v6, Lcom/example/tutorial/VideoProto$MediaControl;->SHUTDOWN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    goto/16 :goto_2

    .line 175
    .restart local v7    # "mVideoType":Lcom/example/tutorial/VideoProto$MediaControl;
    :cond_1
    sget-object v7, Lcom/example/tutorial/VideoProto$MediaControl;->SHUTDOWN_VIDEO:Lcom/example/tutorial/VideoProto$MediaControl;

    goto/16 :goto_3

    .line 208
    .restart local v8    # "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    .restart local v10    # "request":Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .restart local v12    # "strB":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 210
    .local v3, "e":Ljava/lang/Exception;
    const-string v13, "ClientVedio"

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 122
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch

    .line 143
    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method public static declared-synchronized reconnectControlConnection()V
    .locals 7

    .prologue
    .line 399
    const-class v2, Lcom/boyaa/videodemo/utils/ApiUtils;

    monitor-enter v2

    const-wide/16 v3, 0x7d0

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 401
    const-string v1, "BoyaaReceiver"

    const-string v3, " Socket \u6389\u7ebf\u4e86\uff0c\u91cd\u65b0\u8fde\u63a5"

    invoke-static {v1, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 404
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v1

    iget-object v1, v1, Lcom/boyaa/videosdk/BoyaaVoice;->mActivity:Landroid/app/Activity;

    if-eqz v1, :cond_0

    new-instance v1, Lcom/boyaa/videodemo/utils/NetUtils;

    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v3

    iget-object v3, v3, Lcom/boyaa/videosdk/BoyaaVoice;->mActivity:Landroid/app/Activity;

    invoke-direct {v1, v3}, Lcom/boyaa/videodemo/utils/NetUtils;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/boyaa/videodemo/utils/NetUtils;->isNetWork()Z

    move-result v1

    if-nez v1, :cond_0

    .line 407
    const-string v1, "BoyaaReceiver"

    const-string v3, "\u7f51\u7edc\u6ca1\u6709\u8fde\u63a5\u597d"

    invoke-static {v1, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 431
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    monitor-exit v2

    return-void

    .line 411
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    :try_start_1
    sget-boolean v1, Lcom/boyaa/videodemo/utils/Constants;->isOnRecontentAccess:Z

    if-nez v1, :cond_1

    .line 413
    const/4 v1, 0x1

    sput-boolean v1, Lcom/boyaa/videodemo/utils/Constants;->isOnRecontentAccess:Z

    .line 415
    const-string v1, "BoyaaReceiver"

    const-string v3, " Socket \u6389\u7ebf\u4e86\uff0c\u6211\u5728 \u91cd\u8fde"

    invoke-static {v1, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    invoke-static {}, Lcom/boyaa/videodemo/data/ClientVedio;->getInstance()Lcom/boyaa/videodemo/data/ClientVedio;

    move-result-object v1

    invoke-virtual {v1}, Lcom/boyaa/videodemo/data/ClientVedio;->release()V

    .line 420
    invoke-static {}, Lcom/boyaa/videodemo/data/ClientVedio;->getInstance()Lcom/boyaa/videodemo/data/ClientVedio;

    move-result-object v1

    const/4 v3, 0x0

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v4

    iget-object v4, v4, Lcom/boyaa/videodemo/utils/CacheRef;->mIP:Ljava/lang/String;

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v5

    iget v5, v5, Lcom/boyaa/videodemo/utils/CacheRef;->mPort:I

    new-instance v6, Lcom/boyaa/videodemo/listener/AudioRoomListener;

    invoke-direct {v6}, Lcom/boyaa/videodemo/listener/AudioRoomListener;-><init>()V

    invoke-virtual {v1, v3, v4, v5, v6}, Lcom/boyaa/videodemo/data/ClientVedio;->connectAsyn(ILjava/lang/String;ILcom/boyaa/videodemo/listener/TaskListener;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 427
    :catch_0
    move-exception v0

    .line 429
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 430
    const-string v1, "BoyaaReceiver"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "reconnect terminal socket failed "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 399
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1

    .line 423
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :try_start_3
    const-string v1, "BoyaaReceiver"

    const-string v3, " \u6211\u5728 \u91cd\u8fde \u7a0d\u540e\u3002\u3002\u3002"

    invoke-static {v1, v3}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method

.method public static requestAudioControl(IZ)V
    .locals 13
    .param p0, "userID"    # I
    .param p1, "bSpeakEnable"    # Z

    .prologue
    .line 217
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->newBuilder()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v9

    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setClientVersion(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v9

    .line 218
    invoke-virtual {v9, p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setUserId(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v9

    .line 219
    const-string v10, "1234"

    invoke-virtual {v9, v10}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setAuthKey(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v9

    .line 220
    const-string v10, "AudioCtrolRequest"

    invoke-virtual {v9, v10}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setMessageBodyName(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v9

    .line 221
    invoke-virtual {v9}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->build()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v4

    .line 223
    .local v4, "head":Lcom/example/tutorial/VideoProto$MessageHead;
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 224
    .local v0, "audioCtrol":Lcom/example/tutorial/VideoProto$AudioCtrol;
    if-eqz p1, :cond_0

    .line 225
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SPEAK:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 230
    :goto_0
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->newBuilder()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v9

    invoke-virtual {v9, v0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->setAudioControl(Lcom/example/tutorial/VideoProto$AudioCtrol;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v9

    invoke-virtual {v9}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->build()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    move-result-object v7

    .line 231
    .local v7, "request":Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->toString()Ljava/lang/String;

    move-result-object v8

    .line 232
    .local v8, "strB":Ljava/lang/String;
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoMessage;->newBuilder()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v9

    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->toByteString()Lcom/google/protobuf/ByteString;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->setMessageBody(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v9

    .line 233
    invoke-virtual {v9, v4}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->setMessageHead(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v9

    .line 234
    invoke-virtual {v9}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->build()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v6

    .line 238
    .local v6, "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    :try_start_0
    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v9

    array-length v9, v9

    add-int/lit8 v9, v9, 0x4

    invoke-static {v9}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->intToBytes2(I)[B

    move-result-object v1

    .line 239
    .local v1, "data":[B
    const/4 v9, 0x0

    invoke-static {v1, v9}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->bytesToInt([BI)I

    move-result v5

    .line 241
    .local v5, "iData":I
    array-length v9, v1

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v10

    array-length v10, v10

    add-int/2addr v9, v10

    new-array v2, v9, [B

    .line 242
    .local v2, "data3":[B
    const/4 v9, 0x0

    const/4 v10, 0x0

    array-length v11, v1

    invoke-static {v1, v9, v2, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 243
    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v9

    const/4 v10, 0x0

    array-length v11, v1

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v12

    array-length v12, v12

    invoke-static {v9, v10, v2, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 245
    const-string v9, "AudioCtrol"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "requestAudioControl: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/example/tutorial/VideoProto$MessageHead;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ";body"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    invoke-static {}, Lcom/boyaa/videodemo/data/ClientVedio;->getInstance()Lcom/boyaa/videodemo/data/ClientVedio;

    move-result-object v9

    invoke-virtual {v9, v2}, Lcom/boyaa/videodemo/data/ClientVedio;->writeData2Stream([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    .end local v1    # "data":[B
    .end local v2    # "data3":[B
    .end local v5    # "iData":I
    :goto_1
    return-void

    .line 227
    .end local v6    # "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    .end local v7    # "request":Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .end local v8    # "strB":Ljava/lang/String;
    :cond_0
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    goto :goto_0

    .line 249
    .restart local v6    # "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    .restart local v7    # "request":Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .restart local v8    # "strB":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 251
    .local v3, "e":Ljava/lang/Exception;
    const-string v9, "AudioCtrol"

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public static switchAudioVideo(II)V
    .locals 12
    .param p0, "userID"    # I
    .param p1, "switchID"    # I

    .prologue
    .line 448
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->newBuilder()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v8

    const/16 v9, 0xa

    invoke-virtual {v8, v9}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setClientVersion(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v8

    .line 449
    invoke-virtual {v8, p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setUserId(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v8

    .line 450
    const-string v9, "1234"

    invoke-virtual {v8, v9}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setAuthKey(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v8

    .line 451
    const-string v9, "MediaControlRequest"

    invoke-virtual {v8, v9}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setMessageBodyName(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v8

    .line 452
    invoke-virtual {v8}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->build()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v3

    .line 454
    .local v3, "head":Lcom/example/tutorial/VideoProto$MessageHead;
    const/4 v5, 0x0

    .line 456
    .local v5, "mType":Lcom/example/tutorial/VideoProto$MediaControl;
    sget-object v5, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 457
    packed-switch p1, :pswitch_data_0

    .line 475
    :goto_0
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->newBuilder()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v8

    invoke-virtual {v8, v5}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->setMediaControl(Lcom/example/tutorial/VideoProto$MediaControl;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->build()Lcom/example/tutorial/VideoProto$MediaControlRequest;

    move-result-object v7

    .line 476
    .local v7, "request":Lcom/example/tutorial/VideoProto$MediaControlRequest;
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoMessage;->newBuilder()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v8

    invoke-virtual {v7}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->toByteString()Lcom/google/protobuf/ByteString;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->setMessageBody(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v8

    .line 477
    invoke-virtual {v8, v3}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->setMessageHead(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v8

    .line 478
    invoke-virtual {v8}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->build()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v6

    .line 482
    .local v6, "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    :try_start_0
    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v8

    array-length v8, v8

    add-int/lit8 v8, v8, 0x4

    invoke-static {v8}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->intToBytes2(I)[B

    move-result-object v0

    .line 483
    .local v0, "data":[B
    const/4 v8, 0x0

    invoke-static {v0, v8}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->bytesToInt([BI)I

    move-result v4

    .line 485
    .local v4, "iData":I
    array-length v8, v0

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v9

    array-length v9, v9

    add-int/2addr v8, v9

    new-array v1, v8, [B

    .line 486
    .local v1, "data3":[B
    const/4 v8, 0x0

    const/4 v9, 0x0

    array-length v10, v0

    invoke-static {v0, v8, v1, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 487
    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v8

    const/4 v9, 0x0

    array-length v10, v0

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoMessage;->toByteArray()[B

    move-result-object v11

    array-length v11, v11

    invoke-static {v8, v9, v1, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 491
    invoke-static {}, Lcom/boyaa/videodemo/data/ClientVedio;->getInstance()Lcom/boyaa/videodemo/data/ClientVedio;

    move-result-object v8

    invoke-virtual {v8, v1}, Lcom/boyaa/videodemo/data/ClientVedio;->writeData2Stream([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 498
    .end local v0    # "data":[B
    .end local v1    # "data3":[B
    .end local v4    # "iData":I
    :goto_1
    return-void

    .line 460
    .end local v6    # "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    .end local v7    # "request":Lcom/example/tutorial/VideoProto$MediaControlRequest;
    :pswitch_0
    sget-object v5, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 461
    goto :goto_0

    .line 463
    :pswitch_1
    sget-object v5, Lcom/example/tutorial/VideoProto$MediaControl;->SHUTDOWN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 464
    goto :goto_0

    .line 466
    :pswitch_2
    sget-object v5, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_VIDEO:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 467
    goto :goto_0

    .line 469
    :pswitch_3
    sget-object v5, Lcom/example/tutorial/VideoProto$MediaControl;->SHUTDOWN_VIDEO:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 470
    goto :goto_0

    .line 494
    .restart local v6    # "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    .restart local v7    # "request":Lcom/example/tutorial/VideoProto$MediaControlRequest;
    :catch_0
    move-exception v2

    .line 496
    .local v2, "e":Ljava/lang/Exception;
    const-string v8, "ClientVedio"

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 457
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
