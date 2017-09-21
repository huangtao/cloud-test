.class public final Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$LoginVideoRoomResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$LoginVideoRoomResponseOrBuilder;"
    }
.end annotation


# instance fields
.field private audioPort_:I

.field private bitField0_:I

.field private heartBeat_:I

.field private otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/RepeatedFieldBuilder",
            "<",
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            "Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;",
            "Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;",
            ">;"
        }
    .end annotation
.end field

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

.field private upMicroUserId_:I

.field private videoPort_:I

.field private webrtcRoomserver_:Ljava/lang/Object;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 7013
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 7267
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 7403
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    .line 7642
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    .line 7907
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverIp_:Ljava/lang/Object;

    .line 8054
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->webrtcRoomserver_:Ljava/lang/Object;

    .line 7014
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->maybeForceBuilderInitialization()V

    .line 7015
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 7019
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 7267
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 7403
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    .line 7642
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    .line 7907
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverIp_:Ljava/lang/Object;

    .line 8054
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->webrtcRoomserver_:Ljava/lang/Object;

    .line 7020
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->maybeForceBuilderInitialization()V

    .line 7021
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;)V
    .locals 0

    .prologue
    .line 7017
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 7027
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->create()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 7028
    new-instance v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;-><init>()V

    return-object v0
.end method

.method private ensureOtherPlayersIsMutable()V
    .locals 2

    .prologue
    .line 7405
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x10

    const/16 v1, 0x10

    if-eq v0, v1, :cond_0

    .line 7406
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    .line 7407
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7409
    :cond_0
    return-void
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 7002
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_LoginVideoRoomResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$20()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private getOtherPlayersFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilder;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/RepeatedFieldBuilder",
            "<",
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            "Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;",
            "Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 7629
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 7630
    new-instance v1, Lcom/google/protobuf/RepeatedFieldBuilder;

    .line 7632
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    .line 7633
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x10

    const/16 v3, 0x10

    if-ne v0, v3, :cond_1

    const/4 v0, 0x1

    .line 7634
    :goto_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    move-result-object v3

    .line 7635
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->isClean()Z

    move-result v4

    invoke-direct {v1, v2, v0, v3, v4}, Lcom/google/protobuf/RepeatedFieldBuilder;-><init>(Ljava/util/List;ZLcom/google/protobuf/GeneratedMessage$BuilderParent;Z)V

    .line 7630
    iput-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    .line 7636
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    .line 7638
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    return-object v0

    .line 7633
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 7023
    # getter for: Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$8()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 7024
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->getOtherPlayersFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilder;

    .line 7026
    :cond_0
    return-void
.end method


# virtual methods
.method public addAllOtherPlayers(Ljava/lang/Iterable;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            ">;)",
            "Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;"
        }
    .end annotation

    .prologue
    .line 7541
    .local p1, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lcom/example/tutorial/VideoProto$PlayerInfo;>;"
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 7542
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->ensureOtherPlayersIsMutable()V

    .line 7543
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-static {p1, v0}, Lcom/google/protobuf/GeneratedMessage$Builder;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7544
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7548
    :goto_0
    return-object p0

    .line 7546
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilder;->addAllMessages(Ljava/lang/Iterable;)Lcom/google/protobuf/RepeatedFieldBuilder;

    goto :goto_0
.end method

