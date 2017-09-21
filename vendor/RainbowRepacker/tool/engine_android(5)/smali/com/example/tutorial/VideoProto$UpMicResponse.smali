.class public final Lcom/example/tutorial/VideoProto$UpMicResponse;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$UpMicResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UpMicResponse"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    }
.end annotation


# static fields
.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$UpMicResponse;",
            ">;"
        }
    .end annotation
.end field

.field public static final PLAYER_INFO_FIELD_NUMBER:I = 0x2

.field public static final RESULT_FIELD_NUMBER:I = 0x1

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$UpMicResponse;

.field private static final serialVersionUID:J


# instance fields
.field private bitField0_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

.field private result_:Lcom/example/tutorial/VideoProto$ResultID;

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 13739
    new-instance v0, Lcom/example/tutorial/VideoProto$UpMicResponse$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$UpMicResponse$1;-><init>()V

    .line 13738
    sput-object v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    .line 14202
    new-instance v0, Lcom/example/tutorial/VideoProto$UpMicResponse;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$UpMicResponse;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$UpMicResponse;

    .line 14203
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$UpMicResponse;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$UpMicResponse;->initFields()V

    .line 14204
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V
    .locals 10
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    const/4 v8, -0x1

    .line 13667
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 13796
    iput-byte v8, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->memoizedIsInitialized:B

    .line 13817
    iput v8, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->memoizedSerializedSize:I

    .line 13671
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse;->initFields()V

    .line 13672
    const/4 v2, 0x0

    .line 13674
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v6

    .line 13676
    .local v6, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 13677
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 13722
    invoke-virtual {v6}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v8

    iput-object v8, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 13723
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse;->makeExtensionsImmutable()V

    .line 13725
    return-void

    .line 13678
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v5

    .line 13679
    .local v5, "tag":I
    sparse-switch v5, :sswitch_data_0

    .line 13684
    invoke-virtual {p0, p1, v6, p2, v5}, Lcom/example/tutorial/VideoProto$UpMicResponse;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v8

    .line 13685
    if-nez v8, :cond_0

    .line 13686
    const/4 v0, 0x1

    .line 13688
    goto :goto_0

    .line 13681
    :sswitch_0
    const/4 v0, 0x1

    .line 13682
    goto :goto_0

    .line 13691
    :sswitch_1
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 13692
    .local v3, "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$ResultID;->valueOf(I)Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v7

    .line 13693
    .local v7, "value":Lcom/example/tutorial/VideoProto$ResultID;
    if-nez v7, :cond_2

    .line 13694
    const/4 v8, 0x1

    invoke-virtual {v6, v8, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 13716
    .end local v3    # "rawValue":I
    .end local v5    # "tag":I
    .end local v7    # "value":Lcom/example/tutorial/VideoProto$ResultID;
    :catch_0
    move-exception v1

    .line 13717
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v8

    throw v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13721
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v8

    .line 13722
    invoke-virtual {v6}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v9

    iput-object v9, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 13723
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse;->makeExtensionsImmutable()V

    .line 13724
    throw v8

    .line 13696
    .restart local v3    # "rawValue":I
    .restart local v5    # "tag":I
    .restart local v7    # "value":Lcom/example/tutorial/VideoProto$ResultID;
    :cond_2
    :try_start_2
    iget v8, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->bitField0_:I

    or-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->bitField0_:I

    .line 13697
    iput-object v7, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 13718
    .end local v3    # "rawValue":I
    .end local v5    # "tag":I
    .end local v7    # "value":Lcom/example/tutorial/VideoProto$ResultID;
    :catch_1
    move-exception v1

    .line 13719
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v8, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 13720
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    .line 13719
    invoke-direct {v8, v9}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 13720
    invoke-virtual {v8, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v8

    .line 13719
    throw v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 13702
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v5    # "tag":I
    :sswitch_2
    const/4 v4, 0x0

    .line 13703
    .local v4, "subBuilder":Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    :try_start_4
    iget v8, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->bitField0_:I

    and-int/lit8 v8, v8, 0x2

    const/4 v9, 0x2

    if-ne v8, v9, :cond_3

    .line 13704
    iget-object v8, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v8}, Lcom/example/tutorial/VideoProto$PlayerInfo;->toBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v4

    .line 13706
    :cond_3
    sget-object v8, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    invoke-virtual {p1, v8, p2}, Lcom/google/protobuf/CodedInputStream;->readMessage(Lcom/google/protobuf/Parser;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite;

    move-result-object v8

    check-cast v8, Lcom/example/tutorial/VideoProto$PlayerInfo;

    iput-object v8, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13707
    if-eqz v4, :cond_4

    .line 13708
    iget-object v8, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v4, v8}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .line 13709
    invoke-virtual {v4}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v8

    iput-object v8, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13711
    :cond_4
    iget v8, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->bitField0_:I

    or-int/lit8 v8, v8, 0x2

    iput v8, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->bitField0_:I
    :try_end_4
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 13679
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x12 -> :sswitch_2
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$UpMicResponse;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 13667
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$UpMicResponse;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 13647
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 13796
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->memoizedIsInitialized:B

    .line 13817
    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->memoizedSerializedSize:I

    .line 13648
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 13649
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$UpMicResponse;)V
    .locals 0

    .prologue
    .line 13646
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicResponse;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 13650
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 13796
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->memoizedIsInitialized:B

    .line 13817
    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->memoizedSerializedSize:I

    .line 13650
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$UpMicResponse;Lcom/example/tutorial/VideoProto$ResultID;)V
    .locals 0

    .prologue
    .line 13756
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$UpMicResponse;Lcom/example/tutorial/VideoProto$PlayerInfo;)V
    .locals 0

    .prologue
    .line 13772
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$UpMicResponse;I)V
    .locals 0

    .prologue
    .line 13753
    iput p1, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 13642
    sget-boolean v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$UpMicResponse;
    .locals 1

    .prologue
    .line 13654
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$UpMicResponse;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 13728
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$47()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    .line 13793
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 13794
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13795
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 1

    .prologue
    .line 13896
    # invokes: Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->create()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->access$17()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$UpMicResponse;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$UpMicResponse;

    .prologue
    .line 13899
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicResponse;->newBuilder()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$UpMicResponse;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$UpMicResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 13876
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicResponse;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 13882
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$UpMicResponse;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 13846
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicResponse;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 13852
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$UpMicResponse;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 13887
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicResponse;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 13893
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicResponse;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$UpMicResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 13866
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicResponse;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 13872
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicResponse;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$UpMicResponse;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 13856
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicResponse;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicResponse;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 13862
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicResponse;

    return-object v0
