.class public final Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$PlayerInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;"
    }
.end annotation


# instance fields
.field private audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

.field private audioIp_:Ljava/lang/Object;

.field private audioPort_:I

.field private bitField0_:I

.field private seatId_:I

.field private userId_:I

.field private userName_:Ljava/lang/Object;

.field private videoIp_:Ljava/lang/Object;

.field private videoPort_:I

.field private webrtcRoomid_:Ljava/lang/Object;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 5290
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 5503
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userName_:Ljava/lang/Object;

    .line 5610
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioIp_:Ljava/lang/Object;

    .line 5741
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoIp_:Ljava/lang/Object;

    .line 5848
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->webrtcRoomid_:Ljava/lang/Object;

    .line 5946
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 5291
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->maybeForceBuilderInitialization()V

    .line 5292
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 5296
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 5503
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userName_:Ljava/lang/Object;

    .line 5610
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioIp_:Ljava/lang/Object;

    .line 5741
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoIp_:Ljava/lang/Object;

    .line 5848
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->webrtcRoomid_:Ljava/lang/Object;

    .line 5946
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 5297
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->maybeForceBuilderInitialization()V

    .line 5298
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;)V
    .locals 0

    .prologue
    .line 5294
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 5303
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->create()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 5304
    new-instance v0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 5279
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PlayerInfo_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$17()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 0

    .prologue
    .line 5300
    # getter for: Lcom/example/tutorial/VideoProto$PlayerInfo;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->access$8()Z

    .line 5302
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 2

    .prologue
    .line 5344
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    .line 5345
    .local v0, "result":Lcom/example/tutorial/VideoProto$PlayerInfo;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 5346
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 5348
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 5

    .prologue
    .line 5352
    new-instance v1, Lcom/example/tutorial/VideoProto$PlayerInfo;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$PlayerInfo;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    .line 5353
    .local v1, "result":Lcom/example/tutorial/VideoProto$PlayerInfo;
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5354
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 5355
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 5356
    or-int/lit8 v2, v2, 0x1

    .line 5358
    :cond_0
    iget v3, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$PlayerInfo;->access$10(Lcom/example/tutorial/VideoProto$PlayerInfo;I)V

    .line 5359
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 5360
    or-int/lit8 v2, v2, 0x2

    .line 5362
    :cond_1
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userName_:Ljava/lang/Object;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$PlayerInfo;->access$11(Lcom/example/tutorial/VideoProto$PlayerInfo;Ljava/lang/Object;)V

    .line 5363
    and-int/lit8 v3, v0, 0x4

    const/4 v4, 0x4

    if-ne v3, v4, :cond_2

    .line 5364
    or-int/lit8 v2, v2, 0x4

    .line 5366
    :cond_2
    iget v3, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->seatId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$PlayerInfo;->access$12(Lcom/example/tutorial/VideoProto$PlayerInfo;I)V

    .line 5367
    and-int/lit8 v3, v0, 0x8

    const/16 v4, 0x8

    if-ne v3, v4, :cond_3

    .line 5368
    or-int/lit8 v2, v2, 0x8

    .line 5370
    :cond_3
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioIp_:Ljava/lang/Object;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$PlayerInfo;->access$13(Lcom/example/tutorial/VideoProto$PlayerInfo;Ljava/lang/Object;)V

    .line 5371
    and-int/lit8 v3, v0, 0x10

    const/16 v4, 0x10

    if-ne v3, v4, :cond_4

    .line 5372
    or-int/lit8 v2, v2, 0x10

    .line 5374
    :cond_4
    iget v3, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioPort_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$PlayerInfo;->access$14(Lcom/example/tutorial/VideoProto$PlayerInfo;I)V

    .line 5375
    and-int/lit8 v3, v0, 0x20

    const/16 v4, 0x20

    if-ne v3, v4, :cond_5

    .line 5376
    or-int/lit8 v2, v2, 0x20

    .line 5378
    :cond_5
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoIp_:Ljava/lang/Object;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$PlayerInfo;->access$15(Lcom/example/tutorial/VideoProto$PlayerInfo;Ljava/lang/Object;)V

    .line 5379
    and-int/lit8 v3, v0, 0x40

    const/16 v4, 0x40

    if-ne v3, v4, :cond_6

    .line 5380
    or-int/lit8 v2, v2, 0x40

    .line 5382
    :cond_6
    iget v3, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoPort_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$PlayerInfo;->access$16(Lcom/example/tutorial/VideoProto$PlayerInfo;I)V

    .line 5383
    and-int/lit16 v3, v0, 0x80

    const/16 v4, 0x80

    if-ne v3, v4, :cond_7

    .line 5384
    or-int/lit16 v2, v2, 0x80

    .line 5386
    :cond_7
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->webrtcRoomid_:Ljava/lang/Object;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$PlayerInfo;->access$17(Lcom/example/tutorial/VideoProto$PlayerInfo;Ljava/lang/Object;)V

    .line 5387
    and-int/lit16 v3, v0, 0x100

    const/16 v4, 0x100

    if-ne v3, v4, :cond_8

    .line 5388
    or-int/lit16 v2, v2, 0x100

    .line 5390
    :cond_8
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$PlayerInfo;->access$18(Lcom/example/tutorial/VideoProto$PlayerInfo;Lcom/example/tutorial/VideoProto$AudioCtrol;)V

    .line 5391
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$PlayerInfo;->access$19(Lcom/example/tutorial/VideoProto$PlayerInfo;I)V

    .line 5392
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onBuilt()V

    .line 5393
    return-object v1
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 5308
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 5309
    iput v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userId_:I

    .line 5310
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5311
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userName_:Ljava/lang/Object;

    .line 5312
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5313
    iput v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->seatId_:I

    .line 5314
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5315
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioIp_:Ljava/lang/Object;

    .line 5316
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5317
    iput v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioPort_:I

    .line 5318
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5319
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoIp_:Ljava/lang/Object;

    .line 5320
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x21

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5321
    iput v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoPort_:I

    .line 5322
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x41

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5323
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->webrtcRoomid_:Ljava/lang/Object;

    .line 5324
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x81

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5325
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 5326
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x101

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5327
    return-object p0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->clear()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->clear()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->clear()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearAudioControl()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 5991
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x101

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5992
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 5993
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5994
    return-object p0
