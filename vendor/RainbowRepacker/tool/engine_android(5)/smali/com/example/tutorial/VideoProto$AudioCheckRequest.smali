.class public final Lcom/example/tutorial/VideoProto$AudioCheckRequest;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$AudioCheckRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AudioCheckRequest"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    }
.end annotation


# static fields
.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$AudioCheckRequest;",
            ">;"
        }
    .end annotation
.end field

.field public static final SEND_CHECK_NUM_FIELD_NUMBER:I = 0x2

.field public static final SEND_USER_ID_FIELD_NUMBER:I = 0x1

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$AudioCheckRequest;

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
    .line 19300
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$1;-><init>()V

    .line 19299
    sput-object v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->PARSER:Lcom/google/protobuf/Parser;

    .line 19709
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    .line 19710
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->initFields()V

    .line 19711
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

    .line 19242
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 19367
    iput-byte v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->memoizedIsInitialized:B

    .line 19388
    iput v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->memoizedSerializedSize:I

    .line 19246
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->initFields()V

    .line 19247
    const/4 v2, 0x0

    .line 19249
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v4

    .line 19251
    .local v4, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 19252
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 19283
    invoke-virtual {v4}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v5

    iput-object v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 19284
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->makeExtensionsImmutable()V

    .line 19286
    return-void

    .line 19253
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v3

    .line 19254
    .local v3, "tag":I
    sparse-switch v3, :sswitch_data_0

    .line 19259
    invoke-virtual {p0, p1, v4, p2, v3}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v5

    .line 19260
    if-nez v5, :cond_0

    .line 19261
    const/4 v0, 0x1

    .line 19263
    goto :goto_0

    .line 19256
    :sswitch_0
    const/4 v0, 0x1

    .line 19257
    goto :goto_0

    .line 19266
    :sswitch_1
    iget v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->bitField0_:I

    or-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->bitField0_:I

    .line 19267
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v5

    iput v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->sendUserId_:I
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 19277
    .end local v3    # "tag":I
    :catch_0
    move-exception v1

    .line 19278
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v5

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19282
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v5

    .line 19283
    invoke-virtual {v4}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 19284
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->makeExtensionsImmutable()V

    .line 19285
    throw v5

    .line 19271
    .restart local v3    # "tag":I
    :sswitch_2
    :try_start_2
    iget v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->bitField0_:I

    or-int/lit8 v5, v5, 0x2

    iput v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->bitField0_:I

    .line 19272
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v5

    iput v5, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->sendCheckNum_:I
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 19279
    .end local v3    # "tag":I
    :catch_1
    move-exception v1

    .line 19280
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v5, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 19281
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 19280
    invoke-direct {v5, v6}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 19281
    invoke-virtual {v5, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v5

    .line 19280
    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 19254
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x10 -> :sswitch_2
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$AudioCheckRequest;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 19242
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 19222
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 19367
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->memoizedIsInitialized:B

    .line 19388
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->memoizedSerializedSize:I

    .line 19223
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 19224
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$AudioCheckRequest;)V
    .locals 0

    .prologue
    .line 19221
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 19225
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 19367
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->memoizedIsInitialized:B

    .line 19388
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->memoizedSerializedSize:I

    .line 19225
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$AudioCheckRequest;I)V
    .locals 0

    .prologue
    .line 19317
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->sendUserId_:I

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$AudioCheckRequest;I)V
    .locals 0

    .prologue
    .line 19341
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->sendCheckNum_:I

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$AudioCheckRequest;I)V
    .locals 0

    .prologue
    .line 19314
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 19217
    sget-boolean v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    .locals 1

    .prologue
    .line 19229
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 19289
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCheckRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$74()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 19364
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->sendUserId_:I

    .line 19365
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->sendCheckNum_:I

    .line 19366
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    .locals 1

    .prologue
    .line 19467
    # invokes: Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->create()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->access$17()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$AudioCheckRequest;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    .prologue
    .line 19470
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->newBuilder()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCheckRequest;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19447
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19453
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 19417
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 19423
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19458
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19464
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19437
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19443
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 19427
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 19433
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    return-object v0
.end method


# virtual methods
.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCheckRequest;
    .locals 1

    .prologue
    .line 19233
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCheckRequest;

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
            "Lcom/example/tutorial/VideoProto$AudioCheckRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 19311
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSendCheckNum()I
    .locals 1

    .prologue
    .line 19360
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->sendCheckNum_:I

    return v0
.end method

.method public getSendUserId()I
    .locals 1

    .prologue
    .line 19336
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->sendUserId_:I

    return v0
.end method

.method public getSerializedSize()I
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 19390
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->memoizedSerializedSize:I

    .line 19391
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 19404
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 19393
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 19394
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 19396
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->sendUserId_:I

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 19398
    :cond_1
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-ne v2, v4, :cond_2

    .line 19400
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->sendCheckNum_:I

    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 19402
    :cond_2
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 19403
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->memoizedSerializedSize:I

    move v1, v0

    .line 19404
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 19240
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasSendCheckNum()Z
    .locals 2

    .prologue
    .line 19350
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->bitField0_:I

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

    .line 19326
    iget v1, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->bitField0_:I

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
    .line 19294
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCheckRequest_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$112()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 19296
    const-class v1, Lcom/example/tutorial/VideoProto$AudioCheckRequest;

    const-class v2, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    .line 19295
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 19294
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 19369
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->memoizedIsInitialized:B

    .line 19370
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 19373
    :goto_0
    return v1

    .line 19370
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 19372
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    .locals 1

    .prologue
    .line 19468
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->newBuilder()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 19477
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;)V

    .line 19478
    .local v0, "builder":Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->newBuilderForType()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->newBuilderForType()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;
    .locals 1

    .prologue
    .line 19472
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->newBuilder(Lcom/example/tutorial/VideoProto$AudioCheckRequest;)Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->toBuilder()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->toBuilder()Lcom/example/tutorial/VideoProto$AudioCheckRequest$Builder;

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
    .line 19411
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

    .line 19378
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->getSerializedSize()I

    .line 19379
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 19380
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->sendUserId_:I

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 19382
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_1

    .line 19383
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->sendCheckNum_:I

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 19385
    :cond_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 19386
    return-void
.end method