.end method


# virtual methods
.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicResponse;
    .locals 1

    .prologue
    .line 13658
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$UpMicResponse;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicResponse;

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
            "Lcom/example/tutorial/VideoProto$UpMicResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 13750
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1

    .prologue
    .line 13783
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public getPlayerInfoOrBuilder()Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
    .locals 1

    .prologue
    .line 13789
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public getResult()Lcom/example/tutorial/VideoProto$ResultID;
    .locals 1

    .prologue
    .line 13767
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 13819
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->memoizedSerializedSize:I

    .line 13820
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 13833
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 13822
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 13823
    iget v2, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 13825
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$ResultID;->getNumber()I

    move-result v2

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 13827
    :cond_1
    iget v2, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-ne v2, v4, :cond_2

    .line 13829
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->computeMessageSize(ILcom/google/protobuf/MessageLite;)I

    move-result v2

    add-int/2addr v0, v2

    .line 13831
    :cond_2
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 13832
    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->memoizedSerializedSize:I

    move v1, v0

    .line 13833
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 13665
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasPlayerInfo()Z
    .locals 2

    .prologue
    .line 13777
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->bitField0_:I

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

.method public hasResult()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 13761
    iget v1, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->bitField0_:I

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
    .line 13733
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicResponse_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$103()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 13735
    const-class v1, Lcom/example/tutorial/VideoProto$UpMicResponse;

    const-class v2, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    .line 13734
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 13733
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 13798
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->memoizedIsInitialized:B

    .line 13799
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 13802
    :goto_0
    return v1

    .line 13799
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 13801
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 1

    .prologue
    .line 13897
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicResponse;->newBuilder()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 13906
    new-instance v0, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;)V

    .line 13907
    .local v0, "builder":Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse;->newBuilderForType()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicResponse;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse;->newBuilderForType()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;
    .locals 1

    .prologue
    .line 13901
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse;->newBuilder(Lcom/example/tutorial/VideoProto$UpMicResponse;)Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse;->toBuilder()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse;->toBuilder()Lcom/example/tutorial/VideoProto$UpMicResponse$Builder;

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
    .line 13840
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

    .line 13807
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse;->getSerializedSize()I

    .line 13808
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 13809
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$ResultID;->getNumber()I

    move-result v0

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 13811
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_1

    .line 13812
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicResponse;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->writeMessage(ILcom/google/protobuf/MessageLite;)V

    .line 13814
    :cond_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 13815
    return-void
.end method
