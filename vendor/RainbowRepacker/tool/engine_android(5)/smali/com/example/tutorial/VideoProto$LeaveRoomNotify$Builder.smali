.class public final Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$LeaveRoomNotifyOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$LeaveRoomNotify;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$LeaveRoomNotifyOrBuilder;"
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
    .line 12258
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 12367
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 12259
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->maybeForceBuilderInitialization()V

    .line 12260
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 12264
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 12367
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 12265
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->maybeForceBuilderInitialization()V

    .line 12266
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;)V
    .locals 0

    .prologue
    .line 12262
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;
    .locals 1

    .prologue
    .line 12272
    invoke-static {}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->create()Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;
    .locals 1

    .prologue
    .line 12273
    new-instance v0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 12247
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_LeaveRoomNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$38()Lcom/google/protobuf/Descriptors$Descriptor;

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
    .line 12508
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 12509
    new-instance v0, Lcom/google/protobuf/SingleFieldBuilder;

    .line 12511
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 12512
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    move-result-object v2

    .line 12513
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->isClean()Z

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/SingleFieldBuilder;-><init>(Lcom/google/protobuf/GeneratedMessage;Lcom/google/protobuf/GeneratedMessage$BuilderParent;Z)V

    .line 12509
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    .line 12514
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 12516
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 12268
    # getter for: Lcom/example/tutorial/VideoProto$LeaveRoomNotify;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;->access$8()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 12269
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    .line 12271
    :cond_0
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$LeaveRoomNotify;
    .locals 2

    .prologue
    .line 12301
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    move-result-object v0

    .line 12302
    .local v0, "result":Lcom/example/tutorial/VideoProto$LeaveRoomNotify;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 12303
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 12305
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->build()Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->build()Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$LeaveRoomNotify;
    .locals 5

    .prologue
    .line 12309
    new-instance v1, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$LeaveRoomNotify;)V

    .line 12310
    .local v1, "result":Lcom/example/tutorial/VideoProto$LeaveRoomNotify;
    iget v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->bitField0_:I

    .line 12311
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 12312
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 12313
    or-int/lit8 v2, v2, 0x1

    .line 12315
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v3, :cond_1

    .line 12316
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;->access$10(Lcom/example/tutorial/VideoProto$LeaveRoomNotify;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    .line 12320
    :goto_0
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;->access$11(Lcom/example/tutorial/VideoProto$LeaveRoomNotify;I)V

    .line 12321
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->onBuilt()V

    .line 12322
    return-object v1

    .line 12318
    :cond_1
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v3}, Lcom/google/protobuf/SingleFieldBuilder;->build()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v3

    check-cast v3, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;->access$10(Lcom/example/tutorial/VideoProto$LeaveRoomNotify;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    goto :goto_0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;
    .locals 1

    .prologue
    .line 12277
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 12278
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 12279
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 12283
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->bitField0_:I

    .line 12284
    return-object p0

    .line 12281
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearPlayerInfo()Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;
    .locals 1

    .prologue
    .line 12463
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 12464
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 12465
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->onChanged()V

    .line 12469
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->bitField0_:I

    .line 12470
    return-object p0

    .line 12467
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;
    .locals 2

    .prologue
    .line 12288
    invoke-static {}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->create()Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$LeaveRoomNotify;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$LeaveRoomNotify;
    .locals 1

    .prologue
    .line 12297
    invoke-static {}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 12293
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_LeaveRoomNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$38()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1

    .prologue
    .line 12388
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 12389
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 12391
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessage()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public getPlayerInfoBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 12480
    iget v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->bitField0_:I

    .line 12481
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->onChanged()V

    .line 12482
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getBuilder()Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    return-object v0
.end method

.method public getPlayerInfoOrBuilder()Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
    .locals 1

    .prologue
    .line 12492
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-eqz v0, :cond_0

    .line 12493
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessageOrBuilder()Lcom/google/protobuf/MessageOrBuilder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;

    .line 12495
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public hasPlayerInfo()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 12378
    iget v1, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->bitField0_:I

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
    .line 12252
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_LeaveRoomNotify_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$100()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 12254
    const-class v1, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    const-class v2, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    .line 12253
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 12252
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 12344
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$LeaveRoomNotify;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    .prologue
    .line 12335
    invoke-static {}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 12340
    :goto_0
    return-object p0

    .line 12336
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;->hasPlayerInfo()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 12337
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;->getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->mergePlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    .line 12339
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 12351
    const/4 v2, 0x0

    .line 12353
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$LeaveRoomNotify;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12358
    if-eqz v2, :cond_0

    .line 12359
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$LeaveRoomNotify;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    .line 12362
    :cond_0
    return-object p0

    .line 12354
    :catch_0
    move-exception v1

    .line 12355
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    move-object v2, v0

    .line 12356
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12357
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 12358
    if-eqz v2, :cond_1

    .line 12359
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$LeaveRoomNotify;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    .line 12361
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 12326
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    if-eqz v0, :cond_0

    .line 12327
    check-cast p1, Lcom/example/tutorial/VideoProto$LeaveRoomNotify;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$LeaveRoomNotify;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    move-result-object p0

    .line 12330
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;
    :goto_0
    return-object p0

    .line 12329
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergePlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;
    .locals 2
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 12440
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 12441
    iget v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 12442
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 12444
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->newBuilder(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    .line 12443
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 12448
    :goto_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->onChanged()V

    .line 12452
    :goto_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->bitField0_:I

    .line 12453
    return-object p0

    .line 12446
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0

    .line 12450
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->mergeFrom(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_1
.end method

.method public setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;
    .locals 2
    .param p1, "builderForValue"    # Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .prologue
    .line 12423
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 12424
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 12425
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->onChanged()V

    .line 12429
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->bitField0_:I

    .line 12430
    return-object p0

    .line 12427
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 12402
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 12403
    if-nez p1, :cond_0

    .line 12404
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 12406
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 12407
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->onChanged()V

    .line 12411
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->bitField0_:I

    .line 12412
    return-object p0

    .line 12409
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LeaveRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method
