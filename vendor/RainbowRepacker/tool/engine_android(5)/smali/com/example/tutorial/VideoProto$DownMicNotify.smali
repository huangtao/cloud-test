.class public final Lcom/example/tutorial/VideoProto$DownMicNotify;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$DownMicNotifyOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DownMicNotify"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    }
.end annotation


# static fields
.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$DownMicNotify;",
            ">;"
        }
    .end annotation
.end field

.field public static final PLAYER_INFO_FIELD_NUMBER:I = 0x1

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$DownMicNotify;

.field private static final serialVersionUID:J


# instance fields
.field private bitField0_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 15806
    new-instance v0, Lcom/example/tutorial/VideoProto$DownMicNotify$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$DownMicNotify$1;-><init>()V

    .line 15805
    sput-object v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    .line 16248
    new-instance v0, Lcom/example/tutorial/VideoProto$DownMicNotify;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$DownMicNotify;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->defaultInstance:Lcom/example/tutorial/VideoProto$DownMicNotify;

    .line 16249
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->defaultInstance:Lcom/example/tutorial/VideoProto$DownMicNotify;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$DownMicNotify;->initFields()V

    .line 16250
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

    .line 15745
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 15858
    iput-byte v6, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->memoizedIsInitialized:B

    .line 15876
    iput v6, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->memoizedSerializedSize:I

    .line 15749
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify;->initFields()V

    .line 15750
    const/4 v2, 0x0

    .line 15752
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 15754
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 15755
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 15789
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 15790
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify;->makeExtensionsImmutable()V

    .line 15792
    return-void

    .line 15756
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 15757
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 15762
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$DownMicNotify;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v6

    .line 15763
    if-nez v6, :cond_0

    .line 15764
    const/4 v0, 0x1

    .line 15766
    goto :goto_0

    .line 15759
    :sswitch_0
    const/4 v0, 0x1

    .line 15760
    goto :goto_0

    .line 15769
    :sswitch_1
    const/4 v3, 0x0

    .line 15770
    .local v3, "subBuilder":Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    iget v6, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->bitField0_:I

    and-int/lit8 v6, v6, 0x1

    const/4 v7, 0x1

    if-ne v6, v7, :cond_2

    .line 15771
    iget-object v6, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$PlayerInfo;->toBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v3

    .line 15773
    :cond_2
    sget-object v6, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    invoke-virtual {p1, v6, p2}, Lcom/google/protobuf/CodedInputStream;->readMessage(Lcom/google/protobuf/Parser;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite;

    move-result-object v6

    check-cast v6, Lcom/example/tutorial/VideoProto$PlayerInfo;

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15774
    if-eqz v3, :cond_3

    .line 15775
    iget-object v6, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v3, v6}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .line 15776
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15778
    :cond_3
    iget v6, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->bitField0_:I

    or-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->bitField0_:I
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 15783
    .end local v3    # "subBuilder":Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .end local v4    # "tag":I
    :catch_0
    move-exception v1

    .line 15784
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15788
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v6

    .line 15789
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 15790
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify;->makeExtensionsImmutable()V

    .line 15791
    throw v6

    .line 15785
    :catch_1
    move-exception v1

    .line 15786
    .local v1, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v6, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 15787
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    .line 15786
    invoke-direct {v6, v7}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 15787
    invoke-virtual {v6, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    .line 15786
    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 15757
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_1
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$DownMicNotify;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 15745
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$DownMicNotify;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 15725
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 15858
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->memoizedIsInitialized:B

    .line 15876
    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->memoizedSerializedSize:I

    .line 15726
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 15727
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$DownMicNotify;)V
    .locals 0

    .prologue
    .line 15724
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$DownMicNotify;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 15728
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 15858
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->memoizedIsInitialized:B

    .line 15876
    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->memoizedSerializedSize:I

    .line 15728
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$DownMicNotify;Lcom/example/tutorial/VideoProto$PlayerInfo;)V
    .locals 0

    .prologue
    .line 15823
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$DownMicNotify;I)V
    .locals 0

    .prologue
    .line 15820
    iput p1, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 15720
    sget-boolean v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$DownMicNotify;
    .locals 1

    .prologue
    .line 15732
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->defaultInstance:Lcom/example/tutorial/VideoProto$DownMicNotify;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 15795
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_DownMicNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$59()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    .line 15856
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15857
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    .locals 1

    .prologue
    .line 15951
    # invokes: Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->create()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->access$17()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$DownMicNotify;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$DownMicNotify;

    .prologue
    .line 15954
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicNotify;->newBuilder()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$DownMicNotify;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$DownMicNotify;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15931
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicNotify;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicNotify;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15937
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicNotify;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$DownMicNotify;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 15901
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicNotify;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicNotify;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 15907
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicNotify;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$DownMicNotify;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15942
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicNotify;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicNotify;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15948
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicNotify;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$DownMicNotify;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15921
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicNotify;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicNotify;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15927
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicNotify;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$DownMicNotify;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 15911
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicNotify;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicNotify;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 15917
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicNotify;

    return-object v0
.end method


# virtual methods
.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$DownMicNotify;
    .locals 1

    .prologue
    .line 15736
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->defaultInstance:Lcom/example/tutorial/VideoProto$DownMicNotify;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$DownMicNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$DownMicNotify;

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
            "Lcom/example/tutorial/VideoProto$DownMicNotify;",
            ">;"
        }
    .end annotation

    .prologue
    .line 15817
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1

    .prologue
    .line 15842
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public getPlayerInfoOrBuilder()Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
    .locals 1

    .prologue
    .line 15852
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 15878
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->memoizedSerializedSize:I

    .line 15879
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 15888
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 15881
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 15882
    iget v2, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 15884
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeMessageSize(ILcom/google/protobuf/MessageLite;)I

    move-result v2

    add-int/2addr v0, v2

    .line 15886
    :cond_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 15887
    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->memoizedSerializedSize:I

    move v1, v0

    .line 15888
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 15743
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasPlayerInfo()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 15832
    iget v1, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->bitField0_:I

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
    .line 15800
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_DownMicNotify_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$107()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 15802
    const-class v1, Lcom/example/tutorial/VideoProto$DownMicNotify;

    const-class v2, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    .line 15801
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 15800
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 15860
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->memoizedIsInitialized:B

    .line 15861
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 15864
    :goto_0
    return v1

    .line 15861
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 15863
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    .locals 1

    .prologue
    .line 15952
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicNotify;->newBuilder()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 15961
    new-instance v0, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;)V

    .line 15962
    .local v0, "builder":Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify;->newBuilderForType()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$DownMicNotify;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify;->newBuilderForType()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;
    .locals 1

    .prologue
    .line 15956
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify;->newBuilder(Lcom/example/tutorial/VideoProto$DownMicNotify;)Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify;->toBuilder()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify;->toBuilder()Lcom/example/tutorial/VideoProto$DownMicNotify$Builder;

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
    .line 15895
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage;->writeReplace()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 2
    .param p1, "output"    # Lcom/google/protobuf/CodedOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 15869
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify;->getSerializedSize()I

    .line 15870
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 15871
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeMessage(ILcom/google/protobuf/MessageLite;)V

    .line 15873
    :cond_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicNotify;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 15874
    return-void
.end method
