.class public final Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$LoginVideoRoomRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LoginVideoRoomRequest"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    }
.end annotation


# static fields
.field public static final APP_ID_FIELD_NUMBER:I = 0x1

.field public static final AUDIO_CONTROL_FIELD_NUMBER:I = 0x7

.field public static final HEIGHT_FIELD_NUMBER:I = 0x3

.field public static final NETWORK_TYPE_FIELD_NUMBER:I = 0x6

.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;",
            ">;"
        }
    .end annotation
.end field

.field public static final ROOM_ID_FIELD_NUMBER:I = 0x2

.field public static final ROOM_TYPE_FIELD_NUMBER:I = 0x5

.field public static final SUPPORT_P2P_FIELD_NUMBER:I = 0xa

.field public static final VIDEO_CONTROL_FIELD_NUMBER:I = 0x8

.field public static final WIDTH_FIELD_NUMBER:I = 0x4

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

.field private static final serialVersionUID:J


# instance fields
.field private appId_:I

.field private audioControl_:Lcom/example/tutorial/VideoProto$MediaControl;

.field private bitField0_:I

.field private height_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private networkType_:Lcom/example/tutorial/VideoProto$NetworkType;

.field private roomId_:I

.field private roomType_:Lcom/example/tutorial/VideoProto$RoomType;

.field private supportP2P_:Z

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;

.field private videoControl_:Lcom/example/tutorial/VideoProto$MediaControl;

