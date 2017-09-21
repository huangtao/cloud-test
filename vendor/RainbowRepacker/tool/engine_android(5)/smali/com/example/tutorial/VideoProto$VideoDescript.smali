.class public final Lcom/example/tutorial/VideoProto$VideoDescript;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$VideoDescriptOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VideoDescript"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    }
.end annotation


# static fields
.field public static final DST_SEAT_ID_FIELD_NUMBER:I = 0xb

.field public static final DST_USER_ID_FIELD_NUMBER:I = 0xa

.field public static final FRAME_TYPE_FIELD_NUMBER:I = 0x1

.field public static final FRAME_VIDEO_COUNT_FIELD_NUMBER:I = 0x4

.field public static final FRAME_VIDEO_INDEX_FIELD_NUMBER:I = 0x5

.field public static final FRAME_VIDEO_TYPE_FIELD_NUMBER:I = 0x2

.field public static final FRAME_VIDEO_VALUE_FIELD_NUMBER:I = 0x3

.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$VideoDescript;",
            ">;"
        }
    .end annotation
.end field

.field public static final TIME_STAMP_FIELD_NUMBER:I = 0x9

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$VideoDescript;

.field private static final serialVersionUID:J


# instance fields
.field private bitField0_:I

.field private dstSeatId_:I

.field private dstUserId_:I

.field private frameType_:Lcom/example/tutorial/VideoProto$FrameType;

.field private frameVideoCount_:I

.field private frameVideoIndex_:I

.field private frameVideoType_:Lcom/example/tutorial/VideoProto$FrameVideoType;

