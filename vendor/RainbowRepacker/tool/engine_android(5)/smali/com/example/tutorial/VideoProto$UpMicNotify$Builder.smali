.class public final Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$UpMicNotifyOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$UpMicNotify;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$UpMicNotifyOrBuilder;"
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
    .line 15416
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 15525
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15417
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->maybeForceBuilderInitialization()V

    .line 15418
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 15422
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 15525
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15423
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->maybeForceBuilderInitialization()V

    .line 15424
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;)V
    .locals 0

    .prologue
    .line 15420
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    .locals 1

    .prologue
    .line 15430
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->create()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    .locals 1

    .prologue
    .line 15431
    new-instance v0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 15405
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$56()Lcom/google/protobuf/Descriptors$Descriptor;

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
    .line 15666
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 15667
    new-instance v0, Lcom/google/protobuf/SingleFieldBuilder;

    .line 15669
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15670
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    move-result-object v2

    .line 15671
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->isClean()Z

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/SingleFieldBuilder;-><init>(Lcom/google/protobuf/GeneratedMessage;Lcom/google/protobuf/GeneratedMessage$BuilderParent;Z)V

    .line 15667
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    .line 15672
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15674
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 15426
    # getter for: Lcom/example/tutorial/VideoProto$UpMicNotify;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicNotify;->access$8()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 15427
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    .line 15429
    :cond_0
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$UpMicNotify;
    .locals 2

    .prologue
    .line 15459
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$UpMicNotify;

    move-result-object v0

    .line 15460
    .local v0, "result":Lcom/example/tutorial/VideoProto$UpMicNotify;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$UpMicNotify;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 15461
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 15463
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->build()Lcom/example/tutorial/VideoProto$UpMicNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->build()Lcom/example/tutorial/VideoProto$UpMicNotify;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$UpMicNotify;
    .locals 5

    .prologue
    .line 15467
    new-instance v1, Lcom/example/tutorial/VideoProto$UpMicNotify;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$UpMicNotify;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$UpMicNotify;)V

    .line 15468
    .local v1, "result":Lcom/example/tutorial/VideoProto$UpMicNotify;
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->bitField0_:I

    .line 15469
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 15470
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 15471
    or-int/lit8 v2, v2, 0x1

    .line 15473
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v3, :cond_1

    .line 15474
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$UpMicNotify;->access$10(Lcom/example/tutorial/VideoProto$UpMicNotify;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    .line 15478
    :goto_0
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$UpMicNotify;->access$11(Lcom/example/tutorial/VideoProto$UpMicNotify;I)V

    .line 15479
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->onBuilt()V

    .line 15480
    return-object v1

    .line 15476
    :cond_1
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v3}, Lcom/google/protobuf/SingleFieldBuilder;->build()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v3

    check-cast v3, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$UpMicNotify;->access$10(Lcom/example/tutorial/VideoProto$UpMicNotify;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    goto :goto_0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$UpMicNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$UpMicNotify;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    .locals 1

    .prologue
    .line 15435
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 15436
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 15437
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15441
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->bitField0_:I

    .line 15442
    return-object p0

    .line 15439
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearPlayerInfo()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    .locals 1

    .prologue
    .line 15621
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 15622
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15623
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->onChanged()V

    .line 15627
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->bitField0_:I

    .line 15628
    return-object p0

    .line 15625
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    .locals 2

    .prologue
    .line 15446
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->create()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$UpMicNotify;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$UpMicNotify;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicNotify;
    .locals 1

    .prologue
    .line 15455
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$UpMicNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicNotify;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 15451
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$56()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1

    .prologue
    .line 15546
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 15547
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15549
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessage()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public getPlayerInfoBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 15638
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->bitField0_:I

    .line 15639
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->onChanged()V

    .line 15640
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getBuilder()Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    return-object v0
.end method

.method public getPlayerInfoOrBuilder()Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
    .locals 1

    .prologue
    .line 15650
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-eqz v0, :cond_0

    .line 15651
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessageOrBuilder()Lcom/google/protobuf/MessageOrBuilder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;

    .line 15653
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public hasPlayerInfo()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 15536
    iget v1, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->bitField0_:I

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
    .line 15410
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicNotify_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$106()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 15412
    const-class v1, Lcom/example/tutorial/VideoProto$UpMicNotify;

    const-class v2, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    .line 15411
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 15410
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 15502
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$UpMicNotify;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$UpMicNotify;

    .prologue
    .line 15493
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$UpMicNotify;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 15498
    :goto_0
    return-object p0

    .line 15494
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$UpMicNotify;->hasPlayerInfo()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 15495
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$UpMicNotify;->getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->mergePlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    .line 15497
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$UpMicNotify;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15509
    const/4 v2, 0x0

    .line 15511
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$UpMicNotify;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$UpMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicNotify;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15516
    if-eqz v2, :cond_0

    .line 15517
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$UpMicNotify;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    .line 15520
    :cond_0
    return-object p0

    .line 15512
    :catch_0
    move-exception v1

    .line 15513
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicNotify;

    move-object v2, v0

    .line 15514
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15515
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 15516
    if-eqz v2, :cond_1

    .line 15517
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$UpMicNotify;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    .line 15519
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 15484
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$UpMicNotify;

    if-eqz v0, :cond_0

    .line 15485
    check-cast p1, Lcom/example/tutorial/VideoProto$UpMicNotify;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$UpMicNotify;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object p0

    .line 15488
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    :goto_0
    return-object p0

    .line 15487
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergePlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    .locals 2
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 15598
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 15599
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 15600
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 15602
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->newBuilder(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    .line 15601
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15606
    :goto_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->onChanged()V

    .line 15610
    :goto_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->bitField0_:I

    .line 15611
    return-object p0

    .line 15604
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0

    .line 15608
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->mergeFrom(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_1
.end method

.method public setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    .locals 2
    .param p1, "builderForValue"    # Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .prologue
    .line 15581
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 15582
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15583
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->onChanged()V

    .line 15587
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->bitField0_:I

    .line 15588
    return-object p0

    .line 15585
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 15560
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 15561
    if-nez p1, :cond_0

    .line 15562
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 15564
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15565
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->onChanged()V

    .line 15569
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->bitField0_:I

    .line 15570
    return-object p0

    .line 15567
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method
