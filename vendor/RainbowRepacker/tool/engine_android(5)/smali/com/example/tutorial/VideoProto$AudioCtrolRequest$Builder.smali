.class public final Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$AudioCtrolRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$AudioCtrolRequestOrBuilder;"
    }
.end annotation


# instance fields
.field private audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

.field private bitField0_:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 20524
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 20624
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 20525
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->maybeForceBuilderInitialization()V

    .line 20526
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 20530
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 20624
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 20531
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->maybeForceBuilderInitialization()V

    .line 20532
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;)V
    .locals 0

    .prologue
    .line 20528
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    .locals 1

    .prologue
    .line 20537
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->create()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    .locals 1

    .prologue
    .line 20538
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 20513
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCtrolRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$80()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 0

    .prologue
    .line 20534
    # getter for: Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->access$8()Z

    .line 20536
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .locals 2

    .prologue
    .line 20562
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    move-result-object v0

    .line 20563
    .local v0, "result":Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 20564
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 20566
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->build()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->build()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .locals 5

    .prologue
    .line 20570
    new-instance v1, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$AudioCtrolRequest;)V

    .line 20571
    .local v1, "result":Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->bitField0_:I

    .line 20572
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 20573
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 20574
    or-int/lit8 v2, v2, 0x1

    .line 20576
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->access$10(Lcom/example/tutorial/VideoProto$AudioCtrolRequest;Lcom/example/tutorial/VideoProto$AudioCtrol;)V

    .line 20577
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->access$11(Lcom/example/tutorial/VideoProto$AudioCtrolRequest;I)V

    .line 20578
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->onBuilt()V

    .line 20579
    return-object v1
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    .locals 1

    .prologue
    .line 20542
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 20543
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 20544
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->bitField0_:I

    .line 20545
    return-object p0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearAudioControl()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    .locals 1

    .prologue
    .line 20653
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->bitField0_:I

    .line 20654
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 20655
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->onChanged()V

    .line 20656
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    .locals 2

    .prologue
    .line 20549
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->create()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCtrolRequest;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getAudioControl()Lcom/example/tutorial/VideoProto$AudioCtrol;
    .locals 1

    .prologue
    .line 20635
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .locals 1

    .prologue
    .line 20558
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 20554
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCtrolRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$80()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public hasAudioControl()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 20629
    iget v1, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->bitField0_:I

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
    .line 20518
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCtrolRequest_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$114()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 20520
    const-class v1, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    const-class v2, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    .line 20519
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 20518
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 20601
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$AudioCtrolRequest;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    .prologue
    .line 20592
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 20597
    :goto_0
    return-object p0

    .line 20593
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->hasAudioControl()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 20594
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->getAudioControl()Lcom/example/tutorial/VideoProto$AudioCtrol;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->setAudioControl(Lcom/example/tutorial/VideoProto$AudioCtrol;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    .line 20596
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20608
    const/4 v2, 0x0

    .line 20610
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20615
    if-eqz v2, :cond_0

    .line 20616
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCtrolRequest;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    .line 20619
    :cond_0
    return-object p0

    .line 20611
    :catch_0
    move-exception v1

    .line 20612
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    move-object v2, v0

    .line 20613
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20614
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 20615
    if-eqz v2, :cond_1

    .line 20616
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCtrolRequest;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    .line 20618
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 20583
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    if-eqz v0, :cond_0

    .line 20584
    check-cast p1, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCtrolRequest;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object p0

    .line 20587
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    :goto_0
    return-object p0

    .line 20586
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setAudioControl(Lcom/example/tutorial/VideoProto$AudioCtrol;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$AudioCtrol;

    .prologue
    .line 20641
    if-nez p1, :cond_0

    .line 20642
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 20644
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->bitField0_:I

    .line 20645
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 20646
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->onChanged()V

    .line 20647
    return-object p0
.end method
