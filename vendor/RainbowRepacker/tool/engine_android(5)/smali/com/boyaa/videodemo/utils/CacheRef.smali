.class public Lcom/boyaa/videodemo/utils/CacheRef;
.super Ljava/lang/Object;
.source "CacheRef.java"


# static fields
.field private static mInstance:Lcom/boyaa/videodemo/utils/CacheRef;


# instance fields
.field private audioVideoType:I

.field private audio_port:I

.field private m3Uid:I

.field private m4Uid:I

.field private m5Uid:I

.field private m6Uid:I

.field private m7Uid:I

.field private mFUid:I

.field public mFrameOri1:I

.field public mFrameOri2:I

.field public mFrameOri3:I

.field public mFrameOri4:I

.field public mFrameOri5:I

.field public mFrameOri6:I

.field public mFrameOri7:I

.field public mFrameType1:I

.field public mFrameType2:I

.field public mFrameType3:I

.field public mFrameType4:I

.field public mFrameType5:I

.field public mFrameType6:I

.field public mFrameType7:I

.field public mFrameValue1:I

.field public mFrameValue2:I

.field public mFrameValue3:I

.field public mFrameValue4:I

.field public mFrameValue5:I

.field public mFrameValue6:I

.field public mFrameValue7:I

.field public mIP:Ljava/lang/String;

.field public mPort:I

.field private mProxyServerIp:Ljava/lang/String;

.field private mProxyServerPort:I

.field private mRoomID:I

.field private mSUid:I

.field private mSeatID:I

.field private mUid:I

.field public playInfoList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private room_type:Lcom/example/tutorial/VideoProto$RoomType;

.field private video_port:I


# direct methods
.method private constructor <init>()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/16 v4, 0x64

    const/16 v3, 0x8

    const/4 v2, 0x2

    const/4 v1, -0x1

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const-string v0, "58.83.135.43"

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mIP:Ljava/lang/String;

    .line 30
    const/16 v0, 0x4dc7

    iput v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mPort:I

    .line 31
    iput v5, p0, Lcom/boyaa/videodemo/utils/CacheRef;->audioVideoType:I

    .line 33
    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mUid:I

    .line 34
    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFUid:I

    .line 35
    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mSUid:I

    .line 36
    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m3Uid:I

    .line 37
    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m4Uid:I

    .line 38
    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m5Uid:I

    .line 39
    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m6Uid:I

    .line 40
    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m7Uid:I

    .line 42
    iput v4, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType1:I

    .line 43
    iput v4, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType2:I

    .line 44
    iput v4, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType3:I

    .line 45
    iput v4, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType4:I

    .line 46
    iput v4, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType5:I

    .line 47
    iput v4, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType6:I

    .line 48
    iput v4, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType7:I

    .line 50
    iput v3, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue1:I

    .line 51
    iput v3, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue2:I

    .line 52
    iput v3, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue3:I

    .line 53
    iput v3, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue4:I

    .line 54
    iput v3, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue5:I

    .line 55
    iput v3, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue6:I

    .line 56
    iput v3, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameValue7:I

    .line 58
    iput v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri1:I

    .line 59
    iput v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri2:I

    .line 60
    iput v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri3:I

    .line 61
    iput v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri4:I

    .line 62
    iput v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri5:I

    .line 63
    iput v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri6:I

    .line 64
    iput v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri7:I

    .line 68
    iput v5, p0, Lcom/boyaa/videodemo/utils/CacheRef;->audio_port:I

    .line 69
    iput v5, p0, Lcom/boyaa/videodemo/utils/CacheRef;->video_port:I

    .line 72
    iput v5, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mSeatID:I

    .line 73
    iput v5, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mRoomID:I

    .line 74
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->playInfoList:Ljava/util/ArrayList;

    .line 458
    const-string v0, ""

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mProxyServerIp:Ljava/lang/String;

    .line 459
    iput v5, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mProxyServerPort:I

    .line 79
    return-void
.end method

.method public static getInstance()Lcom/boyaa/videodemo/utils/CacheRef;
    .locals 1

    .prologue
    .line 82
    sget-object v0, Lcom/boyaa/videodemo/utils/CacheRef;->mInstance:Lcom/boyaa/videodemo/utils/CacheRef;

    if-nez v0, :cond_0

    .line 83
    new-instance v0, Lcom/boyaa/videodemo/utils/CacheRef;

    invoke-direct {v0}, Lcom/boyaa/videodemo/utils/CacheRef;-><init>()V

    sput-object v0, Lcom/boyaa/videodemo/utils/CacheRef;->mInstance:Lcom/boyaa/videodemo/utils/CacheRef;

    .line 86
    :cond_0
    sget-object v0, Lcom/boyaa/videodemo/utils/CacheRef;->mInstance:Lcom/boyaa/videodemo/utils/CacheRef;

    return-object v0
