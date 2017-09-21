.class public final Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$P2PInfoNotifyOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$P2PInfoNotify;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$P2PInfoNotifyOrBuilder;"
    }
.end annotation


# instance fields
.field private bitField0_:I

.field private playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/RepeatedFieldBuilder",
            "<",
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            "Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;",
            "Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;",
            ">;"
        }
    .end annotation
.end field

.field private playerInfo_:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 18794
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 18926
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    .line 18795
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->maybeForceBuilderInitialization()V

    .line 18796
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 18800
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 18926
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    .line 18801
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->maybeForceBuilderInitialization()V

    .line 18802
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;)V
    .locals 0

    .prologue
    .line 18798
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    .locals 1

    .prologue
    .line 18808
    invoke-static {}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->create()Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    .locals 1

    .prologue
    .line 18809
    new-instance v0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;-><init>()V

    return-object v0
.end method

.method private ensurePlayerInfoIsMutable()V
    .locals 2

    .prologue
    .line 18928
    iget v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 18929
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    .line 18930
    iget v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->bitField0_:I

    .line 18932
    :cond_0
    return-void
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 18783
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_P2PInfoNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$71()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private getPlayerInfoFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilder;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/RepeatedFieldBuilder",
            "<",
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            "Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;",
            "Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 19152
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v1, :cond_0

    .line 19153
    new-instance v1, Lcom/google/protobuf/RepeatedFieldBuilder;

    .line 19155
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    .line 19156
    iget v3, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->bitField0_:I

    and-int/lit8 v3, v3, 0x1

    if-ne v3, v0, :cond_1

    .line 19157
    :goto_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    move-result-object v3

    .line 19158
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->isClean()Z

    move-result v4

    invoke-direct {v1, v2, v0, v3, v4}, Lcom/google/protobuf/RepeatedFieldBuilder;-><init>(Ljava/util/List;ZLcom/google/protobuf/GeneratedMessage$BuilderParent;Z)V

    .line 19153
    iput-object v1, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    .line 19159
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    .line 19161
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    return-object v0

    .line 19156
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 18804
    # getter for: Lcom/example/tutorial/VideoProto$P2PInfoNotify;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$P2PInfoNotify;->access$8()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 18805
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilder;

    .line 18807
    :cond_0
    return-void
.end method


# virtual methods
.method public addAllPlayerInfo(Ljava/lang/Iterable;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            ">;)",
            "Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;"
        }
    .end annotation

    .prologue
    .line 19064
    .local p1, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lcom/example/tutorial/VideoProto$PlayerInfo;>;"
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 19065
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->ensurePlayerInfoIsMutable()V

    .line 19066
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-static {p1, v0}, Lcom/google/protobuf/GeneratedMessage$Builder;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 19067
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->onChanged()V

    .line 19071
    :goto_0
    return-object p0

    .line 19069
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilder;->addAllMessages(Ljava/lang/Iterable;)Lcom/google/protobuf/RepeatedFieldBuilder;

    goto :goto_0
.end method

