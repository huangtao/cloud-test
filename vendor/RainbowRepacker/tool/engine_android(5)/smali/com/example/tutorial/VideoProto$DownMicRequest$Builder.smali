.class public final Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$DownMicRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$DownMicRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$DownMicRequestOrBuilder;"
    }
.end annotation


# instance fields
.field private bitField0_:I

.field private playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/SingleFieldBuilder",
            "<",
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            "Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;",
            "Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;",
            ">;"
        }
    .end annotation
.end field

.field private playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 14480
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 14589
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14481
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->maybeForceBuilderInitialization()V

    .line 14482
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 14486
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 14589
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14487
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->maybeForceBuilderInitialization()V

    .line 14488
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;)V
    .locals 0

    .prologue
    .line 14484
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;
    .locals 1

    .prologue
    .line 14494
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->create()Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;
    .locals 1

    .prologue
    .line 14495
    new-instance v0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 14469
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_DownMicRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$50()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/SingleFieldBuilder",
            "<",
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            "Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;",
            "Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 14694
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 14695
    new-instance v0, Lcom/google/protobuf/SingleFieldBuilder;

    .line 14697
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14698
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    move-result-object v2

    .line 14699
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->isClean()Z

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/SingleFieldBuilder;-><init>(Lcom/google/protobuf/GeneratedMessage;Lcom/google/protobuf/GeneratedMessage$BuilderParent;Z)V

    .line 14695
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    .line 14700
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14702
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 14490
    # getter for: Lcom/example/tutorial/VideoProto$DownMicRequest;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicRequest;->access$8()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 14491
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    .line 14493
    :cond_0
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$DownMicRequest;
    .locals 2

    .prologue
    .line 14523
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$DownMicRequest;

    move-result-object v0

    .line 14524
    .local v0, "result":Lcom/example/tutorial/VideoProto$DownMicRequest;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$DownMicRequest;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 14525
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 14527
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->build()Lcom/example/tutorial/VideoProto$DownMicRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->build()Lcom/example/tutorial/VideoProto$DownMicRequest;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$DownMicRequest;
    .locals 5

    .prologue
    .line 14531
    new-instance v1, Lcom/example/tutorial/VideoProto$DownMicRequest;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$DownMicRequest;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$DownMicRequest;)V

    .line 14532
    .local v1, "result":Lcom/example/tutorial/VideoProto$DownMicRequest;
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->bitField0_:I

    .line 14533
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 14534
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 14535
    or-int/lit8 v2, v2, 0x1

    .line 14537
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v3, :cond_1

    .line 14538
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$DownMicRequest;->access$10(Lcom/example/tutorial/VideoProto$DownMicRequest;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    .line 14542
    :goto_0
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$DownMicRequest;->access$11(Lcom/example/tutorial/VideoProto$DownMicRequest;I)V

    .line 14543
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->onBuilt()V

    .line 14544
    return-object v1

    .line 14540
    :cond_1
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v3}, Lcom/google/protobuf/SingleFieldBuilder;->build()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v3

    check-cast v3, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$DownMicRequest;->access$10(Lcom/example/tutorial/VideoProto$DownMicRequest;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    goto :goto_0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$DownMicRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$DownMicRequest;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;
    .locals 1

    .prologue
    .line 14499
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 14500
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 14501
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14505
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->bitField0_:I

    .line 14506
    return-object p0

    .line 14503
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearPlayerInfo()Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;
    .locals 1

    .prologue
    .line 14661
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 14662
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14663
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->onChanged()V

    .line 14667
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->bitField0_:I

    .line 14668
    return-object p0

    .line 14665
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;
    .locals 2

    .prologue
    .line 14510
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->create()Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$DownMicRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$DownMicRequest;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$DownMicRequest;
    .locals 1

    .prologue
    .line 14519
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$DownMicRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$DownMicRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$DownMicRequest;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 14515
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_DownMicRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$50()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1

    .prologue
    .line 14602
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 14603
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14605
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessage()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public getPlayerInfoBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 14674
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->bitField0_:I

    .line 14675
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->onChanged()V

    .line 14676
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getBuilder()Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    return-object v0
.end method

.method public getPlayerInfoOrBuilder()Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
    .locals 1

    .prologue
    .line 14682
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-eqz v0, :cond_0

    .line 14683
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessageOrBuilder()Lcom/google/protobuf/MessageOrBuilder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;

    .line 14685
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public hasPlayerInfo()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 14596
    iget v1, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->bitField0_:I

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
    .line 14474
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_DownMicRequest_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$104()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 14476
    const-class v1, Lcom/example/tutorial/VideoProto$DownMicRequest;

    const-class v2, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    .line 14475
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 14474
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 14566
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$DownMicRequest;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$DownMicRequest;

    .prologue
    .line 14557
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$DownMicRequest;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 14562
    :goto_0
    return-object p0

    .line 14558
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$DownMicRequest;->hasPlayerInfo()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 14559
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$DownMicRequest;->getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->mergePlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    .line 14561
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$DownMicRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 14573
    const/4 v2, 0x0

    .line 14575
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$DownMicRequest;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$DownMicRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicRequest;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14580
    if-eqz v2, :cond_0

    .line 14581
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$DownMicRequest;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    .line 14584
    :cond_0
    return-object p0

    .line 14576
    :catch_0
    move-exception v1

    .line 14577
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicRequest;

    move-object v2, v0

    .line 14578
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14579
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 14580
    if-eqz v2, :cond_1

    .line 14581
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$DownMicRequest;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    .line 14583
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 14548
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$DownMicRequest;

    if-eqz v0, :cond_0

    .line 14549
    check-cast p1, Lcom/example/tutorial/VideoProto$DownMicRequest;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$DownMicRequest;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    move-result-object p0

    .line 14552
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;
    :goto_0
    return-object p0

    .line 14551
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergePlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;
    .locals 2
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 14642
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 14643
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 14644
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 14646
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->newBuilder(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    .line 14645
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14650
    :goto_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->onChanged()V

    .line 14654
    :goto_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->bitField0_:I

    .line 14655
    return-object p0

    .line 14648
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0

    .line 14652
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->mergeFrom(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_1
.end method

.method public setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;
    .locals 2
    .param p1, "builderForValue"    # Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .prologue
    .line 14629
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 14630
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14631
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->onChanged()V

    .line 14635
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->bitField0_:I

    .line 14636
    return-object p0

    .line 14633
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 14612
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 14613
    if-nez p1, :cond_0

    .line 14614
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 14616
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14617
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->onChanged()V

    .line 14621
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->bitField0_:I

    .line 14622
    return-object p0

    .line 14619
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method
