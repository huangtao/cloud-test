.class public final Lcom/example/tutorial/VideoProto$UpMicRequest;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$UpMicRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UpMicRequest"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    }
.end annotation


# static fields
.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$UpMicRequest;",
            ">;"
        }
    .end annotation
.end field

.field public static final PLAYER_INFO_FIELD_NUMBER:I = 0x1

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$UpMicRequest;

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
    .line 13207
    new-instance v0, Lcom/example/tutorial/VideoProto$UpMicRequest$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$UpMicRequest$1;-><init>()V

    .line 13206
    sput-object v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->PARSER:Lcom/google/protobuf/Parser;

    .line 13605
    new-instance v0, Lcom/example/tutorial/VideoProto$UpMicRequest;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$UpMicRequest;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$UpMicRequest;

    .line 13606
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$UpMicRequest;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$UpMicRequest;->initFields()V

    .line 13607
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

    .line 13146
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 13247
    iput-byte v6, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->memoizedIsInitialized:B

    .line 13265
    iput v6, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->memoizedSerializedSize:I

    .line 13150
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest;->initFields()V

    .line 13151
    const/4 v2, 0x0

    .line 13153
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 13155
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 13156
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 13190
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 13191
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest;->makeExtensionsImmutable()V

    .line 13193
    return-void

    .line 13157
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 13158
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 13163
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$UpMicRequest;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v6

    .line 13164
    if-nez v6, :cond_0

    .line 13165
    const/4 v0, 0x1

    .line 13167
    goto :goto_0

    .line 13160
    :sswitch_0
    const/4 v0, 0x1

    .line 13161
    goto :goto_0

    .line 13170
    :sswitch_1
    const/4 v3, 0x0

    .line 13171
    .local v3, "subBuilder":Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    iget v6, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->bitField0_:I

    and-int/lit8 v6, v6, 0x1

    const/4 v7, 0x1

    if-ne v6, v7, :cond_2

    .line 13172
    iget-object v6, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$PlayerInfo;->toBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v3

    .line 13174
    :cond_2
    sget-object v6, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    invoke-virtual {p1, v6, p2}, Lcom/google/protobuf/CodedInputStream;->readMessage(Lcom/google/protobuf/Parser;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite;

    move-result-object v6

    check-cast v6, Lcom/example/tutorial/VideoProto$PlayerInfo;

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13175
    if-eqz v3, :cond_3

    .line 13176
    iget-object v6, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v3, v6}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .line 13177
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13179
    :cond_3
    iget v6, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->bitField0_:I

    or-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->bitField0_:I
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 13184
    .end local v3    # "subBuilder":Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .end local v4    # "tag":I
    :catch_0
    move-exception v1

    .line 13185
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13189
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v6

    .line 13190
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 13191
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest;->makeExtensionsImmutable()V

    .line 13192
    throw v6

    .line 13186
    :catch_1
    move-exception v1

    .line 13187
    .local v1, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v6, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 13188
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    .line 13187
    invoke-direct {v6, v7}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 13188
    invoke-virtual {v6, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    .line 13187
    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 13158
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_1
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$UpMicRequest;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 13146
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$UpMicRequest;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 13126
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 13247
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->memoizedIsInitialized:B

    .line 13265
    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->memoizedSerializedSize:I

    .line 13127
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 13128
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$UpMicRequest;)V
    .locals 0

    .prologue
    .line 13125
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicRequest;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 13129
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 13247
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->memoizedIsInitialized:B

    .line 13265
    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->memoizedSerializedSize:I

    .line 13129
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$UpMicRequest;Lcom/example/tutorial/VideoProto$PlayerInfo;)V
    .locals 0

    .prologue
    .line 13224
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$UpMicRequest;I)V
    .locals 0

    .prologue
    .line 13221
    iput p1, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 13121
    sget-boolean v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$UpMicRequest;
    .locals 1

    .prologue
    .line 13133
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$UpMicRequest;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 13196
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$44()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    .line 13245
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 13246
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    .locals 1

    .prologue
    .line 13340
    # invokes: Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->create()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->access$17()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$UpMicRequest;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$UpMicRequest;

    .prologue
    .line 13343
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicRequest;->newBuilder()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$UpMicRequest;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$UpMicRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 13320
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicRequest;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 13326
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$UpMicRequest;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 13290
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicRequest;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 13296
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$UpMicRequest;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 13331
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicRequest;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 13337
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicRequest;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$UpMicRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 13310
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicRequest;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 13316
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicRequest;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$UpMicRequest;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 13300
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicRequest;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicRequest;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 13306
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicRequest;

    return-object v0
.end method


# virtual methods
.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicRequest;
    .locals 1

    .prologue
    .line 13137
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$UpMicRequest;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicRequest;

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
            "Lcom/example/tutorial/VideoProto$UpMicRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 13218
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicRequest;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1

    .prologue
    .line 13235
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public getPlayerInfoOrBuilder()Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
    .locals 1

    .prologue
    .line 13241
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 13267
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->memoizedSerializedSize:I

    .line 13268
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 13277
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 13270
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 13271
    iget v2, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 13273
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeMessageSize(ILcom/google/protobuf/MessageLite;)I

    move-result v2

    add-int/2addr v0, v2

    .line 13275
    :cond_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 13276
    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->memoizedSerializedSize:I

    move v1, v0

    .line 13277
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 13144
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasPlayerInfo()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 13229
    iget v1, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->bitField0_:I

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
    .line 13201
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicRequest_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$102()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 13203
    const-class v1, Lcom/example/tutorial/VideoProto$UpMicRequest;

    const-class v2, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    .line 13202
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 13201
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 13249
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->memoizedIsInitialized:B

    .line 13250
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 13253
    :goto_0
    return v1

    .line 13250
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 13252
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    .locals 1

    .prologue
    .line 13341
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicRequest;->newBuilder()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 13350
    new-instance v0, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;)V

    .line 13351
    .local v0, "builder":Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest;->newBuilderForType()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicRequest;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest;->newBuilderForType()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;
    .locals 1

    .prologue
    .line 13345
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest;->newBuilder(Lcom/example/tutorial/VideoProto$UpMicRequest;)Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest;->toBuilder()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest;->toBuilder()Lcom/example/tutorial/VideoProto$UpMicRequest$Builder;

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
    .line 13284
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

    .line 13258
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest;->getSerializedSize()I

    .line 13259
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 13260
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicRequest;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeMessage(ILcom/google/protobuf/MessageLite;)V

    .line 13262
    :cond_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 13263
    return-void
.end method