.field private width_:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 3661
    new-instance v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$1;-><init>()V

    .line 3660
    sput-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->PARSER:Lcom/google/protobuf/Parser;

    .line 4520
    new-instance v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    .line 4521
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->initFields()V

    .line 4522
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

    .line 3544
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 3839
    iput-byte v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->memoizedIsInitialized:B

    .line 3881
    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->memoizedSerializedSize:I

    .line 3548
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->initFields()V

    .line 3549
    const/4 v2, 0x0

    .line 3551
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 3553
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 3554
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 3644
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 3645
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->makeExtensionsImmutable()V

    .line 3647
    return-void

    .line 3555
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 3556
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 3561
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v7

    .line 3562
    if-nez v7, :cond_0

    .line 3563
    const/4 v0, 0x1

    .line 3565
    goto :goto_0

    .line 3558
    :sswitch_0
    const/4 v0, 0x1

    .line 3559
    goto :goto_0

    .line 3568
    :sswitch_1
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    or-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    .line 3569
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->appId_:I
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 3638
    .end local v4    # "tag":I
    :catch_0
    move-exception v1

    .line 3639
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    throw v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3643
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v7

    .line 3644
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v8

    iput-object v8, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 3645
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->makeExtensionsImmutable()V

    .line 3646
    throw v7

    .line 3573
    .restart local v4    # "tag":I
    :sswitch_2
    :try_start_2
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    or-int/lit8 v7, v7, 0x2

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    .line 3574
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->roomId_:I
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 3640
    .end local v4    # "tag":I
    :catch_1
    move-exception v1

    .line 3641
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v7, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 3642
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    .line 3641
    invoke-direct {v7, v8}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 3642
    invoke-virtual {v7, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    .line 3641
    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 3578
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v4    # "tag":I
    :sswitch_3
    :try_start_4
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    or-int/lit8 v7, v7, 0x4

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    .line 3579
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->height_:I

    goto :goto_0

    .line 3583
    :sswitch_4
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    or-int/lit8 v7, v7, 0x8

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    .line 3584
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->width_:I

    goto :goto_0

    .line 3588
    :sswitch_5
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 3589
    .local v3, "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$RoomType;->valueOf(I)Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v6

    .line 3590
    .local v6, "value":Lcom/example/tutorial/VideoProto$RoomType;
    if-nez v6, :cond_2

    .line 3591
    const/4 v7, 0x5

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;

    goto :goto_0

    .line 3593
    :cond_2
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    or-int/lit8 v7, v7, 0x10

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    .line 3594
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    goto/16 :goto_0

    .line 3599
    .end local v3    # "rawValue":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$RoomType;
    :sswitch_6
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 3600
    .restart local v3    # "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$NetworkType;->valueOf(I)Lcom/example/tutorial/VideoProto$NetworkType;

    move-result-object v6

    .line 3601
    .local v6, "value":Lcom/example/tutorial/VideoProto$NetworkType;
    if-nez v6, :cond_3

    .line 3602
    const/4 v7, 0x6

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;

    goto/16 :goto_0

    .line 3604
    :cond_3
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    or-int/lit8 v7, v7, 0x20

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    .line 3605
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->networkType_:Lcom/example/tutorial/VideoProto$NetworkType;

    goto/16 :goto_0

    .line 3610
    .end local v3    # "rawValue":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$NetworkType;
    :sswitch_7
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 3611
    .restart local v3    # "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$MediaControl;->valueOf(I)Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v6

    .line 3612
    .local v6, "value":Lcom/example/tutorial/VideoProto$MediaControl;
    if-nez v6, :cond_4

    .line 3613
    const/4 v7, 0x7

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;

    goto/16 :goto_0

    .line 3615
    :cond_4
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    or-int/lit8 v7, v7, 0x40

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    .line 3616
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->audioControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    goto/16 :goto_0

    .line 3621
    .end local v3    # "rawValue":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$MediaControl;
    :sswitch_8
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 3622
    .restart local v3    # "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$MediaControl;->valueOf(I)Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v6

    .line 3623
    .restart local v6    # "value":Lcom/example/tutorial/VideoProto$MediaControl;
    if-nez v6, :cond_5

    .line 3624
    const/16 v7, 0x8

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;

    goto/16 :goto_0

    .line 3626
    :cond_5
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    or-int/lit16 v7, v7, 0x80

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    .line 3627
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->videoControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    goto/16 :goto_0

    .line 3632
    .end local v3    # "rawValue":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$MediaControl;
    :sswitch_9
    iget v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    or-int/lit16 v7, v7, 0x100

    iput v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    .line 3633
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBool()Z

    move-result v7

    iput-boolean v7, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->supportP2P_:Z
    :try_end_4
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 3556
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x10 -> :sswitch_2
        0x18 -> :sswitch_3
        0x20 -> :sswitch_4
        0x28 -> :sswitch_5
        0x30 -> :sswitch_6
        0x38 -> :sswitch_7
        0x40 -> :sswitch_8
        0x50 -> :sswitch_9
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 3544
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 3524
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 3839
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->memoizedIsInitialized:B

    .line 3881
    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->memoizedSerializedSize:I

    .line 3525
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 3526
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;)V
    .locals 0

    .prologue
    .line 3523
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 3527
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 3839
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->memoizedIsInitialized:B

    .line 3881
    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->memoizedSerializedSize:I

    .line 3527
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;I)V
    .locals 0

    .prologue
    .line 3678
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->appId_:I

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;I)V
    .locals 0

    .prologue
    .line 3694
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->roomId_:I

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;I)V
    .locals 0

    .prologue
    .line 3710
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->height_:I

    return-void
.end method

.method static synthetic access$13(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;I)V
    .locals 0

    .prologue
    .line 3726
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->width_:I

    return-void
.end method

.method static synthetic access$14(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;Lcom/example/tutorial/VideoProto$RoomType;)V
    .locals 0

    .prologue
    .line 3742
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    return-void
.end method

.method static synthetic access$15(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;Lcom/example/tutorial/VideoProto$NetworkType;)V
    .locals 0

    .prologue
    .line 3758
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->networkType_:Lcom/example/tutorial/VideoProto$NetworkType;

    return-void
.end method

.method static synthetic access$16(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;Lcom/example/tutorial/VideoProto$MediaControl;)V
    .locals 0

    .prologue
    .line 3774
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->audioControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    return-void
.end method

.method static synthetic access$17(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;Lcom/example/tutorial/VideoProto$MediaControl;)V
    .locals 0

    .prologue
    .line 3790
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->videoControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    return-void
.end method

