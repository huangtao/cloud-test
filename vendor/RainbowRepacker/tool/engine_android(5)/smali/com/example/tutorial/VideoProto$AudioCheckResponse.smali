.class public final Lcom/example/tutorial/VideoProto$AudioCheckResponse;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$AudioCheckResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AudioCheckResponse"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    }
.end annotation


# static fields
.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$AudioCheckResponse;",
            ">;"
        }
    .end annotation
.end field

.field public static final SEND_CHECK_NUM_FIELD_NUMBER:I = 0x2

.field public static final SEND_USER_ID_FIELD_NUMBER:I = 0x1

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$AudioCheckResponse;

.field private static final serialVersionUID:J


# instance fields
.field private bitField0_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private sendCheckNum_:I

.field private sendUserId_:I

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 19841
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$1;-><init>()V

    .line 19840
    sput-object v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->PARSER:Lcom/google/protobuf/Parser;

    .line 20250
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    .line 20251
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->initFields()V

    .line 20252
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V
    .locals 7
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    const/4 v5, -0x1

    .line 19783
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 19908
    iput-byte v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->memoizedIsInitialized:B

    .line 19929
    iput v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->memoizedSerializedSize:I

    .line 19787
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->initFields()V

    .line 19788
    const/4 v2, 0x0

    .line 19790
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v4

    .line 19792
    .local v4, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 19793
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 19824
    invoke-virtual {v4}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v5

    iput-object v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 19825
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->makeExtensionsImmutable()V

    .line 19827
    return-void

    .line 19794
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v3

    .line 19795
    .local v3, "tag":I
    sparse-switch v3, :sswitch_data_0

    .line 19800
    invoke-virtual {p0, p1, v4, p2, v3}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v5

    .line 19801
    if-nez v5, :cond_0

    .line 19802
    const/4 v0, 0x1

    .line 19804
    goto :goto_0

    .line 19797
    :sswitch_0
    const/4 v0, 0x1

    .line 19798
    goto :goto_0

    .line 19807
    :sswitch_1
    iget v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->bitField0_:I

    or-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->bitField0_:I

    .line 19808
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v5

    iput v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->sendUserId_:I
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 19818
    .end local v3    # "tag":I
    :catch_0
    move-exception v1

    .line 19819
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v5

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19823
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v5

    .line 19824
    invoke-virtual {v4}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 19825
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->makeExtensionsImmutable()V

    .line 19826
    throw v5

    .line 19812
    .restart local v3    # "tag":I
    :sswitch_2
    :try_start_2
    iget v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->bitField0_:I

    or-int/lit8 v5, v5, 0x2

    iput v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->bitField0_:I

    .line 19813
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v5

    iput v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->sendCheckNum_:I
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 19820
    .end local v3    # "tag":I
    :catch_1
    move-exception v1

    .line 19821
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v5, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 19822
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 19821
    invoke-direct {v5, v6}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 19822
    invoke-virtual {v5, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v5

    .line 19821
    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 19795
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x10 -> :sswitch_2
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$AudioCheckResponse;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 19783
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 19763
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 19908
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->memoizedIsInitialized:B

    .line 19929
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->memoizedSerializedSize:I

    .line 19764
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 19765
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$AudioCheckResponse;)V
    .locals 0

    .prologue
    .line 19762
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 19766
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 19908
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->memoizedIsInitialized:B

    .line 19929
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->memoizedSerializedSize:I

    .line 19766
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$AudioCheckResponse;I)V
    .locals 0

    .prologue
    .line 19858
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->sendUserId_:I

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$AudioCheckResponse;I)V
    .locals 0

    .prologue
    .line 19882
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->sendCheckNum_:I

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$AudioCheckResponse;I)V
    .locals 0

    .prologue
    .line 19855
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 19758
    sget-boolean v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    .locals 1

    .prologue
    .line 19770
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 19830
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCheckResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$77()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 19905
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->sendUserId_:I

    .line 19906
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->sendCheckNum_:I

    .line 19907
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .locals 1

    .prologue
    .line 20008
    # invokes: Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->create()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->access$17()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$AudioCheckResponse;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    .prologue
    .line 20011
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->newBuilder()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCheckResponse;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19988
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19994
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 19958
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 19964
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19999
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20005
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19978
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19984
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 19968
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 19974
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    return-object v0
.end method


# virtual methods
.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    .locals 1

    .prologue
    .line 19774
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCheckResponse;

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
            "Lcom/example/tutorial/VideoProto$AudioCheckResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 19852
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSendCheckNum()I
    .locals 1

    .prologue
    .line 19901
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->sendCheckNum_:I

    return v0
.end method

.method public getSendUserId()I
    .locals 1

    .prologue
    .line 19877
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->sendUserId_:I

    return v0
.end method

.method public getSerializedSize()I
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 19931
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->memoizedSerializedSize:I

    .line 19932
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 19945
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 19934
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 19935
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 19937
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->sendUserId_:I

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 19939
    :cond_1
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-ne v2, v4, :cond_2

    .line 19941
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->sendCheckNum_:I

    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 19943
    :cond_2
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 19944
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->memoizedSerializedSize:I

    move v1, v0

    .line 19945
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 19781
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasSendCheckNum()Z
    .locals 2

    .prologue
    .line 19891
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->bitField0_:I

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

    .line 19867
    iget v1, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->bitField0_:I

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
    .line 19835
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCheckResponse_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$113()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 19837
    const-class v1, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    const-class v2, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    .line 19836
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 19835
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 19910
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->memoizedIsInitialized:B

    .line 19911
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 19914
    :goto_0
    return v1

    .line 19911
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 19913
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .locals 1

    .prologue
    .line 20009
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->newBuilder()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 20018
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;)V

    .line 20019
    .local v0, "builder":Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->newBuilderForType()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->newBuilderForType()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .locals 1

    .prologue
    .line 20013
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->newBuilder(Lcom/example/tutorial/VideoProto$AudioCheckResponse;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->toBuilder()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->toBuilder()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

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
    .line 19952
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

    .line 19919
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->getSerializedSize()I

    .line 19920
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 19921
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->sendUserId_:I

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 19923
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_1

    .line 19924
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->sendCheckNum_:I

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 19926
    :cond_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 19927
    return-void
.end method
