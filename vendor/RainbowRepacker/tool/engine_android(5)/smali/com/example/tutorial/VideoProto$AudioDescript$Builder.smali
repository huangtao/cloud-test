.class public final Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$AudioDescriptOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$AudioDescript;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$AudioDescript$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$AudioDescriptOrBuilder;"
    }
.end annotation


# instance fields
.field private bitField0_:I

.field private dstSeatId_:I

.field private dstUserId_:I

.field private timeStamp_:J


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 16634
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 16635
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->maybeForceBuilderInitialization()V

    .line 16636
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 0
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 16640
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 16641
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->maybeForceBuilderInitialization()V

    .line 16642
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$AudioDescript$Builder;)V
    .locals 0

    .prologue
    .line 16638
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 1

    .prologue
    .line 16647
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->create()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 1

    .prologue
    .line 16648
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 16623
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioDescript_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$62()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 0

    .prologue
    .line 16644
    # getter for: Lcom/example/tutorial/VideoProto$AudioDescript;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->access$8()Z

    .line 16646
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 2

    .prologue
    .line 16676
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    .line 16677
    .local v0, "result":Lcom/example/tutorial/VideoProto$AudioDescript;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$AudioDescript;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 16678
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 16680
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->build()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->build()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 5

    .prologue
    .line 16684
    new-instance v1, Lcom/example/tutorial/VideoProto$AudioDescript;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$AudioDescript;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$AudioDescript;)V

    .line 16685
    .local v1, "result":Lcom/example/tutorial/VideoProto$AudioDescript;
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    .line 16686
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 16687
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 16688
    or-int/lit8 v2, v2, 0x1

    .line 16690
    :cond_0
    iget-wide v3, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->timeStamp_:J

    invoke-static {v1, v3, v4}, Lcom/example/tutorial/VideoProto$AudioDescript;->access$10(Lcom/example/tutorial/VideoProto$AudioDescript;J)V

    .line 16691
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 16692
    or-int/lit8 v2, v2, 0x2

    .line 16694
    :cond_1
    iget v3, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->dstUserId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$AudioDescript;->access$11(Lcom/example/tutorial/VideoProto$AudioDescript;I)V

    .line 16695
    and-int/lit8 v3, v0, 0x4

    const/4 v4, 0x4

    if-ne v3, v4, :cond_2

    .line 16696
    or-int/lit8 v2, v2, 0x4

    .line 16698
    :cond_2
    iget v3, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->dstSeatId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$AudioDescript;->access$12(Lcom/example/tutorial/VideoProto$AudioDescript;I)V

    .line 16699
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$AudioDescript;->access$13(Lcom/example/tutorial/VideoProto$AudioDescript;I)V

    .line 16700
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->onBuilt()V

    .line 16701
    return-object v1
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 16652
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 16653
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->timeStamp_:J

    .line 16654
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    .line 16655
    iput v2, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->dstUserId_:I

    .line 16656
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    .line 16657
    iput v2, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->dstSeatId_:I

    .line 16658
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    .line 16659
    return-object p0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearDstSeatId()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 1

    .prologue
    .line 16892
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    .line 16893
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->dstSeatId_:I

    .line 16894
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->onChanged()V

    .line 16895
    return-object p0
.end method

.method public clearDstUserId()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 1

    .prologue
    .line 16843
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    .line 16844
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->dstUserId_:I

    .line 16845
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->onChanged()V

    .line 16846
    return-object p0
.end method

.method public clearTimeStamp()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 2

    .prologue
    .line 16794
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    .line 16795
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->timeStamp_:J

    .line 16796
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->onChanged()V

    .line 16797
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 2

    .prologue
    .line 16663
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->create()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1

    .prologue
    .line 16672
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 16668
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioDescript_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$62()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getDstSeatId()I
    .locals 1

    .prologue
    .line 16869
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->dstSeatId_:I

    return v0
.end method

.method public getDstUserId()I
    .locals 1

    .prologue
    .line 16820
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->dstUserId_:I

    return v0
.end method

.method public getTimeStamp()J
    .locals 2

    .prologue
    .line 16771
    iget-wide v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->timeStamp_:J

    return-wide v0
.end method

.method public hasDstSeatId()Z
    .locals 2

    .prologue
    .line 16859
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

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

.method public hasDstUserId()Z
    .locals 2

    .prologue
    .line 16810
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

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

.method public hasTimeStamp()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 16761
    iget v1, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

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
    .line 16628
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioDescript_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$108()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 16630
    const-class v1, Lcom/example/tutorial/VideoProto$AudioDescript;

    const-class v2, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    .line 16629
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 16628
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 16729
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 2
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$AudioDescript;

    .prologue
    .line 16714
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 16725
    :goto_0
    return-object p0

    .line 16715
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioDescript;->hasTimeStamp()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 16716
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioDescript;->getTimeStamp()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->setTimeStamp(J)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    .line 16718
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioDescript;->hasDstUserId()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 16719
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDstUserId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->setDstUserId(I)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    .line 16721
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioDescript;->hasDstSeatId()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 16722
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDstSeatId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->setDstSeatId(I)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    .line 16724
    :cond_3
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioDescript;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 16736
    const/4 v2, 0x0

    .line 16738
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$AudioDescript;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$AudioDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescript;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16743
    if-eqz v2, :cond_0

    .line 16744
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    .line 16747
    :cond_0
    return-object p0

    .line 16739
    :catch_0
    move-exception v1

    .line 16740
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescript;

    move-object v2, v0

    .line 16741
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16742
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 16743
    if-eqz v2, :cond_1

    .line 16744
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    .line 16746
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 16705
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$AudioDescript;

    if-eqz v0, :cond_0

    .line 16706
    check-cast p1, Lcom/example/tutorial/VideoProto$AudioDescript;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object p0

    .line 16709
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    :goto_0
    return-object p0

    .line 16708
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setDstSeatId(I)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 16879
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    .line 16880
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->dstSeatId_:I

    .line 16881
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->onChanged()V

    .line 16882
    return-object p0
.end method

.method public setDstUserId(I)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 16830
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    .line 16831
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->dstUserId_:I

    .line 16832
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->onChanged()V

    .line 16833
    return-object p0
.end method

.method public setTimeStamp(J)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 1
    .param p1, "value"    # J

    .prologue
    .line 16781
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->bitField0_:I

    .line 16782
    iput-wide p1, p0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->timeStamp_:J

    .line 16783
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->onChanged()V

    .line 16784
    return-object p0
.end method