.method static synthetic access$18(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;Z)V
    .locals 0

    .prologue
    .line 3806
    iput-boolean p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->supportP2P_:Z

    return-void
.end method

.method static synthetic access$19(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;I)V
    .locals 0

    .prologue
    .line 3675
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 3519
    sget-boolean v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .locals 1

    .prologue
    .line 3531
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 3650
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_LoginVideoRoomRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$14()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 3829
    iput v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->appId_:I

    .line 3830
    iput v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->roomId_:I

    .line 3831
    iput v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->height_:I

    .line 3832
    iput v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->width_:I

    .line 3833
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    .line 3834
    sget-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_2G:Lcom/example/tutorial/VideoProto$NetworkType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->networkType_:Lcom/example/tutorial/VideoProto$NetworkType;

    .line 3835
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->audioControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 3836
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->videoControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 3837
    iput-boolean v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->supportP2P_:Z

    .line 3838
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1

    .prologue
    .line 3988
    # invokes: Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->create()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->access$17()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    .prologue
    .line 3991
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->newBuilder()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3968
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3974
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 3938
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 3944
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3979
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3985
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3958
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3964
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 3948
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 3954
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    return-object v0
.end method


# virtual methods
.method public getAppId()I
    .locals 1

    .prologue
    .line 3689
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->appId_:I

    return v0
.end method

.method public getAudioControl()Lcom/example/tutorial/VideoProto$MediaControl;
    .locals 1

    .prologue
    .line 3785
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->audioControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .locals 1

    .prologue
    .line 3535
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    move-result-object v0

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 3721
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->height_:I

    return v0
.end method

.method public getNetworkType()Lcom/example/tutorial/VideoProto$NetworkType;
    .locals 1

    .prologue
    .line 3769
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->networkType_:Lcom/example/tutorial/VideoProto$NetworkType;

    return-object v0
.end method

.method public getParserForType()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3672
    sget-object v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getRoomId()I
    .locals 1

    .prologue
    .line 3705
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->roomId_:I

    return v0
.end method

