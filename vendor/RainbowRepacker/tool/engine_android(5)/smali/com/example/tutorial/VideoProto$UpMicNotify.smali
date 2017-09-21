.class public final Lcom/example/tutorial/VideoProto$UpMicNotify;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$UpMicNotifyOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UpMicNotify"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    }
.end annotation


# static fields
.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$UpMicNotify;",
            ">;"
        }
    .end annotation
.end field

.field public static final PLAYER_INFO_FIELD_NUMBER:I = 0x1

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$UpMicNotify;

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
    .line 15239
    new-instance v0, Lcom/example/tutorial/VideoProto$UpMicNotify$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$UpMicNotify$1;-><init>()V

    .line 15238
    sput-object v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    .line 15681
    new-instance v0, Lcom/example/tutorial/VideoProto$UpMicNotify;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$UpMicNotify;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->defaultInstance:Lcom/example/tutorial/VideoProto$UpMicNotify;

    .line 15682
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->defaultInstance:Lcom/example/tutorial/VideoProto$UpMicNotify;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$UpMicNotify;->initFields()V

    .line 15683
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

    .line 15178
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 15291
    iput-byte v6, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->memoizedIsInitialized:B

    .line 15309
    iput v6, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->memoizedSerializedSize:I

    .line 15182
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify;->initFields()V

    .line 15183
    const/4 v2, 0x0

    .line 15185
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 15187
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 15188
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 15222
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 15223
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify;->makeExtensionsImmutable()V

    .line 15225
    return-void

    .line 15189
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 15190
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 15195
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$UpMicNotify;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v6

    .line 15196
    if-nez v6, :cond_0

    .line 15197
    const/4 v0, 0x1

    .line 15199
    goto :goto_0

    .line 15192
    :sswitch_0
    const/4 v0, 0x1

    .line 15193
    goto :goto_0

    .line 15202
    :sswitch_1
    const/4 v3, 0x0

    .line 15203
    .local v3, "subBuilder":Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    iget v6, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->bitField0_:I

    and-int/lit8 v6, v6, 0x1

    const/4 v7, 0x1

    if-ne v6, v7, :cond_2

    .line 15204
    iget-object v6, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$PlayerInfo;->toBuilder()Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    move-result-object v3

    .line 15206
    :cond_2
    sget-object v6, Lcom/example/tutorial/VideoProto$PlayerInfo;->PARSER:Lcom/google/protobuf/Parser;

    invoke-virtual {p1, v6, p2}, Lcom/google/protobuf/CodedInputStream;->readMessage(Lcom/google/protobuf/Parser;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite;

    move-result-object v6

    check-cast v6, Lcom/example/tutorial/VideoProto$PlayerInfo;

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15207
    if-eqz v3, :cond_3

    .line 15208
    iget-object v6, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {v3, v6}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PlayerInfo;)Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;

    .line 15209
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15211
    :cond_3
    iget v6, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->bitField0_:I

    or-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->bitField0_:I
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 15216
    .end local v3    # "subBuilder":Lcom/example/tutorial/VideoProto$PlayerInfo$Builder;
    .end local v4    # "tag":I
    :catch_0
    move-exception v1

    .line 15217
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15221
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v6

    .line 15222
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 15223
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify;->makeExtensionsImmutable()V

    .line 15224
    throw v6

    .line 15218
    :catch_1
    move-exception v1

    .line 15219
    .local v1, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v6, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 15220
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    .line 15219
    invoke-direct {v6, v7}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 15220
    invoke-virtual {v6, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    .line 15219
    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 15190
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_1
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$UpMicNotify;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 15178
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$UpMicNotify;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 15158
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 15291
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->memoizedIsInitialized:B

    .line 15309
    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->memoizedSerializedSize:I

    .line 15159
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 15160
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$UpMicNotify;)V
    .locals 0

    .prologue
    .line 15157
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicNotify;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 15161
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 15291
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->memoizedIsInitialized:B

    .line 15309
    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->memoizedSerializedSize:I

    .line 15161
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$UpMicNotify;Lcom/example/tutorial/VideoProto$PlayerInfo;)V
    .locals 0

    .prologue
    .line 15256
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$UpMicNotify;I)V
    .locals 0

    .prologue
    .line 15253
    iput p1, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 15153
    sget-boolean v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$UpMicNotify;
    .locals 1

    .prologue
    .line 15165
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->defaultInstance:Lcom/example/tutorial/VideoProto$UpMicNotify;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 15228
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$56()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    .line 15289
    invoke-static {}, Lcom/example/tutorial/VideoProto$PlayerInfo;->getDefaultInstance()Lcom/example/tutorial/VideoProto$PlayerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    .line 15290
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    .locals 1

    .prologue
    .line 15384
    # invokes: Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->create()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->access$17()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$UpMicNotify;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$UpMicNotify;

    .prologue
    .line 15387
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicNotify;->newBuilder()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$UpMicNotify;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$UpMicNotify;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15364
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicNotify;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicNotify;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15370
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicNotify;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$UpMicNotify;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 15334
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicNotify;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicNotify;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 15340
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicNotify;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$UpMicNotify;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15375
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicNotify;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicNotify;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15381
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicNotify;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$UpMicNotify;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15354
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicNotify;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicNotify;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15360
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicNotify;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$UpMicNotify;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 15344
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicNotify;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$UpMicNotify;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 15350
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$UpMicNotify;

    return-object v0
