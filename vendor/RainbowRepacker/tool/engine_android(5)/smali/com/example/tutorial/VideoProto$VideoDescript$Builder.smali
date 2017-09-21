.class public final Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$VideoDescriptOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$VideoDescript;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$VideoDescript$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$VideoDescriptOrBuilder;"
    }
.end annotation


# instance fields
.field private bitField0_:I

.field private dstSeatId_:I

.field private dstUserId_:I

.field private frameType_:Lcom/example/tutorial/VideoProto$FrameType;

.field private frameVideoCount_:I

.field private frameVideoIndex_:I

.field private frameVideoType_:Lcom/example/tutorial/VideoProto$FrameVideoType;

.field private frameVideoValue_:I

.field private timeStamp_:J


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 9233
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 9396
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_P:Lcom/example/tutorial/VideoProto$FrameType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameType_:Lcom/example/tutorial/VideoProto$FrameType;

    .line 9448
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameVideoType;->FRAME_192:Lcom/example/tutorial/VideoProto$FrameVideoType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoType_:Lcom/example/tutorial/VideoProto$FrameVideoType;

    .line 9234
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->maybeForceBuilderInitialization()V

    .line 9235
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 9239
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 9396
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_P:Lcom/example/tutorial/VideoProto$FrameType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameType_:Lcom/example/tutorial/VideoProto$FrameType;

    .line 9448
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameVideoType;->FRAME_192:Lcom/example/tutorial/VideoProto$FrameVideoType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoType_:Lcom/example/tutorial/VideoProto$FrameVideoType;

    .line 9240
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->maybeForceBuilderInitialization()V

    .line 9241
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$VideoDescript$Builder;)V
    .locals 0

    .prologue
    .line 9237
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1

    .prologue
    .line 9246
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->create()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1

    .prologue
    .line 9247
    new-instance v0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 9222
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoDescript_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$26()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 0

    .prologue
    .line 9243
    # getter for: Lcom/example/tutorial/VideoProto$VideoDescript;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->access$8()Z

    .line 9245
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 2

    .prologue
    .line 9285
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    .line 9286
    .local v0, "result":Lcom/example/tutorial/VideoProto$VideoDescript;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$VideoDescript;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 9287
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 9289
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->build()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->build()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 5

    .prologue
    .line 9293
    new-instance v1, Lcom/example/tutorial/VideoProto$VideoDescript;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$VideoDescript;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$VideoDescript;)V

    .line 9294
    .local v1, "result":Lcom/example/tutorial/VideoProto$VideoDescript;
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9295
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 9296
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 9297
    or-int/lit8 v2, v2, 0x1

    .line 9299
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameType_:Lcom/example/tutorial/VideoProto$FrameType;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$VideoDescript;->access$10(Lcom/example/tutorial/VideoProto$VideoDescript;Lcom/example/tutorial/VideoProto$FrameType;)V

    .line 9300
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 9301
    or-int/lit8 v2, v2, 0x2

    .line 9303
    :cond_1
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoType_:Lcom/example/tutorial/VideoProto$FrameVideoType;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$VideoDescript;->access$11(Lcom/example/tutorial/VideoProto$VideoDescript;Lcom/example/tutorial/VideoProto$FrameVideoType;)V

    .line 9304
    and-int/lit8 v3, v0, 0x4

    const/4 v4, 0x4

    if-ne v3, v4, :cond_2

    .line 9305
    or-int/lit8 v2, v2, 0x4

    .line 9307
    :cond_2
    iget v3, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoValue_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$VideoDescript;->access$12(Lcom/example/tutorial/VideoProto$VideoDescript;I)V

    .line 9308
    and-int/lit8 v3, v0, 0x8

    const/16 v4, 0x8

    if-ne v3, v4, :cond_3

    .line 9309
    or-int/lit8 v2, v2, 0x8

    .line 9311
    :cond_3
    iget v3, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoCount_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$VideoDescript;->access$13(Lcom/example/tutorial/VideoProto$VideoDescript;I)V

    .line 9312
    and-int/lit8 v3, v0, 0x10

    const/16 v4, 0x10

    if-ne v3, v4, :cond_4

    .line 9313
    or-int/lit8 v2, v2, 0x10

    .line 9315
    :cond_4
    iget v3, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoIndex_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$VideoDescript;->access$14(Lcom/example/tutorial/VideoProto$VideoDescript;I)V

    .line 9316
    and-int/lit8 v3, v0, 0x20

    const/16 v4, 0x20

    if-ne v3, v4, :cond_5

    .line 9317
    or-int/lit8 v2, v2, 0x20

    .line 9319
    :cond_5
    iget-wide v3, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->timeStamp_:J

    invoke-static {v1, v3, v4}, Lcom/example/tutorial/VideoProto$VideoDescript;->access$15(Lcom/example/tutorial/VideoProto$VideoDescript;J)V

    .line 9320
    and-int/lit8 v3, v0, 0x40

    const/16 v4, 0x40

    if-ne v3, v4, :cond_6

    .line 9321
    or-int/lit8 v2, v2, 0x40

    .line 9323
    :cond_6
    iget v3, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->dstUserId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$VideoDescript;->access$16(Lcom/example/tutorial/VideoProto$VideoDescript;I)V

    .line 9324
    and-int/lit16 v3, v0, 0x80

    const/16 v4, 0x80

    if-ne v3, v4, :cond_7

    .line 9325
    or-int/lit16 v2, v2, 0x80

    .line 9327
    :cond_7
    iget v3, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->dstSeatId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$VideoDescript;->access$17(Lcom/example/tutorial/VideoProto$VideoDescript;I)V

    .line 9328
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$VideoDescript;->access$18(Lcom/example/tutorial/VideoProto$VideoDescript;I)V

    .line 9329
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onBuilt()V

    .line 9330
    return-object v1
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 9251
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 9252
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_P:Lcom/example/tutorial/VideoProto$FrameType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameType_:Lcom/example/tutorial/VideoProto$FrameType;

    .line 9253
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9254
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameVideoType;->FRAME_192:Lcom/example/tutorial/VideoProto$FrameVideoType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoType_:Lcom/example/tutorial/VideoProto$FrameVideoType;

    .line 9255
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9256
    iput v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoValue_:I

    .line 9257
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9258
    iput v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoCount_:I

    .line 9259
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9260
    iput v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoIndex_:I

    .line 9261
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9262
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->timeStamp_:J

    .line 9263
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x21

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9264
    iput v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->dstUserId_:I

    .line 9265
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x41

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9266
    iput v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->dstSeatId_:I

    .line 9267
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x81

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9268
    return-object p0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->clear()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->clear()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->clear()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearDstSeatId()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1

    .prologue
    .line 9787
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x81

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9788
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->dstSeatId_:I

    .line 9789
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onChanged()V

    .line 9790
    return-object p0