.end method

.method public clearAudioIp()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 5684
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5685
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getAudioIp()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioIp_:Ljava/lang/Object;

    .line 5686
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5687
    return-object p0
.end method

.method public clearAudioPort()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 5734
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5735
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioPort_:I

    .line 5736
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5737
    return-object p0
.end method

.method public clearSeatId()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 5603
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5604
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->seatId_:I

    .line 5605
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5606
    return-object p0
.end method

.method public clearUserId()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 5496
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5497
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userId_:I

    .line 5498
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5499
    return-object p0
.end method

.method public clearUserName()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 5557
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5558
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userName_:Ljava/lang/Object;

    .line 5559
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5560
    return-object p0
.end method

.method public clearVideoIp()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 5795
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x21

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5796
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getVideoIp()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoIp_:Ljava/lang/Object;

    .line 5797
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5798
    return-object p0
.end method

.method public clearVideoPort()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 5841
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x41

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5842
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoPort_:I

    .line 5843
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5844
    return-object p0
.end method

.method public clearWebrtcRoomid()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 5922
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x81

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5923
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getWebrtcRoomid()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->webrtcRoomid_:Ljava/lang/Object;

    .line 5924
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5925
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 2

    .prologue
    .line 5331
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->create()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->clone()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->clone()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->clone()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getAudioControl()Lcom/example/tutorial/VideoProto$AudioCtrol;
    .locals 1

    .prologue
    .line 5965
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    return-object v0
.end method

.method public getAudioIp()Ljava/lang/String;
    .locals 3

    .prologue
    .line 5629
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioIp_:Ljava/lang/Object;

    .line 5630
    .local v0, "ref":Ljava/lang/Object;
    instance-of v2, v0, Ljava/lang/String;

    if-nez v2, :cond_0

    .line 5631
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 5632
    .end local v0    # "ref":Ljava/lang/Object;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v1

    .line 5633
    .local v1, "s":Ljava/lang/String;
    iput-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioIp_:Ljava/lang/Object;

    .line 5636
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

.method public getAudioIpBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 5648
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioIp_:Ljava/lang/Object;

    .line 5649
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 5652
    check-cast v1, Ljava/lang/String;

    .line 5651
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 5653
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioIp_:Ljava/lang/Object;

    .line 5656
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

.method public getAudioPort()I
    .locals 1

    .prologue
    .line 5719
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioPort_:I

    return v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1

    .prologue
    .line 5340
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 5336
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PlayerInfo_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$17()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getSeatId()I
    .locals 1

    .prologue
    .line 5588
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->seatId_:I

    return v0
.end method

