.class public final Lcom/example/tutorial/VideoProto$DownMicResponse;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$DownMicResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DownMicResponse"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    }
.end annotation


# static fields
.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$DownMicResponse;",
            ">;"
        }
    .end annotation
.end field

.field public static final RESULT_FIELD_NUMBER:I = 0x1

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$DownMicResponse;

.field private static final serialVersionUID:J


# instance fields
.field private bitField0_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private result_:Lcom/example/tutorial/VideoProto$ResultID;

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 14816
    new-instance v0, Lcom/example/tutorial/VideoProto$DownMicResponse$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$DownMicResponse$1;-><init>()V

    .line 14815
    sput-object v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    .line 15114
    new-instance v0, Lcom/example/tutorial/VideoProto$DownMicResponse;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$DownMicResponse;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$DownMicResponse;

    .line 15115
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$DownMicResponse;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$DownMicResponse;->initFields()V

    .line 15116
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

    .line 14757
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 14850
    iput-byte v7, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->memoizedIsInitialized:B

    .line 14868
    iput v7, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->memoizedSerializedSize:I

    .line 14761
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse;->initFields()V

    .line 14762
    const/4 v2, 0x0

    .line 14764
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 14766
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 14767
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 14799
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 14800
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse;->makeExtensionsImmutable()V

    .line 14802
    return-void

    .line 14768
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 14769
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 14774
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$DownMicResponse;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v7

    .line 14775
    if-nez v7, :cond_0

    .line 14776
    const/4 v0, 0x1

    .line 14778
    goto :goto_0

    .line 14771
    :sswitch_0
    const/4 v0, 0x1

    .line 14772
    goto :goto_0

    .line 14781
    :sswitch_1
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 14782
    .local v3, "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$ResultID;->valueOf(I)Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v6

    .line 14783
    .local v6, "value":Lcom/example/tutorial/VideoProto$ResultID;
    if-nez v6, :cond_2

    .line 14784
    const/4 v7, 0x1

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 14793
    .end local v3    # "rawValue":I
    .end local v4    # "tag":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$ResultID;
    :catch_0
    move-exception v1

    .line 14794
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    throw v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14798
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v7

    .line 14799
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v8

    iput-object v8, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 14800
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse;->makeExtensionsImmutable()V

    .line 14801
    throw v7

    .line 14786
    .restart local v3    # "rawValue":I
    .restart local v4    # "tag":I
    .restart local v6    # "value":Lcom/example/tutorial/VideoProto$ResultID;
    :cond_2
    :try_start_2
    iget v7, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->bitField0_:I

    or-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->bitField0_:I

    .line 14787
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 14795
    .end local v3    # "rawValue":I
    .end local v4    # "tag":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$ResultID;
    :catch_1
    move-exception v1

    .line 14796
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v7, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 14797
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    .line 14796
    invoke-direct {v7, v8}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 14797
    invoke-virtual {v7, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    .line 14796
    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 14769
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$DownMicResponse;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 14757
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$DownMicResponse;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 14737
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 14850
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->memoizedIsInitialized:B

    .line 14868
    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->memoizedSerializedSize:I

    .line 14738
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 14739
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$DownMicResponse;)V
    .locals 0

    .prologue
    .line 14736
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$DownMicResponse;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 14740
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 14850
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->memoizedIsInitialized:B

    .line 14868
    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->memoizedSerializedSize:I

    .line 14740
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$DownMicResponse;Lcom/example/tutorial/VideoProto$ResultID;)V
    .locals 0

    .prologue
    .line 14833
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$DownMicResponse;I)V
    .locals 0

    .prologue
    .line 14830
    iput p1, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 14732
    sget-boolean v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$DownMicResponse;
    .locals 1

    .prologue
    .line 14744
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$DownMicResponse;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 14805
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_DownMicResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$53()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    .line 14848
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 14849
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    .locals 1

    .prologue
    .line 14943
    # invokes: Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->create()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->access$17()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$DownMicResponse;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$DownMicResponse;

    .prologue
    .line 14946
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicResponse;->newBuilder()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$DownMicResponse;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$DownMicResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 14923
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicResponse;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 14929
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$DownMicResponse;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 14893
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicResponse;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 14899
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$DownMicResponse;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 14934
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicResponse;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 14940
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicResponse;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$DownMicResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 14913
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicResponse;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 14919
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicResponse;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$DownMicResponse;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 14903
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicResponse;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicResponse;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 14909
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicResponse;

    return-object v0
.end method


# virtual methods
.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$DownMicResponse;
    .locals 1

    .prologue
    .line 14748
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$DownMicResponse;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$DownMicResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$DownMicResponse;

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
            "Lcom/example/tutorial/VideoProto$DownMicResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 14827
    sget-object v0, Lcom/example/tutorial/VideoProto$DownMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getResult()Lcom/example/tutorial/VideoProto$ResultID;
    .locals 1

    .prologue
    .line 14844
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 14870
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->memoizedSerializedSize:I

    .line 14871
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 14880
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 14873
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 14874
    iget v2, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 14876
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$ResultID;->getNumber()I

    move-result v2

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 14878
    :cond_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 14879
    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->memoizedSerializedSize:I

    move v1, v0

    .line 14880
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 14755
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasResult()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 14838
    iget v1, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->bitField0_:I

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
    .line 14810
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_DownMicResponse_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$105()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 14812
    const-class v1, Lcom/example/tutorial/VideoProto$DownMicResponse;

    const-class v2, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    .line 14811
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 14810
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 14852
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->memoizedIsInitialized:B

    .line 14853
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 14856
    :goto_0
    return v1

    .line 14853
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 14855
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    .locals 1

    .prologue
    .line 14944
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicResponse;->newBuilder()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 14953
    new-instance v0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;)V

    .line 14954
    .local v0, "builder":Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse;->newBuilderForType()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$DownMicResponse;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse;->newBuilderForType()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    .locals 1

    .prologue
    .line 14948
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse;->newBuilder(Lcom/example/tutorial/VideoProto$DownMicResponse;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse;->toBuilder()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse;->toBuilder()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

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
    .line 14887
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

    .line 14861
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse;->getSerializedSize()I

    .line 14862
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 14863
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$ResultID;->getNumber()I

    move-result v0

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 14865
    :cond_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 14866
    return-void
.end method
