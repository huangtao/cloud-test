.class public final Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$DownMicNotifyOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$DownMicNotify;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$DownMicNotifyOrBuilder;"
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
    .line 15983
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 16092
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15984
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->maybeForceBuilderInitialization()V

    .line 15985
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 15989
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 16092
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15990
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->maybeForceBuilderInitialization()V

    .line 15991
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;)V
    .locals 0

    .prologue
    .line 15987
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    .locals 1

    .prologue
    .line 15997
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->create()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    .locals 1

    .prologue
    .line 15998
    new-instance v0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 15972
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_DownMicNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$59()Lcom/google/protobuf/Descriptors$Descriptor;

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
    .line 16233
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 16234
    new-instance v0, Lcom/google/protobuf/SingleFieldBuilder;

    .line 16236
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 16237
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    move-result-object v2

    .line 16238
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->isClean()Z

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/SingleFieldBuilder;-><init>(Lcom/google/protobuf/GeneratedMessage;Lcom/google/protobuf/GeneratedMessage$BuilderParent;Z)V

    .line 16234
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    .line 16239
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 16241
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 15993
    # getter for: Lcom/example/tutorial/VideoProto$DownMicNotify;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicNotify;->access$8()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 15994
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    .line 15996
    :cond_0
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$DownMicNotify;
    .locals 2

    .prologue
    .line 16026
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$DownMicNotify;

    move-result-object v0

    .line 16027
    .local v0, "result":Lcom/example/tutorial/VideoProto$DownMicNotify;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$DownMicNotify;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 16028
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 16030
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->build()Lcom/example/tutorial/VideoProto$DownMicNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->build()Lcom/example/tutorial/VideoProto$DownMicNotify;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$DownMicNotify;
    .locals 5

    .prologue
    .line 16034
    new-instance v1, Lcom/example/tutorial/VideoProto$DownMicNotify;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$DownMicNotify;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$DownMicNotify;)V

    .line 16035
    .local v1, "result":Lcom/example/tutorial/VideoProto$DownMicNotify;
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->bitField0_:I

    .line 16036
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 16037
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 16038
    or-int/lit8 v2, v2, 0x1

    .line 16040
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v3, :cond_1

    .line 16041
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$DownMicNotify;->access$10(Lcom/example/tutorial/VideoProto$DownMicNotify;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    .line 16045
    :goto_0
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$DownMicNotify;->access$11(Lcom/example/tutorial/VideoProto$DownMicNotify;I)V

    .line 16046
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->onBuilt()V

    .line 16047
    return-object v1

    .line 16043
    :cond_1
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v3}, Lcom/google/protobuf/SingleFieldBuilder;->build()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v3

    check-cast v3, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$DownMicNotify;->access$10(Lcom/example/tutorial/VideoProto$DownMicNotify;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    goto :goto_0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$DownMicNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$DownMicNotify;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    .locals 1

    .prologue
    .line 16002
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 16003
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 16004
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 16008
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->bitField0_:I

    .line 16009
    return-object p0

    .line 16006
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearPlayerInfo()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    .locals 1

    .prologue
    .line 16188
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 16189
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 16190
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->onChanged()V

    .line 16194
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->bitField0_:I

    .line 16195
    return-object p0

    .line 16192
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    .locals 2

    .prologue
    .line 16013
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->create()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$DownMicNotify;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$DownMicNotify;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$DownMicNotify;
    .locals 1

    .prologue
    .line 16022
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$DownMicNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$DownMicNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$DownMicNotify;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 16018
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_DownMicNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$59()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1

    .prologue
    .line 16113
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 16114
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 16116
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessage()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public getPlayerInfoBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 16205
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->bitField0_:I

    .line 16206
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->onChanged()V

    .line 16207
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getBuilder()Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    return-object v0
.end method

.method public getPlayerInfoOrBuilder()Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
    .locals 1

    .prologue
    .line 16217
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-eqz v0, :cond_0

    .line 16218
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessageOrBuilder()Lcom/google/protobuf/MessageOrBuilder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;

    .line 16220
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public hasPlayerInfo()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 16103
    iget v1, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->bitField0_:I

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
    .line 15977
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_DownMicNotify_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$107()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 15979
    const-class v1, Lcom/example/tutorial/VideoProto$DownMicNotify;

    const-class v2, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    .line 15978
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 15977
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 16069
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$DownMicNotify;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$DownMicNotify;

    .prologue
    .line 16060
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$DownMicNotify;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 16065
    :goto_0
    return-object p0

    .line 16061
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$DownMicNotify;->hasPlayerInfo()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 16062
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$DownMicNotify;->getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->mergePlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    .line 16064
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$DownMicNotify;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 16076
    const/4 v2, 0x0

    .line 16078
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$DownMicNotify;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$DownMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicNotify;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16083
    if-eqz v2, :cond_0

    .line 16084
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$DownMicNotify;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    .line 16087
    :cond_0
    return-object p0

    .line 16079
    :catch_0
    move-exception v1

    .line 16080
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicNotify;

    move-object v2, v0

    .line 16081
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16082
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 16083
    if-eqz v2, :cond_1

    .line 16084
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$DownMicNotify;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    .line 16086
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 16051
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$DownMicNotify;

    if-eqz v0, :cond_0

    .line 16052
    check-cast p1, Lcom/example/tutorial/VideoProto$DownMicNotify;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$DownMicNotify;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object p0

    .line 16055
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    :goto_0
    return-object p0

    .line 16054
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergePlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    .locals 2
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 16165
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 16166
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 16167
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 16169
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->newBuilder(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    .line 16168
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 16173
    :goto_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->onChanged()V

    .line 16177
    :goto_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->bitField0_:I

    .line 16178
    return-object p0

    .line 16171
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0

    .line 16175
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->mergeFrom(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_1
.end method

.method public setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    .locals 2
    .param p1, "builderForValue"    # Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .prologue
    .line 16148
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 16149
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 16150
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->onChanged()V

    .line 16154
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->bitField0_:I

    .line 16155
    return-object p0

    .line 16152
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 16127
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 16128
    if-nez p1, :cond_0

    .line 16129
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 16131
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 16132
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->onChanged()V

    .line 16136
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->bitField0_:I

    .line 16137
    return-object p0

    .line 16134
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method