.end method

.method public clearDstUserId()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1

    .prologue
    .line 9738
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x41

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9739
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->dstUserId_:I

    .line 9740
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onChanged()V

    .line 9741
    return-object p0
.end method

.method public clearFrameType()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1

    .prologue
    .line 9441
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9442
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_P:Lcom/example/tutorial/VideoProto$FrameType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameType_:Lcom/example/tutorial/VideoProto$FrameType;

    .line 9443
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onChanged()V

    .line 9444
    return-object p0
.end method

.method public clearFrameVideoCount()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1

    .prologue
    .line 9591
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9592
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoCount_:I

    .line 9593
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onChanged()V

    .line 9594
    return-object p0
.end method

.method public clearFrameVideoIndex()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1

    .prologue
    .line 9640
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9641
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoIndex_:I

    .line 9642
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onChanged()V

    .line 9643
    return-object p0
.end method

.method public clearFrameVideoType()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1

    .prologue
    .line 9493
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9494
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameVideoType;->FRAME_192:Lcom/example/tutorial/VideoProto$FrameVideoType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoType_:Lcom/example/tutorial/VideoProto$FrameVideoType;

    .line 9495
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onChanged()V

    .line 9496
    return-object p0
.end method

.method public clearFrameVideoValue()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1

    .prologue
    .line 9542
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9543
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoValue_:I

    .line 9544
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onChanged()V

    .line 9545
    return-object p0
.end method

.method public clearTimeStamp()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 2

    .prologue
    .line 9689
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x21

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9690
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->timeStamp_:J

    .line 9691
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onChanged()V

    .line 9692
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 2

    .prologue
    .line 9272
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->create()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->clone()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->clone()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->clone()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1

    .prologue
    .line 9281
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 9277
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoDescript_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$26()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getDstSeatId()I
    .locals 1

    .prologue
    .line 9764
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->dstSeatId_:I

    return v0
.end method

.method public getDstUserId()I
    .locals 1

    .prologue
    .line 9715
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->dstUserId_:I

    return v0
.end method

.method public getFrameType()Lcom/example/tutorial/VideoProto$FrameType;
    .locals 1

    .prologue
    .line 9415
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameType_:Lcom/example/tutorial/VideoProto$FrameType;

    return-object v0
.end method

.method public getFrameVideoCount()I
    .locals 1

    .prologue
    .line 9568
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoCount_:I

    return v0
.end method

.method public getFrameVideoIndex()I
    .locals 1

    .prologue
    .line 9617
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoIndex_:I

    return v0
.end method

.method public getFrameVideoType()Lcom/example/tutorial/VideoProto$FrameVideoType;
    .locals 1

    .prologue
    .line 9467
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoType_:Lcom/example/tutorial/VideoProto$FrameVideoType;

    return-object v0
.end method

.method public getFrameVideoValue()I
    .locals 1

    .prologue
    .line 9519
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoValue_:I

    return v0
.end method

.method public getTimeStamp()J
    .locals 2

    .prologue
    .line 9666
    iget-wide v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->timeStamp_:J

    return-wide v0
.end method

