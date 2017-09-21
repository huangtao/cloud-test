.class public final Lcom/example/tutorial/VideoProto$PublishVideoRequest;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$PublishVideoRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PublishVideoRequest"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    }
.end annotation


# static fields
.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$PublishVideoRequest;",
            ">;"
        }
    .end annotation
.end field

.field public static final VIDEO_DATA_FIELD_NUMBER:I = 0x2

.field public static final VIDEO_DESCRIPT_FIELD_NUMBER:I = 0x1

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$PublishVideoRequest;

.field private static final serialVersionUID:J


# instance fields
.field private bitField0_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;

.field private videoData_:Lcom/google/protobuf/ByteString;

.field private videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 9945
    new-instance v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$1;-><init>()V

    .line 9944
    sput-object v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->PARSER:Lcom/google/protobuf/Parser;

    .line 10480
    new-instance v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    .line 10481
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->initFields()V

    .line 10482
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

    .line 9879
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 10022
    iput-byte v6, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->memoizedIsInitialized:B

    .line 10043
    iput v6, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->memoizedSerializedSize:I

    .line 9883
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->initFields()V

    .line 9884
    const/4 v2, 0x0

    .line 9886
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 9888
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 9889
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 9928
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 9929
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->makeExtensionsImmutable()V

    .line 9931
    return-void

    .line 9890
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 9891
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 9896
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v6

    .line 9897
    if-nez v6, :cond_0

    .line 9898
    const/4 v0, 0x1

    .line 9900
    goto :goto_0

    .line 9893
    :sswitch_0
    const/4 v0, 0x1

    .line 9894
    goto :goto_0

    .line 9903
    :sswitch_1
    const/4 v3, 0x0

    .line 9904
    .local v3, "subBuilder":Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    iget v6, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->bitField0_:I

    and-int/lit8 v6, v6, 0x1

    const/4 v7, 0x1

    if-ne v6, v7, :cond_2

    .line 9905
    iget-object v6, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$VideoDescript;->toBuilder()Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    move-result-object v3

    .line 9907
    :cond_2
    sget-object v6, Lcom/example/tutorial/VideoProto$VideoDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-virtual {p1, v6, p2}, Lcom/google/protobuf/CodedInputStream;->readMessage(Lcom/google/protobuf/Parser;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite;

    move-result-object v6

    check-cast v6, Lcom/example/tutorial/VideoProto$VideoDescript;

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 9908
    if-eqz v3, :cond_3

    .line 9909
    iget-object v6, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-virtual {v3, v6}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoDescript;)Lcom/example/tutorial/VideoProto$VideoDescript$Builder;

    .line 9910
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$VideoDescript$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 9912
    :cond_3
    iget v6, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->bitField0_:I

    or-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->bitField0_:I
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 9922
    .end local v3    # "subBuilder":Lcom/example/tutorial/VideoProto$VideoDescript$Builder;
    .end local v4    # "tag":I
    :catch_0
    move-exception v1

    .line 9923
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9927
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v6

    .line 9928
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 9929
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->makeExtensionsImmutable()V

    .line 9930
    throw v6

    .line 9916
    .restart local v4    # "tag":I
    :sswitch_2
    :try_start_2
    iget v6, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->bitField0_:I

    or-int/lit8 v6, v6, 0x2

    iput v6, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->bitField0_:I

    .line 9917
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBytes()Lcom/google/protobuf/ByteString;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->videoData_:Lcom/google/protobuf/ByteString;
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 9924
    .end local v4    # "tag":I
    :catch_1
    move-exception v1

    .line 9925
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v6, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 9926
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    .line 9925
    invoke-direct {v6, v7}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 9926
    invoke-virtual {v6, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    .line 9925
    throw v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 9891
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_1
        0x12 -> :sswitch_2
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$PublishVideoRequest;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 9879
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 9859
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 10022
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->memoizedIsInitialized:B

    .line 10043
    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->memoizedSerializedSize:I

    .line 9860
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 9861
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$PublishVideoRequest;)V
    .locals 0

    .prologue
    .line 9858
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 9862
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 10022
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->memoizedIsInitialized:B

    .line 10043
    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->memoizedSerializedSize:I

    .line 9862
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$PublishVideoRequest;Lcom/example/tutorial/VideoProto$VideoDescript;)V
    .locals 0

    .prologue
    .line 9962
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$PublishVideoRequest;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .prologue
    .line 9996
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->videoData_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$PublishVideoRequest;I)V
    .locals 0

    .prologue
    .line 9959
    iput p1, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 9854
    sget-boolean v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    .locals 1

    .prologue
    .line 9866
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 9934
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PublishVideoRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$29()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    .line 10019
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    .line 10020
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->videoData_:Lcom/google/protobuf/ByteString;

    .line 10021
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 1

    .prologue
    .line 10122
    # invokes: Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->create()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->access$17()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$PublishVideoRequest;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    .prologue
    .line 10125
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->newBuilder()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PublishVideoRequest;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 10102
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 10108
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 10072
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 10078
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 10113
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 10119
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 10092
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 10098
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 10082
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 10088
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    return-object v0
.end method