.field private frameVideoValue_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private timeStamp_:J

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 8842
    new-instance v0, Lcom/example/tutorial/VideoProto$VideoDescript$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$VideoDescript$1;-><init>()V

    .line 8841
    sput-object v0, Lcom/example/tutorial/VideoProto$VideoDescript;->PARSER:Lcom/google/protobuf/Parser;

    .line 9797
    new-instance v0, Lcom/example/tutorial/VideoProto$VideoDescript;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$VideoDescript;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$VideoDescript;->defaultInstance:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 9798
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoDescript;->defaultInstance:Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$VideoDescript;->initFields()V

    .line 9799
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V
    .locals 9
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    .line 8742
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 9059
    iput-byte v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->memoizedIsInitialized:B

    .line 9098
    iput v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->memoizedSerializedSize:I

    .line 8746
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$VideoDescript;->initFields()V

    .line 8747
    const/4 v2, 0x0

    .line 8749
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 8751
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 8752
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 8825
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 8826
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript;->makeExtensionsImmutable()V

    .line 8828
    return-void

    .line 8753
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 8754
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 8759
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$VideoDescript;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v7

    .line 8760
    if-nez v7, :cond_0

    .line 8761
    const/4 v0, 0x1

    .line 8763
    goto :goto_0

    .line 8756
    :sswitch_0
    const/4 v0, 0x1

    .line 8757
    goto :goto_0

    .line 8766
    :sswitch_1
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 8767
    .local v3, "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$FrameType;->valueOf(I)Lcom/example/tutorial/VideoProto$FrameType;

    move-result-object v6

    .line 8768
    .local v6, "value":Lcom/example/tutorial/VideoProto$FrameType;
    if-nez v6, :cond_2

    .line 8769
    const/4 v7, 0x1

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 8819
    .end local v3    # "rawValue":I
    .end local v4    # "tag":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$FrameType;
    :catch_0
    move-exception v1

    .line 8820
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    throw v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8824
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v7

    .line 8825
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v8

    iput-object v8, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 8826
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript;->makeExtensionsImmutable()V

    .line 8827
    throw v7

    .line 8771
    .restart local v3    # "rawValue":I
    .restart local v4    # "tag":I
    .restart local v6    # "value":Lcom/example/tutorial/VideoProto$FrameType;
    :cond_2
    :try_start_2
    iget v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    or-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    .line 8772
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameType_:Lcom/example/tutorial/VideoProto$FrameType;
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 8821
    .end local v3    # "rawValue":I
    .end local v4    # "tag":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$FrameType;
    :catch_1
    move-exception v1

    .line 8822
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v7, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 8823
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    .line 8822
    invoke-direct {v7, v8}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 8823
    invoke-virtual {v7, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    .line 8822
    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 8777
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v4    # "tag":I
    :sswitch_2
    :try_start_4
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 8778
    .restart local v3    # "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$FrameVideoType;->valueOf(I)Lcom/example/tutorial/VideoProto$FrameVideoType;

    move-result-object v6

    .line 8779
    .local v6, "value":Lcom/example/tutorial/VideoProto$FrameVideoType;
    if-nez v6, :cond_3

    .line 8780
    const/4 v7, 0x2

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;

    goto :goto_0

    .line 8782
    :cond_3
    iget v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    or-int/lit8 v7, v7, 0x2

    iput v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    .line 8783
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoType_:Lcom/example/tutorial/VideoProto$FrameVideoType;

    goto :goto_0

    .line 8788
    .end local v3    # "rawValue":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$FrameVideoType;
    :sswitch_3
    iget v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    or-int/lit8 v7, v7, 0x4

    iput v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    .line 8789
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoValue_:I

    goto :goto_0

    .line 8793
    :sswitch_4
    iget v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    or-int/lit8 v7, v7, 0x8

    iput v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    .line 8794
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoCount_:I

    goto/16 :goto_0

    .line 8798
    :sswitch_5
    iget v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    or-int/lit8 v7, v7, 0x10

    iput v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    .line 8799
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoIndex_:I

    goto/16 :goto_0

    .line 8803
    :sswitch_6
    iget v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    or-int/lit8 v7, v7, 0x20

    iput v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    .line 8804
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt64()J

    move-result-wide v7

    iput-wide v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->timeStamp_:J

    goto/16 :goto_0

    .line 8808
    :sswitch_7
    iget v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    or-int/lit8 v7, v7, 0x40

    iput v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    .line 8809
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->dstUserId_:I

    goto/16 :goto_0

    .line 8813
    :sswitch_8
    iget v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    or-int/lit16 v7, v7, 0x80

    iput v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    .line 8814
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->dstSeatId_:I
    :try_end_4
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 8754
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x10 -> :sswitch_2
        0x18 -> :sswitch_3
        0x20 -> :sswitch_4
        0x28 -> :sswitch_5
        0x48 -> :sswitch_6
        0x50 -> :sswitch_7
        0x58 -> :sswitch_8
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$VideoDescript;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 8742
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$VideoDescript;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 8722
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 9059
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->memoizedIsInitialized:B

    .line 9098
    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->memoizedSerializedSize:I

    .line 8723
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 8724
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$VideoDescript;)V
    .locals 0

    .prologue
    .line 8721
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$VideoDescript;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 8725
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 9059
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->memoizedIsInitialized:B

    .line 9098
    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->memoizedSerializedSize:I

    .line 8725
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$VideoDescript;Lcom/example/tutorial/VideoProto$FrameType;)V
    .locals 0

    .prologue
    .line 8859
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameType_:Lcom/example/tutorial/VideoProto$FrameType;

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$VideoDescript;Lcom/example/tutorial/VideoProto$FrameVideoType;)V
    .locals 0

    .prologue
    .line 8883
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoType_:Lcom/example/tutorial/VideoProto$FrameVideoType;

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$VideoDescript;I)V
    .locals 0

    .prologue
    .line 8907
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoValue_:I

    return-void
.end method

.method static synthetic access$13(Lcom/example/tutorial/VideoProto$VideoDescript;I)V
    .locals 0

    .prologue
    .line 8931
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoCount_:I

    return-void
.end method

.method static synthetic access$14(Lcom/example/tutorial/VideoProto$VideoDescript;I)V
    .locals 0

    .prologue
    .line 8955
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoIndex_:I

    return-void
.end method

.method static synthetic access$15(Lcom/example/tutorial/VideoProto$VideoDescript;J)V
    .locals 0

    .prologue
    .line 8979
    iput-wide p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->timeStamp_:J

    return-void
.end method

.method static synthetic access$16(Lcom/example/tutorial/VideoProto$VideoDescript;I)V
    .locals 0

    .prologue
    .line 9003
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->dstUserId_:I

    return-void
.end method

.method static synthetic access$17(Lcom/example/tutorial/VideoProto$VideoDescript;I)V
    .locals 0

    .prologue
    .line 9027
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->dstSeatId_:I

    return-void