.end method

.method public static release()V
    .locals 1

    .prologue
    .line 90
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/videodemo/utils/CacheRef;->mInstance:Lcom/boyaa/videodemo/utils/CacheRef;

    .line 91
    return-void
.end method


# virtual methods
.method public CleanPlayList()V
    .locals 3

    .prologue
    const/16 v2, 0x64

    const/4 v1, -0x1

    .line 261
    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFUid:I

    .line 262
    iput v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType1:I

    .line 263
    const/4 v0, 0x2

    iput v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri1:I

    .line 264
    sget-object v0, Lh264/com/AVDecoder1Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 266
    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mSUid:I

    .line 267
    iput v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType2:I

    .line 269
    sget-object v0, Lh264/com/AVDecoder2Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 271
    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m3Uid:I

    .line 272
    iput v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType3:I

    .line 274
    sget-object v0, Lh264/com/AVDecoder3Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 276
    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m4Uid:I

    .line 277
    iput v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType4:I

    .line 279
    sget-object v0, Lh264/com/AVDecoder4Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 281
    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m5Uid:I

    .line 282
    iput v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType5:I

    .line 284
    sget-object v0, Lh264/com/AVDecoder5Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 286
    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m6Uid:I

    .line 287
    iput v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType6:I

    .line 289
    sget-object v0, Lh264/com/AVDecoder6Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 291
    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m7Uid:I

    .line 292
    iput v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType7:I

    .line 294
    sget-object v0, Lh264/com/AVDecoder7Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 296
    return-void
.end method

.method public addPlayInfoList(Lcom/example/tutorial/VideoProto$PlayerInfo;)V
    .locals 2
    .param p1, "playInfo"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    const/4 v1, -0x1

    .line 309
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->playInfoList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 311
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFUid:I

    if-ne v0, v1, :cond_1

    .line 313
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v0

    iput v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFUid:I

    .line 348
    :cond_0
    :goto_0
    return-void

    .line 316
    :cond_1
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mSUid:I

    if-ne v0, v1, :cond_2

    .line 318
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v0

    iput v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mSUid:I

    goto :goto_0

    .line 321
    :cond_2
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m3Uid:I

    if-ne v0, v1, :cond_3

    .line 323
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v0

    iput v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m3Uid:I

    goto :goto_0

    .line 326
    :cond_3
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m4Uid:I

    if-ne v0, v1, :cond_4

    .line 328
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v0

    iput v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m4Uid:I

    goto :goto_0

    .line 331
    :cond_4
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m5Uid:I

    if-ne v0, v1, :cond_5

    .line 333
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v0

    iput v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m5Uid:I

    goto :goto_0

    .line 336
    :cond_5
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m6Uid:I

    if-ne v0, v1, :cond_6

    .line 338
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v0

    iput v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m6Uid:I

    goto :goto_0

    .line 341
    :cond_6
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m7Uid:I

    if-ne v0, v1, :cond_0

    .line 343
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v0

    iput v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m7Uid:I

    goto :goto_0
.end method

.method public checkPlayExist(Lcom/example/tutorial/VideoProto$PlayerInfo;)Z
    .locals 3
    .param p1, "playInfo"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 300
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->playInfoList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 304
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 300
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 301
    .local v0, "info":Lcom/example/tutorial/VideoProto$PlayerInfo;
    if-ne v0, p1, :cond_0

    .line 302
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public get3UserID()I
    .locals 1

    .prologue
    .line 133
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m3Uid:I

    return v0
.end method

.method public get4UserID()I
    .locals 1

    .prologue
    .line 143
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m4Uid:I

    return v0
.end method

.method public get5UserID()I
    .locals 1

    .prologue
    .line 153
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m5Uid:I

    return v0
.end method

.method public get6UserID()I
    .locals 1

    .prologue
    .line 163
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m6Uid:I

    return v0
.end method

.method public get7UserID()I
    .locals 1

    .prologue
    .line 173
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m7Uid:I

    return v0
.end method

.method public getAudioProt()I
    .locals 1

    .prologue
    .line 430
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->audio_port:I

    return v0
.end method

.method public getAudioVideoType()I
    .locals 1

    .prologue
    .line 94
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->audioVideoType:I

    return v0
.end method

