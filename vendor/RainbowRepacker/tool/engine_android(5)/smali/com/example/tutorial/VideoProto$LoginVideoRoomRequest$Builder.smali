.class public final Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$LoginVideoRoomRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$LoginVideoRoomRequestOrBuilder;"
    }
.end annotation


# instance fields
.field private appId_:I

.field private audioControl_:Lcom/example/tutorial/VideoProto$MediaControl;

.field private bitField0_:I

.field private height_:I

.field private networkType_:Lcom/example/tutorial/VideoProto$NetworkType;

.field private roomId_:I

.field private roomType_:Lcom/example/tutorial/VideoProto$RoomType;

.field private supportP2P_:Z

.field private videoControl_:Lcom/example/tutorial/VideoProto$MediaControl;

.field private width_:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 4020
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 4324
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    .line 4360
    sget-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_2G:Lcom/example/tutorial/VideoProto$NetworkType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->networkType_:Lcom/example/tutorial/VideoProto$NetworkType;

    .line 4396
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 4432
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->videoControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 4021
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->maybeForceBuilderInitialization()V

    .line 4022
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 4026
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 4324
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    .line 4360
    sget-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_2G:Lcom/example/tutorial/VideoProto$NetworkType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->networkType_:Lcom/example/tutorial/VideoProto$NetworkType;

    .line 4396
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 4432
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->videoControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 4027
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->maybeForceBuilderInitialization()V

    .line 4028
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;)V
    .locals 0

    .prologue
    .line 4024
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1

    .prologue
    .line 4033
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->create()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1

    .prologue
    .line 4034
    new-instance v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 4009
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_LoginVideoRoomRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$14()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 0

    .prologue
    .line 4030
    # getter for: Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->access$8()Z

    .line 4032
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .locals 2

    .prologue
    .line 4074
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    move-result-object v0

    .line 4075
    .local v0, "result":Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 4076
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 4078
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->build()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->build()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .locals 5

    .prologue
    .line 4082
    new-instance v1, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;)V

    .line 4083
    .local v1, "result":Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4084
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 4085
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 4086
    or-int/lit8 v2, v2, 0x1

    .line 4088
    :cond_0
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->appId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->access$10(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;I)V

    .line 4089
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 4090
    or-int/lit8 v2, v2, 0x2

    .line 4092
    :cond_1
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->roomId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->access$11(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;I)V

    .line 4093
    and-int/lit8 v3, v0, 0x4

    const/4 v4, 0x4

    if-ne v3, v4, :cond_2

    .line 4094
    or-int/lit8 v2, v2, 0x4

    .line 4096
    :cond_2
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->height_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->access$12(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;I)V

    .line 4097
    and-int/lit8 v3, v0, 0x8

    const/16 v4, 0x8

    if-ne v3, v4, :cond_3

    .line 4098
    or-int/lit8 v2, v2, 0x8

    .line 4100
    :cond_3
    iget v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->width_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->access$13(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;I)V

    .line 4101
    and-int/lit8 v3, v0, 0x10

    const/16 v4, 0x10

    if-ne v3, v4, :cond_4

    .line 4102
    or-int/lit8 v2, v2, 0x10

    .line 4104
    :cond_4
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->access$14(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;Lcom/example/tutorial/VideoProto$RoomType;)V

    .line 4105
    and-int/lit8 v3, v0, 0x20

    const/16 v4, 0x20

    if-ne v3, v4, :cond_5

    .line 4106
    or-int/lit8 v2, v2, 0x20

    .line 4108
    :cond_5
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->networkType_:Lcom/example/tutorial/VideoProto$NetworkType;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->access$15(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;Lcom/example/tutorial/VideoProto$NetworkType;)V

    .line 4109
    and-int/lit8 v3, v0, 0x40

    const/16 v4, 0x40

    if-ne v3, v4, :cond_6

    .line 4110
    or-int/lit8 v2, v2, 0x40

    .line 4112
    :cond_6
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->access$16(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;Lcom/example/tutorial/VideoProto$MediaControl;)V

    .line 4113
    and-int/lit16 v3, v0, 0x80

    const/16 v4, 0x80

    if-ne v3, v4, :cond_7

    .line 4114
    or-int/lit16 v2, v2, 0x80

    .line 4116
    :cond_7
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->videoControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->access$17(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;Lcom/example/tutorial/VideoProto$MediaControl;)V

    .line 4117
    and-int/lit16 v3, v0, 0x100

    const/16 v4, 0x100

    if-ne v3, v4, :cond_8

    .line 4118
    or-int/lit16 v2, v2, 0x100

    .line 4120
    :cond_8
    iget-boolean v3, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->supportP2P_:Z

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->access$18(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;Z)V

    .line 4121
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->access$19(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;I)V

    .line 4122
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onBuilt()V

    .line 4123
    return-object v1
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 4038
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 4039
    iput v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->appId_:I

    .line 4040
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4041
    iput v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->roomId_:I

    .line 4042
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4043
    iput v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->height_:I

    .line 4044
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4045
    iput v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->width_:I

    .line 4046
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4047
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    .line 4048
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4049
    sget-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_2G:Lcom/example/tutorial/VideoProto$NetworkType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->networkType_:Lcom/example/tutorial/VideoProto$NetworkType;

    .line 4050
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x21

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4051
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 4052
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x41

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4053
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->videoControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 4054
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x81

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4055
    iput-boolean v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->supportP2P_:Z

    .line 4056
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x101

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4057
    return-object p0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearAppId()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1

    .prologue
    .line 4218
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4219
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->appId_:I

    .line 4220
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4221
    return-object p0
