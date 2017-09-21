.class public final Lcom/example/tutorial/VideoProto$VideoNotify;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$VideoNotifyOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VideoNotify"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    }
.end annotation


# static fields
.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$VideoNotify;",
            ">;"
        }
    .end annotation
.end field

.field public static final SEAT_ID_FIELD_NUMBER:I = 0x2

.field public static final SEND_USER_ID_FIELD_NUMBER:I = 0x1

.field public static final VIDEO_DATA_FIELD_NUMBER:I = 0x4

.field public static final VIDEO_DESCRIPT_FIELD_NUMBER:I = 0x3

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$VideoNotify;

.field private static final serialVersionUID:J


# instance fields
.field private bitField0_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private seatId_:I

.field private sendUserId_:I

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;

.field private videoData_:Lcom/google/protobuf/ByteString;

.field private videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 10674
    new-instance v0, Lcom/example/tutorial/VideoProto$VideoNotify$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$VideoNotify$1;-><init>()V

    .line 10673
    sput-object v0, Lcom/example/tutorial/VideoProto$VideoNotify;->PARSER:Lcom/google/protobuf/Parser;

    .line 11389
    new-instance v0, Lcom/example/tutorial/VideoProto$VideoNotify;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$VideoNotify;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$VideoNotify;->defaultInstance:Lcom/example/tutorial/VideoProto$VideoNotify;

    .line 11390
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoNotify;->defaultInstance:Lcom/example/tutorial/VideoProto$VideoNotify;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$VideoNotify;->initFields()V

    .line 11391
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V
    .locals 8
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    const/4 v6, -0x1

    .line 10598
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 10801
    iput-byte v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->memoizedIsInitialized:B

    .line 10828
    iput v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->memoizedSerializedSize:I

    .line 10602
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$VideoNotify;->initFields()V

    .line 10603
    const/4 v2, 0x0

    .line 10605
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 10607
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 10608
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 10657
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 10658
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify;->makeExtensionsImmutable()V

    .line 10660
    return-void

    .line 10609
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 10610
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 10615
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$VideoNotify;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v6

    .line 10616
    if-nez v6, :cond_0

    .line 10617
    const/4 v0, 0x1

    .line 10619
    goto :goto_0

    .line 10612
    :sswitch_0
    const/4 v0, 0x1

    .line 10613
    goto :goto_0

    .line 10622
    :sswitch_1
    iget v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    or-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    .line 10623
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v6

    iput v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->sendUserId_:I
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 10651
    .end local v4    # "tag":I
    :catch_0
    move-exception v1

    .line 10652
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10656
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v6

    .line 10657
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 10658
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify;->makeExtensionsImmutable()V

    .line 10659
    throw v6

    .line 10627
    .restart local v4    # "tag":I
    :sswitch_2
    :try_start_2
    iget v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    or-int/lit8 v6, v6, 0x2

    iput v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    .line 10628
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v6

    iput v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->seatId_:I
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 10653
    .end local v4    # "tag":I
    :catch_1
    move-exception v1

    .line 10654
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v6, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 10655
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    .line 10654
    invoke-direct {v6, v7}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 10655
    invoke-virtual {v6, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    .line 10654
    throw v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 10632
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v4    # "tag":I
    :sswitch_3
    const/4 v3, 0x0

    .line 10633
    .local v3, "subBuilder":Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    :try_start_4
    iget v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    and-int/lit8 v6, v6, 0x4

    const/4 v7, 0x4

    if-ne v6, v7, :cond_2

    .line 10634
    iget-object v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoDescript;->toBuilder()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v3

    .line 10636
    :cond_2
    sget-object v6, Lcom/example/tutorial/VideoProto$VideoDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-virtual {p1, v6, p2}, Lcom/google/protobuf/CodedInputStream;->readMessage(Lcom/google/protobuf/Parser;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite;

    move-result-object v6

    check-cast v6, Lcom/example/tutorial/VideoProto$VideoDescript;

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 10637
    if-eqz v3, :cond_3

    .line 10638
    iget-object v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-virtual {v3, v6}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    .line 10639
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 10641
    :cond_3
    iget v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    or-int/lit8 v6, v6, 0x4

    iput v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    goto/16 :goto_0

    .line 10645
    .end local v3    # "subBuilder":Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    :sswitch_4
    iget v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    or-int/lit8 v6, v6, 0x8

    iput v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    .line 10646
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBytes()Lcom/google/protobuf/ByteString;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->videoData_:Lcom/google/protobuf/ByteString;
    :try_end_4
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 10610
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x10 -> :sswitch_2
        0x1a -> :sswitch_3
        0x22 -> :sswitch_4
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$VideoNotify;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 10598
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$VideoNotify;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/GeneratedMessage$Builder",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .local p1, "builder":Lcom/google/protobuf/GeneratedMessage$Builder;, "Lcom/google/protobuf/GeneratedMessage$Builder<*>;"
    const/4 v0, -0x1

    .line 10578
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 10801
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->memoizedIsInitialized:B

    .line 10828
    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->memoizedSerializedSize:I

    .line 10579
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 10580
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$VideoNotify;)V
    .locals 0

    .prologue
    .line 10577
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$VideoNotify;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 10581
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 10801
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->memoizedIsInitialized:B

    .line 10828
    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->memoizedSerializedSize:I

    .line 10581
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$VideoNotify;I)V
    .locals 0

    .prologue
    .line 10691
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->sendUserId_:I

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$VideoNotify;I)V
    .locals 0

    .prologue
    .line 10715
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->seatId_:I

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$VideoNotify;Lcom/example/tutorial/VideoProto$VideoDescript;)V
    .locals 0

    .prologue
    .line 10739
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    return-void
.end method

