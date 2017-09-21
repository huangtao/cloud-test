.class public final Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$VideoNotifyOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$VideoNotify;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$VideoNotify$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$VideoNotifyOrBuilder;"
    }
.end annotation


# instance fields
.field private bitField0_:I

.field private seatId_:I

.field private sendUserId_:I

.field private videoData_:Lcom/google/protobuf/ByteString;

.field private videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/SingleFieldBuilder",
            "<",
            "Lcom/example/tutorial/VideoProto$VideoDescript;",
            "Lcom/example/tutorial/VideoProto$VideoDescript$Builder;",
            "Lcom/example/tutorial/VideoProto$VideoDescriptOrBuilder;",
            ">;"
        }
    .end annotation
.end field

.field private videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 10947
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 11181
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 11334
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoData_:Lcom/google/protobuf/ByteString;

    .line 10948
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->maybeForceBuilderInitialization()V

    .line 10949
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 10953
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 11181
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 11334
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoData_:Lcom/google/protobuf/ByteString;

    .line 10954
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->maybeForceBuilderInitialization()V

    .line 10955
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$VideoNotify$Builder;)V
    .locals 0

    .prologue
    .line 10951
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 1

    .prologue
    .line 10961
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->create()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 1

    .prologue
    .line 10962
    new-instance v0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 10936
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$32()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private getVideoDescriptFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/SingleFieldBuilder",
            "<",
            "Lcom/example/tutorial/VideoProto$VideoDescript;",
            "Lcom/example/tutorial/VideoProto$VideoDescript$Builder;",
            "Lcom/example/tutorial/VideoProto$VideoDescriptOrBuilder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 11322
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 11323
    new-instance v0, Lcom/google/protobuf/SingleFieldBuilder;

    .line 11325
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 11326
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    move-result-object v2

    .line 11327
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->isClean()Z

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/SingleFieldBuilder;-><init>(Lcom/google/protobuf/GeneratedMessage;Lcom/google/protobuf/GeneratedMessage$BuilderParent;Z)V

    .line 11323
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    .line 11328
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 11330
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 10957
    # getter for: Lcom/example/tutorial/VideoProto$VideoNotify;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoNotify;->access$8()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 10958
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->getVideoDescriptFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    .line 10960
    :cond_0
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$VideoNotify;
    .locals 2

    .prologue
    .line 10996
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$VideoNotify;

    move-result-object v0

    .line 10997
    .local v0, "result":Lcom/example/tutorial/VideoProto$VideoNotify;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$VideoNotify;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 10998
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 11000
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->build()Lcom/example/tutorial/VideoProto$VideoNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->build()Lcom/example/tutorial/VideoProto$VideoNotify;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$VideoNotify;
    .locals 5

    .prologue
    .line 11004
    new-instance v1, Lcom/example/tutorial/VideoProto$VideoNotify;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$VideoNotify;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$VideoNotify;)V

    .line 11005
    .local v1, "result":Lcom/example/tutorial/VideoProto$VideoNotify;
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    .line 11006
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 11007
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 11008
    or-int/lit8 v2, v2, 0x1

    .line 11010
    :cond_0
    iget v3, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->sendUserId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$VideoNotify;->access$10(Lcom/example/tutorial/VideoProto$VideoNotify;I)V

    .line 11011
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 11012
    or-int/lit8 v2, v2, 0x2

    .line 11014
    :cond_1
    iget v3, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->seatId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$VideoNotify;->access$11(Lcom/example/tutorial/VideoProto$VideoNotify;I)V

    .line 11015
    and-int/lit8 v3, v0, 0x4

    const/4 v4, 0x4

    if-ne v3, v4, :cond_2

    .line 11016
    or-int/lit8 v2, v2, 0x4

    .line 11018
    :cond_2
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v3, :cond_4

    .line 11019
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$VideoNotify;->access$12(Lcom/example/tutorial/VideoProto$VideoNotify;Lcom/example/tutorial/VideoProto$VideoDescript;)V

    .line 11023
    :goto_0
    and-int/lit8 v3, v0, 0x8

    const/16 v4, 0x8

    if-ne v3, v4, :cond_3

    .line 11024
    or-int/lit8 v2, v2, 0x8

    .line 11026
    :cond_3
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoData_:Lcom/google/protobuf/ByteString;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$VideoNotify;->access$13(Lcom/example/tutorial/VideoProto$VideoNotify;Lcom/google/protobuf/ByteString;)V

    .line 11027
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$VideoNotify;->access$14(Lcom/example/tutorial/VideoProto$VideoNotify;I)V

    .line 11028
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->onBuilt()V

    .line 11029
    return-object v1

    .line 11021
    :cond_4
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v3}, Lcom/google/protobuf/SingleFieldBuilder;->build()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v3

    check-cast v3, Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$VideoNotify;->access$12(Lcom/example/tutorial/VideoProto$VideoNotify;Lcom/example/tutorial/VideoProto$VideoDescript;)V

    goto :goto_0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$VideoNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$VideoNotify;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 10966
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 10967
    iput v1, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->sendUserId_:I

    .line 10968
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    .line 10969
    iput v1, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->seatId_:I

    .line 10970
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    .line 10971
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 10972
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 10976
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    .line 10977
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoData_:Lcom/google/protobuf/ByteString;

    .line 10978
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    .line 10979
    return-object p0

    .line 10974
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearSeatId()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 1

    .prologue
    .line 11174
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    .line 11175
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->seatId_:I

    .line 11176
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->onChanged()V

    .line 11177
    return-object p0
.end method

.method public clearSendUserId()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 1

    .prologue
    .line 11125
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    .line 11126
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->sendUserId_:I

    .line 11127
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->onChanged()V

    .line 11128
    return-object p0
