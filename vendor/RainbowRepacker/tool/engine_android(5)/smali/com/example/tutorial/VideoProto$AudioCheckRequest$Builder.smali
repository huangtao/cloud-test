.class public final Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$AudioCheckRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$AudioCheckRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$AudioCheckRequestOrBuilder;"
    }
.end annotation


# instance fields
.field private bitField0_:I

.field private sendCheckNum_:I

.field private sendUserId_:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 19499
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 19500
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->maybeForceBuilderInitialization()V

    .line 19501
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 0
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 19505
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 19506
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->maybeForceBuilderInitialization()V

    .line 19507
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;)V
    .locals 0

    .prologue
    .line 19503
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    .locals 1

    .prologue
    .line 19512
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->create()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    .locals 1

    .prologue
    .line 19513
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 19488
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCheckRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$74()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 0

    .prologue
    .line 19509
    # getter for: Lcom/example/tutorial/VideoProto$AudioCheckRequest;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->access$8()Z

    .line 19511
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    .locals 2

    .prologue
    .line 19539
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    move-result-object v0

    .line 19540
    .local v0, "result":Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 19541
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 19543
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->build()Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->build()Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    .locals 5

    .prologue
    .line 19547
    new-instance v1, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$AudioCheckRequest;)V

    .line 19548
    .local v1, "result":Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->bitField0_:I

    .line 19549
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 19550
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 19551
    or-int/lit8 v2, v2, 0x1

    .line 19553
    :cond_0
    iget v3, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->sendUserId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->access$10(Lcom/example/tutorial/VideoProto$AudioCheckRequest;I)V

    .line 19554
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 19555
    or-int/lit8 v2, v2, 0x2

    .line 19557
    :cond_1
    iget v3, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->sendCheckNum_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->access$11(Lcom/example/tutorial/VideoProto$AudioCheckRequest;I)V

    .line 19558
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->access$12(Lcom/example/tutorial/VideoProto$AudioCheckRequest;I)V

    .line 19559
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->onBuilt()V

    .line 19560
    return-object v1
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 19517
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 19518
    iput v1, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->sendUserId_:I

    .line 19519
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->bitField0_:I

    .line 19520
    iput v1, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->sendCheckNum_:I

    .line 19521
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->bitField0_:I

    .line 19522
    return-object p0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearSendCheckNum()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    .locals 1

    .prologue
    .line 19699
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->bitField0_:I

    .line 19700
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->sendCheckNum_:I

    .line 19701
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->onChanged()V

    .line 19702
    return-object p0
.end method

.method public clearSendUserId()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    .locals 1

    .prologue
    .line 19650
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->bitField0_:I

    .line 19651
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->sendUserId_:I

    .line 19652
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->onChanged()V

    .line 19653
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    .locals 2

    .prologue
    .line 19526
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->create()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCheckRequest;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    .locals 1

    .prologue
    .line 19535
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 19531
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCheckRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$74()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getSendCheckNum()I
    .locals 1

    .prologue
    .line 19676
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->sendCheckNum_:I

    return v0
.end method

.method public getSendUserId()I
    .locals 1

    .prologue
    .line 19627
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->sendUserId_:I

    return v0
.end method

.method public hasSendCheckNum()Z
    .locals 2

    .prologue
    .line 19666
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->bitField0_:I

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

.method public hasSendUserId()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 19617
    iget v1, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->bitField0_:I

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
    .line 19493
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCheckRequest_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$112()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 19495
    const-class v1, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    const-class v2, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    .line 19494
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 19493
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 19585
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$AudioCheckRequest;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    .prologue
    .line 19573
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 19581
    :goto_0
    return-object p0

    .line 19574
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->hasSendUserId()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 19575
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->getSendUserId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->setSendUserId(I)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    .line 19577
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->hasSendCheckNum()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 19578
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->getSendCheckNum()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->setSendCheckNum(I)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    .line 19580
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19592
    const/4 v2, 0x0

    .line 19594
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19599
    if-eqz v2, :cond_0

    .line 19600
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCheckRequest;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    .line 19603
    :cond_0
    return-object p0

    .line 19595
    :catch_0
    move-exception v1

    .line 19596
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    move-object v2, v0

    .line 19597
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19598
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 19599
    if-eqz v2, :cond_1

    .line 19600
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCheckRequest;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    .line 19602
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 19564
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    if-eqz v0, :cond_0

    .line 19565
    check-cast p1, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCheckRequest;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object p0

    .line 19568
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    :goto_0
    return-object p0

    .line 19567
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setSendCheckNum(I)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 19686
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->bitField0_:I

    .line 19687
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->sendCheckNum_:I

    .line 19688
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->onChanged()V

    .line 19689
    return-object p0
.end method

.method public setSendUserId(I)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 19637
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->bitField0_:I

    .line 19638
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->sendUserId_:I

    .line 19639
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->onChanged()V

    .line 19640
    return-object p0
.end method
