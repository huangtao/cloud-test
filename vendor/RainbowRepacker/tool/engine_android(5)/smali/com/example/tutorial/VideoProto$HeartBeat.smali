.class public final Lcom/example/tutorial/VideoProto$HeartBeat;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$HeartBeatOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "HeartBeat"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    }
.end annotation


# static fields
.field public static final CHANNEL_TYPE_FIELD_NUMBER:I = 0x1

.field public static PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$HeartBeat;",
            ">;"
        }
    .end annotation
.end field

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$HeartBeat;

.field private static final serialVersionUID:J


# instance fields
.field private bitField0_:I

.field private channelType_:Lcom/example/tutorial/VideoProto$ChannelType;

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 8262
    new-instance v0, Lcom/example/tutorial/VideoProto$HeartBeat$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$HeartBeat$1;-><init>()V

    .line 8261
    sput-object v0, Lcom/example/tutorial/VideoProto$HeartBeat;->PARSER:Lcom/google/protobuf/Parser;

    .line 8560
    new-instance v0, Lcom/example/tutorial/VideoProto$HeartBeat;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$HeartBeat;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$HeartBeat;->defaultInstance:Lcom/example/tutorial/VideoProto$HeartBeat;

    .line 8561
    sget-object v0, Lcom/example/tutorial/VideoProto$HeartBeat;->defaultInstance:Lcom/example/tutorial/VideoProto$HeartBeat;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$HeartBeat;->initFields()V

    .line 8562
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

    .line 8203
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 8296
    iput-byte v7, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->memoizedIsInitialized:B

    .line 8314
    iput v7, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->memoizedSerializedSize:I

    .line 8207
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$HeartBeat;->initFields()V

    .line 8208
    const/4 v2, 0x0

    .line 8210
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 8212
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 8213
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 8245
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 8246
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat;->makeExtensionsImmutable()V

    .line 8248
    return-void

    .line 8214
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 8215
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 8220
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$HeartBeat;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v7

    .line 8221
    if-nez v7, :cond_0

    .line 8222
    const/4 v0, 0x1

    .line 8224
    goto :goto_0

    .line 8217
    :sswitch_0
    const/4 v0, 0x1

    .line 8218
    goto :goto_0

    .line 8227
    :sswitch_1
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 8228
    .local v3, "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$ChannelType;->valueOf(I)Lcom/example/tutorial/VideoProto$ChannelType;

    move-result-object v6

    .line 8229
    .local v6, "value":Lcom/example/tutorial/VideoProto$ChannelType;
    if-nez v6, :cond_2

    .line 8230
    const/4 v7, 0x1

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 8239
    .end local v3    # "rawValue":I
    .end local v4    # "tag":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$ChannelType;
    :catch_0
    move-exception v1

    .line 8240
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    throw v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8244
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v7

    .line 8245
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v8

    iput-object v8, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 8246
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat;->makeExtensionsImmutable()V

    .line 8247
    throw v7

    .line 8232
    .restart local v3    # "rawValue":I
    .restart local v4    # "tag":I
    .restart local v6    # "value":Lcom/example/tutorial/VideoProto$ChannelType;
    :cond_2
    :try_start_2
    iget v7, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->bitField0_:I

    or-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->bitField0_:I

    .line 8233
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->channelType_:Lcom/example/tutorial/VideoProto$ChannelType;
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 8241
    .end local v3    # "rawValue":I
    .end local v4    # "tag":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$ChannelType;
    :catch_1
    move-exception v1

    .line 8242
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v7, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 8243
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    .line 8242
    invoke-direct {v7, v8}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 8243
    invoke-virtual {v7, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    .line 8242
    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 8215
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$HeartBeat;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 8203
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$HeartBeat;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 8183
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 8296
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->memoizedIsInitialized:B

    .line 8314
    iput v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->memoizedSerializedSize:I

    .line 8184
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 8185
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$HeartBeat;)V
    .locals 0

    .prologue
    .line 8182
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$HeartBeat;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 8186
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 8296
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->memoizedIsInitialized:B

    .line 8314
    iput v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->memoizedSerializedSize:I

    .line 8186
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$HeartBeat;Lcom/example/tutorial/VideoProto$ChannelType;)V
    .locals 0

    .prologue
    .line 8279
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->channelType_:Lcom/example/tutorial/VideoProto$ChannelType;

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$HeartBeat;I)V
    .locals 0

    .prologue
    .line 8276
    iput p1, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 8178
    sget-boolean v0, Lcom/example/tutorial/VideoProto$HeartBeat;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$HeartBeat;
    .locals 1

    .prologue
    .line 8190
    sget-object v0, Lcom/example/tutorial/VideoProto$HeartBeat;->defaultInstance:Lcom/example/tutorial/VideoProto$HeartBeat;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 8251
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_HeartBeat_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$23()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    .line 8294
    sget-object v0, Lcom/example/tutorial/VideoProto$ChannelType;->CT_TCP_COMPOSITE:Lcom/example/tutorial/VideoProto$ChannelType;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->channelType_:Lcom/example/tutorial/VideoProto$ChannelType;

    .line 8295
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    .locals 1

    .prologue
    .line 8389
    # invokes: Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->create()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->access$17()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$HeartBeat;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$HeartBeat;

    .prologue
    .line 8392
    invoke-static {}, Lcom/example/tutorial/VideoProto$HeartBeat;->newBuilder()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$HeartBeat;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$HeartBeat;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 8369
    sget-object v0, Lcom/example/tutorial/VideoProto$HeartBeat;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$HeartBeat;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$HeartBeat;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 8375
    sget-object v0, Lcom/example/tutorial/VideoProto$HeartBeat;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$HeartBeat;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$HeartBeat;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 8339
    sget-object v0, Lcom/example/tutorial/VideoProto$HeartBeat;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$HeartBeat;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$HeartBeat;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 8345
    sget-object v0, Lcom/example/tutorial/VideoProto$HeartBeat;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$HeartBeat;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$HeartBeat;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 8380
    sget-object v0, Lcom/example/tutorial/VideoProto$HeartBeat;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$HeartBeat;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$HeartBeat;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 8386
    sget-object v0, Lcom/example/tutorial/VideoProto$HeartBeat;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$HeartBeat;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$HeartBeat;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 8359
    sget-object v0, Lcom/example/tutorial/VideoProto$HeartBeat;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$HeartBeat;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$HeartBeat;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 8365
    sget-object v0, Lcom/example/tutorial/VideoProto$HeartBeat;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$HeartBeat;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$HeartBeat;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 8349
    sget-object v0, Lcom/example/tutorial/VideoProto$HeartBeat;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$HeartBeat;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$HeartBeat;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 8355
    sget-object v0, Lcom/example/tutorial/VideoProto$HeartBeat;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$HeartBeat;

    return-object v0
