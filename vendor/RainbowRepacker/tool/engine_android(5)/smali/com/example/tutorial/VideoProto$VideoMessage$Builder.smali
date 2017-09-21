.class public final Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$VideoMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$VideoMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$VideoMessage$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$VideoMessageOrBuilder;"
    }
.end annotation


# instance fields
.field private bitField0_:I

.field private messageBody_:Lcom/google/protobuf/ByteString;

.field private messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/SingleFieldBuilder",
            "<",
            "Lcom/example/tutorial/VideoProto$MessageHead;",
            "Lcom/example/tutorial/VideoProto$MessageHead$Builder;",
            "Lcom/example/tutorial/VideoProto$MessageHeadOrBuilder;",
            ">;"
        }
    .end annotation
.end field

.field private messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 2234
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 2352
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->getDefaultInstance()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    .line 2469
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageBody_:Lcom/google/protobuf/ByteString;

    .line 2235
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->maybeForceBuilderInitialization()V

    .line 2236
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 2240
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 2352
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->getDefaultInstance()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    .line 2469
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageBody_:Lcom/google/protobuf/ByteString;

    .line 2241
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->maybeForceBuilderInitialization()V

    .line 2242
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$VideoMessage$Builder;)V
    .locals 0

    .prologue
    .line 2238
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 1

    .prologue
    .line 2248
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->create()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 1

    .prologue
    .line 2249
    new-instance v0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 2223
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoMessage_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$5()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private getMessageHeadFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/SingleFieldBuilder",
            "<",
            "Lcom/example/tutorial/VideoProto$MessageHead;",
            "Lcom/example/tutorial/VideoProto$MessageHead$Builder;",
            "Lcom/example/tutorial/VideoProto$MessageHeadOrBuilder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2457
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 2458
    new-instance v0, Lcom/google/protobuf/SingleFieldBuilder;

    .line 2460
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    .line 2461
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    move-result-object v2

    .line 2462
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->isClean()Z

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/SingleFieldBuilder;-><init>(Lcom/google/protobuf/GeneratedMessage;Lcom/google/protobuf/GeneratedMessage$BuilderParent;Z)V

    .line 2458
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    .line 2463
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    .line 2465
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 2244
    # getter for: Lcom/example/tutorial/VideoProto$VideoMessage;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoMessage;->access$8()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2245
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->getMessageHeadFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    .line 2247
    :cond_0
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 2

    .prologue
    .line 2279
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v0

    .line 2280
    .local v0, "result":Lcom/example/tutorial/VideoProto$VideoMessage;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$VideoMessage;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 2281
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 2283
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->build()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->build()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 5

    .prologue
    .line 2287
    new-instance v1, Lcom/example/tutorial/VideoProto$VideoMessage;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$VideoMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$VideoMessage;)V

    .line 2288
    .local v1, "result":Lcom/example/tutorial/VideoProto$VideoMessage;
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    .line 2289
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 2290
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 2291
    or-int/lit8 v2, v2, 0x1

    .line 2293
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v3, :cond_2

    .line 2294
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$VideoMessage;->access$10(Lcom/example/tutorial/VideoProto$VideoMessage;Lcom/example/tutorial/VideoProto$MessageHead;)V

    .line 2298
    :goto_0
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 2299
    or-int/lit8 v2, v2, 0x2

    .line 2301
    :cond_1
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageBody_:Lcom/google/protobuf/ByteString;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$VideoMessage;->access$11(Lcom/example/tutorial/VideoProto$VideoMessage;Lcom/google/protobuf/ByteString;)V

    .line 2302
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$VideoMessage;->access$12(Lcom/example/tutorial/VideoProto$VideoMessage;I)V

    .line 2303
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->onBuilt()V

    .line 2304
    return-object v1

    .line 2296
    :cond_2
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v3}, Lcom/google/protobuf/SingleFieldBuilder;->build()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v3

    check-cast v3, Lcom/example/tutorial/VideoProto$MessageHead;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$VideoMessage;->access$10(Lcom/example/tutorial/VideoProto$VideoMessage;Lcom/example/tutorial/VideoProto$MessageHead;)V

    goto :goto_0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 1

    .prologue
    .line 2253
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 2254
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 2255
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->getDefaultInstance()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    .line 2259
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    .line 2260
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageBody_:Lcom/google/protobuf/ByteString;

    .line 2261
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    .line 2262
    return-object p0

    .line 2257
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->clear()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->clear()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->clear()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearMessageBody()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 1

    .prologue
    .line 2498
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    .line 2499
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoMessage;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageBody()Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageBody_:Lcom/google/protobuf/ByteString;

    .line 2500
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->onChanged()V

    .line 2501
    return-object p0
