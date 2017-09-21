.class public final Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$AudioNotifyOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$AudioNotify;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$AudioNotify$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$AudioNotifyOrBuilder;"
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

.field private seatId_:I

.field private sendUserId_:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 18052
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 18286
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 18439
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioData_:Lcom/google/protobuf/ByteString;

    .line 18053
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->maybeForceBuilderInitialization()V

    .line 18054
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 18058
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 18286
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 18439
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioData_:Lcom/google/protobuf/ByteString;

    .line 18059
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->maybeForceBuilderInitialization()V

    .line 18060
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$AudioNotify$Builder;)V
    .locals 0

    .prologue
    .line 18056
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 1

    .prologue
    .line 18066
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->create()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 1

    .prologue
    .line 18067
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;-><init>()V

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
    .line 18427
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 18428
    new-instance v0, Lcom/google/protobuf/SingleFieldBuilder;

    .line 18430
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 18431
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->getParentForChildren()Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    move-result-object v2

    .line 18432
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->isClean()Z

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/protobuf/SingleFieldBuilder;-><init>(Lcom/google/protobuf/GeneratedMessage;Lcom/google/protobuf/GeneratedMessage$BuilderParent;Z)V

    .line 18428
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    .line 18433
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 18435
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 18041
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$68()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 1

    .prologue
    .line 18062
    # getter for: Lcom/example/tutorial/VideoProto$AudioNotify;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioNotify;->access$8()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 18063
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->getAudioDescriptFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    .line 18065
    :cond_0
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$AudioNotify;
    .locals 2

    .prologue
    .line 18101
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioNotify;

    move-result-object v0

    .line 18102
    .local v0, "result":Lcom/example/tutorial/VideoProto$AudioNotify;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$AudioNotify;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 18103
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 18105
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->build()Lcom/example/tutorial/VideoProto$AudioNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->build()Lcom/example/tutorial/VideoProto$AudioNotify;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$AudioNotify;
    .locals 5

    .prologue
    .line 18109
    new-instance v1, Lcom/example/tutorial/VideoProto$AudioNotify;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$AudioNotify;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$AudioNotify;)V

    .line 18110
    .local v1, "result":Lcom/example/tutorial/VideoProto$AudioNotify;
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    .line 18111
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 18112
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 18113
    or-int/lit8 v2, v2, 0x1

    .line 18115
    :cond_0
    iget v3, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->sendUserId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$AudioNotify;->access$10(Lcom/example/tutorial/VideoProto$AudioNotify;I)V

    .line 18116
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 18117
    or-int/lit8 v2, v2, 0x2

    .line 18119
    :cond_1
    iget v3, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->seatId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$AudioNotify;->access$11(Lcom/example/tutorial/VideoProto$AudioNotify;I)V

    .line 18120
    and-int/lit8 v3, v0, 0x4

    const/4 v4, 0x4

    if-ne v3, v4, :cond_2

    .line 18121
    or-int/lit8 v2, v2, 0x4

    .line 18123
    :cond_2
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v3, :cond_4

    .line 18124
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$AudioNotify;->access$12(Lcom/example/tutorial/VideoProto$AudioNotify;Lcom/example/tutorial/VideoProto$AudioDescript;)V

    .line 18128
    :goto_0
    and-int/lit8 v3, v0, 0x8

    const/16 v4, 0x8

    if-ne v3, v4, :cond_3

    .line 18129
    or-int/lit8 v2, v2, 0x8

    .line 18131
    :cond_3
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioData_:Lcom/google/protobuf/ByteString;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$AudioNotify;->access$13(Lcom/example/tutorial/VideoProto$AudioNotify;Lcom/google/protobuf/ByteString;)V

    .line 18132
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$AudioNotify;->access$14(Lcom/example/tutorial/VideoProto$AudioNotify;I)V

    .line 18133
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->onBuilt()V

    .line 18134
    return-object v1

    .line 18126
    :cond_4
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v3}, Lcom/google/protobuf/SingleFieldBuilder;->build()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v3

    check-cast v3, Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$AudioNotify;->access$12(Lcom/example/tutorial/VideoProto$AudioNotify;Lcom/example/tutorial/VideoProto$AudioDescript;)V

    goto :goto_0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioNotify;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 18071
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 18072
    iput v1, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->sendUserId_:I

    .line 18073
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    .line 18074
    iput v1, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->seatId_:I

    .line 18075
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    .line 18076
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 18077
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 18081
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    .line 18082
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioData_:Lcom/google/protobuf/ByteString;

    .line 18083
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    .line 18084
    return-object p0

    .line 18079
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearAudioData()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 1

    .prologue
    .line 18484
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    .line 18485
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioNotify;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$AudioNotify;->getAudioData()Lcom/google/protobuf/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioData_:Lcom/google/protobuf/ByteString;

    .line 18486
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->onChanged()V

    .line 18487
    return-object p0
.end method

.method public clearAudioDescript()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 1

    .prologue
    .line 18382
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 18383
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 18384
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->onChanged()V

    .line 18388
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    .line 18389
    return-object p0

    .line 18386
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->clear()Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public clearSeatId()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 1

    .prologue
    .line 18279
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    .line 18280
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->seatId_:I

    .line 18281
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->onChanged()V

    .line 18282
    return-object p0
.end method

.method public clearSendUserId()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 1

    .prologue
    .line 18230
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    .line 18231
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->sendUserId_:I

    .line 18232
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->onChanged()V

    .line 18233
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 2

    .prologue
    .line 18088
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->create()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioNotify;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioNotify;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getAudioData()Lcom/google/protobuf/ByteString;
    .locals 1

    .prologue
    .line 18458
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioData_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getAudioDescript()Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1

    .prologue
    .line 18307
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 18308
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 18310
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessage()Lcom/google/protobuf/GeneratedMessage;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescript;

    goto :goto_0
