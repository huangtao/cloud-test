.class Lcom/example/tutorial/VideoProto$1;
.super Ljava/lang/Object;
.source "VideoProto.java"

# interfaces
.implements Lcom/google/protobuf/Descriptors$FileDescriptor$InternalDescriptorAssigner;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 22057
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public assignDescriptors(Lcom/google/protobuf/Descriptors$FileDescriptor;)Lcom/google/protobuf/ExtensionRegistry;
    .locals 10
    .param p1, "root"    # Lcom/google/protobuf/Descriptors$FileDescriptor;

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 22060
    invoke-static {p1}, Lcom/example/tutorial/VideoProto;->access$0(Lcom/google/protobuf/Descriptors$FileDescriptor;)V

    .line 22062
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22061
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$1(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22064
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22065
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MessageHead_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$2()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22066
    new-array v2, v9, [Ljava/lang/String;

    const-string v3, "ClientVersion"

    aput-object v3, v2, v5

    const-string v3, "UserId"

    aput-object v3, v2, v6

    const-string v3, "AuthKey"

    aput-object v3, v2, v7

    const-string v3, "MessageBodyName"

    aput-object v3, v2, v8

    .line 22063
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$3(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22068
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22067
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$4(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22070
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22071
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoMessage_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$5()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22072
    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "MessageHead"

    aput-object v3, v2, v5

    const-string v3, "MessageBody"

    aput-object v3, v2, v6

    .line 22069
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$6(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22074
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22073
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$7(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22076
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22077
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MediaControlRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$8()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22078
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "MediaControl"

    aput-object v3, v2, v5

    .line 22075
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$9(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22080
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22079
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$10(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22082
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22083
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MediaControlResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$11()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22084
    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "Result"

    aput-object v3, v2, v5

    const-string v3, "MediaControl"

    aput-object v3, v2, v6

    .line 22081
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$12(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22086
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22085
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$13(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22088
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22089
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_LoginVideoRoomRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$14()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22090
    const/16 v2, 0x9

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "AppId"

    aput-object v3, v2, v5

    const-string v3, "RoomId"

    aput-object v3, v2, v6

    const-string v3, "Height"

    aput-object v3, v2, v7

    const-string v3, "Width"

    aput-object v3, v2, v8

    const-string v3, "RoomType"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "NetworkType"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "AudioControl"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "VideoControl"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "SupportP2P"

    aput-object v4, v2, v3

    .line 22087
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$15(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22092
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22091
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$16(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22094
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22095
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PlayerInfo_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$17()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22096
    const/16 v2, 0x9

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "UserId"

    aput-object v3, v2, v5

    const-string v3, "UserName"

    aput-object v3, v2, v6

    const-string v3, "SeatId"

    aput-object v3, v2, v7

    const-string v3, "AudioIp"

    aput-object v3, v2, v8

    const-string v3, "AudioPort"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "VideoIp"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "VideoPort"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "WebrtcRoomid"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "AudioControl"

    aput-object v4, v2, v3

    .line 22093
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$18(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22098
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x6

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22097
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$19(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22100
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22101
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_LoginVideoRoomResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$20()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22102
    const/16 v2, 0xe

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "Result"

    aput-object v3, v2, v5

    const-string v3, "RoomId"

    aput-object v3, v2, v6

    const-string v3, "HeartBeat"

    aput-object v3, v2, v7

    const-string v3, "SeatId"

    aput-object v3, v2, v8

    const-string v3, "OtherPlayers"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "RoomType"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "TimeStamp"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "AudioPort"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "VideoPort"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "UpMicroUserId"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "SupportP2P"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "ProxyserverIp"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "ProxyserverPort"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "WebrtcRoomserver"

    aput-object v4, v2, v3

    .line 22099
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$21(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22104
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x7

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22103
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$22(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22106
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22107
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_HeartBeat_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$23()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22108
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "ChannelType"

    aput-object v3, v2, v5

    .line 22105
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$24(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22110
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0x8

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22109
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$25(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22112
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22113
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoDescript_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$26()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22114
    const/16 v2, 0x8

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "FrameType"

    aput-object v3, v2, v5

    const-string v3, "FrameVideoType"

    aput-object v3, v2, v6

    const-string v3, "FrameVideoValue"

    aput-object v3, v2, v7

    const-string v3, "FrameVideoCount"

    aput-object v3, v2, v8

    const-string v3, "FrameVideoIndex"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "TimeStamp"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "DstUserId"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "DstSeatId"

    aput-object v4, v2, v3

    .line 22111
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$27(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22116
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0x9

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22115
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$28(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22118
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22119
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PublishVideoRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$29()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22120
    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "VideoDescript"

    aput-object v3, v2, v5

    const-string v3, "VideoData"

    aput-object v3, v2, v6

    .line 22117
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$30(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22122
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0xa

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22121
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$31(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22124
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22125
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$32()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22126
    new-array v2, v9, [Ljava/lang/String;

    const-string v3, "SendUserId"

    aput-object v3, v2, v5

    const-string v3, "SeatId"

    aput-object v3, v2, v6

    const-string v3, "VideoDescript"

    aput-object v3, v2, v7

    const-string v3, "VideoData"

    aput-object v3, v2, v8

    .line 22123
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$33(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22128
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0xb

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22127
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$34(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22130
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22131
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_EnterRoomNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$35()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22132
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "PlayerInfo"

    aput-object v3, v2, v5

    .line 22129
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$36(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22134
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0xc

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22133
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$37(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22136
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22137
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_LeaveRoomNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$38()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22138
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "PlayerInfo"

    aput-object v3, v2, v5

    .line 22135
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$39(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22140
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0xd

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22139
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$40(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22142
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22143
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MediaInfoNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$41()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22144
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "PlayerInfo"

    aput-object v3, v2, v5

    .line 22141
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$42(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22146
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0xe

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22145
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$43(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22148
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22149
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$44()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22150
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "PlayerInfo"

    aput-object v3, v2, v5

    .line 22147
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$45(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22152
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0xf

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22151
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$46(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22154
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22155
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$47()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22156
    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "Result"

    aput-object v3, v2, v5

    const-string v3, "PlayerInfo"

    aput-object v3, v2, v6

    .line 22153
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$48(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22158
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0x10

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22157
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$49(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22160
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22161
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_DownMicRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$50()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22162
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "PlayerInfo"

    aput-object v3, v2, v5

    .line 22159
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$51(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22164
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0x11

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22163
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$52(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22166
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22167
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_DownMicResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$53()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22168
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "Result"

    aput-object v3, v2, v5

    .line 22165
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$54(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22170
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0x12

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22169
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$55(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22172
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22173
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$56()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22174
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "PlayerInfo"

    aput-object v3, v2, v5

    .line 22171
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$57(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22176
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0x13

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22175
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$58(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22178
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22179
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_DownMicNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$59()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22180
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "PlayerInfo"

    aput-object v3, v2, v5

    .line 22177
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$60(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22182
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0x14

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22181
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$61(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22184
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22185
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioDescript_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$62()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22186
    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "TimeStamp"

    aput-object v3, v2, v5

    const-string v3, "DstUserId"

    aput-object v3, v2, v6

    const-string v3, "DstSeatId"

    aput-object v3, v2, v7

    .line 22183
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$63(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22188
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0x15

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22187
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$64(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22190
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22191
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PublishAudioRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$65()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22192
    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "AudioDescript"

    aput-object v3, v2, v5

    const-string v3, "AudioData"

    aput-object v3, v2, v6

    .line 22189
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$66(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22194
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0x16

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22193
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$67(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22196
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22197
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$68()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22198
    new-array v2, v9, [Ljava/lang/String;

    const-string v3, "SendUserId"

    aput-object v3, v2, v5

    const-string v3, "SeatId"

    aput-object v3, v2, v6

    const-string v3, "AudioDescript"

    aput-object v3, v2, v7

    const-string v3, "AudioData"

    aput-object v3, v2, v8

    .line 22195
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$69(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22200
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0x17

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22199
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$70(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22202
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22203
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_P2PInfoNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$71()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22204
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "PlayerInfo"

    aput-object v3, v2, v5

    .line 22201
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$72(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22206
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0x18

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22205
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$73(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22208
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22209
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCheckRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$74()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22210
    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "SendUserId"

    aput-object v3, v2, v5

    const-string v3, "SendCheckNum"

    aput-object v3, v2, v6

    .line 22207
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$75(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22212
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0x19

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22211
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$76(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22214
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22215
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCheckResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$77()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22216
    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "SendUserId"

    aput-object v3, v2, v5

    const-string v3, "SendCheckNum"

    aput-object v3, v2, v6

    .line 22213
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$78(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22218
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0x1a

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22217
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$79(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22220
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22221
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCtrolRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$80()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22222
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "AudioControl"

    aput-object v3, v2, v5

    .line 22219
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$81(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22224
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0x1b

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22223
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$82(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22226
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22227
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCtrolResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$83()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22228
    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "Result"

    aput-object v3, v2, v5

    const-string v3, "MediaControl"

    aput-object v3, v2, v6

    .line 22225
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$84(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22230
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getMessageTypes()Ljava/util/List;

    move-result-object v0

    const/16 v1, 0x1c

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$Descriptor;

    .line 22229
    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$85(Lcom/google/protobuf/Descriptors$Descriptor;)V

    .line 22232
    new-instance v0, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    .line 22233
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_NotifyAudioCtrol_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$86()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v1

    .line 22234
    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "UserId"

    aput-object v3, v2, v5

    const-string v3, "SeatId"

    aput-object v3, v2, v6

    const-string v3, "AudioControl"

    aput-object v3, v2, v7

    .line 22231
    invoke-direct {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;-><init>(Lcom/google/protobuf/Descriptors$Descriptor;[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/example/tutorial/VideoProto;->access$87(Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;)V

    .line 22235
    const/4 v0, 0x0

    return-object v0
.end method
