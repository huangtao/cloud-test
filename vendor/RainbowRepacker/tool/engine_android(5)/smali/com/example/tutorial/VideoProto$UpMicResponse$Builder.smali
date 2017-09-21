.class public final Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$UpMicResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$UpMicResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$UpMicResponseOrBuilder;"
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

.field private result_:Lcom/example/tutorial/VideoProto$ResultID;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 13928
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 14046
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 14082
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13929
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->maybeForceBuilderInitialization()V

    .line 13930
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 13934
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 14046
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 14082
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13935
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->maybeForceBuilderInitialization()V

    .line 13936
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;)V
    .locals 0

    .prologue
    .line 13932
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 1

    .prologue
    .line 13942
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->create()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 1

    .prologue
    .line 13943
    new-instance v0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 13917
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$47()Lcom/google/protobuf/Descriptors$Descriptor;

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
    .line 14187
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 14188
    new-instance v0, Lcom/google/protobuf/SingleFieldBuilder;

    .line 14190
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14191
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    move-result-object v2

    .line 14192
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->isClean()Z

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/SingleFieldBuilder;-><init>(Lcom/google/protobuf/GeneratedMessage;Lcom/google/protobuf/GeneratedMessage$BuilderParent;Z)V

    .line 14188
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    .line 14193
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14195
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 13938
    # getter for: Lcom/example/tutorial/VideoProto$UpMicResponse;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicResponse;->access$8()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 13939
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    .line 13941
    :cond_0
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$UpMicResponse;
    .locals 2

    .prologue
    .line 13973
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$UpMicResponse;

    move-result-object v0

    .line 13974
    .local v0, "result":Lcom/example/tutorial/VideoProto$UpMicResponse;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$UpMicResponse;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 13975
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 13977
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->build()Lcom/example/tutorial/VideoProto$UpMicResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->build()Lcom/example/tutorial/VideoProto$UpMicResponse;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$UpMicResponse;
    .locals 5

    .prologue
    .line 13981
    new-instance v1, Lcom/example/tutorial/VideoProto$UpMicResponse;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$UpMicResponse;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$UpMicResponse;)V

    .line 13982
    .local v1, "result":Lcom/example/tutorial/VideoProto$UpMicResponse;
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    .line 13983
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 13984
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 13985
    or-int/lit8 v2, v2, 0x1

    .line 13987
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$UpMicResponse;->access$10(Lcom/example/tutorial/VideoProto$UpMicResponse;Lcom/example/tutorial/VideoProto$ResultID;)V

    .line 13988
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 13989
    or-int/lit8 v2, v2, 0x2

    .line 13991
    :cond_1
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v3, :cond_2

    .line 13992
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$UpMicResponse;->access$11(Lcom/example/tutorial/VideoProto$UpMicResponse;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    .line 13996
    :goto_0
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$UpMicResponse;->access$12(Lcom/example/tutorial/VideoProto$UpMicResponse;I)V

    .line 13997
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->onBuilt()V

    .line 13998
    return-object v1

    .line 13994
    :cond_2
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v3}, Lcom/google/protobuf/SingleFieldBuilder;->build()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v3

    check-cast v3, Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$UpMicResponse;->access$11(Lcom/example/tutorial/VideoProto$UpMicResponse;Lcom/example/tutorial/VideoProto$PlayerInfo;)V

    goto :goto_0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$UpMicResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$UpMicResponse;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 1

    .prologue
    .line 13947
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 13948
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 13949
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    .line 13950
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 13951
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13955
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    .line 13956
    return-object p0

    .line 13953
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearPlayerInfo()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 1

    .prologue
    .line 14154
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 14155
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14156
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->onChanged()V

    .line 14160
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    .line 14161
    return-object p0

    .line 14158
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public clearResult()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 1

    .prologue
    .line 14075
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    .line 14076
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 14077
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->onChanged()V

    .line 14078
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 2

    .prologue
    .line 13960
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->create()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$UpMicResponse;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$UpMicResponse;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicResponse;
    .locals 1

    .prologue
    .line 13969
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicResponse;->getDefaultInstance()Lcom/example/tutorial/VideoProto$UpMicResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicResponse;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 13965
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$47()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1

    .prologue
    .line 14095
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 14096
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14098
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessage()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public getPlayerInfoBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 14167
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    .line 14168
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->onChanged()V

    .line 14169
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getBuilder()Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    return-object v0
.end method

.method public getPlayerInfoOrBuilder()Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
    .locals 1

    .prologue
    .line 14175
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-eqz v0, :cond_0

    .line 14176
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessageOrBuilder()Lcom/google/protobuf/MessageOrBuilder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;

    .line 14178
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public getResult()Lcom/example/tutorial/VideoProto$ResultID;
    .locals 1

    .prologue
    .line 14057
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    return-object v0
.end method

.method public hasPlayerInfo()Z
    .locals 2

    .prologue
    .line 14089
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

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

.method public hasResult()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 14051
    iget v1, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

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
    .line 13922
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicResponse_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$103()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 13924
    const-class v1, Lcom/example/tutorial/VideoProto$UpMicResponse;

    const-class v2, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    .line 13923
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 13922
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 14023
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$UpMicResponse;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$UpMicResponse;

    .prologue
    .line 14011
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicResponse;->getDefaultInstance()Lcom/example/tutorial/VideoProto$UpMicResponse;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 14019
    :goto_0
    return-object p0

    .line 14012
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$UpMicResponse;->hasResult()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 14013
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$UpMicResponse;->getResult()Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->setResult(Lcom/example/tutorial/VideoProto$ResultID;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    .line 14015
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$UpMicResponse;->hasPlayerInfo()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 14016
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$UpMicResponse;->getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->mergePlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    .line 14018
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$UpMicResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 14030
    const/4 v2, 0x0

    .line 14032
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$UpMicResponse;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$UpMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicResponse;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14037
    if-eqz v2, :cond_0

    .line 14038
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$UpMicResponse;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    .line 14041
    :cond_0
    return-object p0

    .line 14033
    :catch_0
    move-exception v1

    .line 14034
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicResponse;

    move-object v2, v0

    .line 14035
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14036
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 14037
    if-eqz v2, :cond_1

    .line 14038
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$UpMicResponse;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    .line 14040
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 14002
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$UpMicResponse;

    if-eqz v0, :cond_0

    .line 14003
    check-cast p1, Lcom/example/tutorial/VideoProto$UpMicResponse;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$UpMicResponse;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object p0

    .line 14006
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    :goto_0
    return-object p0

    .line 14005
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergePlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 2
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 14135
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 14136
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 14137
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 14139
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->newBuilder(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    .line 14138
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14143
    :goto_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->onChanged()V

    .line 14147
    :goto_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    .line 14148
    return-object p0

    .line 14141
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0

    .line 14145
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->mergeFrom(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_1
.end method

.method public setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 2
    .param p1, "builderForValue"    # Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .prologue
    .line 14122
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 14123
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14124
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->onChanged()V

    .line 14128
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    .line 14129
    return-object p0

    .line 14126
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public setPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 14105
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 14106
    if-nez p1, :cond_0

    .line 14107
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 14109
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 14110
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->onChanged()V

    .line 14114
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    .line 14115
    return-object p0

    .line 14112
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->playerInfoBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public setResult(Lcom/example/tutorial/VideoProto$ResultID;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$ResultID;

    .prologue
    .line 14063
    if-nez p1, :cond_0

    .line 14064
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 14066
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->bitField0_:I

    .line 14067
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 14068
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->onChanged()V

    .line 14069
    return-object p0
.end method