.method public getRoomType()Lcom/example/tutorial/VideoProto$RoomType;
    .locals 1

    .prologue
    .line 3753
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 7

    .prologue
    const/16 v6, 0x8

    const/4 v5, 0x4

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 3883
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->memoizedSerializedSize:I

    .line 3884
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 3925
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 3886
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 3887
    iget v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 3889
    iget v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->appId_:I

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 3891
    :cond_1
    iget v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-ne v2, v4, :cond_2

    .line 3893
    iget v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->roomId_:I

    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 3895
    :cond_2
    iget v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit8 v2, v2, 0x4

    if-ne v2, v5, :cond_3

    .line 3897
    const/4 v2, 0x3

    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->height_:I

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 3899
    :cond_3
    iget v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit8 v2, v2, 0x8

    if-ne v2, v6, :cond_4

    .line 3901
    iget v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->width_:I

    invoke-static {v5, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 3903
    :cond_4
    iget v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit8 v2, v2, 0x10

    const/16 v3, 0x10

    if-ne v2, v3, :cond_5

    .line 3905
    const/4 v2, 0x5

    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$RoomType;->getNumber()I

    move-result v3

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 3907
    :cond_5
    iget v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit8 v2, v2, 0x20

    const/16 v3, 0x20

    if-ne v2, v3, :cond_6

    .line 3909
    const/4 v2, 0x6

    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->networkType_:Lcom/example/tutorial/VideoProto$NetworkType;

    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$NetworkType;->getNumber()I

    move-result v3

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 3911
    :cond_6
    iget v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit8 v2, v2, 0x40

    const/16 v3, 0x40

    if-ne v2, v3, :cond_7

    .line 3913
    const/4 v2, 0x7

    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->audioControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$MediaControl;->getNumber()I

    move-result v3

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 3915
    :cond_7
    iget v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit16 v2, v2, 0x80

    const/16 v3, 0x80

    if-ne v2, v3, :cond_8

    .line 3917
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->videoControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$MediaControl;->getNumber()I

    move-result v2

    invoke-static {v6, v2}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 3919
    :cond_8
    iget v2, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit16 v2, v2, 0x100

    const/16 v3, 0x100

    if-ne v2, v3, :cond_9

    .line 3921
    const/16 v2, 0xa

    iget-boolean v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->supportP2P_:Z

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeBoolSize(IZ)I

    move-result v2

    add-int/2addr v0, v2

    .line 3923
    :cond_9
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 3924
    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->memoizedSerializedSize:I

    move v1, v0

    .line 3925
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto/16 :goto_0
.end method

.method public getSupportP2P()Z
    .locals 1

    .prologue
    .line 3825
    iget-boolean v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->supportP2P_:Z

    return v0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 3542
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public getVideoControl()Lcom/example/tutorial/VideoProto$MediaControl;
    .locals 1

    .prologue
    .line 3801
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->videoControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 3737
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->width_:I

    return v0
.end method

.method public hasAppId()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 3683
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasAudioControl()Z
    .locals 2

    .prologue
    .line 3779
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

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

.method public hasHeight()Z
    .locals 2

    .prologue
    .line 3715
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

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

.method public hasNetworkType()Z
    .locals 2

    .prologue
    .line 3763
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

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

.method public hasRoomId()Z
    .locals 2

    .prologue
    .line 3699
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

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

.method public hasRoomType()Z
    .locals 2

    .prologue
    .line 3747
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

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

.method public hasSupportP2P()Z
    .locals 2

    .prologue
    .line 3815
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

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

.method public hasVideoControl()Z
    .locals 2

    .prologue
    .line 3795
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

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

.method public hasWidth()Z
    .locals 2

    .prologue
    .line 3731
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

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

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    .locals 3

    .prologue
    .line 3655
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_LoginVideoRoomRequest_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$92()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 3657
    const-class v1, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    const-class v2, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    .line 3656
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 3655
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 3841
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->memoizedIsInitialized:B

    .line 3842
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 3845
    :goto_0
    return v1

    .line 3842
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 3844
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1

    .prologue
    .line 3989
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->newBuilder()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 3998
    new-instance v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;)V

    .line 3999
    .local v0, "builder":Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->newBuilderForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->newBuilderForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1

    .prologue
    .line 3993
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->newBuilder(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->toBuilder()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->toBuilder()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

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
    .line 3932
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

    .line 3850
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getSerializedSize()I

    .line 3851
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 3852
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->appId_:I

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 3854
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_1

    .line 3855
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->roomId_:I

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 3857
    :cond_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit8 v0, v0, 0x4

    if-ne v0, v3, :cond_2

    .line 3858
    const/4 v0, 0x3

    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->height_:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 3860
    :cond_2
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit8 v0, v0, 0x8

    if-ne v0, v4, :cond_3

    .line 3861
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->width_:I

    invoke-virtual {p1, v3, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 3863
    :cond_3
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit8 v0, v0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_4

    .line 3864
    const/4 v0, 0x5

    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$RoomType;->getNumber()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 3866
    :cond_4
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit8 v0, v0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_5

    .line 3867
    const/4 v0, 0x6

    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->networkType_:Lcom/example/tutorial/VideoProto$NetworkType;

    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$NetworkType;->getNumber()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 3869
    :cond_5
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit8 v0, v0, 0x40

    const/16 v1, 0x40

    if-ne v0, v1, :cond_6

    .line 3870
    const/4 v0, 0x7

    iget-object v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->audioControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$MediaControl;->getNumber()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 3872
    :cond_6
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit16 v0, v0, 0x80

    const/16 v1, 0x80

    if-ne v0, v1, :cond_7

    .line 3873
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->videoControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MediaControl;->getNumber()I

    move-result v0

    invoke-virtual {p1, v4, v0}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 3875
    :cond_7
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->bitField0_:I

    and-int/lit16 v0, v0, 0x100

    const/16 v1, 0x100

    if-ne v0, v1, :cond_8

    .line 3876
    const/16 v0, 0xa

    iget-boolean v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->supportP2P_:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeBool(IZ)V

    .line 3878
    :cond_8
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 3879
    return-void
.end method