.end method


# virtual methods
.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicNotify;
    .locals 1

    .prologue
    .line 15169
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->defaultInstance:Lcom/example/tutorial/VideoProto$UpMicNotify;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$UpMicNotify;

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
            "Lcom/example/tutorial/VideoProto$UpMicNotify;",
            ">;"
        }
    .end annotation

    .prologue
    .line 15250
    sget-object v0, Lcom/example/tutorial/VideoProto$UpMicNotify;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getPlayerInfo()Lcom/example/tutorial/VideoProto$PlayerInfo;
    .locals 1

    .prologue
    .line 15275
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public getPlayerInfoOrBuilder()Lcom/example/tutorial/VideoProto$PlayerInfoOrBuilder;
    .locals 1

    .prologue
    .line 15285
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 15311
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->memoizedSerializedSize:I

    .line 15312
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 15321
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 15314
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 15315
    iget v2, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 15317
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeMessageSize(ILcom/google/protobuf/MessageLite;)I

    move-result v2

    add-int/2addr v0, v2

    .line 15319
    :cond_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 15320
    iput v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->memoizedSerializedSize:I

    move v1, v0

    .line 15321
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 15176
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasPlayerInfo()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 15265
    iget v1, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->bitField0_:I

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
    .line 15233
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_UpMicNotify_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$106()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 15235
    const-class v1, Lcom/example/tutorial/VideoProto$UpMicNotify;

    const-class v2, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    .line 15234
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 15233
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 15293
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->memoizedIsInitialized:B

    .line 15294
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 15297
    :goto_0
    return v1

    .line 15294
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 15296
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    .locals 1

    .prologue
    .line 15385
    invoke-static {}, Lcom/example/tutorial/VideoProto$UpMicNotify;->newBuilder()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 15394
    new-instance v0, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;)V

    .line 15395
    .local v0, "builder":Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify;->newBuilderForType()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$UpMicNotify;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify;->newBuilderForType()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;
    .locals 1

    .prologue
    .line 15389
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify;->newBuilder(Lcom/example/tutorial/VideoProto$UpMicNotify;)Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify;->toBuilder()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify;->toBuilder()Lcom/example/tutorial/VideoProto$UpMicNotify$Builder;

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
    .line 15328
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

    .line 15302
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify;->getSerializedSize()I

    .line 15303
    iget v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 15304
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$UpMicNotify;->playerInfo_:Lcom/example/tutorial/VideoProto$PlayerInfo;

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeMessage(ILcom/google/protobuf/MessageLite;)V

    .line 15306
    :cond_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$UpMicNotify;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 15307
    return-void
.end method