.method public getUserId()I
    .locals 1

    .prologue
    .line 5481
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userId_:I

    return v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 5514
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userName_:Ljava/lang/Object;

    .line 5515
    .local v0, "ref":Ljava/lang/Object;
    instance-of v2, v0, Ljava/lang/String;

    if-nez v2, :cond_0

    .line 5516
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 5517
    .end local v0    # "ref":Ljava/lang/Object;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v1

    .line 5518
    .local v1, "s":Ljava/lang/String;
    iput-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userName_:Ljava/lang/Object;

    .line 5521
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

.method public getUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 5529
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userName_:Ljava/lang/Object;

    .line 5530
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 5533
    check-cast v1, Ljava/lang/String;

    .line 5532
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 5534
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userName_:Ljava/lang/Object;

    .line 5537
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

.method public getVideoIp()Ljava/lang/String;
    .locals 3

    .prologue
    .line 5752
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoIp_:Ljava/lang/Object;

    .line 5753
    .local v0, "ref":Ljava/lang/Object;
    instance-of v2, v0, Ljava/lang/String;

    if-nez v2, :cond_0

    .line 5754
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 5755
    .end local v0    # "ref":Ljava/lang/Object;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v1

    .line 5756
    .local v1, "s":Ljava/lang/String;
    iput-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoIp_:Ljava/lang/Object;

    .line 5759
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

.method public getVideoIpBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 5767
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoIp_:Ljava/lang/Object;

    .line 5768
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 5771
    check-cast v1, Ljava/lang/String;

    .line 5770
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 5772
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoIp_:Ljava/lang/Object;

    .line 5775
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

.method public getVideoPort()I
    .locals 1

    .prologue
    .line 5826
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoPort_:I

    return v0
.end method

.method public getWebrtcRoomid()Ljava/lang/String;
    .locals 3

    .prologue
    .line 5867
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->webrtcRoomid_:Ljava/lang/Object;

    .line 5868
    .local v0, "ref":Ljava/lang/Object;
    instance-of v2, v0, Ljava/lang/String;

    if-nez v2, :cond_0

    .line 5869
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 5870
    .end local v0    # "ref":Ljava/lang/Object;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v1

    .line 5871
    .local v1, "s":Ljava/lang/String;
    iput-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->webrtcRoomid_:Ljava/lang/Object;

    .line 5874
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

.method public getWebrtcRoomidBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 5886
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->webrtcRoomid_:Ljava/lang/Object;

    .line 5887
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 5890
    check-cast v1, Ljava/lang/String;

    .line 5889
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 5891
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->webrtcRoomid_:Ljava/lang/Object;

    .line 5894
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

.method public hasAudioControl()Z
    .locals 2

    .prologue
    .line 5955
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

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

.method public hasAudioIp()Z
    .locals 2

    .prologue
    .line 5619
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

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

.method public hasAudioPort()Z
    .locals 2

    .prologue
    .line 5713
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

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
    .line 5582
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

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

.method public hasUserId()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 5475
    iget v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasUserName()Z
    .locals 2

    .prologue
    .line 5508
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

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

.method public hasVideoIp()Z
    .locals 2

    .prologue
    .line 5746
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

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

.method public hasVideoPort()Z
    .locals 2

    .prologue
    .line 5820
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

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

