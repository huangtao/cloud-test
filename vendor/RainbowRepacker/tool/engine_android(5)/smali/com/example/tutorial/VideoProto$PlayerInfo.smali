.class public final Lcom/example/tutorial/VideoProto$PlayerInfo;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PlayerInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    }
.end annotation


# static fields
.field public static final AUDIO_CONTROL_FIELD_NUMBER:I = 0x9

.field public static final AUDIO_IP_FIELD_NUMBER:I = 0x4

.field public static final AUDIO_PORT_FIELD_NUMBER:I = 0x5

.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final SEAT_ID_FIELD_NUMBER:I = 0x3

.field public static final USER_ID_FIELD_NUMBER:I = 0x1

.field public static final USER_NAME_FIELD_NUMBER:I = 0x2

.field public static final VIDEO_IP_FIELD_NUMBER:I = 0x6

.field public static final VIDEO_PORT_FIELD_NUMBER:I = 0x7

.field public static final WEBRTC_ROOMID_FIELD_NUMBER:I = 0x8

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$PlayerInfo;

.field private static final serialVersionUID:J


# instance fields
.field private audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

.field private audioIp_:Ljava/lang/Object;

.field private audioPort_:I

.field private bitField0_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private seatId_:I

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;

.field private userId_:I

.field private userName_:Ljava/lang/Object;

.field private videoIp_:Ljava/lang/Object;

.field private videoPort_:I

.field private webrtcRoomid_:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 4799
    new-instance v0, Lcom/example/tutorial/VideoProto$PlayerInfo$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo$1;-><init>()V

    .line 4798
    sput-object v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    .line 6001
    new-instance v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$PlayerInfo;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->defaultInstance:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 6002
    sget-object v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->defaultInstance:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->initFields()V

    .line 6003
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

    .line 4700
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 5109
    iput-byte v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->memoizedIsInitialized:B

    .line 5151
    iput v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->memoizedSerializedSize:I

    .line 4704
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->initFields()V

    .line 4705
    const/4 v2, 0x0

    .line 4707
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 4709
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 4710
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 4782
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 4783
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->makeExtensionsImmutable()V

    .line 4785
    return-void

    .line 4711
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 4712
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 4717
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$PlayerInfo;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v7

    .line 4718
    if-nez v7, :cond_0

    .line 4719
    const/4 v0, 0x1

    .line 4721
    goto :goto_0

    .line 4714
    :sswitch_0
    const/4 v0, 0x1

    .line 4715
    goto :goto_0

    .line 4724
    :sswitch_1
    iget v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    or-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    .line 4725
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->userId_:I
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 4776
    .end local v4    # "tag":I
    :catch_0
    move-exception v1

    .line 4777
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    throw v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 4781
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v7

    .line 4782
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v8

    iput-object v8, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 4783
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->makeExtensionsImmutable()V

    .line 4784
    throw v7

    .line 4729
    .restart local v4    # "tag":I
    :sswitch_2
    :try_start_2
    iget v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    or-int/lit8 v7, v7, 0x2

    iput v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    .line 4730
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBytes()Lcom/google/protobuf/ByteString;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->userName_:Ljava/lang/Object;
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 4778
    .end local v4    # "tag":I
    :catch_1
    move-exception v1

    .line 4779
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v7, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 4780
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    .line 4779
    invoke-direct {v7, v8}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 4780
    invoke-virtual {v7, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    .line 4779
    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 4734
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v4    # "tag":I
    :sswitch_3
    :try_start_4
    iget v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    or-int/lit8 v7, v7, 0x4

    iput v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    .line 4735
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->seatId_:I

    goto :goto_0

    .line 4739
    :sswitch_4
    iget v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    or-int/lit8 v7, v7, 0x8

    iput v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    .line 4740
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBytes()Lcom/google/protobuf/ByteString;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioIp_:Ljava/lang/Object;

    goto :goto_0

    .line 4744
    :sswitch_5
    iget v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    or-int/lit8 v7, v7, 0x10

    iput v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    .line 4745
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readUInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioPort_:I

    goto :goto_0

    .line 4749
    :sswitch_6
    iget v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    or-int/lit8 v7, v7, 0x20

    iput v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    .line 4750
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBytes()Lcom/google/protobuf/ByteString;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->videoIp_:Ljava/lang/Object;

    goto/16 :goto_0

    .line 4754
    :sswitch_7
    iget v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    or-int/lit8 v7, v7, 0x40

    iput v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    .line 4755
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readUInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->videoPort_:I

    goto/16 :goto_0

    .line 4759
    :sswitch_8
    iget v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    or-int/lit16 v7, v7, 0x80

    iput v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    .line 4760
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBytes()Lcom/google/protobuf/ByteString;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->webrtcRoomid_:Ljava/lang/Object;

    goto/16 :goto_0

    .line 4764
    :sswitch_9
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 4765
    .local v3, "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$AudioCtrol;->valueOf(I)Lcom/example/tutorial/VideoProto$AudioCtrol;

    move-result-object v6

    .line 4766
    .local v6, "value":Lcom/example/tutorial/VideoProto$AudioCtrol;
    if-nez v6, :cond_2

    .line 4767
    const/16 v7, 0x9

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;

    goto/16 :goto_0

    .line 4769
    :cond_2
    iget v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    or-int/lit16 v7, v7, 0x100

    iput v7, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    .line 4770
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;
    :try_end_4
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 4712
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x12 -> :sswitch_2
        0x18 -> :sswitch_3
        0x22 -> :sswitch_4
        0x28 -> :sswitch_5
        0x32 -> :sswitch_6
        0x38 -> :sswitch_7
        0x42 -> :sswitch_8
        0x48 -> :sswitch_9
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$PlayerInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 4700
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$PlayerInfo;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 4680
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 5109
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->memoizedIsInitialized:B

    .line 5151
    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->memoizedSerializedSize:I

    .line 4681
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 4682
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$PlayerInfo;)V
    .locals 0

    .prologue
    .line 4679
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 4683
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 5109
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->memoizedIsInitialized:B

    .line 5151
    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->memoizedSerializedSize:I

    .line 4683
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$PlayerInfo;I)V
    .locals 0

    .prologue
    .line 4816
    iput p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->userId_:I

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$PlayerInfo;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 4832
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->userName_:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$PlayerInfo;I)V
    .locals 0

    .prologue
    .line 4875
    iput p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->seatId_:I

    return-void
