.class public final Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$UpMicRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$UpMicRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$UpMicRequestOrBuilder;"
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
    .line 13376
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 13485
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13377
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->maybeForceBuilderInitialization()V

    .line 13378
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 13382
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 13485
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13383
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->maybeForceBuilderInitialization()V

    .line 13384
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;)V
    .locals 0

    .prologue
    .line 13380
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    .locals 1

    .prologue
    .line 13390
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->create()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    .locals 1

    .prologue
    .line 13391
    new-instance v0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 13365
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$44()Lcom/google/protobuf/Descriptors$Descriptor;

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
    .line 13590
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 13591
    new-instance v0, Lcom/google/protobuf/SingleFieldBuilder;

    .line 13593
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13594
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    move-result-object v2

    .line 13595
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->isClean()Z

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/SingleFieldBuilder;-><init>(Lcom/google/protobuf/GeneratedMessage;Lcom/google/protobuf/GeneratedMessage$BuilderParent;Z)V

    .line 13591
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    .line 13596
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13598
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 13386
    # getter for: Lcom/example/tutorial/VideoProto$UpMicRequest;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicRequest;->access$8()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 13387
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    .line 13389
    :cond_0
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$UpMicRequest;
    .locals 2

    .prologue
    .line 13419
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$UpMicRequest;

    move-result-object v0

    .line 13420
    .local v0, "result":Lcom/example/tutorial/VideoProto$UpMicRequest;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$UpMicRequest;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 13421
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 13423
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->build()Lcom/example/tutorial/VideoProto$UpMicRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->build()Lcom/example/tutorial/VideoProto$UpMicRequest;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$UpMicRequest;
    .locals 5

    .prologue
    .line 13427
    new-instance v1, Lcom/example/tutorial/VideoProto$UpMicRequest;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$UpMicRequest;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$UpMicRequest;)V

    .line 13428
    .local v1, "result":Lcom/example/tutorial/VideoProto$UpMicRequest;
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->bitField0_:I

    .line 13429
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 13430
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 13431
    or-int/lit8 v2, v2, 0x1

    .line 13433
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v3, :cond_1

    .line 13434
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$UpMicRequest;->access$10(Lcom/example/tutorial/VideoProto$UpMicRequest;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    .line 13438
    :goto_0
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$UpMicRequest;->access$11(Lcom/example/tutorial/VideoProto$UpMicRequest;I)V

    .line 13439
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->onBuilt()V

    .line 13440
    return-object v1

    .line 13436
    :cond_1
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v3}, Lcom/google/protobuf/SingleFieldBuilder;->build()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v3

    check-cast v3, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$UpMicRequest;->access$10(Lcom/example/tutorial/VideoProto$UpMicRequest;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    goto :goto_0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$UpMicRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$UpMicRequest;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    .locals 1

    .prologue
    .line 13395
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 13396
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 13397
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13401
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->bitField0_:I

    .line 13402
    return-object p0

    .line 13399
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearPlayerInfo()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    .locals 1

    .prologue
    .line 13557
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 13558
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13559
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->onChanged()V

    .line 13563
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->bitField0_:I

    .line 13564
    return-object p0

    .line 13561
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    .locals 2

    .prologue
    .line 13406
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->create()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$UpMicRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$UpMicRequest;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicRequest;
    .locals 1

    .prologue
    .line 13415
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$UpMicRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicRequest;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 13411
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$44()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1

    .prologue
    .line 13498
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 13499
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13501
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessage()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public getPlayerInfoBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 13570
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->bitField0_:I

    .line 13571
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->onChanged()V

    .line 13572
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getBuilder()Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    return-object v0
.end method

.method public getPlayerInfoOrBuilder()Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
    .locals 1

    .prologue
    .line 13578
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-eqz v0, :cond_0

    .line 13579
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessageOrBuilder()Lcom/google/protobuf/MessageOrBuilder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;

    .line 13581
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public hasPlayerInfo()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 13492
    iget v1, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->bitField0_:I

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
    .line 13370
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicRequest_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$102()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 13372
    const-class v1, Lcom/example/tutorial/VideoProto$UpMicRequest;

    const-class v2, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    .line 13371
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 13370
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 13462
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$UpMicRequest;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$UpMicRequest;

    .prologue
    .line 13453
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$UpMicRequest;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 13458
    :goto_0
    return-object p0

    .line 13454
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$UpMicRequest;->hasPlayerInfo()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 13455
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$UpMicRequest;->getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->mergePlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    .line 13457
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$UpMicRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 13469
    const/4 v2, 0x0

    .line 13471
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$UpMicRequest;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$UpMicRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicRequest;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13476
    if-eqz v2, :cond_0

    .line 13477
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$UpMicRequest;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    .line 13480
    :cond_0
    return-object p0

    .line 13472
    :catch_0
    move-exception v1

    .line 13473
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicRequest;

    move-object v2, v0

    .line 13474
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13475
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 13476
    if-eqz v2, :cond_1

    .line 13477
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$UpMicRequest;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    .line 13479
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 13444
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$UpMicRequest;

    if-eqz v0, :cond_0

    .line 13445
    check-cast p1, Lcom/example/tutorial/VideoProto$UpMicRequest;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$UpMicRequest;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object p0

    .line 13448
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    :goto_0
    return-object p0

    .line 13447
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergePlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    .locals 2
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 13538
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 13539
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 13540
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 13542
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->newBuilder(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    .line 13541
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13546
    :goto_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->onChanged()V

    .line 13550
    :goto_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->bitField0_:I

    .line 13551
    return-object p0

    .line 13544
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0

    .line 13548
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->mergeFrom(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_1
.end method

.method public setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    .locals 2
    .param p1, "builderForValue"    # Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .prologue
    .line 13525
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 13526
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13527
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->onChanged()V

    .line 13531
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->bitField0_:I

    .line 13532
    return-object p0

    .line 13529
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 13508
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 13509
    if-nez p1, :cond_0

    .line 13510
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 13512
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13513
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->onChanged()V

    .line 13517
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->bitField0_:I

    .line 13518
    return-object p0

    .line 13515
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method
