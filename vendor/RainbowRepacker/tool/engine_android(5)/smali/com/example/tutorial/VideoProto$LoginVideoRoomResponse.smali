.class public final Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$LoginVideoRoomResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LoginVideoRoomResponse"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    }
.end annotation


# static fields
.field public static final AUDIO_PORT_FIELD_NUMBER:I = 0x8

.field public static final HEART_BEAT_FIELD_NUMBER:I = 0x3

.field public static final OTHER_PLAYERS_FIELD_NUMBER:I = 0x5

.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROXYSERVER_IP_FIELD_NUMBER:I = 0xc

.field public static final PROXYSERVER_PORT_FIELD_NUMBER:I = 0xd

.field public static final RESULT_FIELD_NUMBER:I = 0x1

.field public static final ROOM_ID_FIELD_NUMBER:I = 0x2

.field public static final ROOM_TYPE_FIELD_NUMBER:I = 0x6

.field public static final SEAT_ID_FIELD_NUMBER:I = 0x4

.field public static final SUPPORT_P2P_FIELD_NUMBER:I = 0xb

.field public static final TIME_STAMP_FIELD_NUMBER:I = 0x7

.field public static final UP_MICRO_USER_ID_FIELD_NUMBER:I = 0xa

.field public static final VIDEO_PORT_FIELD_NUMBER:I = 0x9

.field public static final WEBRTC_ROOMSERVER_FIELD_NUMBER:I = 0xe

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

.field private static final serialVersionUID:J


# instance fields
.field private audioPort_:I

.field private bitField0_:I

.field private heartBeat_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private otherPlayers_:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private proxyserverIp_:Ljava/lang/Object;

.field private proxyserverPort_:I

.field private result_:Lcom/example/tutorial/VideoProto$ResultID;

.field private roomId_:I

.field private roomType_:Lcom/example/tutorial/VideoProto$RoomType;

.field private seatId_:I

.field private supportP2P_:Z

.field private timeStamp_:J

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;

.field private upMicroUserId_:I

.field private videoPort_:I