.end method

.method public clearAudioControl()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1

    .prologue
    .line 4425
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x41

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4426
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 4427
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4428
    return-object p0
.end method

.method public clearHeight()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1

    .prologue
    .line 4284
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4285
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->height_:I

    .line 4286
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4287
    return-object p0
.end method

.method public clearNetworkType()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1

    .prologue
    .line 4389
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x21

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4390
    sget-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_2G:Lcom/example/tutorial/VideoProto$NetworkType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->networkType_:Lcom/example/tutorial/VideoProto$NetworkType;

    .line 4391
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4392
    return-object p0
.end method

.method public clearRoomId()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1

    .prologue
    .line 4251
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4252
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->roomId_:I

    .line 4253
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4254
    return-object p0
.end method

.method public clearRoomType()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1

    .prologue
    .line 4353
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4354
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    .line 4355
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4356
    return-object p0
.end method

.method public clearSupportP2P()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1

    .prologue
    .line 4510
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x101

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4511
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->supportP2P_:Z

    .line 4512
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4513
    return-object p0
.end method

.method public clearVideoControl()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1

    .prologue
    .line 4461
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit16 v0, v0, -0x81

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4462
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->videoControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 4463
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4464
    return-object p0
.end method

.method public clearWidth()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1

    .prologue
    .line 4317
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4318
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->width_:I

    .line 4319
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4320
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 2

    .prologue
    .line 4061
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->create()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getAppId()I
    .locals 1

    .prologue
    .line 4203
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->appId_:I

    return v0
.end method

.method public getAudioControl()Lcom/example/tutorial/VideoProto$MediaControl;
    .locals 1

    .prologue
    .line 4407
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    .locals 1

    .prologue
    .line 4070
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 4066
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_LoginVideoRoomRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$14()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 4269
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->height_:I

    return v0
.end method

.method public getNetworkType()Lcom/example/tutorial/VideoProto$NetworkType;
    .locals 1

    .prologue
    .line 4371
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->networkType_:Lcom/example/tutorial/VideoProto$NetworkType;

    return-object v0
.end method

.method public getRoomId()I
    .locals 1

    .prologue
    .line 4236
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->roomId_:I

    return v0
.end method

.method public getRoomType()Lcom/example/tutorial/VideoProto$RoomType;
    .locals 1

    .prologue
    .line 4335
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    return-object v0
.end method

.method public getSupportP2P()Z
    .locals 1

    .prologue
    .line 4487
    iget-boolean v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->supportP2P_:Z

    return v0
.end method

.method public getVideoControl()Lcom/example/tutorial/VideoProto$MediaControl;
    .locals 1

    .prologue
    .line 4443
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->videoControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 4302
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->width_:I

    return v0
.end method

