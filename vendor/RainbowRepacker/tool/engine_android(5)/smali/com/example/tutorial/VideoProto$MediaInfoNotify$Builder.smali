.class public final Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$MediaInfoNotifyOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$MediaInfoNotify;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$MediaInfoNotifyOrBuilder;"
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
    .line 12825
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 12934
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 12826
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->maybeForceBuilderInitialization()V

    .line 12827
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 12831
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 12934
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 12832
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->maybeForceBuilderInitialization()V

    .line 12833
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;)V
    .locals 0

    .prologue
    .line 12829
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;
    .locals 1

    .prologue
    .line 12839
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->create()Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;
    .locals 1

    .prologue
    .line 12840
    new-instance v0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 12814
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MediaInfoNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$41()Lcom/google/protobuf/Descriptors$Descriptor;

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
    .line 13075
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 13076
    new-instance v0, Lcom/google/protobuf/SingleFieldBuilder;

    .line 13078
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13079
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    move-result-object v2

    .line 13080
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->isClean()Z

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/SingleFieldBuilder;-><init>(Lcom/google/protobuf/GeneratedMessage;Lcom/google/protobuf/GeneratedMessage$BuilderParent;Z)V

    .line 13076
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    .line 13081
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13083
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 12835
    # getter for: Lcom/example/tutorial/VideoProto$MediaInfoNotify;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaInfoNotify;->access$8()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 12836
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    .line 12838
    :cond_0
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$MediaInfoNotify;
    .locals 2

    .prologue
    .line 12868
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    move-result-object v0

    .line 12869
    .local v0, "result":Lcom/example/tutorial/VideoProto$MediaInfoNotify;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 12870
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 12872
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->build()Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->build()Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$MediaInfoNotify;
    .locals 5

    .prologue
    .line 12876
    new-instance v1, Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$MediaInfoNotify;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$MediaInfoNotify;)V

    .line 12877
    .local v1, "result":Lcom/example/tutorial/VideoProto$MediaInfoNotify;
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->bitField0_:I

    .line 12878
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 12879
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 12880
    or-int/lit8 v2, v2, 0x1

    .line 12882
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v3, :cond_1

    .line 12883
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$MediaInfoNotify;->access$10(Lcom/example/tutorial/VideoProto$MediaInfoNotify;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    .line 12887
    :goto_0
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$MediaInfoNotify;->access$11(Lcom/example/tutorial/VideoProto$MediaInfoNotify;I)V

    .line 12888
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->onBuilt()V

    .line 12889
    return-object v1

    .line 12885
    :cond_1
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v3}, Lcom/google/protobuf/SingleFieldBuilder;->build()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v3

    check-cast v3, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$MediaInfoNotify;->access$10(Lcom/example/tutorial/VideoProto$MediaInfoNotify;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    goto :goto_0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;
    .locals 1

    .prologue
    .line 12844
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 12845
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 12846
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 12850
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->bitField0_:I

    .line 12851
    return-object p0

    .line 12848
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearPlayerInfo()Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;
    .locals 1

    .prologue
    .line 13030
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 13031
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13032
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->onChanged()V

    .line 13036
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->bitField0_:I

    .line 13037
    return-object p0

    .line 13034
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;
    .locals 2

    .prologue
    .line 12855
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->create()Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MediaInfoNotify;)Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MediaInfoNotify;
    .locals 1

    .prologue
    .line 12864
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaInfoNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 12860
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MediaInfoNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$41()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1

    .prologue
    .line 12955
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 12956
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 12958
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessage()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public getPlayerInfoBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 13047
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->bitField0_:I

    .line 13048
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->onChanged()V

    .line 13049
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getBuilder()Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    return-object v0
.end method

.method public getPlayerInfoOrBuilder()Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
    .locals 1

    .prologue
    .line 13059
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-eqz v0, :cond_0

    .line 13060
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessageOrBuilder()Lcom/google/protobuf/MessageOrBuilder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;

    .line 13062
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public hasPlayerInfo()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 12945
    iget v1, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->bitField0_:I

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
    .line 12819
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MediaInfoNotify_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$101()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 12821
    const-class v1, Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    const-class v2, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    .line 12820
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 12819
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 12911
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$MediaInfoNotify;)Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    .prologue
    .line 12902
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaInfoNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 12907
    :goto_0
    return-object p0

    .line 12903
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MediaInfoNotify;->hasPlayerInfo()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 12904
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MediaInfoNotify;->getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->mergePlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    .line 12906
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MediaInfoNotify;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 12918
    const/4 v2, 0x0

    .line 12920
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$MediaInfoNotify;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$MediaInfoNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12925
    if-eqz v2, :cond_0

    .line 12926
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MediaInfoNotify;)Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    .line 12929
    :cond_0
    return-object p0

    .line 12921
    :catch_0
    move-exception v1

    .line 12922
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    move-object v2, v0

    .line 12923
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12924
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 12925
    if-eqz v2, :cond_1

    .line 12926
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MediaInfoNotify;)Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    .line 12928
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 12893
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    if-eqz v0, :cond_0

    .line 12894
    check-cast p1, Lcom/example/tutorial/VideoProto$MediaInfoNotify;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MediaInfoNotify;)Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    move-result-object p0

    .line 12897
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;
    :goto_0
    return-object p0

    .line 12896
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergePlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;
    .locals 2
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 13007
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 13008
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 13009
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 13011
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->newBuilder(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    .line 13010
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13015
    :goto_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->onChanged()V

    .line 13019
    :goto_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->bitField0_:I

    .line 13020
    return-object p0

    .line 13013
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0

    .line 13017
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->mergeFrom(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_1
.end method

.method public setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;)Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;
    .locals 2
    .param p1, "builderForValue"    # Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .prologue
    .line 12990
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 12991
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 12992
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->onChanged()V

    .line 12996
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->bitField0_:I

    .line 12997
    return-object p0

    .line 12994
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 12969
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 12970
    if-nez p1, :cond_0

    .line 12971
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 12973
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 12974
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->onChanged()V

    .line 12978
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->bitField0_:I

    .line 12979
    return-object p0

    .line 12976
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method