.end method

.method static synthetic access$13(Lcom/example/tutorial/VideoProto$PlayerInfo;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 4891
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioIp_:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$14(Lcom/example/tutorial/VideoProto$PlayerInfo;I)V
    .locals 0

    .prologue
    .line 4946
    iput p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioPort_:I

    return-void
.end method

.method static synthetic access$15(Lcom/example/tutorial/VideoProto$PlayerInfo;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 4962
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->videoIp_:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$16(Lcom/example/tutorial/VideoProto$PlayerInfo;I)V
    .locals 0

    .prologue
    .line 5005
    iput p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->videoPort_:I

    return-void
.end method

.method static synthetic access$17(Lcom/example/tutorial/VideoProto$PlayerInfo;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 5021
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->webrtcRoomid_:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$18(Lcom/example/tutorial/VideoProto$PlayerInfo;Lcom/example/tutorial/VideoProto$AudioCtrol;)V
    .locals 0

    .prologue
    .line 5076
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    return-void
.end method

.method static synthetic access$19(Lcom/example/tutorial/VideoProto$PlayerInfo;I)V
    .locals 0

    .prologue
    .line 4813
    iput p1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    return-void
.end method

.method static synthetic access$20(Lcom/example/tutorial/VideoProto$PlayerInfo;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 4832
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->userName_:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$21(Lcom/example/tutorial/VideoProto$PlayerInfo;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 4891
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioIp_:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$22(Lcom/example/tutorial/VideoProto$PlayerInfo;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 4962
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->videoIp_:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$23(Lcom/example/tutorial/VideoProto$PlayerInfo;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 5021
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->webrtcRoomid_:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 4675
    sget-boolean v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1

    .prologue
    .line 4687
    sget-object v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->defaultInstance:Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 4788
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PlayerInfo_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$17()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 5099
    iput v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->userId_:I

    .line 5100
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->userName_:Ljava/lang/Object;

    .line 5101
    iput v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->seatId_:I

    .line 5102
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioIp_:Ljava/lang/Object;

    .line 5103
    iput v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioPort_:I

    .line 5104
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->videoIp_:Ljava/lang/Object;

    .line 5105
    iput v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->videoPort_:I

    .line 5106
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->webrtcRoomid_:Ljava/lang/Object;

    .line 5107
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 5108
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 5258
    # invokes: Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->create()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->access$17()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$PlayerInfo;

    .prologue
    .line 5261
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->newBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 5238
    sget-object v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 5244
    sget-object v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 5208
    sget-object v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 5214
    sget-object v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 5249
    sget-object v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 5255
    sget-object v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 5228
    sget-object v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 5234
    sget-object v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 5218
    sget-object v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 5224
    sget-object v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method


# virtual methods
.method public getAudioControl()Lcom/example/tutorial/VideoProto$AudioCtrol;
    .locals 1

    .prologue
    .line 5095
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    return-object v0
.end method

.method public getAudioIp()Ljava/lang/String;
    .locals 4

    .prologue
    .line 4910
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioIp_:Ljava/lang/Object;

    .line 4911
    .local v1, "ref":Ljava/lang/Object;
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 4912
    check-cast v1, Ljava/lang/String;

    .line 4920
    .end local v1    # "ref":Ljava/lang/Object;
    :goto_0
    return-object v1

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    move-object v0, v1

    .line 4915
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 4916
    .local v0, "bs":Lcom/google/protobuf/ByteString;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v2

    .line 4917
    .local v2, "s":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->isValidUtf8()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 4918
    iput-object v2, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioIp_:Ljava/lang/Object;

    :cond_1
    move-object v1, v2

    .line 4920
    goto :goto_0
.end method

.method public getAudioIpBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 4932
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioIp_:Ljava/lang/Object;

    .line 4933
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 4936
    check-cast v1, Ljava/lang/String;

    .line 4935
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 4937
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioIp_:Ljava/lang/Object;

    .line 4940
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

.method public getAudioPort()I
    .locals 1

    .prologue
    .line 4957
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioPort_:I

    return v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1

    .prologue
    .line 4691
    sget-object v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->defaultInstance:Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PlayerInfo;

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
            "Lcom/example/tutorial/VideoProto$PlayerInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4810
    sget-object v0, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSeatId()I
    .locals 1

    .prologue
    .line 4886
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->seatId_:I

    return v0
.end method

.method public getSerializedSize()I
    .locals 7

    .prologue
    const/16 v6, 0x8

    const/4 v5, 0x4

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 5153
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->memoizedSerializedSize:I

    .line 5154
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 5195
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 5156
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 5157
    iget v2, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 5159
    iget v2, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->userId_:I

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 5161
    :cond_1
    iget v2, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-ne v2, v4, :cond_2

    .line 5163
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserNameBytes()Lcom/google/protobuf/ByteString;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v2

    add-int/2addr v0, v2

    .line 5165
    :cond_2
    iget v2, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit8 v2, v2, 0x4

    if-ne v2, v5, :cond_3

    .line 5167
    const/4 v2, 0x3

    iget v3, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->seatId_:I

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 5169
    :cond_3
    iget v2, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit8 v2, v2, 0x8

    if-ne v2, v6, :cond_4

    .line 5171
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getAudioIpBytes()Lcom/google/protobuf/ByteString;

    move-result-object v2

    invoke-static {v5, v2}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v2

    add-int/2addr v0, v2

    .line 5173
    :cond_4
    iget v2, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit8 v2, v2, 0x10

    const/16 v3, 0x10

    if-ne v2, v3, :cond_5

    .line 5175
    const/4 v2, 0x5

    iget v3, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioPort_:I

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 5177
    :cond_5
    iget v2, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit8 v2, v2, 0x20

    const/16 v3, 0x20

    if-ne v2, v3, :cond_6

    .line 5179
    const/4 v2, 0x6

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getVideoIpBytes()Lcom/google/protobuf/ByteString;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v2

    add-int/2addr v0, v2

    .line 5181
    :cond_6
    iget v2, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit8 v2, v2, 0x40

    const/16 v3, 0x40

    if-ne v2, v3, :cond_7

    .line 5183
    const/4 v2, 0x7

    iget v3, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->videoPort_:I

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 5185
    :cond_7
    iget v2, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit16 v2, v2, 0x80

    const/16 v3, 0x80

    if-ne v2, v3, :cond_8

    .line 5187
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getWebrtcRoomidBytes()Lcom/google/protobuf/ByteString;

    move-result-object v2

    invoke-static {v6, v2}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v2

    add-int/2addr v0, v2

    .line 5189
    :cond_8
    iget v2, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit16 v2, v2, 0x100

    const/16 v3, 0x100

    if-ne v2, v3, :cond_9

    .line 5191
    const/16 v2, 0x9

    iget-object v3, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$AudioCtrol;->getNumber()I

    move-result v3

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 5193
    :cond_9
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 5194
    iput v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->memoizedSerializedSize:I

    move v1, v0

    .line 5195
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto/16 :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 4698
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public getUserId()I
    .locals 1

    .prologue
    .line 4827
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->userId_:I

    return v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 4843
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->userName_:Ljava/lang/Object;

    .line 4844
    .local v1, "ref":Ljava/lang/Object;
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 4845
    check-cast v1, Ljava/lang/String;

    .line 4853
    .end local v1    # "ref":Ljava/lang/Object;
    :goto_0
    return-object v1

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    move-object v0, v1

    .line 4848
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 4849
    .local v0, "bs":Lcom/google/protobuf/ByteString;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v2

    .line 4850
    .local v2, "s":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->isValidUtf8()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 4851
    iput-object v2, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->userName_:Ljava/lang/Object;

    :cond_1
    move-object v1, v2

    .line 4853
    goto :goto_0
.end method

.method public getUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 4861
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->userName_:Ljava/lang/Object;

    .line 4862
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 4865
    check-cast v1, Ljava/lang/String;

    .line 4864
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 4866
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->userName_:Ljava/lang/Object;

    .line 4869
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

.method public getVideoIp()Ljava/lang/String;
    .locals 4

    .prologue
    .line 4973
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->videoIp_:Ljava/lang/Object;

    .line 4974
    .local v1, "ref":Ljava/lang/Object;
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 4975
    check-cast v1, Ljava/lang/String;

    .line 4983
    .end local v1    # "ref":Ljava/lang/Object;
    :goto_0
    return-object v1

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    move-object v0, v1

    .line 4978
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 4979
    .local v0, "bs":Lcom/google/protobuf/ByteString;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v2

    .line 4980
    .local v2, "s":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->isValidUtf8()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 4981
    iput-object v2, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->videoIp_:Ljava/lang/Object;

    :cond_1
    move-object v1, v2

    .line 4983
    goto :goto_0
.end method

.method public getVideoIpBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 4991
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->videoIp_:Ljava/lang/Object;

    .line 4992
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 4995
    check-cast v1, Ljava/lang/String;

    .line 4994
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 4996
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->videoIp_:Ljava/lang/Object;

    .line 4999
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

.method public getVideoPort()I
    .locals 1

    .prologue
    .line 5016
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->videoPort_:I

    return v0
.end method

.method public getWebrtcRoomid()Ljava/lang/String;
    .locals 4

    .prologue
    .line 5040
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->webrtcRoomid_:Ljava/lang/Object;

    .line 5041
    .local v1, "ref":Ljava/lang/Object;
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 5042
    check-cast v1, Ljava/lang/String;

    .line 5050
    .end local v1    # "ref":Ljava/lang/Object;
    :goto_0
    return-object v1

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    move-object v0, v1

    .line 5045
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 5046
    .local v0, "bs":Lcom/google/protobuf/ByteString;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v2

    .line 5047
    .local v2, "s":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->isValidUtf8()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 5048
    iput-object v2, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->webrtcRoomid_:Ljava/lang/Object;

    :cond_1
    move-object v1, v2

    .line 5050
    goto :goto_0
.end method

.method public getWebrtcRoomidBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 5062
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->webrtcRoomid_:Ljava/lang/Object;

    .line 5063
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 5066
    check-cast v1, Ljava/lang/String;

    .line 5065
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 5067
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->webrtcRoomid_:Ljava/lang/Object;

    .line 5070
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

.method public hasAudioControl()Z
    .locals 2

    .prologue
    .line 5085
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit16 v0, v0, 0x100

    const/16 v1, 0x100

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasAudioIp()Z
    .locals 2

    .prologue
    .line 4900
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

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

.method public hasAudioPort()Z
    .locals 2

    .prologue
    .line 4951
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

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

.method public hasSeatId()Z
    .locals 2

    .prologue
    .line 4880
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

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

.method public hasUserId()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 4821
    iget v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasUserName()Z
    .locals 2

    .prologue
    .line 4837
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

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

.method public hasVideoIp()Z
    .locals 2

    .prologue
    .line 4967
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

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

.method public hasVideoPort()Z
    .locals 2

    .prologue
    .line 5010
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

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

.method public hasWebrtcRoomid()Z
    .locals 2

    .prologue
    .line 5030
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

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

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    .locals 3

    .prologue
    .line 4793
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PlayerInfo_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$93()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 4795
    const-class v1, Lcom/example/tutorial/VideoProto$PlayerInfo;

    const-class v2, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .line 4794
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 4793
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 5111
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->memoizedIsInitialized:B

    .line 5112
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 5115
    :goto_0
    return v1

    .line 5112
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 5114
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 5259
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->newBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 5268
    new-instance v0, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;)V

    .line 5269
    .local v0, "builder":Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->newBuilderForType()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$PlayerInfo;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->newBuilderForType()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .locals 1

    .prologue
    .line 5263
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->newBuilder(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->toBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->toBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

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
    .line 5202
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage;->writeReplace()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 5
    .param p1, "output"    # Lcom/google/protobuf/CodedOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x4

    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 5120
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getSerializedSize()I

    .line 5121
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 5122
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->userId_:I

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 5124
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_1

    .line 5125
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUserNameBytes()Lcom/google/protobuf/ByteString;

    move-result-object v0

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    .line 5127
    :cond_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit8 v0, v0, 0x4

    if-ne v0, v3, :cond_2

    .line 5128
    const/4 v0, 0x3

    iget v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->seatId_:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 5130
    :cond_2
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit8 v0, v0, 0x8

    if-ne v0, v4, :cond_3

    .line 5131
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getAudioIpBytes()Lcom/google/protobuf/ByteString;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    .line 5133
    :cond_3
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit8 v0, v0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_4

    .line 5134
    const/4 v0, 0x5

    iget v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioPort_:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeUInt32(II)V

    .line 5136
    :cond_4
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit8 v0, v0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_5

    .line 5137
    const/4 v0, 0x6

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getVideoIpBytes()Lcom/google/protobuf/ByteString;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    .line 5139
    :cond_5
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit8 v0, v0, 0x40

    const/16 v1, 0x40

    if-ne v0, v1, :cond_6

    .line 5140
    const/4 v0, 0x7

    iget v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->videoPort_:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeUInt32(II)V

    .line 5142
    :cond_6
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit16 v0, v0, 0x80

    const/16 v1, 0x80

    if-ne v0, v1, :cond_7

    .line 5143
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getWebrtcRoomidBytes()Lcom/google/protobuf/ByteString;

    move-result-object v0

    invoke-virtual {p1, v4, v0}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    .line 5145
    :cond_7
    iget v0, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->bitField0_:I

    and-int/lit16 v0, v0, 0x100

    const/16 v1, 0x100

    if-ne v0, v1, :cond_8

    .line 5146
    const/16 v0, 0x9

    iget-object v1, p0, Lcom/example/tutorial/VideoProto$PlayerInfo;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$AudioCtrol;->getNumber()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 5148
    :cond_8
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 5149
    return-void
.end method