.method static synthetic access$13(Lcom/example/tutorial/VideoProto$VideoNotify;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .prologue
    .line 10773
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->videoData_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method static synthetic access$14(Lcom/example/tutorial/VideoProto$VideoNotify;I)V
    .locals 0

    .prologue
    .line 10688
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 10573
    sget-boolean v0, Lcom/example/tutorial/VideoProto$VideoNotify;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoNotify;
    .locals 1

    .prologue
    .line 10585
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoNotify;->defaultInstance:Lcom/example/tutorial/VideoProto$VideoNotify;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 10663
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$32()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 10796
    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->sendUserId_:I

    .line 10797
    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->seatId_:I

    .line 10798
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 10799
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->videoData_:Lcom/google/protobuf/ByteString;

    .line 10800
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 1

    .prologue
    .line 10915
    # invokes: Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->create()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->access$17()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$VideoNotify;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$VideoNotify;

    .prologue
    .line 10918
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoNotify;->newBuilder()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoNotify;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$VideoNotify;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 10895
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoNotify;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoNotify;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 10901
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoNotify;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$VideoNotify;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 10865
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoNotify;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoNotify;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 10871
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoNotify;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$VideoNotify;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 10906
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoNotify;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoNotify;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 10912
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoNotify;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$VideoNotify;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 10885
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoNotify;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoNotify;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 10891
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoNotify;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$VideoNotify;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 10875
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoNotify;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoNotify;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 10881
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoNotify;

    return-object v0
.end method


# virtual methods
.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoNotify;
    .locals 1

    .prologue
    .line 10589
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoNotify;->defaultInstance:Lcom/example/tutorial/VideoProto$VideoNotify;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoNotify;

    move-result-object v0

    return-object v0
.end method

.method public getParserForType()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$VideoNotify;",
            ">;"
        }
    .end annotation

    .prologue
    .line 10685
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoNotify;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSeatId()I
    .locals 1

    .prologue
    .line 10734
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->seatId_:I

    return v0
.end method

.method public getSendUserId()I
    .locals 1

    .prologue
    .line 10710
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->sendUserId_:I

    return v0
.end method

.method public getSerializedSize()I
    .locals 6

    .prologue
    const/4 v5, 0x4

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 10830
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->memoizedSerializedSize:I

    .line 10831
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 10852
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 10833
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 10834
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 10836
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->sendUserId_:I

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 10838
    :cond_1
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-ne v2, v4, :cond_2

    .line 10840
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->seatId_:I

    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 10842
    :cond_2
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    and-int/lit8 v2, v2, 0x4

    if-ne v2, v5, :cond_3

    .line 10844
    const/4 v2, 0x3

    iget-object v3, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeMessageSize(ILcom/google/protobuf/MessageLite;)I

    move-result v2

    add-int/2addr v0, v2

    .line 10846
    :cond_3
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    and-int/lit8 v2, v2, 0x8

    const/16 v3, 0x8

    if-ne v2, v3, :cond_4

    .line 10848
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->videoData_:Lcom/google/protobuf/ByteString;

    invoke-static {v5, v2}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v2

    add-int/2addr v0, v2

    .line 10850
    :cond_4
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 10851
    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->memoizedSerializedSize:I

    move v1, v0

    .line 10852
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 10596
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public getVideoData()Lcom/google/protobuf/ByteString;
    .locals 1

    .prologue
    .line 10792
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->videoData_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getVideoDescript()Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1

    .prologue
    .line 10758
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    return-object v0
.end method

.method public getVideoDescriptOrBuilder()Lcom/example/tutorial/VideoProto$VideoDescriptOrBuilder;
    .locals 1

    .prologue
    .line 10768
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    return-object v0
.end method

.method public hasSeatId()Z
    .locals 2

    .prologue
    .line 10724
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

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

    .line 10700
    iget v1, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

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
    .line 10782
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

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
    .line 10748
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

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
    .line 10668
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoNotify_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$98()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 10670
    const-class v1, Lcom/example/tutorial/VideoProto$VideoNotify;

    const-class v2, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    .line 10669
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 10668
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 10803
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->memoizedIsInitialized:B

    .line 10804
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 10807
    :goto_0
    return v1

    .line 10804
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 10806
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 1

    .prologue
    .line 10916
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoNotify;->newBuilder()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 10925
    new-instance v0, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$VideoNotify$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$VideoNotify$Builder;)V

    .line 10926
    .local v0, "builder":Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify;->newBuilderForType()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$VideoNotify;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify;->newBuilderForType()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;
    .locals 1

    .prologue
    .line 10920
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$VideoNotify;->newBuilder(Lcom/example/tutorial/VideoProto$VideoNotify;)Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify;->toBuilder()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify;->toBuilder()Lcom/example/tutorial/VideoProto$VideoNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected writeReplace()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .prologue
    .line 10859
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage;->writeReplace()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 4
    .param p1, "output"    # Lcom/google/protobuf/CodedOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x4

    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 10812
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify;->getSerializedSize()I

    .line 10813
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 10814
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->sendUserId_:I

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 10816
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_1

    .line 10817
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->seatId_:I

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 10819
    :cond_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    and-int/lit8 v0, v0, 0x4

    if-ne v0, v3, :cond_2

    .line 10820
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeMessage(ILcom/google/protobuf/MessageLite;)V

    .line 10822
    :cond_2
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->bitField0_:I

    and-int/lit8 v0, v0, 0x8

    const/16 v1, 0x8

    if-ne v0, v1, :cond_3

    .line 10823
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoNotify;->videoData_:Lcom/google/protobuf/ByteString;

    invoke-virtual {p1, v3, v0}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    .line 10825
    :cond_3
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoNotify;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 10826
    return-void
.end method