.end method

.method public clearMessageHead()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 1

    .prologue
    .line 2424
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 2425
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->getDefaultInstance()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    .line 2426
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->onChanged()V

    .line 2430
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    .line 2431
    return-object p0

    .line 2428
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 2

    .prologue
    .line 2266
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->create()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoMessage;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->clone()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->clone()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->clone()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 1

    .prologue
    .line 2275
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoMessage;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 2271
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoMessage_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$5()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getMessageBody()Lcom/google/protobuf/ByteString;
    .locals 1

    .prologue
    .line 2480
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageBody_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getMessageHead()Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 1

    .prologue
    .line 2365
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 2366
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    .line 2368
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessage()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MessageHead;

    goto :goto_0
.end method

.method public getMessageHeadBuilder()Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1

    .prologue
    .line 2437
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    .line 2438
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->onChanged()V

    .line 2439
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->getMessageHeadFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getBuilder()Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    return-object v0
.end method

.method public getMessageHeadOrBuilder()Lcom/example/tutorial/VideoProto$MessageHeadOrBuilder;
    .locals 1

    .prologue
    .line 2445
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-eqz v0, :cond_0

    .line 2446
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessageOrBuilder()Lcom/google/protobuf/MessageOrBuilder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MessageHeadOrBuilder;

    .line 2448
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    goto :goto_0
.end method

.method public hasMessageBody()Z
    .locals 2

    .prologue
    .line 2474
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

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

.method public hasMessageHead()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 2359
    iget v1, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

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
    .line 2228
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoMessage_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$89()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 2230
    const-class v1, Lcom/example/tutorial/VideoProto$VideoMessage;

    const-class v2, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    .line 2229
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 2228
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 2329
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$VideoMessage;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$VideoMessage;

    .prologue
    .line 2317
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoMessage;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 2325
    :goto_0
    return-object p0

    .line 2318
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->hasMessageHead()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2319
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageHead()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->mergeMessageHead(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    .line 2321
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->hasMessageBody()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2322
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getMessageBody()Lcom/google/protobuf/ByteString;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->setMessageBody(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    .line 2324
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2336
    const/4 v2, 0x0

    .line 2338
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$VideoMessage;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$VideoMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoMessage;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2343
    if-eqz v2, :cond_0

    .line 2344
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoMessage;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    .line 2347
    :cond_0
    return-object p0

    .line 2339
    :catch_0
    move-exception v1

    .line 2340
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoMessage;

    move-object v2, v0

    .line 2341
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2342
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 2343
    if-eqz v2, :cond_1

    .line 2344
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoMessage;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    .line 2346
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 2308
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$VideoMessage;

    if-eqz v0, :cond_0

    .line 2309
    check-cast p1, Lcom/example/tutorial/VideoProto$VideoMessage;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoMessage;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object p0

    .line 2312
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    :goto_0
    return-object p0

    .line 2311
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public mergeMessageHead(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 2
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$MessageHead;

    .prologue
    .line 2405
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 2406
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 2407
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->getDefaultInstance()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 2409
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    invoke-static {v0}, Lcom/example/tutorial/VideoProto$MessageHead;->newBuilder(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    .line 2408
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    .line 2413
    :goto_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->onChanged()V

    .line 2417
    :goto_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    .line 2418
    return-object p0

    .line 2411
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    goto :goto_0

    .line 2415
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->mergeFrom(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_1
.end method

.method public setMessageBody(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .prologue
    .line 2486
    if-nez p1, :cond_0

    .line 2487
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 2489
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    .line 2490
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageBody_:Lcom/google/protobuf/ByteString;

    .line 2491
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->onChanged()V

    .line 2492
    return-object p0
.end method

.method public setMessageHead(Lcom/example/tutorial/VideoProto$MessageHead$Builder;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 2
    .param p1, "builderForValue"    # Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    .prologue
    .line 2392
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 2393
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->build()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    .line 2394
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->onChanged()V

    .line 2398
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    .line 2399
    return-object p0

    .line 2396
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->build()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public setMessageHead(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$MessageHead;

    .prologue
    .line 2375
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 2376
    if-nez p1, :cond_0

    .line 2377
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 2379
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    .line 2380
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->onChanged()V

    .line 2384
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->bitField0_:I

    .line 2385
    return-object p0

    .line 2382
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->messageHeadBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method
