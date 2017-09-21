.class public Lcom/boyaa/videodemo/listener/VideoUdpListener;
.super Ljava/lang/Object;
.source "VideoUdpListener.java"

# interfaces
.implements Lcom/boyaa/videodemo/listener/TaskListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/videodemo/listener/VideoUdpListener$ParseHandler;
    }
.end annotation


# instance fields
.field private final PARSE_WATH:I

.field private TAG:Ljava/lang/String;

.field private iLastIndex:I

.field private mParseHandler:Lcom/boyaa/videodemo/listener/VideoUdpListener$ParseHandler;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Lcom/boyaa/videodemo/listener/VideoUdpListener$ParseHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/boyaa/videodemo/listener/VideoUdpListener$ParseHandler;-><init>(Lcom/boyaa/videodemo/listener/VideoUdpListener;Lcom/boyaa/videodemo/listener/VideoUdpListener$ParseHandler;)V

    iput-object v0, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->mParseHandler:Lcom/boyaa/videodemo/listener/VideoUdpListener$ParseHandler;

    .line 42
    iput v2, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->PARSE_WATH:I

    .line 44
    const-string v0, "VideoUdpListener"

    iput-object v0, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->TAG:Ljava/lang/String;

    .line 428
    iput v2, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    .line 47
    return-void
.end method

.method private CheckFrameData(Lcom/example/tutorial/VideoProto$FrameType;I)I
    .locals 7
    .param p1, "frameType"    # Lcom/example/tutorial/VideoProto$FrameType;
    .param p2, "frameVideoIndex"    # I

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v2, -0x1

    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 335
    const/4 v0, -0x3

    .line 336
    .local v0, "iR":I
    sget-object v1, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_I:Lcom/example/tutorial/VideoProto$FrameType;

    if-ne p1, v1, :cond_1

    .line 338
    const/4 v1, 0x7

    if-ne p2, v1, :cond_0

    .line 340
    iput v4, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    .line 341
    const/4 v1, 0x1

    .line 425
    :goto_0
    return v1

    .line 345
    :cond_0
    iput v2, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    .line 346
    const v1, -0x989298

    goto :goto_0

    .line 351
    :cond_1
    sget-object v1, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_P:Lcom/example/tutorial/VideoProto$FrameType;

    if-eq p1, v1, :cond_2

    .line 353
    iput v2, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    .line 354
    const v1, -0x5f5e0ff

    goto :goto_0

    .line 357
    :cond_2
    packed-switch p2, :pswitch_data_0

    :goto_1
    move v1, v0

    .line 425
    goto :goto_0

    .line 360
    :pswitch_0
    iget v1, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    if-ne v1, v4, :cond_3

    .line 362
    const/16 v0, 0x16

    .line 363
    const/16 v1, 0x9

    iput v1, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    goto :goto_1

    .line 366
    :cond_3
    iput v4, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    goto :goto_1

    .line 369
    :pswitch_1
    iget v1, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    const/16 v2, 0x9

    if-ne v1, v2, :cond_4

    .line 371
    const/16 v0, 0x14d

    .line 372
    iput v3, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    goto :goto_1

    .line 375
    :cond_4
    iput v4, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    goto :goto_1

    .line 378
    :pswitch_2
    iget v1, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_5

    .line 380
    const v0, 0x43d11c

    .line 381
    iput v5, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    goto :goto_1

    .line 384
    :cond_5
    iput v3, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    goto :goto_1

    .line 387
    :pswitch_3
    iget v1, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    if-ne v1, v5, :cond_6

    .line 389
    const/16 v0, 0x15b3

    .line 390
    iput v6, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    goto :goto_1

    .line 393
    :cond_6
    iput v3, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    goto :goto_1

    .line 396
    :pswitch_4
    iget v1, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    if-ne v1, v6, :cond_7

    .line 398
    const/16 v0, 0x42

    .line 399
    const/4 v1, 0x5

    iput v1, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    goto :goto_1

    .line 402
    :cond_7
    iput v3, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    goto :goto_1

    .line 405
    :pswitch_5
    iget v1, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    const/4 v2, 0x5

    if-ne v1, v2, :cond_8

    .line 407
    const v0, 0xbde31

    .line 408
    const/4 v1, 0x6

    iput v1, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    goto :goto_1

    .line 411
    :cond_8
    iput v3, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    goto :goto_1

    .line 414
    :pswitch_6
    iget v1, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    const/4 v2, 0x6

    if-ne v1, v2, :cond_9

    .line 416
    const v0, 0xd9038

    .line 417
    const/4 v1, 0x7

    iput v1, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    goto :goto_1

    .line 420
    :cond_9
    iput v3, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    goto :goto_1

    .line 357
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private CheckFrameDataExt(Lcom/example/tutorial/VideoProto$FrameType;I)I
    .locals 6
    .param p1, "frameType"    # Lcom/example/tutorial/VideoProto$FrameType;
    .param p2, "frameVideoIndex"    # I

    .prologue
    const/4 v0, 0x1

    const/16 v1, -0x64

    const/16 v2, -0x65

    .line 113
    const-string v3, "CheckFrame"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Sequen ..."

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "...."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    sget-object v3, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_I:Lcom/example/tutorial/VideoProto$FrameType;

    if-ne p1, v3, :cond_0

    .line 116
    const/4 v1, 0x0

    iput v1, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    .line 136
    :goto_0
    return v0

    .line 121
    :cond_0
    sget-object v3, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_P:Lcom/example/tutorial/VideoProto$FrameType;

    if-eq p1, v3, :cond_1

    .line 123
    iput v1, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    move v0, v1

    .line 124
    goto :goto_0

    .line 128
    :cond_1
    iget v1, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    add-int/lit8 v3, p2, -0x1

    if-ne v1, v3, :cond_2

    .line 130
    iput p2, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    goto :goto_0

    .line 135
    :cond_2
    iput v2, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->iLastIndex:I

    move v0, v2

    .line 136
    goto :goto_0
