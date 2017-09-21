.class public final Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$EnterRoomNotifyOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$EnterRoomNotify;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$EnterRoomNotifyOrBuilder;"
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
    .line 11691
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 11800
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 11692
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->maybeForceBuilderInitialization()V

    .line 11693
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 11697
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 11800
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 11698
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->maybeForceBuilderInitialization()V

    .line 11699
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;)V
    .locals 0

    .prologue
    .line 11695
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;
    .locals 1

    .prologue
    .line 11705
    invoke-static {}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->create()Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;
    .locals 1

    .prologue
    .line 11706
    new-instance v0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 11680
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_EnterRoomNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$35()Lcom/google/protobuf/Descriptors$Descriptor;

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
    .line 11941
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 11942
    new-instance v0, Lcom/google/protobuf/SingleFieldBuilder;

    .line 11944
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 11945
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    move-result-object v2

    .line 11946
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->isClean()Z

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/SingleFieldBuilder;-><init>(Lcom/google/protobuf/GeneratedMessage;Lcom/google/protobuf/GeneratedMessage$BuilderParent;Z)V

    .line 11942
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    .line 11947
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 11949
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 11701
    # getter for: Lcom/example/tutorial/VideoProto$EnterRoomNotify;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$EnterRoomNotify;->access$8()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 11702
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    .line 11704
    :cond_0
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$EnterRoomNotify;
    .locals 2

    .prologue
    .line 11734
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    move-result-object v0

    .line 11735
    .local v0, "result":Lcom/example/tutorial/VideoProto$EnterRoomNotify;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 11736
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 11738
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->build()Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->build()Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$EnterRoomNotify;
    .locals 5

    .prologue
    .line 11742
    new-instance v1, Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$EnterRoomNotify;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$EnterRoomNotify;)V

    .line 11743
    .local v1, "result":Lcom/example/tutorial/VideoProto$EnterRoomNotify;
    iget v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->bitField0_:I

    .line 11744
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 11745
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 11746
    or-int/lit8 v2, v2, 0x1

    .line 11748
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v3, :cond_1

    .line 11749
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$EnterRoomNotify;->access$10(Lcom/example/tutorial/VideoProto$EnterRoomNotify;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    .line 11753
    :goto_0
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$EnterRoomNotify;->access$11(Lcom/example/tutorial/VideoProto$EnterRoomNotify;I)V

    .line 11754
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->onBuilt()V

    .line 11755
    return-object v1

    .line 11751
    :cond_1
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v3}, Lcom/google/protobuf/SingleFieldBuilder;->build()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v3

    check-cast v3, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$EnterRoomNotify;->access$10(Lcom/example/tutorial/VideoProto$EnterRoomNotify;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    goto :goto_0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;
    .locals 1

    .prologue
    .line 11710
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 11711
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 11712
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 11716
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->bitField0_:I

    .line 11717
    return-object p0

    .line 11714
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearPlayerInfo()Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;
    .locals 1

    .prologue
    .line 11896
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 11897
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 11898
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->onChanged()V

    .line 11902
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->bitField0_:I

    .line 11903
    return-object p0

    .line 11900
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;
    .locals 2

    .prologue
    .line 11721
    invoke-static {}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->create()Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$EnterRoomNotify;)Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$EnterRoomNotify;
    .locals 1

    .prologue
    .line 11730
    invoke-static {}, Lcom/example/tutorial/VideoProto$EnterRoomNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 11726
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_EnterRoomNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$35()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1

    .prologue
    .line 11821
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 11822
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 11824
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessage()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public getPlayerInfoBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 11913
    iget v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->bitField0_:I

    .line 11914
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->onChanged()V

    .line 11915
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getBuilder()Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    return-object v0
.end method

.method public getPlayerInfoOrBuilder()Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
    .locals 1

    .prologue
    .line 11925
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-eqz v0, :cond_0

    .line 11926
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessageOrBuilder()Lcom/google/protobuf/MessageOrBuilder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;

    .line 11928
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public hasPlayerInfo()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 11811
    iget v1, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->bitField0_:I

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
    .line 11685
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_EnterRoomNotify_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$99()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 11687
    const-class v1, Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    const-class v2, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    .line 11686
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 11685
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 11777
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$EnterRoomNotify;)Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    .prologue
    .line 11768
    invoke-static {}, Lcom/example/tutorial/VideoProto$EnterRoomNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 11773
    :goto_0
    return-object p0

    .line 11769
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$EnterRoomNotify;->hasPlayerInfo()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 11770
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$EnterRoomNotify;->getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->mergePlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    .line 11772
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$EnterRoomNotify;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 11784
    const/4 v2, 0x0

    .line 11786
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$EnterRoomNotify;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$EnterRoomNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11791
    if-eqz v2, :cond_0

    .line 11792
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$EnterRoomNotify;)Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    .line 11795
    :cond_0
    return-object p0

    .line 11787
    :catch_0
    move-exception v1

    .line 11788
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    move-object v2, v0

    .line 11789
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11790
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 11791
    if-eqz v2, :cond_1

    .line 11792
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$EnterRoomNotify;)Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    .line 11794
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 11759
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    if-eqz v0, :cond_0

    .line 11760
    check-cast p1, Lcom/example/tutorial/VideoProto$EnterRoomNotify;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$EnterRoomNotify;)Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    move-result-object p0

    .line 11763
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;
    :goto_0
    return-object p0

    .line 11762
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergePlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;
    .locals 2
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 11873
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 11874
    iget v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 11875
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 11877
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->newBuilder(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    .line 11876
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 11881
    :goto_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->onChanged()V

    .line 11885
    :goto_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->bitField0_:I

    .line 11886
    return-object p0

    .line 11879
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0

    .line 11883
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->mergeFrom(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_1
.end method

.method public setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;)Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;
    .locals 2
    .param p1, "builderForValue"    # Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .prologue
    .line 11856
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 11857
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 11858
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->onChanged()V

    .line 11862
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->bitField0_:I

    .line 11863
    return-object p0

    .line 11860
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 11835
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 11836
    if-nez p1, :cond_0

    .line 11837
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 11839
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 11840
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->onChanged()V

    .line 11844
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->bitField0_:I

    .line 11845
    return-object p0

    .line 11842
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$EnterRoomNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method
