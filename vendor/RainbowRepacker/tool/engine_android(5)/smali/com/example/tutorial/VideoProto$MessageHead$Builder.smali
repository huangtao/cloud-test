.class public final Lcom/example/tutorial/VideoProto$MessageHead$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$MessageHeadOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$MessageHead;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$MessageHead$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$MessageHeadOrBuilder;"
    }
.end annotation


# instance fields
.field private authKey_:Ljava/lang/Object;

.field private bitField0_:I

.field private clientVersion_:I

.field private messageBodyName_:Ljava/lang/Object;

.field private userId_:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 1481
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 1710
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->authKey_:Ljava/lang/Object;

    .line 1808
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->messageBodyName_:Ljava/lang/Object;

    .line 1482
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->maybeForceBuilderInitialization()V

    .line 1483
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 1487
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 1710
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->authKey_:Ljava/lang/Object;

    .line 1808
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->messageBodyName_:Ljava/lang/Object;

    .line 1488
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->maybeForceBuilderInitialization()V

    .line 1489
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$MessageHead$Builder;)V
    .locals 0

    .prologue
    .line 1485
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1

    .prologue
    .line 1494
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->create()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1

    .prologue
    .line 1495
    new-instance v0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 1470
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MessageHead_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$2()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 0

    .prologue
    .line 1491
    # getter for: Lcom/example/tutorial/VideoProto$MessageHead;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->access$8()Z

    .line 1493
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 2

    .prologue
    .line 1525
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    .line 1526
    .local v0, "result":Lcom/example/tutorial/VideoProto$MessageHead;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MessageHead;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1527
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 1529
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->build()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->build()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 5

    .prologue
    .line 1533
    new-instance v1, Lcom/example/tutorial/VideoProto$MessageHead;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$MessageHead;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$MessageHead;)V

    .line 1534
    .local v1, "result":Lcom/example/tutorial/VideoProto$MessageHead;
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1535
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 1536
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 1537
    or-int/lit8 v2, v2, 0x1

    .line 1539
    :cond_0
    iget v3, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->clientVersion_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$MessageHead;->access$10(Lcom/example/tutorial/VideoProto$MessageHead;I)V

    .line 1540
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 1541
    or-int/lit8 v2, v2, 0x2

    .line 1543
    :cond_1
    iget v3, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->userId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$MessageHead;->access$11(Lcom/example/tutorial/VideoProto$MessageHead;I)V

    .line 1544
    and-int/lit8 v3, v0, 0x4

    const/4 v4, 0x4

    if-ne v3, v4, :cond_2

    .line 1545
    or-int/lit8 v2, v2, 0x4

    .line 1547
    :cond_2
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->authKey_:Ljava/lang/Object;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$MessageHead;->access$12(Lcom/example/tutorial/VideoProto$MessageHead;Ljava/lang/Object;)V

    .line 1548
    and-int/lit8 v3, v0, 0x8

    const/16 v4, 0x8

    if-ne v3, v4, :cond_3

    .line 1549
    or-int/lit8 v2, v2, 0x8

    .line 1551
    :cond_3
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->messageBodyName_:Ljava/lang/Object;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$MessageHead;->access$13(Lcom/example/tutorial/VideoProto$MessageHead;Ljava/lang/Object;)V

    .line 1552
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$MessageHead;->access$14(Lcom/example/tutorial/VideoProto$MessageHead;I)V

    .line 1553
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->onBuilt()V

    .line 1554
    return-object v1
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1499
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 1500
    iput v1, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->clientVersion_:I

    .line 1501
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1502
    iput v1, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->userId_:I

    .line 1503
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1504
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->authKey_:Ljava/lang/Object;

    .line 1505
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1506
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->messageBodyName_:Ljava/lang/Object;

    .line 1507
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1508
    return-object p0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->clear()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->clear()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->clear()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearAuthKey()Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1

    .prologue
    .line 1784
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1785
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->getDefaultInstance()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MessageHead;->getAuthKey()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->authKey_:Ljava/lang/Object;

    .line 1786
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->onChanged()V

    .line 1787
    return-object p0
