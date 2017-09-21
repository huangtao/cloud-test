.class public final Lcom/example/tutorial/VideoProto$MediaControlResponse;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$MediaControlResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MediaControlResponse"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    }
.end annotation


# static fields
.field public static final MEDIA_CONTROL_FIELD_NUMBER:I = 0x2

.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$MediaControlResponse;",
            ">;"
        }
    .end annotation
.end field

.field public static final RESULT_FIELD_NUMBER:I = 0x1

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$MediaControlResponse;

.field private static final serialVersionUID:J


# instance fields
.field private bitField0_:I

.field private mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private result_:Lcom/example/tutorial/VideoProto$ResultID;

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 3041
    new-instance v0, Lcom/example/tutorial/VideoProto$MediaControlResponse$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$1;-><init>()V

    .line 3040
    sput-object v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->PARSER:Lcom/google/protobuf/Parser;

    .line 3408
    new-instance v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$MediaControlResponse;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$MediaControlResponse;

    .line 3409
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$MediaControlResponse;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->initFields()V

    .line 3410
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

    .line 2971
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 3092
    iput-byte v7, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->memoizedIsInitialized:B

    .line 3113
    iput v7, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->memoizedSerializedSize:I

    .line 2975
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->initFields()V

    .line 2976
    const/4 v2, 0x0

    .line 2978
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 2980
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 2981
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 3024
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 3025
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->makeExtensionsImmutable()V

    .line 3027
    return-void

    .line 2982
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 2983
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 2988
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v7

    .line 2989
    if-nez v7, :cond_0

    .line 2990
    const/4 v0, 0x1

    .line 2992
    goto :goto_0

    .line 2985
    :sswitch_0
    const/4 v0, 0x1

    .line 2986
    goto :goto_0

    .line 2995
    :sswitch_1
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 2996
    .local v3, "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$ResultID;->valueOf(I)Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v6

    .line 2997
    .local v6, "value":Lcom/example/tutorial/VideoProto$ResultID;
    if-nez v6, :cond_2

    .line 2998
    const/4 v7, 0x1

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 3018
    .end local v3    # "rawValue":I
    .end local v4    # "tag":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$ResultID;
    :catch_0
    move-exception v1

    .line 3019
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    throw v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3023
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v7

    .line 3024
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v8

    iput-object v8, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 3025
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->makeExtensionsImmutable()V

    .line 3026
    throw v7

    .line 3000
    .restart local v3    # "rawValue":I
    .restart local v4    # "tag":I
    .restart local v6    # "value":Lcom/example/tutorial/VideoProto$ResultID;
    :cond_2
    :try_start_2
    iget v7, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->bitField0_:I

    or-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->bitField0_:I

    .line 3001
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 3020
    .end local v3    # "rawValue":I
    .end local v4    # "tag":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$ResultID;
    :catch_1
    move-exception v1

    .line 3021
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v7, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 3022
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    .line 3021
    invoke-direct {v7, v8}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 3022
    invoke-virtual {v7, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    .line 3021
    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 3006
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v4    # "tag":I
    :sswitch_2
    :try_start_4
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 3007
    .restart local v3    # "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$MediaControl;->valueOf(I)Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v6

    .line 3008
    .local v6, "value":Lcom/example/tutorial/VideoProto$MediaControl;
    if-nez v6, :cond_3

    .line 3009
    const/4 v7, 0x2

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;

    goto :goto_0

    .line 3011
    :cond_3
    iget v7, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->bitField0_:I

    or-int/lit8 v7, v7, 0x2

    iput v7, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->bitField0_:I

    .line 3012
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;
    :try_end_4
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 2983
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x10 -> :sswitch_2
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$MediaControlResponse;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 2971
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$MediaControlResponse;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 2951
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 3092
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->memoizedIsInitialized:B

    .line 3113
    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->memoizedSerializedSize:I

    .line 2952
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 2953
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$MediaControlResponse;)V
    .locals 0

    .prologue
    .line 2950
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$MediaControlResponse;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 2954
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 3092
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->memoizedIsInitialized:B

    .line 3113
    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->memoizedSerializedSize:I

    .line 2954
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$MediaControlResponse;Lcom/example/tutorial/VideoProto$ResultID;)V
    .locals 0

    .prologue
    .line 3058
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$MediaControlResponse;Lcom/example/tutorial/VideoProto$MediaControl;)V
    .locals 0

    .prologue
    .line 3074
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$MediaControlResponse;I)V
    .locals 0

    .prologue
    .line 3055
    iput p1, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 2946
    sget-boolean v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$MediaControlResponse;
    .locals 1

    .prologue
    .line 2958
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$MediaControlResponse;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 3030
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MediaControlResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$11()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    .line 3089
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 3090
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 3091
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    .locals 1

    .prologue
    .line 3192
    # invokes: Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->create()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->access$17()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$MediaControlResponse;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$MediaControlResponse;

    .prologue
    .line 3195
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->newBuilder()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MediaControlResponse;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$MediaControlResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3172
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3178
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$MediaControlResponse;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 3142
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlResponse;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 3148
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$MediaControlResponse;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3183
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlResponse;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3189
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$MediaControlResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3162
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3168
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$MediaControlResponse;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 3152
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlResponse;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 3158
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    return-object v0
.end method


# virtual methods
.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MediaControlResponse;
    .locals 1

    .prologue
    .line 2962
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$MediaControlResponse;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MediaControlResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MediaControlResponse;

    move-result-object v0

    return-object v0
.end method

.method public getMediaControl()Lcom/example/tutorial/VideoProto$MediaControl;
    .locals 1

    .prologue
    .line 3085
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    return-object v0
.end method

.method public getParserForType()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$MediaControlResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3052
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getResult()Lcom/example/tutorial/VideoProto$ResultID;
    .locals 1

    .prologue
    .line 3069
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 3115
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->memoizedSerializedSize:I

    .line 3116
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 3129
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 3118
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 3119
    iget v2, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 3121
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$ResultID;->getNumber()I

    move-result v2

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 3123
    :cond_1
    iget v2, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-ne v2, v4, :cond_2

    .line 3125
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$MediaControl;->getNumber()I

    move-result v2

    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 3127
    :cond_2
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 3128
    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->memoizedSerializedSize:I

    move v1, v0

    .line 3129
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 2969
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasMediaControl()Z
    .locals 2

    .prologue
    .line 3079
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->bitField0_:I

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

    .line 3063
    iget v1, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->bitField0_:I

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
    .line 3035
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MediaControlResponse_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$91()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 3037
    const-class v1, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    const-class v2, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    .line 3036
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 3035
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 3094
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->memoizedIsInitialized:B

    .line 3095
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 3098
    :goto_0
    return v1

    .line 3095
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 3097
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    .locals 1

    .prologue
    .line 3193
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->newBuilder()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 3202
    new-instance v0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;)V

    .line 3203
    .local v0, "builder":Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->newBuilderForType()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->newBuilderForType()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    .locals 1

    .prologue
    .line 3197
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->newBuilder(Lcom/example/tutorial/VideoProto$MediaControlResponse;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->toBuilder()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->toBuilder()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

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
    .line 3136
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

    .line 3103
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getSerializedSize()I

    .line 3104
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 3105
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$ResultID;->getNumber()I

    move-result v0

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 3107
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_1

    .line 3108
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MediaControl;->getNumber()I

    move-result v0

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 3110
    :cond_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 3111
    return-void
.end method