.field private webrtcRoomserver_:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 6404
    new-instance v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$1;-><init>()V

    .line 6403
    sput-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->PARSER:Lcom/google/protobuf/Parser;

    .line 8155
    new-instance v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    .line 8156
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->initFields()V

    .line 8157
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V
    .locals 10
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    const/16 v9, 0x10

    .line 6268
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 6797
    iput-byte v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->memoizedIsInitialized:B

    .line 6854
    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->memoizedSerializedSize:I

    .line 6272
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->initFields()V

    .line 6273
    const/4 v2, 0x0

    .line 6275
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 6277
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 6278
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_2

    .line 6384
    and-int/lit8 v7, v2, 0x10

    if-ne v7, v9, :cond_1

    .line 6385
    iget-object v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    invoke-static {v7}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    .line 6387
    :cond_1
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 6388
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->makeExtensionsImmutable()V

    .line 6390
    return-void

    .line 6279
    :cond_2
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 6280
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 6285
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v7

    .line 6286
    if-nez v7, :cond_0

    .line 6287
    const/4 v0, 0x1

    .line 6289
    goto :goto_0

    .line 6282
    :sswitch_0
    const/4 v0, 0x1

    .line 6283
    goto :goto_0

    .line 6292
    :sswitch_1
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 6293
    .local v3, "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$ResultID;->valueOf(I)Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v6

    .line 6294
    .local v6, "value":Lcom/example/tutorial/VideoProto$ResultID;
    if-nez v6, :cond_4

    .line 6295
    const/4 v7, 0x1

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 6378
    .end local v3    # "rawValue":I
    .end local v4    # "tag":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$ResultID;
    :catch_0
    move-exception v1

    .line 6379
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    throw v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 6383
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v7

    .line 6384
    and-int/lit8 v8, v2, 0x10

    if-ne v8, v9, :cond_3

    .line 6385
    iget-object v8, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    invoke-static {v8}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v8

    iput-object v8, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    .line 6387
    :cond_3
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v8

    iput-object v8, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 6388
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->makeExtensionsImmutable()V

    .line 6389
    throw v7

    .line 6297
    .restart local v3    # "rawValue":I
    .restart local v4    # "tag":I
    .restart local v6    # "value":Lcom/example/tutorial/VideoProto$ResultID;
    :cond_4
    :try_start_2
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    or-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    .line 6298
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 6380
    .end local v3    # "rawValue":I
    .end local v4    # "tag":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$ResultID;
    :catch_1
    move-exception v1

    .line 6381
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v7, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 6382
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    .line 6381
    invoke-direct {v7, v8}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 6382
    invoke-virtual {v7, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    .line 6381
    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 6303
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v4    # "tag":I
    :sswitch_2
    :try_start_4
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    or-int/lit8 v7, v7, 0x2

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    .line 6304
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->roomId_:I

    goto :goto_0

    .line 6308
    :sswitch_3
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    or-int/lit8 v7, v7, 0x4

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    .line 6309
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->heartBeat_:I

    goto/16 :goto_0

    .line 6313
    :sswitch_4
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    or-int/lit8 v7, v7, 0x8

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    .line 6314
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->seatId_:I

    goto/16 :goto_0

    .line 6318
    :sswitch_5
    and-int/lit8 v7, v2, 0x10

    if-eq v7, v9, :cond_5

    .line 6319
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    .line 6320
    or-int/lit8 v2, v2, 0x10

    .line 6322
    :cond_5
    iget-object v8, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    sget-object v7, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    invoke-virtual {p1, v7, p2}, Lcom/google/protobuf/CodedInputStream;->readMessage(Lcom/google/protobuf/Parser;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite;

    move-result-object v7

    check-cast v7, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 6326
    :sswitch_6
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 6327
    .restart local v3    # "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$RoomType;->valueOf(I)Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v6

    .line 6328
    .local v6, "value":Lcom/example/tutorial/VideoProto$RoomType;
    if-nez v6, :cond_6

    .line 6329
    const/4 v7, 0x6

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;

    goto/16 :goto_0

    .line 6331
    :cond_6
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    or-int/lit8 v7, v7, 0x10

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    .line 6332
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    goto/16 :goto_0

    .line 6337
    .end local v3    # "rawValue":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$RoomType;
    :sswitch_7
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    or-int/lit8 v7, v7, 0x20

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    .line 6338
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt64()J

    move-result-wide v7

    iput-wide v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->timeStamp_:J

    goto/16 :goto_0

    .line 6342
    :sswitch_8
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    or-int/lit8 v7, v7, 0x40

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    .line 6343
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->audioPort_:I

    goto/16 :goto_0

    .line 6347
    :sswitch_9
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    or-int/lit16 v7, v7, 0x80

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    .line 6348
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->videoPort_:I

    goto/16 :goto_0

    .line 6352
    :sswitch_a
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    or-int/lit16 v7, v7, 0x100

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    .line 6353
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->upMicroUserId_:I

    goto/16 :goto_0

    .line 6357
    :sswitch_b
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    or-int/lit16 v7, v7, 0x200

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    .line 6358
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBool()Z

    move-result v7

    iput-boolean v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->supportP2P_:Z

    goto/16 :goto_0

    .line 6362
    :sswitch_c
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    or-int/lit16 v7, v7, 0x400

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    .line 6363
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBytes()Lcom/google/protobuf/ByteString;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->proxyserverIp_:Ljava/lang/Object;

    goto/16 :goto_0

    .line 6367
    :sswitch_d
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    or-int/lit16 v7, v7, 0x800

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    .line 6368
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->proxyserverPort_:I

    goto/16 :goto_0

    .line 6372
    :sswitch_e
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    or-int/lit16 v7, v7, 0x1000

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    .line 6373
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBytes()Lcom/google/protobuf/ByteString;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->webrtcRoomserver_:Ljava/lang/Object;
    :try_end_4
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 6280
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x10 -> :sswitch_2
        0x18 -> :sswitch_3
        0x20 -> :sswitch_4
        0x2a -> :sswitch_5
        0x30 -> :sswitch_6
        0x38 -> :sswitch_7
        0x40 -> :sswitch_8
        0x48 -> :sswitch_9
        0x50 -> :sswitch_a
        0x58 -> :sswitch_b
        0x62 -> :sswitch_c
        0x68 -> :sswitch_d
        0x72 -> :sswitch_e
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 6268
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/GeneratedMessage$Builder",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .local p1, "builder":Lcom/google/protobuf/GeneratedMessage$Builder;, "Lcom/google/protobuf/GeneratedMessage$Builder<*>;"
    const/4 v0, -0x1

    .line 6248
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 6797
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->memoizedIsInitialized:B

    .line 6854
    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->memoizedSerializedSize:I

    .line 6249
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 6250
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)V
    .locals 0

    .prologue
    .line 6247
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 6251
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 6797
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->memoizedIsInitialized:B

    .line 6854
    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->memoizedSerializedSize:I

    .line 6251
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;Lcom/example/tutorial/VideoProto$ResultID;)V
    .locals 0

    .prologue
    .line 6421
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;I)V
    .locals 0

    .prologue
    .line 6437
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->roomId_:I

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;I)V
    .locals 0

    .prologue
    .line 6453
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->heartBeat_:I

    return-void