.method public addOtherPlayers(ILcom/example/tutorial/VideoProto$PlayerInfo$Builder;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 2
    .param p1, "index"    # I
    .param p2, "builderForValue"    # Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .prologue
    .line 7527
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 7528
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->ensureOtherPlayersIsMutable()V

    .line 7529
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-virtual {p2}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 7530
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7534
    :goto_0
    return-object p0

    .line 7532
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {p2}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/google/protobuf/RepeatedFieldBuilder;->addMessage(ILcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/RepeatedFieldBuilder;

    goto :goto_0
.end method

.method public addOtherPlayers(ILcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 7496
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_1

    .line 7497
    if-nez p2, :cond_0

    .line 7498
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 7500
    :cond_0
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->ensureOtherPlayersIsMutable()V

    .line 7501
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 7502
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7506
    :goto_0
    return-object p0

    .line 7504
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0, p1, p2}, Lcom/google/protobuf/RepeatedFieldBuilder;->addMessage(ILcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/RepeatedFieldBuilder;

    goto :goto_0
.end method

.method public addOtherPlayers(Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 2
    .param p1, "builderForValue"    # Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .prologue
    .line 7513
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 7514
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->ensureOtherPlayersIsMutable()V

    .line 7515
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 7516
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7520
    :goto_0
    return-object p0

    .line 7518
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/RepeatedFieldBuilder;->addMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/RepeatedFieldBuilder;

    goto :goto_0
.end method

.method public addOtherPlayers(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 7479
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_1

    .line 7480
    if-nez p1, :cond_0

    .line 7481
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 7483
    :cond_0
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->ensureOtherPlayersIsMutable()V

    .line 7484
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 7485
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7489
    :goto_0
    return-object p0

    .line 7487
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilder;->addMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/RepeatedFieldBuilder;

    goto :goto_0
.end method

.method public addOtherPlayersBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 2

    .prologue
    .line 7608
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->getOtherPlayersFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilder;

    move-result-object v0

    .line 7609
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    .line 7608
    invoke-virtual {v0, v1}, Lcom/google/protobuf/RepeatedFieldBuilder;->addBuilder(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    return-object v0
.end method

.method public addOtherPlayersBuilder(I)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 7616
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->getOtherPlayersFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilder;

    move-result-object v0

    .line 7617
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    .line 7616
    invoke-virtual {v0, p1, v1}, Lcom/google/protobuf/RepeatedFieldBuilder;->addBuilder(ILcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    return-object v0
.end method

.method public build()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .locals 2

    .prologue
    .line 7082
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-result-object v0

    .line 7083
    .local v0, "result":Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 7084
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 7086
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->build()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->build()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .locals 5

    .prologue
    .line 7090
    new-instance v1, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)V

    .line 7091
    .local v1, "result":Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7092
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 7093
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 7094
    or-int/lit8 v2, v2, 0x1

    .line 7096
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$10(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;Lcom/example/tutorial/VideoProto$ResultID;)V

    .line 7097
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 7098
    or-int/lit8 v2, v2, 0x2

    .line 7100
    :cond_1
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->roomId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$11(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;I)V

    .line 7101
    and-int/lit8 v3, v0, 0x4

    const/4 v4, 0x4

    if-ne v3, v4, :cond_2

    .line 7102
    or-int/lit8 v2, v2, 0x4

    .line 7104
    :cond_2
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->heartBeat_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$12(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;I)V

    .line 7105
    and-int/lit8 v3, v0, 0x8

    const/16 v4, 0x8

    if-ne v3, v4, :cond_3

    .line 7106
    or-int/lit8 v2, v2, 0x8

    .line 7108
    :cond_3
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->seatId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$13(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;I)V

    .line 7109
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v3, :cond_e

    .line 7110
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v3, v3, 0x10

    const/16 v4, 0x10

    if-ne v3, v4, :cond_4

    .line 7111
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    .line 7112
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v3, v3, -0x11

    iput v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7114
    :cond_4
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$14(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;Ljava/util/List;)V

    .line 7118
    :goto_0
    and-int/lit8 v3, v0, 0x20

    const/16 v4, 0x20

    if-ne v3, v4, :cond_5

    .line 7119
    or-int/lit8 v2, v2, 0x10

    .line 7121
    :cond_5
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$15(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;Lcom/example/tutorial/VideoProto$RoomType;)V

    .line 7122
    and-int/lit8 v3, v0, 0x40

    const/16 v4, 0x40

    if-ne v3, v4, :cond_6

    .line 7123
    or-int/lit8 v2, v2, 0x20

    .line 7125
    :cond_6
    iget-wide v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->timeStamp_:J

    invoke-static {v1, v3, v4}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$16(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;J)V

    .line 7126
    and-int/lit16 v3, v0, 0x80

    const/16 v4, 0x80

    if-ne v3, v4, :cond_7

    .line 7127
    or-int/lit8 v2, v2, 0x40

    .line 7129
    :cond_7
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->audioPort_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$17(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;I)V

    .line 7130
    and-int/lit16 v3, v0, 0x100

    const/16 v4, 0x100

    if-ne v3, v4, :cond_8

    .line 7131
    or-int/lit16 v2, v2, 0x80

    .line 7133
    :cond_8
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->videoPort_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$18(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;I)V

    .line 7134
    and-int/lit16 v3, v0, 0x200

    const/16 v4, 0x200

    if-ne v3, v4, :cond_9

    .line 7135
    or-int/lit16 v2, v2, 0x100

    .line 7137
    :cond_9
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->upMicroUserId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$19(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;I)V

    .line 7138
    and-int/lit16 v3, v0, 0x400

    const/16 v4, 0x400

    if-ne v3, v4, :cond_a

    .line 7139
    or-int/lit16 v2, v2, 0x200

    .line 7141
    :cond_a
    iget-boolean v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->supportP2P_:Z

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$20(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;Z)V

    .line 7142
    and-int/lit16 v3, v0, 0x800

    const/16 v4, 0x800

    if-ne v3, v4, :cond_b

    .line 7143
    or-int/lit16 v2, v2, 0x400

    .line 7145
    :cond_b
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverIp_:Ljava/lang/Object;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$21(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;Ljava/lang/Object;)V

    .line 7146
    and-int/lit16 v3, v0, 0x1000

    const/16 v4, 0x1000

    if-ne v3, v4, :cond_c

    .line 7147
    or-int/lit16 v2, v2, 0x800

    .line 7149
    :cond_c
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverPort_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$22(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;I)V

    .line 7150
    and-int/lit16 v3, v0, 0x2000

    const/16 v4, 0x2000

    if-ne v3, v4, :cond_d

    .line 7151
    or-int/lit16 v2, v2, 0x1000

    .line 7153
    :cond_d
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->webrtcRoomserver_:Ljava/lang/Object;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$23(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;Ljava/lang/Object;)V

    .line 7154
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$24(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;I)V

    .line 7155
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onBuilt()V

    .line 7156
    return-object v1

    .line 7116
    :cond_e
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v3}, Lcom/google/protobuf/RepeatedFieldBuilder;->build()Ljava/util/List;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$14(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;Ljava/util/List;)V

    goto/16 :goto_0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 7032
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 7033
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 7034
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7035
    iput v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->roomId_:I

    .line 7036
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7037
    iput v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->heartBeat_:I

    .line 7038
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7039
    iput v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->seatId_:I

    .line 7040
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7041
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 7042
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    .line 7043
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7047
    :goto_0
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    .line 7048
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x21

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7049
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->timeStamp_:J

    .line 7050
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x41

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7051
    iput v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->audioPort_:I

    .line 7052
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x81

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7053
    iput v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->videoPort_:I

    .line 7054
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x101

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7055
    iput v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->upMicroUserId_:I

    .line 7056
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x201

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7057
    iput-boolean v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->supportP2P_:Z

    .line 7058
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x401

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7059
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverIp_:Ljava/lang/Object;

    .line 7060
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x801

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7061
    iput v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverPort_:I

    .line 7062
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x1001

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7063
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->webrtcRoomserver_:Ljava/lang/Object;

    .line 7064
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x2001

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7065
    return-object p0

    .line 7045
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilder;->clear()V

    goto :goto_0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearAudioPort()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 7753
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x81

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7754
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->audioPort_:I

    .line 7755
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7756
    return-object p0
.end method

.method public clearHeartBeat()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 7362
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7363
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->heartBeat_:I

    .line 7364
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7365
    return-object p0
.end method

.method public clearOtherPlayers()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 7554
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 7555
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    .line 7556
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7557
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7561
    :goto_0
    return-object p0

    .line 7559
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilder;->clear()V

    goto :goto_0
.end method

.method public clearProxyserverIp()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 7981
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x801

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7982
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getDefaultInstance()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getProxyserverIp()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverIp_:Ljava/lang/Object;

    .line 7983
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7984
    return-object p0
.end method

.method public clearProxyserverPort()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 8047
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x1001

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 8048
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverPort_:I

    .line 8049
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 8050
    return-object p0
.end method

.method public clearResult()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 7296
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7297
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 7298
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7299
    return-object p0
.end method

.method public clearRoomId()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 7329
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7330
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->roomId_:I

    .line 7331
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7332
    return-object p0
.end method

.method public clearRoomType()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 7671
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x21

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7672
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    .line 7673
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7674
    return-object p0
.end method

.method public clearSeatId()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 7395
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7396
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->seatId_:I

    .line 7397
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7398
    return-object p0
.end method

.method public clearSupportP2P()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 7900
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x401

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7901
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->supportP2P_:Z

    .line 7902
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7903
    return-object p0
.end method

.method public clearTimeStamp()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 2

    .prologue
    .line 7704
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x41

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7705
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->timeStamp_:J

    .line 7706
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7707
    return-object p0
.end method

.method public clearUpMicroUserId()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 7851
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x201

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7852
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->upMicroUserId_:I

    .line 7853
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7854
    return-object p0
.end method

.method public clearVideoPort()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 7802
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x101

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7803
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->videoPort_:I

    .line 7804
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7805
    return-object p0
.end method

.method public clearWebrtcRoomserver()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1

    .prologue
    .line 8128
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x2001

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 8129
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getDefaultInstance()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getWebrtcRoomserver()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->webrtcRoomserver_:Ljava/lang/Object;

    .line 8130
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 8131
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 2

    .prologue
    .line 7069
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->create()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getAudioPort()I
    .locals 1

    .prologue
    .line 7730
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->audioPort_:I

    return v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    .locals 1

    .prologue
    .line 7078
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getDefaultInstance()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 7074
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_LoginVideoRoomResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$20()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getHeartBeat()I
    .locals 1

    .prologue
    .line 7347
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->heartBeat_:I

    return v0
.end method

.method public getOtherPlayers(I)Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 7438
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 7439
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 7441
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilder;->getMessage(I)Lcom/google/protobuf/GeneratedMessage;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public getOtherPlayersBuilder(I)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 7581
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->getOtherPlayersFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilder;->getBuilder(I)Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    return-object v0
.end method

.method public getOtherPlayersBuilderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 7624
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->getOtherPlayersFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilder;->getBuilderList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getOtherPlayersCount()I
    .locals 1

    .prologue
    .line 7428
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 7429
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 7431
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilder;->getCount()I

    move-result v0

    goto :goto_0
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
    .line 7418
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 7419
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 7421
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilder;->getMessageList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getOtherPlayersOrBuilder(I)Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 7588
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 7589
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;

    .line 7590
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilder;->getMessageOrBuilder(I)Lcom/google/protobuf/MessageOrBuilder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;

    goto :goto_0
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
    .line 7598
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-eqz v0, :cond_0

    .line 7599
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilder;->getMessageOrBuilderList()Ljava/util/List;

    move-result-object v0

    .line 7601
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getProxyserverIp()Ljava/lang/String;
    .locals 3

    .prologue
    .line 7926
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverIp_:Ljava/lang/Object;

    .line 7927
    .local v0, "ref":Ljava/lang/Object;
    instance-of v2, v0, Ljava/lang/String;

    if-nez v2, :cond_0

    .line 7928
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 7929
    .end local v0    # "ref":Ljava/lang/Object;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v1

    .line 7930
    .local v1, "s":Ljava/lang/String;
    iput-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverIp_:Ljava/lang/Object;

    .line 7933
    .end local v1    # "s":Ljava/lang/String;
    :goto_0
    return-object v1

    .restart local v0    # "ref":Ljava/lang/Object;
    :cond_0
    check-cast v0, Ljava/lang/String;

    .end local v0    # "ref":Ljava/lang/Object;
    move-object v1, v0

    goto :goto_0
.end method

.method public getProxyserverIpBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 7945
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverIp_:Ljava/lang/Object;

    .line 7946
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 7949
    check-cast v1, Ljava/lang/String;

    .line 7948
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 7950
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverIp_:Ljava/lang/Object;

    .line 7953
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
    .line 8024
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverPort_:I

    return v0
.end method

.method public getResult()Lcom/example/tutorial/VideoProto$ResultID;
    .locals 1

    .prologue
    .line 7278
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    return-object v0
.end method

.method public getRoomId()I
    .locals 1

    .prologue
    .line 7314
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->roomId_:I

    return v0
.end method

.method public getRoomType()Lcom/example/tutorial/VideoProto$RoomType;
    .locals 1

    .prologue
    .line 7653
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    return-object v0
.end method

.method public getSeatId()I
    .locals 1

    .prologue
    .line 7380
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->seatId_:I

    return v0
.end method

.method public getSupportP2P()Z
    .locals 1

    .prologue
    .line 7877
    iget-boolean v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->supportP2P_:Z

    return v0
.end method

.method public getTimeStamp()J
    .locals 2

    .prologue
    .line 7689
    iget-wide v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->timeStamp_:J

    return-wide v0
.end method

.method public getUpMicroUserId()I
    .locals 1

    .prologue
    .line 7828
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->upMicroUserId_:I

    return v0
.end method

.method public getVideoPort()I
    .locals 1

    .prologue
    .line 7779
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->videoPort_:I

    return v0
.end method

.method public getWebrtcRoomserver()Ljava/lang/String;
    .locals 3

    .prologue
    .line 8073
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->webrtcRoomserver_:Ljava/lang/Object;

    .line 8074
    .local v0, "ref":Ljava/lang/Object;
    instance-of v2, v0, Ljava/lang/String;

    if-nez v2, :cond_0

    .line 8075
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 8076
    .end local v0    # "ref":Ljava/lang/Object;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v1

    .line 8077
    .local v1, "s":Ljava/lang/String;
    iput-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->webrtcRoomserver_:Ljava/lang/Object;

    .line 8080
    .end local v1    # "s":Ljava/lang/String;
    :goto_0
    return-object v1

    .restart local v0    # "ref":Ljava/lang/Object;
    :cond_0
    check-cast v0, Ljava/lang/String;

    .end local v0    # "ref":Ljava/lang/Object;
    move-object v1, v0

    goto :goto_0
.end method

.method public getWebrtcRoomserverBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 8092
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->webrtcRoomserver_:Ljava/lang/Object;

    .line 8093
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 8096
    check-cast v1, Ljava/lang/String;

    .line 8095
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 8097
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->webrtcRoomserver_:Ljava/lang/Object;

    .line 8100
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
    .line 7720
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

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

.method public hasHeartBeat()Z
    .locals 2

    .prologue
    .line 7341
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

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
    .line 7916
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

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

.method public hasProxyserverPort()Z
    .locals 2

    .prologue
    .line 8014
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

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

.method public hasResult()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 7272
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

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
    .line 7308
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

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
    .line 7647
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

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

.method public hasSeatId()Z
    .locals 2

    .prologue
    .line 7374
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

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
    .line 7867
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

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

.method public hasTimeStamp()Z
    .locals 2

    .prologue
    .line 7683
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

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

.method public hasUpMicroUserId()Z
    .locals 2

    .prologue
    .line 7818
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

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

.method public hasVideoPort()Z
    .locals 2

    .prologue
    .line 7769
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

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

.method public hasWebrtcRoomserver()Z
    .locals 2

    .prologue
    .line 8063
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit16 v0, v0, 0x2000

    const/16 v1, 0x2000

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
    .line 7007
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_LoginVideoRoomResponse_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$94()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 7009
    const-class v1, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    const-class v2, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    .line 7008
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 7007
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 7244
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 2
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    .prologue
    const/4 v0, 0x0

    .line 7169
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getDefaultInstance()Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-result-object v1

    if-ne p1, v1, :cond_0

    .line 7240
    :goto_0
    return-object p0

    .line 7170
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->hasResult()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 7171
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getResult()Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->setResult(Lcom/example/tutorial/VideoProto$ResultID;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    .line 7173
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->hasRoomId()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 7174
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getRoomId()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->setRoomId(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    .line 7176
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->hasHeartBeat()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 7177
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getHeartBeat()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->setHeartBeat(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    .line 7179
    :cond_3
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->hasSeatId()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 7180
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getSeatId()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->setSeatId(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    .line 7182
    :cond_4
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v1, :cond_10

    .line 7183
    # getter for: Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$25(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    .line 7184
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 7185
    # getter for: Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$25(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    .line 7186
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7191
    :goto_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7208
    :cond_5
    :goto_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->hasRoomType()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 7209
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->setRoomType(Lcom/example/tutorial/VideoProto$RoomType;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    .line 7211
    :cond_6
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->hasTimeStamp()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 7212
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getTimeStamp()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->setTimeStamp(J)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    .line 7214
    :cond_7
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->hasAudioPort()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 7215
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getAudioPort()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->setAudioPort(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    .line 7217
    :cond_8
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->hasVideoPort()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 7218
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getVideoPort()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->setVideoPort(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    .line 7220
    :cond_9
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->hasUpMicroUserId()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 7221
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getUpMicroUserId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->setUpMicroUserId(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    .line 7223
    :cond_a
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->hasSupportP2P()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 7224
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getSupportP2P()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->setSupportP2P(Z)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    .line 7226
    :cond_b
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->hasProxyserverIp()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 7227
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x800

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7228
    # getter for: Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->proxyserverIp_:Ljava/lang/Object;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$26(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverIp_:Ljava/lang/Object;

    .line 7229
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7231
    :cond_c
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->hasProxyserverPort()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 7232
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getProxyserverPort()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->setProxyserverPort(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    .line 7234
    :cond_d
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->hasWebrtcRoomserver()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 7235
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x2000

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7236
    # getter for: Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->webrtcRoomserver_:Ljava/lang/Object;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$27(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->webrtcRoomserver_:Ljava/lang/Object;

    .line 7237
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7239
    :cond_e
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto/16 :goto_0

    .line 7188
    :cond_f
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->ensureOtherPlayersIsMutable()V

    .line 7189
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    # getter for: Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$25(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_1

    .line 7194
    :cond_10
    # getter for: Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$25(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5

    .line 7195
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v1}, Lcom/google/protobuf/RepeatedFieldBuilder;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 7196
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v1}, Lcom/google/protobuf/RepeatedFieldBuilder;->dispose()V

    .line 7197
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    .line 7198
    # getter for: Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$25(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    .line 7199
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    and-int/lit8 v1, v1, -0x11

    iput v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7201
    # getter for: Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$8()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 7202
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->getOtherPlayersFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilder;

    move-result-object v0

    .line 7200
    :cond_11
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    goto/16 :goto_2

    .line 7204
    :cond_12
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    # getter for: Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->otherPlayers_:Ljava/util/List;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->access$25(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/RepeatedFieldBuilder;->addAllMessages(Ljava/lang/Iterable;)Lcom/google/protobuf/RepeatedFieldBuilder;

    goto/16 :goto_2
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 7251
    const/4 v2, 0x0

    .line 7253
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7258
    if-eqz v2, :cond_0

    .line 7259
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    .line 7262
    :cond_0
    return-object p0

    .line 7254
    :catch_0
    move-exception v1

    .line 7255
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    move-object v2, v0

    .line 7256
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 7257
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 7258
    if-eqz v2, :cond_1

    .line 7259
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    .line 7261
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 7160
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    if-eqz v0, :cond_0

    .line 7161
    check-cast p1, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object p0

    .line 7164
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    :goto_0
    return-object p0

    .line 7163
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .restart local p1    # "other":Lcom/google/protobuf/Message;
    :cond_0
    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;

    goto :goto_0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/Message$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public removeOtherPlayers(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 7567
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 7568
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->ensureOtherPlayersIsMutable()V

    .line 7569
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7570
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7574
    :goto_0
    return-object p0

    .line 7572
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilder;->remove(I)V

    goto :goto_0
.end method

.method public setAudioPort(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 7740
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x80

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7741
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->audioPort_:I

    .line 7742
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7743
    return-object p0
.end method

.method public setHeartBeat(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 7353
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7354
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->heartBeat_:I

    .line 7355
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7356
    return-object p0
.end method

.method public setOtherPlayers(ILcom/example/tutorial/VideoProto$PlayerInfo$Builder;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 2
    .param p1, "index"    # I
    .param p2, "builderForValue"    # Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .prologue
    .line 7466
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 7467
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->ensureOtherPlayersIsMutable()V

    .line 7468
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-virtual {p2}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 7469
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7473
    :goto_0
    return-object p0

    .line 7471
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {p2}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/google/protobuf/RepeatedFieldBuilder;->setMessage(ILcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/RepeatedFieldBuilder;

    goto :goto_0
.end method

.method public setOtherPlayers(ILcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 7449
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_1

    .line 7450
    if-nez p2, :cond_0

    .line 7451
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 7453
    :cond_0
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->ensureOtherPlayersIsMutable()V

    .line 7454
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayers_:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 7455
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7459
    :goto_0
    return-object p0

    .line 7457
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->otherPlayersBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0, p1, p2}, Lcom/google/protobuf/RepeatedFieldBuilder;->setMessage(ILcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/RepeatedFieldBuilder;

    goto :goto_0
.end method

.method public setProxyserverIp(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 7965
    if-nez p1, :cond_0

    .line 7966
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 7968
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x800

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7969
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverIp_:Ljava/lang/Object;

    .line 7970
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7971
    return-object p0
.end method

.method public setProxyserverIpBytes(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .prologue
    .line 7995
    if-nez p1, :cond_0

    .line 7996
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 7998
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x800

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7999
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverIp_:Ljava/lang/Object;

    .line 8000
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 8001
    return-object p0
.end method

.method public setProxyserverPort(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 8034
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x1000

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 8035
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->proxyserverPort_:I

    .line 8036
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 8037
    return-object p0
.end method

.method public setResult(Lcom/example/tutorial/VideoProto$ResultID;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$ResultID;

    .prologue
    .line 7284
    if-nez p1, :cond_0

    .line 7285
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 7287
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7288
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 7289
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7290
    return-object p0
.end method

.method public setRoomId(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 7320
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7321
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->roomId_:I

    .line 7322
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7323
    return-object p0
.end method

.method public setRoomType(Lcom/example/tutorial/VideoProto$RoomType;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$RoomType;

    .prologue
    .line 7659
    if-nez p1, :cond_0

    .line 7660
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 7662
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7663
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    .line 7664
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7665
    return-object p0
.end method

.method public setSeatId(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 7386
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7387
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->seatId_:I

    .line 7388
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7389
    return-object p0
.end method

.method public setSupportP2P(Z)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "value"    # Z

    .prologue
    .line 7887
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x400

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7888
    iput-boolean p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->supportP2P_:Z

    .line 7889
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7890
    return-object p0
.end method

.method public setTimeStamp(J)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "value"    # J

    .prologue
    .line 7695
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x40

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7696
    iput-wide p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->timeStamp_:J

    .line 7697
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7698
    return-object p0
.end method

.method public setUpMicroUserId(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 7838
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x200

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7839
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->upMicroUserId_:I

    .line 7840
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7841
    return-object p0
.end method

.method public setVideoPort(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 7789
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x100

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 7790
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->videoPort_:I

    .line 7791
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 7792
    return-object p0
.end method

.method public setWebrtcRoomserver(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 8112
    if-nez p1, :cond_0

    .line 8113
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 8115
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x2000

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 8116
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->webrtcRoomserver_:Ljava/lang/Object;

    .line 8117
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 8118
    return-object p0
.end method

.method public setWebrtcRoomserverBytes(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .prologue
    .line 8142
    if-nez p1, :cond_0

    .line 8143
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 8145
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x2000

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->bitField0_:I

    .line 8146
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->webrtcRoomserver_:Ljava/lang/Object;

    .line 8147
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomResponse$Builder;->onChanged()V

    .line 8148
    return-object p0
.end method
