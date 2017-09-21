.class public final Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$PublishAudioRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$PublishAudioRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$PublishAudioRequestOrBuilder;"
    }
.end annotation


# instance fields
.field private audioData_:Lcom/google/protobuf/ByteString;

.field private audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/SingleFieldBuilder",
            "<",
            "Lcom/example/tutorial/VideoProto$AudioDescript;",
            "Lcom/example/tutorial/VideoProto$AudioDescript$Builder;",
            "Lcom/example/tutorial/VideoProto$AudioDescriptOrBuilder;",
            ">;"
        }
    .end annotation
.end field

.field private audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

.field private bitField0_:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 17259
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 17377
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 17530
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioData_:Lcom/google/protobuf/ByteString;

    .line 17260
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->maybeForceBuilderInitialization()V

    .line 17261
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 17265
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 17377
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 17530
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioData_:Lcom/google/protobuf/ByteString;

    .line 17266
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->maybeForceBuilderInitialization()V

    .line 17267
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;)V
    .locals 0

    .prologue
    .line 17263
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 1

    .prologue
    .line 17273
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->create()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 1

    .prologue
    .line 17274
    new-instance v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;-><init>()V

    return-object v0
.end method

.method private getAudioDescriptFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/SingleFieldBuilder",
            "<",
            "Lcom/example/tutorial/VideoProto$AudioDescript;",
            "Lcom/example/tutorial/VideoProto$AudioDescript$Builder;",
            "Lcom/example/tutorial/VideoProto$AudioDescriptOrBuilder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 17518
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 17519
    new-instance v0, Lcom/google/protobuf/SingleFieldBuilder;

    .line 17521
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 17522
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    move-result-object v2

    .line 17523
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->isClean()Z

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/SingleFieldBuilder;-><init>(Lcom/google/protobuf/GeneratedMessage;Lcom/google/protobuf/GeneratedMessage$BuilderParent;Z)V

    .line 17519
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    .line 17524
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 17526
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 17248
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PublishAudioRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$65()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 17269
    # getter for: Lcom/example/tutorial/VideoProto$PublishAudioRequest;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->access$8()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 17270
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->getAudioDescriptFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    .line 17272
    :cond_0
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    .locals 2

    .prologue
    .line 17304
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    move-result-object v0

    .line 17305
    .local v0, "result":Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 17306
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 17308
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->build()Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->build()Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    .locals 5

    .prologue
    .line 17312
    new-instance v1, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$PublishAudioRequest;)V

    .line 17313
    .local v1, "result":Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    .line 17314
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 17315
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 17316
    or-int/lit8 v2, v2, 0x1

    .line 17318
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v3, :cond_2

    .line 17319
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->access$10(Lcom/example/tutorial/VideoProto$PublishAudioRequest;Lcom/example/tutorial/VideoProto$AudioDescript;)V

    .line 17323
    :goto_0
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 17324
    or-int/lit8 v2, v2, 0x2

    .line 17326
    :cond_1
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioData_:Lcom/google/protobuf/ByteString;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->access$11(Lcom/example/tutorial/VideoProto$PublishAudioRequest;Lcom/google/protobuf/ByteString;)V

    .line 17327
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->access$12(Lcom/example/tutorial/VideoProto$PublishAudioRequest;I)V

    .line 17328
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->onBuilt()V

    .line 17329
    return-object v1

    .line 17321
    :cond_2
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v3}, Lcom/google/protobuf/SingleFieldBuilder;->build()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v3

    check-cast v3, Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->access$10(Lcom/example/tutorial/VideoProto$PublishAudioRequest;Lcom/example/tutorial/VideoProto$AudioDescript;)V

    goto :goto_0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 1

    .prologue
    .line 17278
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 17279
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 17280
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 17284
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    .line 17285
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioData_:Lcom/google/protobuf/ByteString;

    .line 17286
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    .line 17287
    return-object p0

    .line 17282
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearAudioData()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 1

    .prologue
    .line 17575
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    .line 17576
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->getAudioData()Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioData_:Lcom/google/protobuf/ByteString;

    .line 17577
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->onChanged()V

    .line 17578
    return-object p0