.end method


# virtual methods
.method public getChannelType()Lcom/example/tutorial/VideoProto$ChannelType;
    .locals 1

    .prologue
    .line 8290
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->channelType_:Lcom/example/tutorial/VideoProto$ChannelType;

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$HeartBeat;
    .locals 1

    .prologue
    .line 8194
    sget-object v0, Lcom/example/tutorial/VideoProto$HeartBeat;->defaultInstance:Lcom/example/tutorial/VideoProto$HeartBeat;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$HeartBeat;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$HeartBeat;

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
            "Lcom/example/tutorial/VideoProto$HeartBeat;",
            ">;"
        }
    .end annotation

    .prologue
    .line 8273
    sget-object v0, Lcom/example/tutorial/VideoProto$HeartBeat;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 8316
    iget v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->memoizedSerializedSize:I

    .line 8317
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 8326
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 8319
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 8320
    iget v2, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 8322
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->channelType_:Lcom/example/tutorial/VideoProto$ChannelType;

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$ChannelType;->getNumber()I

    move-result v2

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 8324
    :cond_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 8325
    iput v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->memoizedSerializedSize:I

    move v1, v0

    .line 8326
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 8201
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasChannelType()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 8284
    iget v1, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->bitField0_:I

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
    .line 8256
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_HeartBeat_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$95()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 8258
    const-class v1, Lcom/example/tutorial/VideoProto$HeartBeat;

    const-class v2, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    .line 8257
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 8256
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 8298
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->memoizedIsInitialized:B

    .line 8299
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 8302
    :goto_0
    return v1

    .line 8299
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 8301
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    .locals 1

    .prologue
    .line 8390
    invoke-static {}, Lcom/example/tutorial/VideoProto$HeartBeat;->newBuilder()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 8399
    new-instance v0, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$HeartBeat$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$HeartBeat$Builder;)V

    .line 8400
    .local v0, "builder":Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat;->newBuilderForType()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$HeartBeat;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat;->newBuilderForType()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;
    .locals 1

    .prologue
    .line 8394
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$HeartBeat;->newBuilder(Lcom/example/tutorial/VideoProto$HeartBeat;)Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat;->toBuilder()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat;->toBuilder()Lcom/example/tutorial/VideoProto$HeartBeat$Builder;

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
    .line 8333
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

    .line 8307
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat;->getSerializedSize()I

    .line 8308
    iget v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 8309
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$HeartBeat;->channelType_:Lcom/example/tutorial/VideoProto$ChannelType;

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$ChannelType;->getNumber()I

    move-result v0

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 8311
    :cond_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$HeartBeat;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 8312
    return-void
.end method