.method public addPlayerInfo(ILcom/example/tutorial/VideoProto$PlayerInfo$Builder;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    .locals 2
    .param p1, "index"    # I
    .param p2, "builderForValue"    # Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .prologue
    .line 19050
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 19051
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->ensurePlayerInfoIsMutable()V

    .line 19052
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-virtual {p2}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 19053
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->onChanged()V

    .line 19057
    :goto_0
    return-object p0

    .line 19055
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {p2}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/google/protobuf/RepeatedFieldBuilder;->addMessage(ILcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/RepeatedFieldBuilder;

    goto :goto_0
.end method

.method public addPlayerInfo(ILcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 19019
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_1

    .line 19020
    if-nez p2, :cond_0

    .line 19021
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 19023
    :cond_0
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->ensurePlayerInfoIsMutable()V

    .line 19024
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 19025
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->onChanged()V

    .line 19029
    :goto_0
    return-object p0

    .line 19027
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0, p1, p2}, Lcom/google/protobuf/RepeatedFieldBuilder;->addMessage(ILcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/RepeatedFieldBuilder;

    goto :goto_0
.end method

.method public addPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    .locals 2
    .param p1, "builderForValue"    # Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .prologue
    .line 19036
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 19037
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->ensurePlayerInfoIsMutable()V

    .line 19038
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19039
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->onChanged()V

    .line 19043
    :goto_0
    return-object p0

    .line 19041
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/RepeatedFieldBuilder;->addMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/RepeatedFieldBuilder;

    goto :goto_0
.end method

.method public addPlayerInfo(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 19002
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_1

    .line 19003
    if-nez p1, :cond_0

    .line 19004
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 19006
    :cond_0
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->ensurePlayerInfoIsMutable()V

    .line 19007
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19008
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->onChanged()V

    .line 19012
    :goto_0
    return-object p0

    .line 19010
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilder;->addMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/RepeatedFieldBuilder;

    goto :goto_0
.end method

.method public addPlayerInfoBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 2

    .prologue
    .line 19131
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilder;

    move-result-object v0

    .line 19132
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    .line 19131
    invoke-virtual {v0, v1}, Lcom/google/protobuf/RepeatedFieldBuilder;->addBuilder(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    return-object v0
.end method

.method public addPlayerInfoBuilder(I)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 19139
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilder;

    move-result-object v0

    .line 19140
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    .line 19139
    invoke-virtual {v0, p1, v1}, Lcom/google/protobuf/RepeatedFieldBuilder;->addBuilder(ILcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    return-object v0
.end method

.method public build()Lcom/example/tutorial/VideoProto$P2PInfoNotify;
    .locals 2

    .prologue
    .line 18837
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    move-result-object v0

    .line 18838
    .local v0, "result":Lcom/example/tutorial/VideoProto$P2PInfoNotify;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 18839
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 18841
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->build()Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->build()Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$P2PInfoNotify;
    .locals 4

    .prologue
    .line 18845
    new-instance v1, Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/example/tutorial/VideoProto$P2PInfoNotify;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$P2PInfoNotify;)V

    .line 18846
    .local v1, "result":Lcom/example/tutorial/VideoProto$P2PInfoNotify;
    iget v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->bitField0_:I

    .line 18847
    .local v0, "from_bitField0_":I
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v2, :cond_1

    .line 18848
    iget v2, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 18849
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    iput-object v2, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    .line 18850
    iget v2, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->bitField0_:I

    and-int/lit8 v2, v2, -0x2

    iput v2, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->bitField0_:I

    .line 18852
    :cond_0
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$P2PInfoNotify;->access$10(Lcom/example/tutorial/VideoProto$P2PInfoNotify;Ljava/util/List;)V

    .line 18856
    :goto_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->onBuilt()V

    .line 18857
    return-object v1

    .line 18854
    :cond_1
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v2}, Lcom/google/protobuf/RepeatedFieldBuilder;->build()Ljava/util/List;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$P2PInfoNotify;->access$10(Lcom/example/tutorial/VideoProto$P2PInfoNotify;Ljava/util/List;)V

    goto :goto_0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    .locals 1

    .prologue
    .line 18813
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 18814
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 18815
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    .line 18816
    iget v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->bitField0_:I

    .line 18820
    :goto_0
    return-object p0

    .line 18818
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilder;->clear()V

    goto :goto_0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearPlayerInfo()Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    .locals 1

    .prologue
    .line 19077
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 19078
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    .line 19079
    iget v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->bitField0_:I

    .line 19080
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->onChanged()V

    .line 19084
    :goto_0
    return-object p0

    .line 19082
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilder;->clear()V

    goto :goto_0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    .locals 2

    .prologue
    .line 18824
    invoke-static {}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->create()Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$P2PInfoNotify;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$P2PInfoNotify;
    .locals 1

    .prologue
    .line 18833
    invoke-static {}, Lcom/example/tutorial/VideoProto$P2PInfoNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 18829
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_P2PInfoNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$71()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getPlayerInfo(I)Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 18961
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 18962
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 18964
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilder;->getMessage(I)Lcom/google/protobuf/GeneratedMessage;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    goto :goto_0
.end method

.method public getPlayerInfoBuilder(I)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 19104
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilder;->getBuilder(I)Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    return-object v0
.end method

.method public getPlayerInfoBuilderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 19147
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilder;->getBuilderList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPlayerInfoCount()I
    .locals 1

    .prologue
    .line 18951
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 18952
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 18954
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilder;->getCount()I

    move-result v0

    goto :goto_0
.end method

.method public getPlayerInfoList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 18941
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 18942
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 18944
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilder;->getMessageList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getPlayerInfoOrBuilder(I)Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 19111
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 19112
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;

    .line 19113
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilder;->getMessageOrBuilder(I)Lcom/google/protobuf/MessageOrBuilder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;

    goto :goto_0
.end method

.method public getPlayerInfoOrBuilderList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 19121
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-eqz v0, :cond_0

    .line 19122
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/RepeatedFieldBuilder;->getMessageOrBuilderList()Ljava/util/List;

    move-result-object v0

    .line 19124
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    .locals 3

    .prologue
    .line 18788
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_P2PInfoNotify_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$111()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 18790
    const-class v1, Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    const-class v2, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    .line 18789
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 18788
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 18902
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$P2PInfoNotify;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    .locals 2
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    .prologue
    const/4 v0, 0x0

    .line 18870
    invoke-static {}, Lcom/example/tutorial/VideoProto$P2PInfoNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    move-result-object v1

    if-ne p1, v1, :cond_0

    .line 18898
    :goto_0
    return-object p0

    .line 18871
    :cond_0
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v1, :cond_3

    .line 18872
    # getter for: Lcom/example/tutorial/VideoProto$P2PInfoNotify;->playerInfo_:Ljava/util/List;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$P2PInfoNotify;->access$11(Lcom/example/tutorial/VideoProto$P2PInfoNotify;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 18873
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 18874
    # getter for: Lcom/example/tutorial/VideoProto$P2PInfoNotify;->playerInfo_:Ljava/util/List;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$P2PInfoNotify;->access$11(Lcom/example/tutorial/VideoProto$P2PInfoNotify;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    .line 18875
    iget v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->bitField0_:I

    .line 18880
    :goto_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->onChanged()V

    .line 18897
    :cond_1
    :goto_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$P2PInfoNotify;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0

    .line 18877
    :cond_2
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->ensurePlayerInfoIsMutable()V

    .line 18878
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    # getter for: Lcom/example/tutorial/VideoProto$P2PInfoNotify;->playerInfo_:Ljava/util/List;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$P2PInfoNotify;->access$11(Lcom/example/tutorial/VideoProto$P2PInfoNotify;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 18883
    :cond_3
    # getter for: Lcom/example/tutorial/VideoProto$P2PInfoNotify;->playerInfo_:Ljava/util/List;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$P2PInfoNotify;->access$11(Lcom/example/tutorial/VideoProto$P2PInfoNotify;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 18884
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v1}, Lcom/google/protobuf/RepeatedFieldBuilder;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 18885
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v1}, Lcom/google/protobuf/RepeatedFieldBuilder;->dispose()V

    .line 18886
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    .line 18887
    # getter for: Lcom/example/tutorial/VideoProto$P2PInfoNotify;->playerInfo_:Ljava/util/List;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$P2PInfoNotify;->access$11(Lcom/example/tutorial/VideoProto$P2PInfoNotify;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    .line 18888
    iget v1, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->bitField0_:I

    and-int/lit8 v1, v1, -0x2

    iput v1, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->bitField0_:I

    .line 18890
    # getter for: Lcom/example/tutorial/VideoProto$P2PInfoNotify;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$P2PInfoNotify;->access$8()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 18891
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->getPlayerInfoFieldBuilder()Lcom/google/protobuf/RepeatedFieldBuilder;

    move-result-object v0

    .line 18889
    :cond_4
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    goto :goto_2

    .line 18893
    :cond_5
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    # getter for: Lcom/example/tutorial/VideoProto$P2PInfoNotify;->playerInfo_:Ljava/util/List;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$P2PInfoNotify;->access$11(Lcom/example/tutorial/VideoProto$P2PInfoNotify;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/RepeatedFieldBuilder;->addAllMessages(Ljava/lang/Iterable;)Lcom/google/protobuf/RepeatedFieldBuilder;

    goto :goto_2
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 18909
    const/4 v2, 0x0

    .line 18911
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$P2PInfoNotify;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$P2PInfoNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18916
    if-eqz v2, :cond_0

    .line 18917
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$P2PInfoNotify;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    .line 18920
    :cond_0
    return-object p0

    .line 18912
    :catch_0
    move-exception v1

    .line 18913
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    move-object v2, v0

    .line 18914
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18915
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 18916
    if-eqz v2, :cond_1

    .line 18917
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$P2PInfoNotify;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    .line 18919
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 18861
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    if-eqz v0, :cond_0

    .line 18862
    check-cast p1, Lcom/example/tutorial/VideoProto$P2PInfoNotify;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$P2PInfoNotify;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    move-result-object p0

    .line 18865
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    :goto_0
    return-object p0

    .line 18864
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public removePlayerInfo(I)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 19090
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 19091
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->ensurePlayerInfoIsMutable()V

    .line 19092
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 19093
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->onChanged()V

    .line 19097
    :goto_0
    return-object p0

    .line 19095
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/RepeatedFieldBuilder;->remove(I)V

    goto :goto_0
.end method

.method public setPlayerInfo(ILcom/example/tutorial/VideoProto$PlayerInfo$Builder;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    .locals 2
    .param p1, "index"    # I
    .param p2, "builderForValue"    # Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .prologue
    .line 18989
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_0

    .line 18990
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->ensurePlayerInfoIsMutable()V

    .line 18991
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-virtual {p2}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 18992
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->onChanged()V

    .line 18996
    :goto_0
    return-object p0

    .line 18994
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {p2}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->build()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/google/protobuf/RepeatedFieldBuilder;->setMessage(ILcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/RepeatedFieldBuilder;

    goto :goto_0
.end method

.method public setPlayerInfo(ILcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 18972
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    if-nez v0, :cond_1

    .line 18973
    if-nez p2, :cond_0

    .line 18974
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 18976
    :cond_0
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->ensurePlayerInfoIsMutable()V

    .line 18977
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfo_:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 18978
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->onChanged()V

    .line 18982
    :goto_0
    return-object p0

    .line 18980
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$P2PInfoNotify$Builder;->playerInfoBuilder_:Lcom/google/protobuf/RepeatedFieldBuilder;

    invoke-virtual {v0, p1, p2}, Lcom/google/protobuf/RepeatedFieldBuilder;->setMessage(ILcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/RepeatedFieldBuilder;

    goto :goto_0
.end method