.end method

.method public clearVideoData()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 1

    .prologue
    .line 11379
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    .line 11380
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoNotify;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$VideoNotify;->getVideoData()Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoData_:Lcom/google/protobuf/ByteString;

    .line 11381
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->onChanged()V

    .line 11382
    return-object p0
.end method

.method public clearVideoDescript()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 1

    .prologue
    .line 11277
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 11278
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 11279
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->onChanged()V

    .line 11283
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    .line 11284
    return-object p0

    .line 11281
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 2

    .prologue
    .line 10983
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->create()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$VideoNotify;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoNotify;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoNotify;
    .locals 1

    .prologue
    .line 10992
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoNotify;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 10988
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$32()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getSeatId()I
    .locals 1

    .prologue
    .line 11151
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->seatId_:I

    return v0
.end method

.method public getSendUserId()I
    .locals 1

    .prologue
    .line 11102
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->sendUserId_:I

    return v0
.end method

.method public getVideoData()Lcom/google/protobuf/ByteString;
    .locals 1

    .prologue
    .line 11353
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoData_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getVideoDescript()Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1

    .prologue
    .line 11202
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 11203
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 11205
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessage()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescript;

    goto :goto_0
.end method

.method public getVideoDescriptBuilder()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1

    .prologue
    .line 11294
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    .line 11295
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->onChanged()V

    .line 11296
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->getVideoDescriptFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getBuilder()Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    return-object v0
.end method

.method public getVideoDescriptOrBuilder()Lcom/example/tutorial/VideoProto$VideoDescriptOrBuilder;
    .locals 1

    .prologue
    .line 11306
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-eqz v0, :cond_0

    .line 11307
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessageOrBuilder()Lcom/google/protobuf/MessageOrBuilder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescriptOrBuilder;

    .line 11309
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    goto :goto_0
.end method

.method public hasSeatId()Z
    .locals 2

    .prologue
    .line 11141
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

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

.method public hasSendUserId()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 11092
    iget v1, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasVideoData()Z
    .locals 2

    .prologue
    .line 11343
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x8

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasVideoDescript()Z
    .locals 2

    .prologue
    .line 11192
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

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

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    .locals 3

    .prologue
    .line 10941
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoNotify_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$98()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 10943
    const-class v1, Lcom/example/tutorial/VideoProto$VideoNotify;

    const-class v2, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    .line 10942
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 10941
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 11060
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$VideoNotify;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$VideoNotify;

    .prologue
    .line 11042
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoNotify;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 11056
    :goto_0
    return-object p0

    .line 11043
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoNotify;->hasSendUserId()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 11044
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoNotify;->getSendUserId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->setSendUserId(I)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    .line 11046
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoNotify;->hasSeatId()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 11047
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoNotify;->getSeatId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->setSeatId(I)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    .line 11049
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoNotify;->hasVideoDescript()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 11050
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoNotify;->getVideoDescript()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->mergeVideoDescript(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    .line 11052
    :cond_3
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoNotify;->hasVideoData()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 11053
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoNotify;->getVideoData()Lcom/google/protobuf/ByteString;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->setVideoData(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    .line 11055
    :cond_4
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoNotify;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 11067
    const/4 v2, 0x0

    .line 11069
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$VideoNotify;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$VideoNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoNotify;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11074
    if-eqz v2, :cond_0

    .line 11075
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoNotify;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    .line 11078
    :cond_0
    return-object p0

    .line 11070
    :catch_0
    move-exception v1

    .line 11071
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoNotify;

    move-object v2, v0

    .line 11072
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11073
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 11074
    if-eqz v2, :cond_1

    .line 11075
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoNotify;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    .line 11077
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 11033
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$VideoNotify;

    if-eqz v0, :cond_0

    .line 11034
    check-cast p1, Lcom/example/tutorial/VideoProto$VideoNotify;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoNotify;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object p0

    .line 11037
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    :goto_0
    return-object p0

    .line 11036
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergeVideoDescript(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 2
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$VideoDescript;

    .prologue
    .line 11254
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 11255
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x4

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 11256
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 11258
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-static {v0}, Lcom/example/tutorial/VideoProto$VideoDescript;->newBuilder(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    .line 11257
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 11262
    :goto_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->onChanged()V

    .line 11266
    :goto_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    .line 11267
    return-object p0

    .line 11260
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    goto :goto_0

    .line 11264
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->mergeFrom(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_1
.end method

.method public setSeatId(I)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 11161
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    .line 11162
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->seatId_:I

    .line 11163
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->onChanged()V

    .line 11164
    return-object p0
.end method

.method public setSendUserId(I)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 11112
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    .line 11113
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->sendUserId_:I

    .line 11114
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->onChanged()V

    .line 11115
    return-object p0
.end method

.method public setVideoData(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .prologue
    .line 11363
    if-nez p1, :cond_0

    .line 11364
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 11366
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    .line 11367
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoData_:Lcom/google/protobuf/ByteString;

    .line 11368
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->onChanged()V

    .line 11369
    return-object p0
.end method

.method public setVideoDescript(Lcom/example/tutorial/VideoProto$VideoDescript$Builder;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 2
    .param p1, "builderForValue"    # Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    .prologue
    .line 11237
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 11238
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->build()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 11239
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->onChanged()V

    .line 11243
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    .line 11244
    return-object p0

    .line 11241
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->build()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public setVideoDescript(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$VideoDescript;

    .prologue
    .line 11216
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 11217
    if-nez p1, :cond_0

    .line 11218
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 11220
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 11221
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->onChanged()V

    .line 11225
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->bitField0_:I

    .line 11226
    return-object p0

    .line 11223
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method
