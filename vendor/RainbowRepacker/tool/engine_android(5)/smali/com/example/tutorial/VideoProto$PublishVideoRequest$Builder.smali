.class public final Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$PublishVideoRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$PublishVideoRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$PublishVideoRequestOrBuilder;"
    }
.end annotation


# instance fields
.field private bitField0_:I

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
    .line 10154
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 10272
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 10425
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoData_:Lcom/google/protobuf/ByteString;

    .line 10155
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->maybeForceBuilderInitialization()V

    .line 10156
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 10160
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 10272
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 10425
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoData_:Lcom/google/protobuf/ByteString;

    .line 10161
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->maybeForceBuilderInitialization()V

    .line 10162
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;)V
    .locals 0

    .prologue
    .line 10158
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 1

    .prologue
    .line 10168
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->create()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 1

    .prologue
    .line 10169
    new-instance v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 10143
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PublishVideoRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$29()Lcom/google/protobuf/Descriptors$Descriptor;

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
    .line 10413
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 10414
    new-instance v0, Lcom/google/protobuf/SingleFieldBuilder;

    .line 10416
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 10417
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    move-result-object v2

    .line 10418
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->isClean()Z

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/SingleFieldBuilder;-><init>(Lcom/google/protobuf/GeneratedMessage;Lcom/google/protobuf/GeneratedMessage$BuilderParent;Z)V

    .line 10414
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    .line 10419
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 10421
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 10164
    # getter for: Lcom/example/tutorial/VideoProto$PublishVideoRequest;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->access$8()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 10165
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->getVideoDescriptFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    .line 10167
    :cond_0
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    .locals 2

    .prologue
    .line 10199
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    move-result-object v0

    .line 10200
    .local v0, "result":Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 10201
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 10203
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->build()Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->build()Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    .locals 5

    .prologue
    .line 10207
    new-instance v1, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$PublishVideoRequest;)V

    .line 10208
    .local v1, "result":Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    .line 10209
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 10210
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 10211
    or-int/lit8 v2, v2, 0x1

    .line 10213
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v3, :cond_2

    .line 10214
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->access$10(Lcom/example/tutorial/VideoProto$PublishVideoRequest;Lcom/example/tutorial/VideoProto$VideoDescript;)V

    .line 10218
    :goto_0
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 10219
    or-int/lit8 v2, v2, 0x2

    .line 10221
    :cond_1
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoData_:Lcom/google/protobuf/ByteString;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->access$11(Lcom/example/tutorial/VideoProto$PublishVideoRequest;Lcom/google/protobuf/ByteString;)V

    .line 10222
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->access$12(Lcom/example/tutorial/VideoProto$PublishVideoRequest;I)V

    .line 10223
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->onBuilt()V

    .line 10224
    return-object v1

    .line 10216
    :cond_2
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v3}, Lcom/google/protobuf/SingleFieldBuilder;->build()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v3

    check-cast v3, Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->access$10(Lcom/example/tutorial/VideoProto$PublishVideoRequest;Lcom/example/tutorial/VideoProto$VideoDescript;)V

    goto :goto_0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 1

    .prologue
    .line 10173
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 10174
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 10175
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 10179
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    .line 10180
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoData_:Lcom/google/protobuf/ByteString;

    .line 10181
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    .line 10182
    return-object p0

    .line 10177
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearVideoData()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 1

    .prologue
    .line 10470
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    .line 10471
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->getVideoData()Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoData_:Lcom/google/protobuf/ByteString;

    .line 10472
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->onChanged()V

    .line 10473
    return-object p0
.end method

.method public clearVideoDescript()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 1

    .prologue
    .line 10368
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 10369
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 10370
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->onChanged()V

    .line 10374
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    .line 10375
    return-object p0

    .line 10372
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 2

    .prologue
    .line 10186
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->create()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PublishVideoRequest;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    .locals 1

    .prologue
    .line 10195
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 10191
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PublishVideoRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$29()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getVideoData()Lcom/google/protobuf/ByteString;
    .locals 1

    .prologue
    .line 10444
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoData_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getVideoDescript()Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1

    .prologue
    .line 10293
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 10294
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 10296
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessage()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescript;

    goto :goto_0
.end method

.method public getVideoDescriptBuilder()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1

    .prologue
    .line 10385
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    .line 10386
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->onChanged()V

    .line 10387
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->getVideoDescriptFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getBuilder()Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    return-object v0
.end method

.method public getVideoDescriptOrBuilder()Lcom/example/tutorial/VideoProto$VideoDescriptOrBuilder;
    .locals 1

    .prologue
    .line 10397
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-eqz v0, :cond_0

    .line 10398
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessageOrBuilder()Lcom/google/protobuf/MessageOrBuilder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescriptOrBuilder;

    .line 10400
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    goto :goto_0
.end method

.method public hasVideoData()Z
    .locals 2

    .prologue
    .line 10434
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

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

.method public hasVideoDescript()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 10283
    iget v1, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

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
    .line 10148
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PublishVideoRequest_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$97()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 10150
    const-class v1, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    const-class v2, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    .line 10149
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 10148
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 10249
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$PublishVideoRequest;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    .prologue
    .line 10237
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 10245
    :goto_0
    return-object p0

    .line 10238
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->hasVideoDescript()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 10239
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->getVideoDescript()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->mergeVideoDescript(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    .line 10241
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->hasVideoData()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 10242
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->getVideoData()Lcom/google/protobuf/ByteString;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->setVideoData(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    .line 10244
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 10256
    const/4 v2, 0x0

    .line 10258
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10263
    if-eqz v2, :cond_0

    .line 10264
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PublishVideoRequest;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    .line 10267
    :cond_0
    return-object p0

    .line 10259
    :catch_0
    move-exception v1

    .line 10260
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    move-object v2, v0

    .line 10261
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10262
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 10263
    if-eqz v2, :cond_1

    .line 10264
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PublishVideoRequest;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    .line 10266
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 10228
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    if-eqz v0, :cond_0

    .line 10229
    check-cast p1, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PublishVideoRequest;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object p0

    .line 10232
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    :goto_0
    return-object p0

    .line 10231
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergeVideoDescript(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 2
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$VideoDescript;

    .prologue
    .line 10345
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 10346
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 10347
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 10349
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-static {v0}, Lcom/example/tutorial/VideoProto$VideoDescript;->newBuilder(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    .line 10348
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 10353
    :goto_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->onChanged()V

    .line 10357
    :goto_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    .line 10358
    return-object p0

    .line 10351
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    goto :goto_0

    .line 10355
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->mergeFrom(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_1
.end method

.method public setVideoData(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .prologue
    .line 10454
    if-nez p1, :cond_0

    .line 10455
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 10457
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    .line 10458
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoData_:Lcom/google/protobuf/ByteString;

    .line 10459
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->onChanged()V

    .line 10460
    return-object p0
.end method

.method public setVideoDescript(Lcom/example/tutorial/VideoProto$VideoDescript$Builder;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 2
    .param p1, "builderForValue"    # Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    .prologue
    .line 10328
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 10329
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->build()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 10330
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->onChanged()V

    .line 10334
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    .line 10335
    return-object p0

    .line 10332
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->build()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public setVideoDescript(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$VideoDescript;

    .prologue
    .line 10307
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 10308
    if-nez p1, :cond_0

    .line 10309
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 10311
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 10312
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->onChanged()V

    .line 10316
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->bitField0_:I

    .line 10317
    return-object p0

    .line 10314
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->videoDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method