.end method

.method static synthetic access$18(Lcom/example/tutorial/VideoProto$VideoDescript;I)V
    .locals 0

    .prologue
    .line 8856
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 8717
    sget-boolean v0, Lcom/example/tutorial/VideoProto$VideoDescript;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1

    .prologue
    .line 8729
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoDescript;->defaultInstance:Lcom/example/tutorial/VideoProto$VideoDescript;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 8831
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoDescript_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$26()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 9050
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_P:Lcom/example/tutorial/VideoProto$FrameType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameType_:Lcom/example/tutorial/VideoProto$FrameType;

    .line 9051
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameVideoType;->FRAME_192:Lcom/example/tutorial/VideoProto$FrameVideoType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoType_:Lcom/example/tutorial/VideoProto$FrameVideoType;

    .line 9052
    iput v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoValue_:I

    .line 9053
    iput v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoCount_:I

    .line 9054
    iput v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoIndex_:I

    .line 9055
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->timeStamp_:J

    .line 9056
    iput v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->dstUserId_:I

    .line 9057
    iput v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->dstSeatId_:I

    .line 9058
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1

    .prologue
    .line 9201
    # invokes: Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->create()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->access$17()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$VideoDescript;

    .prologue
    .line 9204
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->newBuilder()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 9181
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescript;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 9187
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescript;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 9151
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescript;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 9157
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescript;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 9192
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescript;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 9198
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescript;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 9171
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescript;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 9177
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescript;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 9161
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescript;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 9167
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoDescript;

    return-object v0
.end method


# virtual methods
.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1

    .prologue
    .line 8733
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoDescript;->defaultInstance:Lcom/example/tutorial/VideoProto$VideoDescript;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    return-object v0
.end method

.method public getDstSeatId()I
    .locals 1

    .prologue
    .line 9046
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->dstSeatId_:I

    return v0
.end method

.method public getDstUserId()I
    .locals 1

    .prologue
    .line 9022
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->dstUserId_:I

    return v0
.end method

.method public getFrameType()Lcom/example/tutorial/VideoProto$FrameType;
    .locals 1

    .prologue
    .line 8878
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameType_:Lcom/example/tutorial/VideoProto$FrameType;

    return-object v0
.end method

.method public getFrameVideoCount()I
    .locals 1

    .prologue
    .line 8950
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoCount_:I

    return v0
.end method

.method public getFrameVideoIndex()I
    .locals 1

    .prologue
    .line 8974
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoIndex_:I

    return v0
.end method

.method public getFrameVideoType()Lcom/example/tutorial/VideoProto$FrameVideoType;
    .locals 1

    .prologue
    .line 8902
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoType_:Lcom/example/tutorial/VideoProto$FrameVideoType;

    return-object v0
.end method

.method public getFrameVideoValue()I
    .locals 1

    .prologue
    .line 8926
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoValue_:I

    return v0
.end method