.method public hasDstSeatId()Z
    .locals 2

    .prologue
    .line 9754
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit16 v0, v0, 0x80

    const/16 v1, 0x80

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasDstUserId()Z
    .locals 2

    .prologue
    .line 9705
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x40

    const/16 v1, 0x40

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasFrameType()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 9405
    iget v1, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasFrameVideoCount()Z
    .locals 2

    .prologue
    .line 9558
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

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

.method public hasFrameVideoIndex()Z
    .locals 2

    .prologue
    .line 9607
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasFrameVideoType()Z
    .locals 2

    .prologue
    .line 9457
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

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

.method public hasFrameVideoValue()Z
    .locals 2

    .prologue
    .line 9509
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

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

.method public hasTimeStamp()Z
    .locals 2

    .prologue
    .line 9656
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x20

    const/16 v1, 0x20

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
    .line 9227
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoDescript_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$96()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 9229
    const-class v1, Lcom/example/tutorial/VideoProto$VideoDescript;

    const-class v2, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    .line 9228
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 9227
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 9373
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 2
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$VideoDescript;

    .prologue
    .line 9343
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 9369
    :goto_0
    return-object p0

    .line 9344
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->hasFrameType()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 9345
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameType()Lcom/example/tutorial/VideoProto$FrameType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->setFrameType(Lcom/example/tutorial/VideoProto$FrameType;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    .line 9347
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->hasFrameVideoType()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 9348
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoType()Lcom/example/tutorial/VideoProto$FrameVideoType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->setFrameVideoType(Lcom/example/tutorial/VideoProto$FrameVideoType;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    .line 9350
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->hasFrameVideoValue()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 9351
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->setFrameVideoValue(I)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    .line 9353
    :cond_3
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->hasFrameVideoCount()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 9354
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoCount()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->setFrameVideoCount(I)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    .line 9356
    :cond_4
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->hasFrameVideoIndex()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 9357
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->getFrameVideoIndex()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->setFrameVideoIndex(I)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    .line 9359
    :cond_5
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->hasTimeStamp()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 9360
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->getTimeStamp()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->setTimeStamp(J)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    .line 9362
    :cond_6
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->hasDstUserId()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 9363
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDstUserId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->setDstUserId(I)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    .line 9365
    :cond_7
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->hasDstSeatId()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 9366
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDstSeatId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->setDstSeatId(I)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    .line 9368
    :cond_8
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 9380
    const/4 v2, 0x0

    .line 9382
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$VideoDescript;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$VideoDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescript;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9387
    if-eqz v2, :cond_0

    .line 9388
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    .line 9391
    :cond_0
    return-object p0

    .line 9383
    :catch_0
    move-exception v1

    .line 9384
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescript;

    move-object v2, v0

    .line 9385
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9386
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 9387
    if-eqz v2, :cond_1

    .line 9388
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    .line 9390
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 9334
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$VideoDescript;

    if-eqz v0, :cond_0

    .line 9335
    check-cast p1, Lcom/example/tutorial/VideoProto$VideoDescript;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object p0

    .line 9338
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    :goto_0
    return-object p0

    .line 9337
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setDstSeatId(I)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 9774
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x80

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9775
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->dstSeatId_:I

    .line 9776
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onChanged()V

    .line 9777
    return-object p0
.end method

.method public setDstUserId(I)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 9725
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x40

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9726
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->dstUserId_:I

    .line 9727
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onChanged()V

    .line 9728
    return-object p0
.end method

.method public setFrameType(Lcom/example/tutorial/VideoProto$FrameType;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$FrameType;

    .prologue
    .line 9425
    if-nez p1, :cond_0

    .line 9426
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 9428
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9429
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameType_:Lcom/example/tutorial/VideoProto$FrameType;

    .line 9430
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onChanged()V

    .line 9431
    return-object p0
.end method

.method public setFrameVideoCount(I)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 9578
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9579
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoCount_:I

    .line 9580
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onChanged()V

    .line 9581
    return-object p0
.end method

.method public setFrameVideoIndex(I)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 9627
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9628
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoIndex_:I

    .line 9629
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onChanged()V

    .line 9630
    return-object p0
.end method

.method public setFrameVideoType(Lcom/example/tutorial/VideoProto$FrameVideoType;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$FrameVideoType;

    .prologue
    .line 9477
    if-nez p1, :cond_0

    .line 9478
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 9480
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9481
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoType_:Lcom/example/tutorial/VideoProto$FrameVideoType;

    .line 9482
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onChanged()V

    .line 9483
    return-object p0
.end method

.method public setFrameVideoValue(I)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 9529
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9530
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->frameVideoValue_:I

    .line 9531
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onChanged()V

    .line 9532
    return-object p0
.end method

.method public setTimeStamp(J)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1
    .param p1, "value"    # J

    .prologue
    .line 9676
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->bitField0_:I

    .line 9677
    iput-wide p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->timeStamp_:J

    .line 9678
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->onChanged()V

    .line 9679
    return-object p0
.end method