.end method

.method public clearClientVersion()Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1

    .prologue
    .line 1654
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1655
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->clientVersion_:I

    .line 1656
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->onChanged()V

    .line 1657
    return-object p0
.end method

.method public clearMessageBodyName()Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1

    .prologue
    .line 1882
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1883
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->getDefaultInstance()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MessageHead;->getMessageBodyName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->messageBodyName_:Ljava/lang/Object;

    .line 1884
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->onChanged()V

    .line 1885
    return-object p0
.end method

.method public clearUserId()Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1

    .prologue
    .line 1703
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1704
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->userId_:I

    .line 1705
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->onChanged()V

    .line 1706
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 2

    .prologue
    .line 1512
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->create()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->clone()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->clone()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->clone()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getAuthKey()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1729
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->authKey_:Ljava/lang/Object;

    .line 1730
    .local v0, "ref":Ljava/lang/Object;
    instance-of v2, v0, Ljava/lang/String;

    if-nez v2, :cond_0

    .line 1731
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 1732
    .end local v0    # "ref":Ljava/lang/Object;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v1

    .line 1733
    .local v1, "s":Ljava/lang/String;
    iput-object v1, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->authKey_:Ljava/lang/Object;

    .line 1736
    .end local v1    # "s":Ljava/lang/String;
    :goto_0
    return-object v1

    .restart local v0    # "ref":Ljava/lang/Object;
    :cond_0
    check-cast v0, Ljava/lang/String;

    .end local v0    # "ref":Ljava/lang/Object;
    move-object v1, v0

    goto :goto_0
.end method

.method public getAuthKeyBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 1748
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->authKey_:Ljava/lang/Object;

    .line 1749
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 1752
    check-cast v1, Ljava/lang/String;

    .line 1751
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 1753
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->authKey_:Ljava/lang/Object;

    .line 1756
    .end local v0    # "b":Lcom/google/protobuf/ByteString;
    :goto_0
    return-object v0

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    check-cast v1, Lcom/google/protobuf/ByteString;

    .end local v1    # "ref":Ljava/lang/Object;
    move-object v0, v1

    goto :goto_0
.end method

.method public getClientVersion()I
    .locals 1

    .prologue
    .line 1631
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->clientVersion_:I

    return v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 1

    .prologue
    .line 1521
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->getDefaultInstance()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 1517
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MessageHead_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$2()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getMessageBodyName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1827
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->messageBodyName_:Ljava/lang/Object;

    .line 1828
    .local v0, "ref":Ljava/lang/Object;
    instance-of v2, v0, Ljava/lang/String;

    if-nez v2, :cond_0

    .line 1829
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 1830
    .end local v0    # "ref":Ljava/lang/Object;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v1

    .line 1831
    .local v1, "s":Ljava/lang/String;
    iput-object v1, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->messageBodyName_:Ljava/lang/Object;

    .line 1834
    .end local v1    # "s":Ljava/lang/String;
    :goto_0
    return-object v1

    .restart local v0    # "ref":Ljava/lang/Object;
    :cond_0
    check-cast v0, Ljava/lang/String;

    .end local v0    # "ref":Ljava/lang/Object;
    move-object v1, v0

    goto :goto_0
.end method

.method public getMessageBodyNameBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 1846
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->messageBodyName_:Ljava/lang/Object;

    .line 1847
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 1850
    check-cast v1, Ljava/lang/String;

    .line 1849
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 1851
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->messageBodyName_:Ljava/lang/Object;

    .line 1854
    .end local v0    # "b":Lcom/google/protobuf/ByteString;
    :goto_0
    return-object v0

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    check-cast v1, Lcom/google/protobuf/ByteString;

    .end local v1    # "ref":Ljava/lang/Object;
    move-object v0, v1

    goto :goto_0
.end method

.method public getUserId()I
    .locals 1

    .prologue
    .line 1680
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->userId_:I

    return v0
.end method