.end method

.method public clearAudioDescript()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 1

    .prologue
    .line 17473
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 17474
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 17475
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->onChanged()V

    .line 17479
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    .line 17480
    return-object p0

    .line 17477
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 2

    .prologue
    .line 17291
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->create()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PublishAudioRequest;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getAudioData()Lcom/google/protobuf/ByteString;
    .locals 1

    .prologue
    .line 17549
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioData_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getAudioDescript()Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1

    .prologue
    .line 17398
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 17399
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 17401
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessage()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescript;

    goto :goto_0
.end method

.method public getAudioDescriptBuilder()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 1

    .prologue
    .line 17490
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    .line 17491
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->onChanged()V

    .line 17492
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->getAudioDescriptFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getBuilder()Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    return-object v0
.end method

.method public getAudioDescriptOrBuilder()Lcom/example/tutorial/VideoProto$AudioDescriptOrBuilder;
    .locals 1

    .prologue
    .line 17502
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-eqz v0, :cond_0

    .line 17503
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessageOrBuilder()Lcom/google/protobuf/MessageOrBuilder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescriptOrBuilder;

    .line 17505
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    goto :goto_0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    .locals 1

    .prologue
    .line 17300
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 17296
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PublishAudioRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$65()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public hasAudioData()Z
    .locals 2

    .prologue
    .line 17539
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

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

.method public hasAudioDescript()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 17388
    iget v1, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

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
    .line 17253
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PublishAudioRequest_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$109()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 17255
    const-class v1, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    const-class v2, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    .line 17254
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 17253
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 17354
    const/4 v0, 0x1

    return v0
.end method

.method public mergeAudioDescript(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 2
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$AudioDescript;

    .prologue
    .line 17450
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 17451
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 17452
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 17454
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-static {v0}, Lcom/example/tutorial/VideoProto$AudioDescript;->newBuilder(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    .line 17453
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 17458
    :goto_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->onChanged()V

    .line 17462
    :goto_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    .line 17463
    return-object p0

    .line 17456
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    goto :goto_0

    .line 17460
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->mergeFrom(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_1
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$PublishAudioRequest;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    .prologue
    .line 17342
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 17350
    :goto_0
    return-object p0

    .line 17343
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->hasAudioDescript()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 17344
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->getAudioDescript()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->mergeAudioDescript(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    .line 17346
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->hasAudioData()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 17347
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->getAudioData()Lcom/google/protobuf/ByteString;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->setAudioData(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    .line 17349
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 17361
    const/4 v2, 0x0

    .line 17363
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17368
    if-eqz v2, :cond_0

    .line 17369
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PublishAudioRequest;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    .line 17372
    :cond_0
    return-object p0

    .line 17364
    :catch_0
    move-exception v1

    .line 17365
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    move-object v2, v0

    .line 17366
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17367
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 17368
    if-eqz v2, :cond_1

    .line 17369
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PublishAudioRequest;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    .line 17371
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 17333
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    if-eqz v0, :cond_0

    .line 17334
    check-cast p1, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PublishAudioRequest;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object p0

    .line 17337
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    :goto_0
    return-object p0

    .line 17336
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setAudioData(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .prologue
    .line 17559
    if-nez p1, :cond_0

    .line 17560
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 17562
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    .line 17563
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioData_:Lcom/google/protobuf/ByteString;

    .line 17564
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->onChanged()V

    .line 17565
    return-object p0
.end method

.method public setAudioDescript(Lcom/example/tutorial/VideoProto$AudioDescript$Builder;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 2
    .param p1, "builderForValue"    # Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    .prologue
    .line 17433
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 17434
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->build()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 17435
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->onChanged()V

    .line 17439
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    .line 17440
    return-object p0

    .line 17437
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->build()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public setAudioDescript(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$AudioDescript;

    .prologue
    .line 17412
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 17413
    if-nez p1, :cond_0

    .line 17414
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 17416
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 17417
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->onChanged()V

    .line 17421
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->bitField0_:I

    .line 17422
    return-object p0

    .line 17419
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method
