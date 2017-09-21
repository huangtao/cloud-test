.class public final Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$AudioCtrolRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AudioCtrolRequest"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    }
.end annotation


# static fields
.field public static final AUDIO_CONTROL_FIELD_NUMBER:I = 0x1

.field public static PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$AudioCtrolRequest;",
            ">;"
        }
    .end annotation
.end field

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

.field private static final serialVersionUID:J


# instance fields
.field private audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

.field private bitField0_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 20361
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$1;-><init>()V

    .line 20360
    sput-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->PARSER:Lcom/google/protobuf/Parser;

    .line 20663
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    .line 20664
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->initFields()V

    .line 20665
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

    .line 20302
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 20395
    iput-byte v7, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->memoizedIsInitialized:B

    .line 20413
    iput v7, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->memoizedSerializedSize:I

    .line 20306
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->initFields()V

    .line 20307
    const/4 v2, 0x0

    .line 20309
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 20311
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 20312
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 20344
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 20345
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->makeExtensionsImmutable()V

    .line 20347
    return-void

    .line 20313
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 20314
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 20319
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v7

    .line 20320
    if-nez v7, :cond_0

    .line 20321
    const/4 v0, 0x1

    .line 20323
    goto :goto_0

    .line 20316
    :sswitch_0
    const/4 v0, 0x1

    .line 20317
    goto :goto_0

    .line 20326
    :sswitch_1
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 20327
    .local v3, "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$AudioCtrol;->valueOf(I)Lcom/example/tutorial/VideoProto$AudioCtrol;

    move-result-object v6

    .line 20328
    .local v6, "value":Lcom/example/tutorial/VideoProto$AudioCtrol;
    if-nez v6, :cond_2

    .line 20329
    const/4 v7, 0x1

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 20338
    .end local v3    # "rawValue":I
    .end local v4    # "tag":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$AudioCtrol;
    :catch_0
    move-exception v1

    .line 20339
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    throw v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20343
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v7

    .line 20344
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v8

    iput-object v8, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 20345
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->makeExtensionsImmutable()V

    .line 20346
    throw v7

    .line 20331
    .restart local v3    # "rawValue":I
    .restart local v4    # "tag":I
    .restart local v6    # "value":Lcom/example/tutorial/VideoProto$AudioCtrol;
    :cond_2
    :try_start_2
    iget v7, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->bitField0_:I

    or-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->bitField0_:I

    .line 20332
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 20340
    .end local v3    # "rawValue":I
    .end local v4    # "tag":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$AudioCtrol;
    :catch_1
    move-exception v1

    .line 20341
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v7, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 20342
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    .line 20341
    invoke-direct {v7, v8}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 20342
    invoke-virtual {v7, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    .line 20341
    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 20314
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$AudioCtrolRequest;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 20302
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 20282
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 20395
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->memoizedIsInitialized:B

    .line 20413
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->memoizedSerializedSize:I

    .line 20283
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 20284
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$AudioCtrolRequest;)V
    .locals 0

    .prologue
    .line 20281
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 20285
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 20395
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->memoizedIsInitialized:B

    .line 20413
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->memoizedSerializedSize:I

    .line 20285
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$AudioCtrolRequest;Lcom/example/tutorial/VideoProto$AudioCtrol;)V
    .locals 0

    .prologue
    .line 20378
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$AudioCtrolRequest;I)V
    .locals 0

    .prologue
    .line 20375
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 20277
    sget-boolean v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .locals 1

    .prologue
    .line 20289
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 20350
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCtrolRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$80()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    .line 20393
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 20394
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    .locals 1

    .prologue
    .line 20488
    # invokes: Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->create()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->access$17()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$AudioCtrolRequest;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    .prologue
    .line 20491
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->newBuilder()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCtrolRequest;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20468
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20474
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 20438
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 20444
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20479
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20485
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20458
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20464
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 20448
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 20454
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    return-object v0
.end method


# virtual methods
.method public getAudioControl()Lcom/example/tutorial/VideoProto$AudioCtrol;
    .locals 1

    .prologue
    .line 20389
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;
    .locals 1

    .prologue
    .line 20293
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

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
            "Lcom/example/tutorial/VideoProto$AudioCtrolRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 20372
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 20415
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->memoizedSerializedSize:I

    .line 20416
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 20425
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 20418
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 20419
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 20421
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$AudioCtrol;->getNumber()I

    move-result v2

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 20423
    :cond_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 20424
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->memoizedSerializedSize:I

    move v1, v0

    .line 20425
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 20300
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasAudioControl()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 20383
    iget v1, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->bitField0_:I

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
    .line 20355
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCtrolRequest_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$114()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 20357
    const-class v1, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;

    const-class v2, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    .line 20356
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 20355
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 20397
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->memoizedIsInitialized:B

    .line 20398
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 20401
    :goto_0
    return v1

    .line 20398
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 20400
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    .locals 1

    .prologue
    .line 20489
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->newBuilder()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 20498
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;)V

    .line 20499
    .local v0, "builder":Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->newBuilderForType()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->newBuilderForType()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;
    .locals 1

    .prologue
    .line 20493
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->newBuilder(Lcom/example/tutorial/VideoProto$AudioCtrolRequest;)Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->toBuilder()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->toBuilder()Lcom/example/tutorial/VideoProto$AudioCtrolRequest$Builder;

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
    .line 20432
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

    .line 20406
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->getSerializedSize()I

    .line 20407
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 20408
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$AudioCtrol;->getNumber()I

    move-result v0

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 20410
    :cond_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 20411
    return-void
.end method
