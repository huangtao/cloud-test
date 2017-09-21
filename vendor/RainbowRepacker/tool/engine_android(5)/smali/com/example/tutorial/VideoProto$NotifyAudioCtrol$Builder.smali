.class public final Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$NotifyAudioCtrolOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$NotifyAudioCtrolOrBuilder;"
    }
.end annotation


# instance fields
.field private audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

.field private bitField0_:I

.field private seatId_:I

.field private userId_:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 21542
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 21758
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 21543
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->maybeForceBuilderInitialization()V

    .line 21544
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 21548
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 21758
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 21549
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->maybeForceBuilderInitialization()V

    .line 21550
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;)V
    .locals 0

    .prologue
    .line 21546
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 1

    .prologue
    .line 21555
    invoke-static {}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->create()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 1

    .prologue
    .line 21556
    new-instance v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 21531
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_NotifyAudioCtrol_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$86()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 0

    .prologue
    .line 21552
    # getter for: Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->access$8()Z

    .line 21554
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .locals 2

    .prologue
    .line 21584
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    move-result-object v0

    .line 21585
    .local v0, "result":Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 21586
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 21588
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->build()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->build()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .locals 5

    .prologue
    .line 21592
    new-instance v1, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;)V

    .line 21593
    .local v1, "result":Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    .line 21594
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 21595
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 21596
    or-int/lit8 v2, v2, 0x1

    .line 21598
    :cond_0
    iget v3, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->userId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->access$10(Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;I)V

    .line 21599
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 21600
    or-int/lit8 v2, v2, 0x2

    .line 21602
    :cond_1
    iget v3, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->seatId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->access$11(Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;I)V

    .line 21603
    and-int/lit8 v3, v0, 0x4

    const/4 v4, 0x4

    if-ne v3, v4, :cond_2

    .line 21604
    or-int/lit8 v2, v2, 0x4

    .line 21606
    :cond_2
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->access$12(Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;Lcom/example/tutorial/VideoProto$AudioCtrol;)V

    .line 21607
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->access$13(Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;I)V

    .line 21608
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->onBuilt()V

    .line 21609
    return-object v1
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 21560
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 21561
    iput v1, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->userId_:I

    .line 21562
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    .line 21563
    iput v1, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->seatId_:I

    .line 21564
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    .line 21565
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 21566
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    .line 21567
    return-object p0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->clear()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->clear()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->clear()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearAudioControl()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 1

    .prologue
    .line 21787
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    .line 21788
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 21789
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->onChanged()V

    .line 21790
    return-object p0
.end method

.method public clearSeatId()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 1

    .prologue
    .line 21751
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    .line 21752
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->seatId_:I

    .line 21753
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->onChanged()V

    .line 21754
    return-object p0
.end method

.method public clearUserId()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 1

    .prologue
    .line 21702
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    .line 21703
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->userId_:I

    .line 21704
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->onChanged()V

    .line 21705
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 2

    .prologue
    .line 21571
    invoke-static {}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->create()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->clone()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->clone()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->clone()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getAudioControl()Lcom/example/tutorial/VideoProto$AudioCtrol;
    .locals 1

    .prologue
    .line 21769
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .locals 1

    .prologue
    .line 21580
    invoke-static {}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->getDefaultInstance()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 21576
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_NotifyAudioCtrol_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$86()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getSeatId()I
    .locals 1

    .prologue
    .line 21728
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->seatId_:I

    return v0
.end method

.method public getUserId()I
    .locals 1

    .prologue
    .line 21679
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->userId_:I

    return v0
.end method

.method public hasAudioControl()Z
    .locals 2

    .prologue
    .line 21763
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

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

.method public hasSeatId()Z
    .locals 2

    .prologue
    .line 21718
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

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

.method public hasUserId()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 21669
    iget v1, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

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
    .line 21536
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_NotifyAudioCtrol_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$116()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 21538
    const-class v1, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    const-class v2, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    .line 21537
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 21536
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 21637
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    .prologue
    .line 21622
    invoke-static {}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->getDefaultInstance()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 21633
    :goto_0
    return-object p0

    .line 21623
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->hasUserId()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 21624
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->getUserId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->setUserId(I)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    .line 21626
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->hasSeatId()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 21627
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->getSeatId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->setSeatId(I)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    .line 21629
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->hasAudioControl()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 21630
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->getAudioControl()Lcom/example/tutorial/VideoProto$AudioCtrol;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->setAudioControl(Lcom/example/tutorial/VideoProto$AudioCtrol;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    .line 21632
    :cond_3
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 21644
    const/4 v2, 0x0

    .line 21646
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21651
    if-eqz v2, :cond_0

    .line 21652
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    .line 21655
    :cond_0
    return-object p0

    .line 21647
    :catch_0
    move-exception v1

    .line 21648
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    move-object v2, v0

    .line 21649
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21650
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 21651
    if-eqz v2, :cond_1

    .line 21652
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    .line 21654
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 21613
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    if-eqz v0, :cond_0

    .line 21614
    check-cast p1, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object p0

    .line 21617
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    :goto_0
    return-object p0

    .line 21616
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setAudioControl(Lcom/example/tutorial/VideoProto$AudioCtrol;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$AudioCtrol;

    .prologue
    .line 21775
    if-nez p1, :cond_0

    .line 21776
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 21778
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    .line 21779
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 21780
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->onChanged()V

    .line 21781
    return-object p0
.end method

.method public setSeatId(I)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 21738
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    .line 21739
    iput p1, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->seatId_:I

    .line 21740
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->onChanged()V

    .line 21741
    return-object p0
.end method

.method public setUserId(I)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 21689
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->bitField0_:I

    .line 21690
    iput p1, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->userId_:I

    .line 21691
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->onChanged()V

    .line 21692
    return-object p0
.end method