# virtual methods
.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PublishVideoRequest;
    .locals 1

    .prologue
    .line 9870
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PublishVideoRequest;

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
            "Lcom/example/tutorial/VideoProto$PublishVideoRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 9956
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 10045
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->memoizedSerializedSize:I

    .line 10046
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 10059
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 10048
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 10049
    iget v2, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 10051
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeMessageSize(ILcom/google/protobuf/MessageLite;)I

    move-result v2

    add-int/2addr v0, v2

    .line 10053
    :cond_1
    iget v2, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-ne v2, v4, :cond_2

    .line 10055
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->videoData_:Lcom/google/protobuf/ByteString;

    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v2

    add-int/2addr v0, v2

    .line 10057
    :cond_2
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 10058
    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->memoizedSerializedSize:I

    move v1, v0

    .line 10059
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 9877
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public getVideoData()Lcom/google/protobuf/ByteString;
    .locals 1

    .prologue
    .line 10015
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->videoData_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getVideoDescript()Lcom/example/tutorial/VideoProto$VideoDescript;
    .locals 1

    .prologue
    .line 9981
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    return-object v0
.end method

.method public getVideoDescriptOrBuilder()Lcom/example/tutorial/VideoProto$VideoDescriptOrBuilder;
    .locals 1

    .prologue
    .line 9991
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    return-object v0
.end method

.method public hasVideoData()Z
    .locals 2

    .prologue
    .line 10005
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->bitField0_:I

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

.method public hasVideoDescript()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 9971
    iget v1, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->bitField0_:I

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
    .line 9939
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PublishVideoRequest_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$97()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 9941
    const-class v1, Lcom/example/tutorial/VideoProto$PublishVideoRequest;

    const-class v2, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    .line 9940
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 9939
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 10024
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->memoizedIsInitialized:B

    .line 10025
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 10028
    :goto_0
    return v1

    .line 10025
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 10027
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 1

    .prologue
    .line 10123
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->newBuilder()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 10132
    new-instance v0, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;)V

    .line 10133
    .local v0, "builder":Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->newBuilderForType()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->newBuilderForType()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;
    .locals 1

    .prologue
    .line 10127
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->newBuilder(Lcom/example/tutorial/VideoProto$PublishVideoRequest;)Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->toBuilder()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->toBuilder()Lcom/example/tutorial/VideoProto$PublishVideoRequest$Builder;

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
    .line 10066
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage;->writeReplace()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 3
    .param p1, "output"    # Lcom/google/protobuf/CodedOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 10033
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->getSerializedSize()I

    .line 10034
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 10035
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->videoDescript_:Lcom/example/tutorial/VideoProto$VideoDescript;

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeMessage(ILcom/google/protobuf/MessageLite;)V

    .line 10037
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_1

    .line 10038
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->videoData_:Lcom/google/protobuf/ByteString;

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    .line 10040
    :cond_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishVideoRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 10041
    return-void
.end method