.method public getFUserID()I
    .locals 1

    .prologue
    .line 113
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFUid:I

    return v0
.end method

.method public getProxyIP()Ljava/lang/String;
    .locals 1

    .prologue
    .line 467
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mProxyServerIp:Ljava/lang/String;

    return-object v0
.end method

.method public getProxyPort()I
    .locals 1

    .prologue
    .line 477
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mProxyServerPort:I

    return v0
.end method

.method public getRoomID()I
    .locals 1

    .prologue
    .line 187
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mRoomID:I

    return v0
.end method

.method public getRoomType()Lcom/example/tutorial/VideoProto$RoomType;
    .locals 1

    .prologue
    .line 455
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->room_type:Lcom/example/tutorial/VideoProto$RoomType;

    return-object v0
.end method

.method public getSUserID()I
    .locals 1

    .prologue
    .line 123
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mSUid:I

    return v0
.end method

.method public getSeatID()I
    .locals 1

    .prologue
    .line 197
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mSeatID:I

    return v0
.end method

.method public getUserID()I
    .locals 1

    .prologue
    .line 103
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mUid:I

    return v0
.end method

.method public getVideoProt()I
    .locals 1

    .prologue
    .line 440
    iget v0, p0, Lcom/boyaa/videodemo/utils/CacheRef;->video_port:I

    return v0
.end method

.method public removePlayInfoList(Lcom/example/tutorial/VideoProto$PlayerInfo;)V
    .locals 6
    .param p1, "playInfo"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    const/16 v5, 0x64

    const/4 v4, -0x1

    .line 352
    iget v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFUid:I

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 354
    iput v4, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFUid:I

    .line 355
    iput v5, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType1:I

    .line 356
    const/4 v2, 0x2

    iput v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameOri1:I

    .line 357
    sget-object v2, Lh264/com/AVDecoder1Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v2}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 361
    :cond_0
    iget v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mSUid:I

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v3

    if-ne v2, v3, :cond_1

    .line 363
    iput v4, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mSUid:I

    .line 364
    iput v5, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType2:I

    .line 366
    sget-object v2, Lh264/com/AVDecoder2Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v2}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 370
    :cond_1
    iget v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m3Uid:I

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v3

    if-ne v2, v3, :cond_2

    .line 372
    iput v4, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m3Uid:I

    .line 373
    iput v5, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType3:I

    .line 375
    sget-object v2, Lh264/com/AVDecoder3Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v2}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 379
    :cond_2
    iget v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m4Uid:I

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v3

    if-ne v2, v3, :cond_3

    .line 381
    iput v4, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m4Uid:I

    .line 382
    iput v5, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType4:I

    .line 384
    sget-object v2, Lh264/com/AVDecoder4Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v2}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 388
    :cond_3
    iget v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m5Uid:I

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v3

    if-ne v2, v3, :cond_4

    .line 390
    iput v4, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m5Uid:I

    .line 391
    iput v5, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType5:I

    .line 393
    sget-object v2, Lh264/com/AVDecoder5Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v2}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 397
    :cond_4
    iget v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m6Uid:I

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v3

    if-ne v2, v3, :cond_5

    .line 399
    iput v4, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m6Uid:I

    .line 400
    iput v5, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType6:I

    .line 402
    sget-object v2, Lh264/com/AVDecoder6Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v2}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 406
    :cond_5
    iget v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m7Uid:I

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v3

    if-ne v2, v3, :cond_6

    .line 408
    iput v4, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m7Uid:I

    .line 409
    iput v5, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType7:I

    .line 411
    sget-object v2, Lh264/com/AVDecoder7Service;->mRingQueue:Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;

    invoke-virtual {v2}, Lcom/boyaa/videodemo/videobuffer/VedioRingQueue;->clear()V

    .line 415
    :cond_6
    const/4 v1, -0x1

    .line 416
    .local v1, "iIndex":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->playInfoList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_8

    .line 424
    :goto_1
    if-eq v1, v4, :cond_7

    iget-object v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->playInfoList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-gt v1, v2, :cond_7

    .line 425
    iget-object v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->playInfoList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 426
    :cond_7
    return-void

    .line 418
    :cond_8
    iget-object v2, p0, Lcom/boyaa/videodemo/utils/CacheRef;->playInfoList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v2

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v3

    if-ne v2, v3, :cond_9

    .line 420
    move v1, v0

    .line 421
    goto :goto_1

    .line 416
    :cond_9
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public set3UserID(I)V
    .locals 0
    .param p1, "uid"    # I

    .prologue
    .line 138
    iput p1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m3Uid:I

    .line 139
    return-void