.end method

.method public getAudioDescriptBuilder()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 1

    .prologue
    .line 18399
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    .line 18400
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->onChanged()V

    .line 18401
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->getAudioDescriptFieldBuilder()Lcom/google/protobuf/SingleFieldBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getBuilder()Lcom/google/protobuf/GeneratedMessage$Builder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    return-object v0
.end method

.method public getAudioDescriptOrBuilder()Lcom/example/tutorial/VideoProto$AudioDescriptOrBuilder;
    .locals 1

    .prologue
    .line 18411
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-eqz v0, :cond_0

    .line 18412
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0}, Lcom/google/protobuf/SingleFieldBuilder;->getMessageOrBuilder()Lcom/google/protobuf/MessageOrBuilder;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescriptOrBuilder;

    .line 18414
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    goto :goto_0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioNotify;
    .locals 1

    .prologue
    .line 18097
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioNotify;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 18093
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$68()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getSeatId()I
    .locals 1

    .prologue
    .line 18256
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->seatId_:I

    return v0
.end method

.method public getSendUserId()I
    .locals 1

    .prologue
    .line 18207
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->sendUserId_:I

    return v0
.end method

.method public hasAudioData()Z
    .locals 2

    .prologue
    .line 18448
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

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

.method public hasAudioDescript()Z
    .locals 2

    .prologue
    .line 18297
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

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

.method public hasSeatId()Z
    .locals 2

    .prologue
    .line 18246
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

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

    .line 18197
    iget v1, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

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
    .line 18046
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioNotify_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$110()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 18048
    const-class v1, Lcom/example/tutorial/VideoProto$AudioNotify;

    const-class v2, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    .line 18047
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 18046
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 18165
    const/4 v0, 0x1

    return v0
.end method

.method public mergeAudioDescript(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 2
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$AudioDescript;

    .prologue
    .line 18359
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 18360
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x4

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 18361
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 18363
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-static {v0}, Lcom/example/tutorial/VideoProto$AudioDescript;->newBuilder(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    .line 18362
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 18367
    :goto_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->onChanged()V

    .line 18371
    :goto_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    .line 18372
    return-object p0

    .line 18365
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    goto :goto_0

    .line 18369
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->mergeFrom(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_1
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$AudioNotify;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$AudioNotify;

    .prologue
    .line 18147
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioNotify;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioNotify;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 18161
    :goto_0
    return-object p0

    .line 18148
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioNotify;->hasSendUserId()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 18149
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioNotify;->getSendUserId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->setSendUserId(I)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    .line 18151
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioNotify;->hasSeatId()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 18152
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioNotify;->getSeatId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->setSeatId(I)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    .line 18154
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioNotify;->hasAudioDescript()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 18155
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioNotify;->getAudioDescript()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->mergeAudioDescript(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    .line 18157
    :cond_3
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioNotify;->hasAudioData()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 18158
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioNotify;->getAudioData()Lcom/google/protobuf/ByteString;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->setAudioData(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    .line 18160
    :cond_4
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioNotify;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 18172
    const/4 v2, 0x0

    .line 18174
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$AudioNotify;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$AudioNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioNotify;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18179
    if-eqz v2, :cond_0

    .line 18180
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioNotify;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    .line 18183
    :cond_0
    return-object p0

    .line 18175
    :catch_0
    move-exception v1

    .line 18176
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioNotify;

    move-object v2, v0

    .line 18177
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18178
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 18179
    if-eqz v2, :cond_1

    .line 18180
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioNotify;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    .line 18182
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 18138
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$AudioNotify;

    if-eqz v0, :cond_0

    .line 18139
    check-cast p1, Lcom/example/tutorial/VideoProto$AudioNotify;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioNotify;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object p0

    .line 18142
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    :goto_0
    return-object p0

    .line 18141
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setAudioData(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .prologue
    .line 18468
    if-nez p1, :cond_0

    .line 18469
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 18471
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    .line 18472
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioData_:Lcom/google/protobuf/ByteString;

    .line 18473
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->onChanged()V

    .line 18474
    return-object p0
.end method

.method public setAudioDescript(Lcom/example/tutorial/VideoProto$AudioDescript$Builder;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 2
    .param p1, "builderForValue"    # Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    .prologue
    .line 18342
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_0

    .line 18343
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->build()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 18344
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->onChanged()V

    .line 18348
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    .line 18349
    return-object p0

    .line 18346
    :cond_0
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->build()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public setAudioDescript(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$AudioDescript;

    .prologue
    .line 18321
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    if-nez v0, :cond_1

    .line 18322
    if-nez p1, :cond_0

    .line 18323
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 18325
    :cond_0
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 18326
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->onChanged()V

    .line 18330
    :goto_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    .line 18331
    return-object p0

    .line 18328
    :cond_1
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->audioDescriptBuilder_:Lcom/google/protobuf/SingleFieldBuilder;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/SingleFieldBuilder;->setMessage(Lcom/google/protobuf/GeneratedMessage;)Lcom/google/protobuf/SingleFieldBuilder;

    goto :goto_0
.end method

.method public setSeatId(I)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 18266
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    .line 18267
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->seatId_:I

    .line 18268
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->onChanged()V

    .line 18269
    return-object p0
.end method

.method public setSendUserId(I)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 18217
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->bitField0_:I

    .line 18218
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->sendUserId_:I

    .line 18219
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->onChanged()V

    .line 18220
    return-object p0
.end method