.method public hasWebrtcRoomid()Z
    .locals 2

    .prologue
    .line 5857
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

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

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    .locals 3

    .prologue
    .line 5284
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PlayerInfo_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$93()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 5286
    const-class v1, Lcom/example/tutorial/VideoProto$PlayerInfo;

    const-class v2, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .line 5285
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 5284
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 5447
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 5406
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 5443
    :goto_0
    return-object p0

    .line 5407
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->hasUserId()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 5408
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->setUserId(I)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .line 5410
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->hasUserName()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 5411
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5412
    # getter for: Lcom/example/tutorial/VideoProto$PlayerInfo;->userName_:Ljava/lang/Object;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->access$20(Lcom/example/tutorial/VideoProto$PlayerInfo;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userName_:Ljava/lang/Object;

    .line 5413
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5415
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->hasSeatId()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 5416
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getSeatId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->setSeatId(I)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .line 5418
    :cond_3
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->hasAudioIp()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 5419
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5420
    # getter for: Lcom/example/tutorial/VideoProto$PlayerInfo;->audioIp_:Ljava/lang/Object;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->access$21(Lcom/example/tutorial/VideoProto$PlayerInfo;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioIp_:Ljava/lang/Object;

    .line 5421
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5423
    :cond_4
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->hasAudioPort()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 5424
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getAudioPort()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->setAudioPort(I)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .line 5426
    :cond_5
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->hasVideoIp()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 5427
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5428
    # getter for: Lcom/example/tutorial/VideoProto$PlayerInfo;->videoIp_:Ljava/lang/Object;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->access$22(Lcom/example/tutorial/VideoProto$PlayerInfo;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoIp_:Ljava/lang/Object;

    .line 5429
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5431
    :cond_6
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->hasVideoPort()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 5432
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getVideoPort()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->setVideoPort(I)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .line 5434
    :cond_7
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->hasWebrtcRoomid()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 5435
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x80

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5436
    # getter for: Lcom/example/tutorial/VideoProto$PlayerInfo;->webrtcRoomid_:Ljava/lang/Object;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->access$23(Lcom/example/tutorial/VideoProto$PlayerInfo;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->webrtcRoomid_:Ljava/lang/Object;

    .line 5437
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5439
    :cond_8
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->hasAudioControl()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 5440
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getAudioControl()Lcom/example/tutorial/VideoProto$AudioCtrol;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->setAudioControl(Lcom/example/tutorial/VideoProto$AudioCtrol;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .line 5442
    :cond_9
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto/16 :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 5454
    const/4 v2, 0x0

    .line 5456
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$PlayerInfo;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5461
    if-eqz v2, :cond_0

    .line 5462
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .line 5465
    :cond_0
    return-object p0

    .line 5457
    :catch_0
    move-exception v1

    .line 5458
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-object v2, v0

    .line 5459
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 5460
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 5461
    if-eqz v2, :cond_1

    .line 5462
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .line 5464
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 5397
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$PlayerInfo;

    if-eqz v0, :cond_0

    .line 5398
    check-cast p1, Lcom/example/tutorial/VideoProto$PlayerInfo;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object p0

    .line 5401
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    :goto_0
    return-object p0

    .line 5400
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setAudioControl(Lcom/example/tutorial/VideoProto$AudioCtrol;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$AudioCtrol;

    .prologue
    .line 5975
    if-nez p1, :cond_0

    .line 5976
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 5978
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x100

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5979
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 5980
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5981
    return-object p0
.end method

.method public setAudioIp(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 5668
    if-nez p1, :cond_0

    .line 5669
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 5671
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5672
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioIp_:Ljava/lang/Object;

    .line 5673
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5674
    return-object p0
.end method

.method public setAudioIpBytes(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .prologue
    .line 5698
    if-nez p1, :cond_0

    .line 5699
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 5701
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5702
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioIp_:Ljava/lang/Object;

    .line 5703
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5704
    return-object p0
.end method

.method public setAudioPort(I)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 5725
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5726
    iput p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->audioPort_:I

    .line 5727
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5728
    return-object p0
.end method

.method public setSeatId(I)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 5594
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5595
    iput p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->seatId_:I

    .line 5596
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5597
    return-object p0
.end method

.method public setUserId(I)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 5487
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5488
    iput p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userId_:I

    .line 5489
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5490
    return-object p0
.end method

.method public setUserName(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 5545
    if-nez p1, :cond_0

    .line 5546
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 5548
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5549
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userName_:Ljava/lang/Object;

    .line 5550
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5551
    return-object p0
.end method

.method public setUserNameBytes(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .prologue
    .line 5567
    if-nez p1, :cond_0

    .line 5568
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 5570
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5571
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->userName_:Ljava/lang/Object;

    .line 5572
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5573
    return-object p0
.end method

.method public setVideoIp(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 5783
    if-nez p1, :cond_0

    .line 5784
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 5786
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5787
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoIp_:Ljava/lang/Object;

    .line 5788
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5789
    return-object p0
.end method

.method public setVideoIpBytes(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .prologue
    .line 5805
    if-nez p1, :cond_0

    .line 5806
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 5808
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5809
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoIp_:Ljava/lang/Object;

    .line 5810
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5811
    return-object p0
.end method

.method public setVideoPort(I)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 5832
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x40

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5833
    iput p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->videoPort_:I

    .line 5834
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5835
    return-object p0
.end method

.method public setWebrtcRoomid(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 5906
    if-nez p1, :cond_0

    .line 5907
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 5909
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x80

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5910
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->webrtcRoomid_:Ljava/lang/Object;

    .line 5911
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5912
    return-object p0
.end method

.method public setWebrtcRoomidBytes(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .prologue
    .line 5936
    if-nez p1, :cond_0

    .line 5937
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 5939
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x80

    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->bitField0_:I

    .line 5940
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->webrtcRoomid_:Ljava/lang/Object;

    .line 5941
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->onChanged()V

    .line 5942
    return-object p0
.end method