.method public getParserForType()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$VideoDescript;",
            ">;"
        }
    .end annotation

    .prologue
    .line 8853
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoDescript;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 6

    .prologue
    const/4 v5, 0x4

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 9100
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->memoizedSerializedSize:I

    .line 9101
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 9138
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 9103
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 9104
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 9106
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameType_:Lcom/example/tutorial/VideoProto$FrameType;

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$FrameType;->getNumber()I

    move-result v2

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 9108
    :cond_1
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-ne v2, v4, :cond_2

    .line 9110
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoType_:Lcom/example/tutorial/VideoProto$FrameVideoType;

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$FrameVideoType;->getNumber()I

    move-result v2

    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 9112
    :cond_2
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    and-int/lit8 v2, v2, 0x4

    if-ne v2, v5, :cond_3

    .line 9114
    const/4 v2, 0x3

    iget v3, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoValue_:I

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 9116
    :cond_3
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    and-int/lit8 v2, v2, 0x8

    const/16 v3, 0x8

    if-ne v2, v3, :cond_4

    .line 9118
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoCount_:I

    invoke-static {v5, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 9120
    :cond_4
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    and-int/lit8 v2, v2, 0x10

    const/16 v3, 0x10

    if-ne v2, v3, :cond_5

    .line 9122
    const/4 v2, 0x5

    iget v3, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoIndex_:I

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 9124
    :cond_5
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    and-int/lit8 v2, v2, 0x20

    const/16 v3, 0x20

    if-ne v2, v3, :cond_6

    .line 9126
    const/16 v2, 0x9

    iget-wide v3, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->timeStamp_:J

    invoke-static {v2, v3, v4}, Lcom/google/protobuf/CodedOutputStream;->computeInt64Size(IJ)I

    move-result v2

    add-int/2addr v0, v2

    .line 9128
    :cond_6
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    and-int/lit8 v2, v2, 0x40

    const/16 v3, 0x40

    if-ne v2, v3, :cond_7

    .line 9130
    const/16 v2, 0xa

    iget v3, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->dstUserId_:I

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 9132
    :cond_7
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    and-int/lit16 v2, v2, 0x80

    const/16 v3, 0x80

    if-ne v2, v3, :cond_8

    .line 9134
    const/16 v2, 0xb

    iget v3, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->dstSeatId_:I

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 9136
    :cond_8
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 9137
    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->memoizedSerializedSize:I

    move v1, v0

    .line 9138
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto/16 :goto_0
.end method

.method public getTimeStamp()J
    .locals 2

    .prologue
    .line 8998
    iget-wide v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->timeStamp_:J

    return-wide v0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 8740
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasDstSeatId()Z
    .locals 2

    .prologue
    .line 9036
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

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
    .line 9012
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

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

    .line 8868
    iget v1, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

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
    .line 8940
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

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
    .line 8964
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

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
    .line 8892
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

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
    .line 8916
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

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
    .line 8988
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

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
    .line 8836
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoDescript_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$96()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 8838
    const-class v1, Lcom/example/tutorial/VideoProto$VideoDescript;

    const-class v2, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    .line 8837
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 8836
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 9061
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->memoizedIsInitialized:B

    .line 9062
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 9065
    :goto_0
    return v1

    .line 9062
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 9064
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1

    .prologue
    .line 9202
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->newBuilder()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 9211
    new-instance v0, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$VideoDescript$Builder;)V

    .line 9212
    .local v0, "builder":Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript;->newBuilderForType()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$VideoDescript;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript;->newBuilderForType()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .locals 1

    .prologue
    .line 9206
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$VideoDescript;->newBuilder(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript;->toBuilder()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript;->toBuilder()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

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
    .line 9145
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

    .line 9070
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript;->getSerializedSize()I

    .line 9071
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 9072
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameType_:Lcom/example/tutorial/VideoProto$FrameType;

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$FrameType;->getNumber()I

    move-result v0

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 9074
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_1

    .line 9075
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoType_:Lcom/example/tutorial/VideoProto$FrameVideoType;

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$FrameVideoType;->getNumber()I

    move-result v0

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 9077
    :cond_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    and-int/lit8 v0, v0, 0x4

    if-ne v0, v3, :cond_2

    .line 9078
    const/4 v0, 0x3

    iget v1, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoValue_:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 9080
    :cond_2
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    and-int/lit8 v0, v0, 0x8

    const/16 v1, 0x8

    if-ne v0, v1, :cond_3

    .line 9081
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoCount_:I

    invoke-virtual {p1, v3, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 9083
    :cond_3
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    and-int/lit8 v0, v0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_4

    .line 9084
    const/4 v0, 0x5

    iget v1, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->frameVideoIndex_:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 9086
    :cond_4
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    and-int/lit8 v0, v0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_5

    .line 9087
    const/16 v0, 0x9

    iget-wide v1, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->timeStamp_:J

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->writeInt64(IJ)V

    .line 9089
    :cond_5
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    and-int/lit8 v0, v0, 0x40

    const/16 v1, 0x40

    if-ne v0, v1, :cond_6

    .line 9090
    const/16 v0, 0xa

    iget v1, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->dstUserId_:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 9092
    :cond_6
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->bitField0_:I

    and-int/lit16 v0, v0, 0x80

    const/16 v1, 0x80

    if-ne v0, v1, :cond_7

    .line 9093
    const/16 v0, 0xb

    iget v1, p0, Lcom/example/tutorial/VideoProto$VideoDescript;->dstSeatId_:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 9095
    :cond_7
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoDescript;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 9096
    return-void
.end method