.method public hasAuthKey()Z
    .locals 2

    .prologue
    .line 1719
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

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

.method public hasClientVersion()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 1621
    iget v1, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasMessageBodyName()Z
    .locals 2

    .prologue
    .line 1817
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

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

.method public hasUserId()Z
    .locals 2

    .prologue
    .line 1670
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

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

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    .locals 3

    .prologue
    .line 1475
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MessageHead_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$88()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 1477
    const-class v1, Lcom/example/tutorial/VideoProto$MessageHead;

    const-class v2, Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    .line 1476
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 1475
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 1589
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$MessageHead;

    .prologue
    .line 1567
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->getDefaultInstance()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 1585
    :goto_0
    return-object p0

    .line 1568
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MessageHead;->hasClientVersion()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1569
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MessageHead;->getClientVersion()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setClientVersion(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    .line 1571
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MessageHead;->hasUserId()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1572
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MessageHead;->getUserId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->setUserId(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    .line 1574
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MessageHead;->hasAuthKey()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1575
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1576
    # getter for: Lcom/example/tutorial/VideoProto$MessageHead;->authKey_:Ljava/lang/Object;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$MessageHead;->access$15(Lcom/example/tutorial/VideoProto$MessageHead;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->authKey_:Ljava/lang/Object;

    .line 1577
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->onChanged()V

    .line 1579
    :cond_3
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MessageHead;->hasMessageBodyName()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1580
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1581
    # getter for: Lcom/example/tutorial/VideoProto$MessageHead;->messageBodyName_:Ljava/lang/Object;
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$MessageHead;->access$16(Lcom/example/tutorial/VideoProto$MessageHead;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->messageBodyName_:Ljava/lang/Object;

    .line 1582
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->onChanged()V

    .line 1584
    :cond_4
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MessageHead;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1596
    const/4 v2, 0x0

    .line 1598
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$MessageHead;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$MessageHead;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$MessageHead;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1603
    if-eqz v2, :cond_0

    .line 1604
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    .line 1607
    :cond_0
    return-object p0

    .line 1599
    :catch_0
    move-exception v1

    .line 1600
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$MessageHead;

    move-object v2, v0

    .line 1601
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1602
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 1603
    if-eqz v2, :cond_1

    .line 1604
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    .line 1606
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 1558
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$MessageHead;

    if-eqz v0, :cond_0

    .line 1559
    check-cast p1, Lcom/example/tutorial/VideoProto$MessageHead;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object p0

    .line 1562
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    :goto_0
    return-object p0

    .line 1561
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$MessageHead$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setAuthKey(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 1768
    if-nez p1, :cond_0

    .line 1769
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 1771
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1772
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->authKey_:Ljava/lang/Object;

    .line 1773
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->onChanged()V

    .line 1774
    return-object p0
.end method

.method public setAuthKeyBytes(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .prologue
    .line 1798
    if-nez p1, :cond_0

    .line 1799
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 1801
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1802
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->authKey_:Ljava/lang/Object;

    .line 1803
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->onChanged()V

    .line 1804
    return-object p0
.end method

.method public setClientVersion(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 1641
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1642
    iput p1, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->clientVersion_:I

    .line 1643
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->onChanged()V

    .line 1644
    return-object p0
.end method

.method public setMessageBodyName(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 1866
    if-nez p1, :cond_0

    .line 1867
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 1869
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1870
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->messageBodyName_:Ljava/lang/Object;

    .line 1871
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->onChanged()V

    .line 1872
    return-object p0
.end method

.method public setMessageBodyNameBytes(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/ByteString;

    .prologue
    .line 1896
    if-nez p1, :cond_0

    .line 1897
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 1899
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1900
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->messageBodyName_:Ljava/lang/Object;

    .line 1901
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->onChanged()V

    .line 1902
    return-object p0
.end method

.method public setUserId(I)Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 1690
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->bitField0_:I

    .line 1691
    iput p1, p0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->userId_:I

    .line 1692
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->onChanged()V

    .line 1693
    return-object p0
.end method
