.class public final Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$HeartBeatOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$HeartBeat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$HeartBeat$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$HeartBeatOrBuilder;"
    }
.end annotation


# instance fields
.field private bitField0_:I

.field private channelType_:Lcom/example/tutorial/VideoProto$ChannelType;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 8421
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 8521
    sget-object v0, Lcom/example/tutorial/VideoProto$ChannelType;->CT_TCP_COMPOSITE:Lcom/example/tutorial/VideoProto$ChannelType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->channelType_:Lcom/example/tutorial/VideoProto$ChannelType;

    .line 8422
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->maybeForceBuilderInitialization()V

    .line 8423
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 8427
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 8521
    sget-object v0, Lcom/example/tutorial/VideoProto$ChannelType;->CT_TCP_COMPOSITE:Lcom/example/tutorial/VideoProto$ChannelType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->channelType_:Lcom/example/tutorial/VideoProto$ChannelType;

    .line 8428
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->maybeForceBuilderInitialization()V

    .line 8429
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$HeartBeat$Builder;)V
    .locals 0

    .prologue
    .line 8425
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    .locals 1

    .prologue
    .line 8434
    invoke-static {}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->create()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    .locals 1

    .prologue
    .line 8435
    new-instance v0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 8410
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_HeartBeat_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$23()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 0

    .prologue
    .line 8431
    # getter for: Lcom/example/tutorial/VideoProto$HeartBeat;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$HeartBeat;->access$8()Z

    .line 8433
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$HeartBeat;
    .locals 2

    .prologue
    .line 8459
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$HeartBeat;

    move-result-object v0

    .line 8460
    .local v0, "result":Lcom/example/tutorial/VideoProto$HeartBeat;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$HeartBeat;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 8461
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 8463
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->build()Lcom/example/tutorial/VideoProto$HeartBeat;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->build()Lcom/example/tutorial/VideoProto$HeartBeat;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$HeartBeat;
    .locals 5

    .prologue
    .line 8467
    new-instance v1, Lcom/example/tutorial/VideoProto$HeartBeat;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$HeartBeat;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$HeartBeat;)V

    .line 8468
    .local v1, "result":Lcom/example/tutorial/VideoProto$HeartBeat;
    iget v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->bitField0_:I

    .line 8469
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 8470
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 8471
    or-int/lit8 v2, v2, 0x1

    .line 8473
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->channelType_:Lcom/example/tutorial/VideoProto$ChannelType;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$HeartBeat;->access$10(Lcom/example/tutorial/VideoProto$HeartBeat;Lcom/example/tutorial/VideoProto$ChannelType;)V

    .line 8474
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$HeartBeat;->access$11(Lcom/example/tutorial/VideoProto$HeartBeat;I)V

    .line 8475
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->onBuilt()V

    .line 8476
    return-object v1
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$HeartBeat;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$HeartBeat;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    .locals 1

    .prologue
    .line 8439
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 8440
    sget-object v0, Lcom/example/tutorial/VideoProto$ChannelType;->CT_TCP_COMPOSITE:Lcom/example/tutorial/VideoProto$ChannelType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->channelType_:Lcom/example/tutorial/VideoProto$ChannelType;

    .line 8441
    iget v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->bitField0_:I

    .line 8442
    return-object p0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->clear()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->clear()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->clear()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearChannelType()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    .locals 1

    .prologue
    .line 8550
    iget v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->bitField0_:I

    .line 8551
    sget-object v0, Lcom/example/tutorial/VideoProto$ChannelType;->CT_TCP_COMPOSITE:Lcom/example/tutorial/VideoProto$ChannelType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->channelType_:Lcom/example/tutorial/VideoProto$ChannelType;

    .line 8552
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->onChanged()V

    .line 8553
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    .locals 2

    .prologue
    .line 8446
    invoke-static {}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->create()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$HeartBeat;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$HeartBeat;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->clone()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->clone()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->clone()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getChannelType()Lcom/example/tutorial/VideoProto$ChannelType;
    .locals 1

    .prologue
    .line 8532
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->channelType_:Lcom/example/tutorial/VideoProto$ChannelType;

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$HeartBeat;
    .locals 1

    .prologue
    .line 8455
    invoke-static {}, Lcom/example/tutorial/VideoProto$HeartBeat;->getDefaultInstance()Lcom/example/tutorial/VideoProto$HeartBeat;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$HeartBeat;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$HeartBeat;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 8451
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_HeartBeat_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$23()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public hasChannelType()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 8526
    iget v1, p0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->bitField0_:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    .locals 3

    .prologue
    .line 8415
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_HeartBeat_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$95()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 8417
    const-class v1, Lcom/example/tutorial/VideoProto$HeartBeat;

    const-class v2, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    .line 8416
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 8415
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 8498
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$HeartBeat;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$HeartBeat;

    .prologue
    .line 8489
    invoke-static {}, Lcom/example/tutorial/VideoProto$HeartBeat;->getDefaultInstance()Lcom/example/tutorial/VideoProto$HeartBeat;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 8494
    :goto_0
    return-object p0

    .line 8490
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$HeartBeat;->hasChannelType()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 8491
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$HeartBeat;->getChannelType()Lcom/example/tutorial/VideoProto$ChannelType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->setChannelType(Lcom/example/tutorial/VideoProto$ChannelType;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    .line 8493
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$HeartBeat;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 8505
    const/4 v2, 0x0

    .line 8507
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$HeartBeat;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$HeartBeat;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$HeartBeat;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8512
    if-eqz v2, :cond_0

    .line 8513
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$HeartBeat;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    .line 8516
    :cond_0
    return-object p0

    .line 8508
    :catch_0
    move-exception v1

    .line 8509
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$HeartBeat;

    move-object v2, v0

    .line 8510
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8511
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 8512
    if-eqz v2, :cond_1

    .line 8513
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$HeartBeat;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    .line 8515
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 8480
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$HeartBeat;

    if-eqz v0, :cond_0

    .line 8481
    check-cast p1, Lcom/example/tutorial/VideoProto$HeartBeat;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$HeartBeat;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object p0

    .line 8484
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    :goto_0
    return-object p0

    .line 8483
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setChannelType(Lcom/example/tutorial/VideoProto$ChannelType;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$ChannelType;

    .prologue
    .line 8538
    if-nez p1, :cond_0

    .line 8539
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 8541
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->bitField0_:I

    .line 8542
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->channelType_:Lcom/example/tutorial/VideoProto$ChannelType;

    .line 8543
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->onChanged()V

    .line 8544
    return-object p0
.end method