.method public hasAppId()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 4197
    iget v1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

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
    .line 4401
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

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
    .line 4263
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

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
    .line 4365
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

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
    .line 4230
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

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
    .line 4329
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

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
    .line 4477
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

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
    .line 4437
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

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
    .line 4296
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

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
    .line 4014
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_LoginVideoRoomRequest_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$92()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 4016
    const-class v1, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    const-class v2, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    .line 4015
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 4014
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 4169
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    .prologue
    .line 4136
    invoke-static {}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 4165
    :goto_0
    return-object p0

    .line 4137
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->hasAppId()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 4138
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getAppId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setAppId(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    .line 4140
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->hasRoomId()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4141
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getRoomId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setRoomId(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    .line 4143
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->hasHeight()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 4144
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getHeight()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setHeight(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    .line 4146
    :cond_3
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->hasWidth()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 4147
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getWidth()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setWidth(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    .line 4149
    :cond_4
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->hasRoomType()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 4150
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getRoomType()Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setRoomType(Lcom/example/tutorial/VideoProto$RoomType;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    .line 4152
    :cond_5
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->hasNetworkType()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 4153
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getNetworkType()Lcom/example/tutorial/VideoProto$NetworkType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setNetworkType(Lcom/example/tutorial/VideoProto$NetworkType;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    .line 4155
    :cond_6
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->hasAudioControl()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 4156
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getAudioControl()Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setAudioControl(Lcom/example/tutorial/VideoProto$MediaControl;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    .line 4158
    :cond_7
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->hasVideoControl()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 4159
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getVideoControl()Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setVideoControl(Lcom/example/tutorial/VideoProto$MediaControl;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    .line 4161
    :cond_8
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->hasSupportP2P()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 4162
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getSupportP2P()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->setSupportP2P(Z)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    .line 4164
    :cond_9
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 4176
    const/4 v2, 0x0

    .line 4178
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4183
    if-eqz v2, :cond_0

    .line 4184
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    .line 4187
    :cond_0
    return-object p0

    .line 4179
    :catch_0
    move-exception v1

    .line 4180
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    move-object v2, v0

    .line 4181
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 4182
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 4183
    if-eqz v2, :cond_1

    .line 4184
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    .line 4186
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 4127
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    if-eqz v0, :cond_0

    .line 4128
    check-cast p1, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object p0

    .line 4131
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    :goto_0
    return-object p0

    .line 4130
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setAppId(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 4209
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4210
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->appId_:I

    .line 4211
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4212
    return-object p0
.end method

.method public setAudioControl(Lcom/example/tutorial/VideoProto$MediaControl;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$MediaControl;

    .prologue
    .line 4413
    if-nez p1, :cond_0

    .line 4414
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 4416
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x40

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4417
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->audioControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 4418
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4419
    return-object p0
.end method

.method public setHeight(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 4275
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4276
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->height_:I

    .line 4277
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4278
    return-object p0
.end method

.method public setNetworkType(Lcom/example/tutorial/VideoProto$NetworkType;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$NetworkType;

    .prologue
    .line 4377
    if-nez p1, :cond_0

    .line 4378
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 4380
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4381
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->networkType_:Lcom/example/tutorial/VideoProto$NetworkType;

    .line 4382
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4383
    return-object p0
.end method

.method public setRoomId(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 4242
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4243
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->roomId_:I

    .line 4244
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4245
    return-object p0
.end method

.method public setRoomType(Lcom/example/tutorial/VideoProto$RoomType;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$RoomType;

    .prologue
    .line 4341
    if-nez p1, :cond_0

    .line 4342
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 4344
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4345
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->roomType_:Lcom/example/tutorial/VideoProto$RoomType;

    .line 4346
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4347
    return-object p0
.end method

.method public setSupportP2P(Z)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1
    .param p1, "value"    # Z

    .prologue
    .line 4497
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x100

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4498
    iput-boolean p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->supportP2P_:Z

    .line 4499
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4500
    return-object p0
.end method

.method public setVideoControl(Lcom/example/tutorial/VideoProto$MediaControl;)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$MediaControl;

    .prologue
    .line 4449
    if-nez p1, :cond_0

    .line 4450
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 4452
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    or-int/lit16 v0, v0, 0x80

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4453
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->videoControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 4454
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4455
    return-object p0
.end method

.method public setWidth(I)Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 4308
    iget v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->bitField0_:I

    .line 4309
    iput p1, p0, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->width_:I

    .line 4310
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$LoginVideoRoomRequest$Builder;->onChanged()V

    .line 4311
    return-object p0
.end method