.end method

.method public set4UserID(I)V
    .locals 0
    .param p1, "uid"    # I

    .prologue
    .line 148
    iput p1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m4Uid:I

    .line 149
    return-void
.end method

.method public set5UserID(I)V
    .locals 0
    .param p1, "uid"    # I

    .prologue
    .line 158
    iput p1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m5Uid:I

    .line 159
    return-void
.end method

.method public set6UserID(I)V
    .locals 0
    .param p1, "uid"    # I

    .prologue
    .line 168
    iput p1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m6Uid:I

    .line 169
    return-void
.end method

.method public set7UserID(I)V
    .locals 0
    .param p1, "uid"    # I

    .prologue
    .line 178
    iput p1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m7Uid:I

    .line 179
    return-void
.end method

.method public setAudioPort(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 435
    iput p1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->audio_port:I

    .line 436
    return-void
.end method

.method public setAudioVideoType(I)V
    .locals 0
    .param p1, "audioVideoType"    # I

    .prologue
    .line 98
    iput p1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->audioVideoType:I

    .line 99
    return-void
.end method

.method public setFUserID(I)V
    .locals 0
    .param p1, "uid"    # I

    .prologue
    .line 118
    iput p1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFUid:I

    .line 119
    return-void
.end method

.method public setPlayInfoList(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "playList":Ljava/util/List;, "Ljava/util/List<Lcom/example/tutorial/VideoProto$PlayerInfo;>;"
    const/4 v2, -0x1

    .line 207
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->playInfoList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 208
    invoke-virtual {p0}, Lcom/boyaa/videodemo/utils/CacheRef;->CleanPlayList()V

    .line 210
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->playInfoList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 212
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 256
    return-void

    .line 214
    :cond_0
    iget v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFUid:I

    if-ne v1, v2, :cond_2

    .line 216
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v1

    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mFUid:I

    .line 212
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 219
    :cond_2
    iget v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mSUid:I

    if-ne v1, v2, :cond_3

    .line 221
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v1

    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mSUid:I

    goto :goto_1

    .line 225
    :cond_3
    iget v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m3Uid:I

    if-ne v1, v2, :cond_4

    .line 227
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v1

    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m3Uid:I

    goto :goto_1

    .line 231
    :cond_4
    iget v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m4Uid:I

    if-ne v1, v2, :cond_5

    .line 233
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v1

    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m4Uid:I

    goto :goto_1

    .line 237
    :cond_5
    iget v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m5Uid:I

    if-ne v1, v2, :cond_6

    .line 239
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v1

    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m5Uid:I

    goto :goto_1

    .line 243
    :cond_6
    iget v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m6Uid:I

    if-ne v1, v2, :cond_7

    .line 245
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v1

    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m6Uid:I

    goto :goto_1

    .line 249
    :cond_7
    iget v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m7Uid:I

    if-ne v1, v2, :cond_1

    .line 251
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v1

    iput v1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->m7Uid:I

    goto :goto_1
.end method

.method public setProxyIP(Ljava/lang/String;)V
    .locals 0
    .param p1, "strProxyIP"    # Ljava/lang/String;

    .prologue
    .line 462
    iput-object p1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mProxyServerIp:Ljava/lang/String;

    .line 463
    return-void
.end method

.method public setProxyServerPort(I)V
    .locals 0
    .param p1, "iProxyPort"    # I

    .prologue
    .line 472
    iput p1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mProxyServerPort:I

    .line 473
    return-void
.end method

.method public setRoomID(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 192
    iput p1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mRoomID:I

    .line 193
    return-void
.end method

.method public setRoomType(Lcom/example/tutorial/VideoProto$RoomType;)V
    .locals 0
    .param p1, "roomType"    # Lcom/example/tutorial/VideoProto$RoomType;

    .prologue
    .line 450
    iput-object p1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->room_type:Lcom/example/tutorial/VideoProto$RoomType;

    .line 451
    return-void
.end method

.method public setSUserID(I)V
    .locals 0
    .param p1, "uid"    # I

    .prologue
    .line 128
    iput p1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mSUid:I

    .line 129
    return-void
.end method

.method public setSeatID(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 202
    iput p1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mSeatID:I

    .line 203
    return-void
.end method

.method public setUserID(I)V
    .locals 0
    .param p1, "uid"    # I

    .prologue
    .line 108
    iput p1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->mUid:I

    .line 109
    return-void
.end method

.method public setVideoPort(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 445
    iput p1, p0, Lcom/boyaa/videodemo/utils/CacheRef;->video_port:I

    .line 446
    return-void
.end method