.end method

.method static synthetic access$13(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;I)V
    .locals 0

    .prologue
    .line 6469
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->seatId_:I

    return-void
.end method

.method static synthetic access$14(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 6485
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    return-void
.end method

.method static synthetic access$15(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;Lcom/example/tutorial/VideoProto$RoomType;)V
    .locals 0

    .prologue
    .line 6521
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    return-void
.end method

.method static synthetic access$16(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;J)V
    .locals 0

    .prologue
    .line 6537
    iput-wide p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->timeStamp_:J

    return-void
.end method

.method static synthetic access$17(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;I)V
    .locals 0

    .prologue
    .line 6553
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->audioPort_:I

    return-void
.end method

.method static synthetic access$18(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;I)V
    .locals 0

    .prologue
    .line 6577
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->videoPort_:I

    return-void
.end method

.method static synthetic access$19(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;I)V
    .locals 0

    .prologue
    .line 6601
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->upMicroUserId_:I

    return-void
.end method

.method static synthetic access$20(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;Z)V
    .locals 0

    .prologue
    .line 6625
    iput-boolean p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->supportP2P_:Z

    return-void
.end method

.method static synthetic access$21(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 6649
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->proxyserverIp_:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$22(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;I)V
    .locals 0

    .prologue
    .line 6704
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->proxyserverPort_:I

    return-void
.end method

.method static synthetic access$23(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 6728
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->webrtcRoomserver_:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$24(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;I)V
    .locals 0

    .prologue
    .line 6418
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    return-void
.end method

.method static synthetic access$25(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Ljava/util/List;
    .locals 1

    .prologue
    .line 6485
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$26(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 6649
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->proxyserverIp_:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$27(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 6728
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->webrtcRoomserver_:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 6243
    sget-boolean v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .locals 1

    .prologue
    .line 6255
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 6393
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_LoginVideoRoomResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$20()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 6782
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 6783
    iput v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->roomId_:I

    .line 6784
    iput v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->heartBeat_:I

    .line 6785
    iput v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->seatId_:I

    .line 6786
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    .line 6787
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    .line 6788
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->timeStamp_:J

    .line 6789
    iput v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->audioPort_:I

    .line 6790
    iput v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->videoPort_:I

    .line 6791
    iput v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->upMicroUserId_:I

    .line 6792
    iput-boolean v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->supportP2P_:Z

    .line 6793
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->proxyserverIp_:Ljava/lang/Object;

    .line 6794
    iput v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->proxyserverPort_:I

    .line 6795
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->webrtcRoomserver_:Ljava/lang/Object;

    .line 6796
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 6981
    # invokes: Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->create()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->access$17()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    .prologue
    .line 6984
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->newBuilder()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 6961
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 6967
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 6931
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 6937
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 6972
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 6978
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 6951
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 6957
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 6941
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 6947
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    return-object v0
.end method


# virtual methods
.method public getAudioPort()I
    .locals 1

    .prologue
    .line 6572
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->audioPort_:I

    return v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .locals 1

    .prologue
    .line 6259
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-result-object v0

    return-object v0
.end method

.method public getHeartBeat()I
    .locals 1

    .prologue
    .line 6464
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->heartBeat_:I

    return v0
.end method

.method public getOtherPlayers(I)Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 6509
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public getOtherPlayersCount()I
    .locals 1

    .prologue
    .line 6503
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getOtherPlayersList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 6490
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    return-object v0
.end method

.method public getOtherPlayersOrBuilder(I)Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 6516
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;

    return-object v0
.end method

.method public getOtherPlayersOrBuilderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 6497
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    return-object v0
.end method

.method public getParserForType()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 6415
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getProxyserverIp()Ljava/lang/String;
    .locals 4

    .prologue
    .line 6668
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->proxyserverIp_:Ljava/lang/Object;

    .line 6669
    .local v1, "ref":Ljava/lang/Object;
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 6670
    check-cast v1, Ljava/lang/String;

    .line 6678
    .end local v1    # "ref":Ljava/lang/Object;
    :goto_0
    return-object v1

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    move-object v0, v1

    .line 6673
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 6674
    .local v0, "bs":Lcom/google/protobuf/ByteString;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v2

    .line 6675
    .local v2, "s":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->isValidUtf8()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 6676
    iput-object v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->proxyserverIp_:Ljava/lang/Object;

    :cond_1
    move-object v1, v2

    .line 6678
    goto :goto_0
.end method

.method public getProxyserverIpBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 6690
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->proxyserverIp_:Ljava/lang/Object;

    .line 6691
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 6694
    check-cast v1, Ljava/lang/String;

    .line 6693
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 6695
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->proxyserverIp_:Ljava/lang/Object;

    .line 6698
    .end local v0    # "b":Lcom/google/protobuf/ByteString;
    :goto_0
    return-object v0

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    check-cast v1, Lcom/google/protobuf/ByteString;

    .end local v1    # "ref":Ljava/lang/Object;
    move-object v0, v1

    goto :goto_0
.end method

.method public getProxyserverPort()I
    .locals 1

    .prologue
    .line 6723
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->proxyserverPort_:I

    return v0
.end method

.method public getResult()Lcom/example/tutorial/VideoProto$ResultID;
    .locals 1

    .prologue
    .line 6432
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    return-object v0
.end method

.method public getRoomId()I
    .locals 1

    .prologue
    .line 6448
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->roomId_:I

    return v0
.end method

.method public getRoomType()Lcom/example/tutorial/VideoProto$RoomType;
    .locals 1

    .prologue
    .line 6532
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    return-object v0
.end method

.method public getSeatId()I
    .locals 1

    .prologue
    .line 6480
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->seatId_:I

    return v0
.end method

.method public getSerializedSize()I
    .locals 8

    .prologue
    const/16 v7, 0x8

    const/4 v6, 0x4

    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 6856
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->memoizedSerializedSize:I

    .line 6857
    .local v1, "size":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_0

    move v2, v1

    .line 6918
    .end local v1    # "size":I
    .local v2, "size":I
    :goto_0
    return v2

    .line 6859
    .end local v2    # "size":I
    .restart local v1    # "size":I
    :cond_0
    const/4 v1, 0x0

    .line 6860
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v3, v3, 0x1

    if-ne v3, v4, :cond_1

    .line 6862
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$ResultID;->getNumber()I

    move-result v3

    invoke-static {v4, v3}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v3

    add-int/2addr v1, v3

    .line 6864
    :cond_1
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v3, v3, 0x2

    if-ne v3, v5, :cond_2

    .line 6866
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->roomId_:I

    invoke-static {v5, v3}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v3

    add-int/2addr v1, v3

    .line 6868
    :cond_2
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v3, v3, 0x4

    if-ne v3, v6, :cond_3

    .line 6870
    const/4 v3, 0x3

    iget v4, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->heartBeat_:I

    invoke-static {v3, v4}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v3

    add-int/2addr v1, v3

    .line 6872
    :cond_3
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v3, v3, 0x8

    if-ne v3, v7, :cond_4

    .line 6874
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->seatId_:I

    invoke-static {v6, v3}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v3

    add-int/2addr v1, v3

    .line 6876
    :cond_4
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lt v0, v3, :cond_e

    .line 6880
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v3, v3, 0x10

    const/16 v4, 0x10

    if-ne v3, v4, :cond_5

    .line 6882
    const/4 v3, 0x6

    iget-object v4, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    invoke-virtual {v4}, Lcom/example/tutorial/VideoProto$RoomType;->getNumber()I

    move-result v4

    invoke-static {v3, v4}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v3

    add-int/2addr v1, v3

    .line 6884
    :cond_5
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v3, v3, 0x20

    const/16 v4, 0x20

    if-ne v3, v4, :cond_6

    .line 6886
    const/4 v3, 0x7

    iget-wide v4, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->timeStamp_:J

    invoke-static {v3, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->computeInt64Size(IJ)I

    move-result v3

    add-int/2addr v1, v3

    .line 6888
    :cond_6
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v3, v3, 0x40

    const/16 v4, 0x40

    if-ne v3, v4, :cond_7

    .line 6890
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->audioPort_:I

    invoke-static {v7, v3}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v3

    add-int/2addr v1, v3

    .line 6892
    :cond_7
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v3, v3, 0x80

    const/16 v4, 0x80

    if-ne v3, v4, :cond_8

    .line 6894
    const/16 v3, 0x9

    iget v4, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->videoPort_:I

    invoke-static {v3, v4}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v3

    add-int/2addr v1, v3

    .line 6896
    :cond_8
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v3, v3, 0x100

    const/16 v4, 0x100

    if-ne v3, v4, :cond_9

    .line 6898
    const/16 v3, 0xa

    iget v4, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->upMicroUserId_:I

    invoke-static {v3, v4}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v3

    add-int/2addr v1, v3

    .line 6900
    :cond_9
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v3, v3, 0x200

    const/16 v4, 0x200

    if-ne v3, v4, :cond_a

    .line 6902
    const/16 v3, 0xb

    iget-boolean v4, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->supportP2P_:Z

    invoke-static {v3, v4}, Lcom/google/protobuf/CodedOutputStream;->computeBoolSize(IZ)I

    move-result v3

    add-int/2addr v1, v3

    .line 6904
    :cond_a
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v3, v3, 0x400

    const/16 v4, 0x400

    if-ne v3, v4, :cond_b

    .line 6906
    const/16 v3, 0xc

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getProxyserverIpBytes()Lcom/google/protobuf/ByteString;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v3

    add-int/2addr v1, v3

    .line 6908
    :cond_b
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v3, v3, 0x800

    const/16 v4, 0x800

    if-ne v3, v4, :cond_c

    .line 6910
    const/16 v3, 0xd

    iget v4, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->proxyserverPort_:I

    invoke-static {v3, v4}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v3

    add-int/2addr v1, v3

    .line 6912
    :cond_c
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v3, v3, 0x1000

    const/16 v4, 0x1000

    if-ne v3, v4, :cond_d

    .line 6914
    const/16 v3, 0xe

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getWebrtcRoomserverBytes()Lcom/google/protobuf/ByteString;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v3

    add-int/2addr v1, v3

    .line 6916
    :cond_d
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v3

    add-int/2addr v1, v3

    .line 6917
    iput v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->memoizedSerializedSize:I

    move v2, v1

    .line 6918
    .end local v1    # "size":I
    .restart local v2    # "size":I
    goto/16 :goto_0

    .line 6878
    .end local v2    # "size":I
    .restart local v1    # "size":I
    :cond_e
    const/4 v4, 0x5

    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/protobuf/MessageLite;

    invoke-static {v4, v3}, Lcom/google/protobuf/CodedOutputStream;->computeMessageSize(ILcom/google/protobuf/MessageLite;)I

    move-result v3

    add-int/2addr v1, v3

    .line 6876
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1
.end method

.method public getSupportP2P()Z
    .locals 1

    .prologue
    .line 6644
    iget-boolean v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->supportP2P_:Z

    return v0
.end method

.method public getTimeStamp()J
    .locals 2

    .prologue
    .line 6548
    iget-wide v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->timeStamp_:J

    return-wide v0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 6266
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public getUpMicroUserId()I
    .locals 1

    .prologue
    .line 6620
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->upMicroUserId_:I

    return v0
.end method

.method public getVideoPort()I
    .locals 1

    .prologue
    .line 6596
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->videoPort_:I

    return v0
.end method

.method public getWebrtcRoomserver()Ljava/lang/String;
    .locals 4

    .prologue
    .line 6747
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->webrtcRoomserver_:Ljava/lang/Object;

    .line 6748
    .local v1, "ref":Ljava/lang/Object;
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 6749
    check-cast v1, Ljava/lang/String;

    .line 6757
    .end local v1    # "ref":Ljava/lang/Object;
    :goto_0
    return-object v1

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    move-object v0, v1

    .line 6752
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 6753
    .local v0, "bs":Lcom/google/protobuf/ByteString;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v2

    .line 6754
    .local v2, "s":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->isValidUtf8()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 6755
    iput-object v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->webrtcRoomserver_:Ljava/lang/Object;

    :cond_1
    move-object v1, v2

    .line 6757
    goto :goto_0
.end method

.method public getWebrtcRoomserverBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 6769
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->webrtcRoomserver_:Ljava/lang/Object;

    .line 6770
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 6773
    check-cast v1, Ljava/lang/String;

    .line 6772
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 6774
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->webrtcRoomserver_:Ljava/lang/Object;

    .line 6777
    .end local v0    # "b":Lcom/google/protobuf/ByteString;
    :goto_0
    return-object v0

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    check-cast v1, Lcom/google/protobuf/ByteString;

    .end local v1    # "ref":Ljava/lang/Object;
    move-object v0, v1

    goto :goto_0
.end method

.method public hasAudioPort()Z
    .locals 2

    .prologue
    .line 6562
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v0, v0, 0x40

    const/16 v1, 0x40

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasHeartBeat()Z
    .locals 2

    .prologue
    .line 6458
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v0, v0, 0x4

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasProxyserverIp()Z
    .locals 2

    .prologue
    .line 6658
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v0, v0, 0x400

    const/16 v1, 0x400

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasProxyserverPort()Z
    .locals 2

    .prologue
    .line 6713
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v0, v0, 0x800

    const/16 v1, 0x800

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasResult()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 6426
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasRoomId()Z
    .locals 2

    .prologue
    .line 6442
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasRoomType()Z
    .locals 2

    .prologue
    .line 6526
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v0, v0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasSeatId()Z
    .locals 2

    .prologue
    .line 6474
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v0, v0, 0x8

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasSupportP2P()Z
    .locals 2

    .prologue
    .line 6634
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v0, v0, 0x200

    const/16 v1, 0x200

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasTimeStamp()Z
    .locals 2

    .prologue
    .line 6542
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v0, v0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasUpMicroUserId()Z
    .locals 2

    .prologue
    .line 6610
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v0, v0, 0x100

    const/16 v1, 0x100

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasVideoPort()Z
    .locals 2

    .prologue
    .line 6586
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v0, v0, 0x80

    const/16 v1, 0x80

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasWebrtcRoomserver()Z
    .locals 2

    .prologue
    .line 6737
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v0, v0, 0x1000

    const/16 v1, 0x1000

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    .locals 3

    .prologue
    .line 6398
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_LoginVideoRoomResponse_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$94()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 6400
    const-class v1, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    const-class v2, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    .line 6399
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 6398
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 6799
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->memoizedIsInitialized:B

    .line 6800
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 6803
    :goto_0
    return v1

    .line 6800
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 6802
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 6982
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->newBuilder()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 6991
    new-instance v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;)V

    .line 6992
    .local v0, "builder":Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->newBuilderForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->newBuilderForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 6986
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->newBuilder(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->toBuilder()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->toBuilder()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected writeReplace()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .prologue
    .line 6925
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage;->writeReplace()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 6
    .param p1, "output"    # Lcom/google/protobuf/CodedOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x8

    const/4 v4, 0x4

    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 6808
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getSerializedSize()I

    .line 6809
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v2, :cond_0

    .line 6810
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$ResultID;->getNumber()I

    move-result v1

    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 6812
    :cond_0
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v1, v1, 0x2

    if-ne v1, v3, :cond_1

    .line 6813
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->roomId_:I

    invoke-virtual {p1, v3, v1}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 6815
    :cond_1
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v1, v1, 0x4

    if-ne v1, v4, :cond_2

    .line 6816
    const/4 v1, 0x3

    iget v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->heartBeat_:I

    invoke-virtual {p1, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 6818
    :cond_2
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v1, v1, 0x8

    if-ne v1, v5, :cond_3

    .line 6819
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->seatId_:I

    invoke-virtual {p1, v4, v1}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 6821
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_d

    .line 6824
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v1, v1, 0x10

    const/16 v2, 0x10

    if-ne v1, v2, :cond_4

    .line 6825
    const/4 v1, 0x6

    iget-object v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$RoomType;->getNumber()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 6827
    :cond_4
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v1, v1, 0x20

    const/16 v2, 0x20

    if-ne v1, v2, :cond_5

    .line 6828
    const/4 v1, 0x7

    iget-wide v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->timeStamp_:J

    invoke-virtual {p1, v1, v2, v3}, Lcom/google/protobuf/CodedOutputStream;->writeInt64(IJ)V

    .line 6830
    :cond_5
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit8 v1, v1, 0x40

    const/16 v2, 0x40

    if-ne v1, v2, :cond_6

    .line 6831
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->audioPort_:I

    invoke-virtual {p1, v5, v1}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 6833
    :cond_6
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v1, v1, 0x80

    const/16 v2, 0x80

    if-ne v1, v2, :cond_7

    .line 6834
    const/16 v1, 0x9

    iget v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->videoPort_:I

    invoke-virtual {p1, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 6836
    :cond_7
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v1, v1, 0x100

    const/16 v2, 0x100

    if-ne v1, v2, :cond_8

    .line 6837
    const/16 v1, 0xa

    iget v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->upMicroUserId_:I

    invoke-virtual {p1, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 6839
    :cond_8
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v1, v1, 0x200

    const/16 v2, 0x200

    if-ne v1, v2, :cond_9

    .line 6840
    const/16 v1, 0xb

    iget-boolean v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->supportP2P_:Z

    invoke-virtual {p1, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->writeBool(IZ)V

    .line 6842
    :cond_9
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v1, v1, 0x400

    const/16 v2, 0x400

    if-ne v1, v2, :cond_a

    .line 6843
    const/16 v1, 0xc

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getProxyserverIpBytes()Lcom/google/protobuf/ByteString;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    .line 6845
    :cond_a
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v1, v1, 0x800

    const/16 v2, 0x800

    if-ne v1, v2, :cond_b

    .line 6846
    const/16 v1, 0xd

    iget v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->proxyserverPort_:I

    invoke-virtual {p1, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 6848
    :cond_b
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->bitField0_:I

    and-int/lit16 v1, v1, 0x1000

    const/16 v2, 0x1000

    if-ne v1, v2, :cond_c

    .line 6849
    const/16 v1, 0xe

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getWebrtcRoomserverBytes()Lcom/google/protobuf/ByteString;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    .line 6851
    :cond_c
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 6852
    return-void

    .line 6822
    :cond_d
    const/4 v2, 0x5

    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/protobuf/MessageLite;

    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->writeMessage(ILcom/google/protobuf/MessageLite;)V

    .line 6821
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0
.end method