.end method


# virtual methods
.method public failed(Ljava/lang/Exception;I)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "key"    # I

    .prologue
    .line 53
    return-void
.end method

.method public getVedioNotify(Lcom/example/tutorial/VideoProto$VideoMessage;)V
    .locals 17
    .param p1, "message"    # Lcom/example/tutorial/VideoProto$VideoMessage;

    .prologue
    .line 147
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageBody()Lcom/google/protobuf/ByteString;

    move-result-object v13

    invoke-static {v13}, Lcom/example/tutorial/VideoProto$VideoNotify;->parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$VideoNotify;

    move-result-object v8

    .line 148
    .local v8, "notify":Lcom/example/tutorial/VideoProto$VideoNotify;
    invoke-virtual {v8}, Lcom/example/tutorial/VideoProto$VideoNotify;->getSendUserId()I

    move-result v10

    .line 149
    .local v10, "send_user_id":I
    invoke-virtual {v8}, Lcom/example/tutorial/VideoProto$VideoNotify;->getSeatId()I

    move-result v9

    .line 150
    .local v9, "seat_id":I
    invoke-virtual {v8}, Lcom/example/tutorial/VideoProto$VideoNotify;->getVideoDescript()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v12

    .line 151
    .local v12, "video_descript":Lcom/example/tutorial/VideoProto$VideoDescript;
    invoke-virtual {v8}, Lcom/example/tutorial/VideoProto$VideoNotify;->getVideoData()Lcom/google/protobuf/ByteString;

    move-result-object v13

    invoke-virtual {v13}, Lcom/google/protobuf/ByteString;->toByteArray()[B

    move-result-object v2

    .line 153
    .local v2, "data":[B
    const-string v13, "Vedio Recv"

    const-string v14, "\u6536\u5230\u89c6\u9891\u6d88\u606f"

    invoke-static {v13, v14}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    const-string v13, "Vedio Recv"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "\u7528\u6237ID: "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    const-string v13, "Vedio Recv"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "\u89c6\u9891\u5e27\u7c7b\uff1a "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoValue()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    const-string v13, "Vedio Recv"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "\u65f6\u95f4\u6233:"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript;->getTimeStamp()J

    move-result-wide v15

    invoke-virtual/range {v14 .. v16}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    invoke-static {}, Lcom/boyaa/videodemo/utils/Constants;->getNowTime()Ljava/lang/String;

    move-result-object v11

    .line 159
    .local v11, "strTime":Ljava/lang/String;
    const-string v13, "Vedio Recv"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "\u5f53\u524d\u5e27\u63a5\u6536\u65f6\u95f4\uff1a "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    const-string v13, "Vedio Recv"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "\u5e27\u7c7b\u578b: "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameType()Lcom/example/tutorial/VideoProto$FrameType;

    move-result-object v15

    invoke-virtual {v15}, Lcom/example/tutorial/VideoProto$FrameType;->getNumber()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameType()Lcom/example/tutorial/VideoProto$FrameType;

    move-result-object v13

    invoke-virtual {v13}, Lcom/example/tutorial/VideoProto$FrameType;->getNumber()I

    move-result v5

    .line 163
    .local v5, "iDataType":I
    const/4 v13, 0x3

    if-ne v5, v13, :cond_1

    .line 331
    .end local v2    # "data":[B
    .end local v5    # "iDataType":I
    .end local v8    # "notify":Lcom/example/tutorial/VideoProto$VideoNotify;
    .end local v9    # "seat_id":I
    .end local v10    # "send_user_id":I
    .end local v11    # "strTime":Ljava/lang/String;
    .end local v12    # "video_descript":Lcom/example/tutorial/VideoProto$VideoDescript;
    :cond_0
    :goto_0
    return-void

    .line 165
    .restart local v2    # "data":[B
    .restart local v5    # "iDataType":I
    .restart local v8    # "notify":Lcom/example/tutorial/VideoProto$VideoNotify;
    .restart local v9    # "seat_id":I
    .restart local v10    # "send_user_id":I
    .restart local v11    # "strTime":Ljava/lang/String;
    .restart local v12    # "video_descript":Lcom/example/tutorial/VideoProto$VideoDescript;
    :cond_1
    const/4 v13, 0x4

    if-eq v5, v13, :cond_0

    .line 168
    const-string v13, "Vedio Recv"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "\u5e27\u5206\u8fa8\u7387\u7c7b\u578b: "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoType()Lcom/example/tutorial/VideoProto$FrameVideoType;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoType()Lcom/example/tutorial/VideoProto$FrameVideoType;

    move-result-object v13

    invoke-virtual {v13}, Lcom/example/tutorial/VideoProto$FrameVideoType;->getNumber()I

    move-result v4

    .line 171
    .local v4, "iDataDisType":I
    const-string v13, "Vedio Recv"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "\u5e27\u7387: "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoValue()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoValue()I

    move-result v7

    .line 174
    .local v7, "iFrameVideoValue":I
    const-string v13, "Vedio Recv"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "\u5f53\u524d\u5e27\u65b9\u5411: "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoCount()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoCount()I

    move-result v6

    .line 177
    .local v6, "iFrameOrien":I
    const-string v13, "Vedio Recv"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "\u5e27\u7c7b\u578b: "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameType()Lcom/example/tutorial/VideoProto$FrameType;

    move-result-object v15

    invoke-virtual {v15}, Lcom/example/tutorial/VideoProto$FrameType;->getNumber()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " \u5e27\u5206\u5305\u5e8f\uff1a "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoIndex()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    const-string v13, "IndexTag"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "index value"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoIndex()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameType()Lcom/example/tutorial/VideoProto$FrameType;

    move-result-object v13

    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoIndex()I

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/boyaa/videodemo/listener/VideoUdpListener;->CheckFrameDataExt(Lcom/example/tutorial/VideoProto$FrameType;I)I

    move-result v3

    .line 185
    .local v3, "errorCode":I
    const-string v13, "RECV VEDIO"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "size:"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v15, Lh264/com/AVDecoder1Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v15}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->getSize()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "     errorCode  "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    if-ltz v3, :cond_0

    .line 189
    new-instance v1, Lcom/boyaa/videodemo/bean/VedioBean;

    invoke-direct {v1}, Lcom/boyaa/videodemo/bean/VedioBean;-><init>()V

    .line 190
    .local v1, "bean":Lcom/boyaa/videodemo/bean/VedioBean;
    invoke-virtual {v12}, Lcom/example/tutorial/VideoProto$VideoDescript;->getTimeStamp()J

    move-result-wide v13

    iput-wide v13, v1, Lcom/boyaa/videodemo/bean/VedioBean;->timestamp:J

    .line 191
    iput-object v2, v1, Lcom/boyaa/videodemo/bean/VedioBean;->message:[B

    .line 192
    iput v5, v1, Lcom/boyaa/videodemo/bean/VedioBean;->vedioType:I

    .line 193
    iput v10, v1, Lcom/boyaa/videodemo/bean/VedioBean;->recording_uid:I

    .line 211
    if-eqz v7, :cond_0

    .line 214
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    invoke-virtual {v13}, Lcom/boyaa/videodemo/utils/CacheRef;->getFUserID()I

    move-result v13

    if-ne v10, v13, :cond_3

    .line 216
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iget v13, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType1:I

    if-ne v13, v4, :cond_2

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iget v13, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue1:I

    if-ne v13, v7, :cond_2

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iget v13, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri1:I

    if-ne v13, v6, :cond_2

    .line 217
    sget-object v13, Lh264/com/AVDecoder1Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v13, v1}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->push_back(Lcom/boyaa/videodemo/bean/VedioBean;)V

    goto/16 :goto_0

    .line 328
    .end local v1    # "bean":Lcom/boyaa/videodemo/bean/VedioBean;
    .end local v2    # "data":[B
    .end local v3    # "errorCode":I
    .end local v4    # "iDataDisType":I
    .end local v5    # "iDataType":I
    .end local v6    # "iFrameOrien":I
    .end local v7    # "iFrameVideoValue":I
    .end local v8    # "notify":Lcom/example/tutorial/VideoProto$VideoNotify;
    .end local v9    # "seat_id":I
    .end local v10    # "send_user_id":I
    .end local v11    # "strTime":Ljava/lang/String;
    .end local v12    # "video_descript":Lcom/example/tutorial/VideoProto$VideoDescript;
    :catch_0
    move-exception v13

    goto/16 :goto_0

    .line 220
    .restart local v1    # "bean":Lcom/boyaa/videodemo/bean/VedioBean;
    .restart local v2    # "data":[B
    .restart local v3    # "errorCode":I
    .restart local v4    # "iDataDisType":I
    .restart local v5    # "iDataType":I
    .restart local v6    # "iFrameOrien":I
    .restart local v7    # "iFrameVideoValue":I
    .restart local v8    # "notify":Lcom/example/tutorial/VideoProto$VideoNotify;
    .restart local v9    # "seat_id":I
    .restart local v10    # "send_user_id":I
    .restart local v11    # "strTime":Ljava/lang/String;
    .restart local v12    # "video_descript":Lcom/example/tutorial/VideoProto$VideoDescript;
    :cond_2
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iput v4, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType1:I

    .line 221
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iput v7, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue1:I

    .line 222
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iput v6, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri1:I

    .line 223
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v13

    iget-object v13, v13, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v14, 0x8

    invoke-virtual {v13, v14}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 226
    :cond_3
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    invoke-virtual {v13}, Lcom/boyaa/videodemo/utils/CacheRef;->getSUserID()I

    move-result v13

    if-ne v10, v13, :cond_5

    .line 229
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iget v13, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType2:I

    if-ne v13, v4, :cond_4

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iget v13, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue2:I

    if-ne v13, v7, :cond_4

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iget v13, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri2:I

    if-ne v13, v6, :cond_4

    .line 230
    sget-object v13, Lh264/com/AVDecoder2Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v13, v1}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->push_back(Lcom/boyaa/videodemo/bean/VedioBean;)V

    goto/16 :goto_0

    .line 233
    :cond_4
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iput v4, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType2:I

    .line 234
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iput v7, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue2:I

    .line 235
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iput v6, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri2:I

    .line 236
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v13

    iget-object v13, v13, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v14, 0x12

    invoke-virtual {v13, v14}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 239
    :cond_5
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    invoke-virtual {v13}, Lcom/boyaa/videodemo/utils/CacheRef;->get3UserID()I

    move-result v13

    if-ne v10, v13, :cond_7

    .line 241
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iget v13, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType3:I

    if-ne v13, v4, :cond_6

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iget v13, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue3:I

    if-ne v13, v7, :cond_6

    .line 242
    sget-object v13, Lh264/com/AVDecoder3Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v13, v1}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->push_back(Lcom/boyaa/videodemo/bean/VedioBean;)V

    goto/16 :goto_0

    .line 245
    :cond_6
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iput v4, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType3:I

    .line 246
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iput v7, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue3:I

    .line 248
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v13

    iget-object v13, v13, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v14, 0x16

    invoke-virtual {v13, v14}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 251
    :cond_7
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    invoke-virtual {v13}, Lcom/boyaa/videodemo/utils/CacheRef;->get4UserID()I

    move-result v13

    if-ne v10, v13, :cond_9

    .line 253
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iget v13, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType4:I

    if-ne v13, v4, :cond_8

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iget v13, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue4:I

    if-ne v13, v7, :cond_8

    .line 254
    sget-object v13, Lh264/com/AVDecoder4Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v13, v1}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->push_back(Lcom/boyaa/videodemo/bean/VedioBean;)V

    goto/16 :goto_0

    .line 257
    :cond_8
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iput v4, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType4:I

    .line 258
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iput v7, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue4:I

    .line 260
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v13

    iget-object v13, v13, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v14, 0x20

    invoke-virtual {v13, v14}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 263
    :cond_9
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    invoke-virtual {v13}, Lcom/boyaa/videodemo/utils/CacheRef;->get5UserID()I

    move-result v13

    if-ne v10, v13, :cond_b

    .line 265
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iget v13, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType5:I

    if-ne v13, v4, :cond_a

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iget v13, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue5:I

    if-ne v13, v7, :cond_a

    .line 266
    sget-object v13, Lh264/com/AVDecoder5Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v13, v1}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->push_back(Lcom/boyaa/videodemo/bean/VedioBean;)V

    goto/16 :goto_0

    .line 269
    :cond_a
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iput v4, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType5:I

    .line 270
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iput v7, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue5:I

    .line 272
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v13

    iget-object v13, v13, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v14, 0x24

    invoke-virtual {v13, v14}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 275
    :cond_b
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    invoke-virtual {v13}, Lcom/boyaa/videodemo/utils/CacheRef;->get6UserID()I

    move-result v13

    if-ne v10, v13, :cond_d

    .line 277
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iget v13, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType6:I

    if-ne v13, v4, :cond_c

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iget v13, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue6:I

    if-ne v13, v7, :cond_c

    .line 278
    sget-object v13, Lh264/com/AVDecoder6Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v13, v1}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->push_back(Lcom/boyaa/videodemo/bean/VedioBean;)V

    goto/16 :goto_0

    .line 281
    :cond_c
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iput v4, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType6:I

    .line 282
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iput v7, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue6:I

    .line 284
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v13

    iget-object v13, v13, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v14, 0x28

    invoke-virtual {v13, v14}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 287
    :cond_d
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    invoke-virtual {v13}, Lcom/boyaa/videodemo/utils/CacheRef;->get7UserID()I

    move-result v13

    if-ne v10, v13, :cond_0

    .line 289
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iget v13, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType7:I

    if-ne v13, v4, :cond_e

    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iget v13, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue7:I

    if-ne v13, v7, :cond_e

    .line 290
    sget-object v13, Lh264/com/AVDecoder7Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v13, v1}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->push_back(Lcom/boyaa/videodemo/bean/VedioBean;)V

    goto/16 :goto_0

    .line 293
    :cond_e
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iput v4, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType7:I

    .line 294
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v13

    iput v7, v13, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue7:I

    .line 296
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v13

    iget-object v13, v13, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v14, 0x32

    invoke-virtual {v13, v14}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0
.end method

.method public release(I)V
    .locals 0
    .param p1, "type"    # I

    .prologue
    .line 59
    return-void
.end method

.method public success([B)V
    .locals 5
    .param p1, "data"    # [B

    .prologue
    .line 66
    :try_start_0
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->parseFrom([B)Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v1

    .line 68
    .local v1, "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->mParseHandler:Lcom/boyaa/videodemo/listener/VideoUdpListener$ParseHandler;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/boyaa/videodemo/listener/VideoUdpListener$ParseHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    .line 69
    .local v2, "msg":Landroid/os/Message;
    const/4 v3, 0x0

    iput v3, v2, Landroid/os/Message;->arg1:I

    .line 70
    iput-object v1, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 71
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .end local v1    # "message":Lcom/example/tutorial/VideoProto$VideoMessage;
    .end local v2    # "msg":Landroid/os/Message;
    :goto_0
    return-void

    .line 73
    :catch_0
    move-exception v0

    .line 75
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/boyaa/videodemo/listener/VideoUdpListener;->TAG:Ljava/lang/String;

    const-string v4, "parse video proto message err"

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
