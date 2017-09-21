.class public final Lcom/example/tutorial/VideoProto$MediaControlRequest;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$MediaControlRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MediaControlRequest"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    }
.end annotation


# static fields
.field public static final MEDIA_CONTROL_FIELD_NUMBER:I = 0x1

.field public static PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$MediaControlRequest;",
            ">;"
        }
    .end annotation
.end field

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$MediaControlRequest;

.field private static final serialVersionUID:J


# instance fields
.field private bitField0_:I

.field private mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 2615
    new-instance v0, Lcom/example/tutorial/VideoProto$MediaControlRequest$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$1;-><init>()V

    .line 2614
    sput-object v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->PARSER:Lcom/google/protobuf/Parser;

    .line 2913
    new-instance v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$MediaControlRequest;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$MediaControlRequest;

    .line 2914
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$MediaControlRequest;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->initFields()V

    .line 2915
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

    .line 2556
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 2649
    iput-byte v7, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->memoizedIsInitialized:B

    .line 2667
    iput v7, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->memoizedSerializedSize:I

    .line 2560
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->initFields()V

    .line 2561
    const/4 v2, 0x0

    .line 2563
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 2565
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 2566
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 2598
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 2599
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->makeExtensionsImmutable()V

    .line 2601
    return-void

    .line 2567
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 2568
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 2573
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v7

    .line 2574
    if-nez v7, :cond_0

    .line 2575
    const/4 v0, 0x1

    .line 2577
    goto :goto_0

    .line 2570
    :sswitch_0
    const/4 v0, 0x1

    .line 2571
    goto :goto_0

    .line 2580
    :sswitch_1
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 2581
    .local v3, "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$MediaControl;->valueOf(I)Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v6

    .line 2582
    .local v6, "value":Lcom/example/tutorial/VideoProto$MediaControl;
    if-nez v6, :cond_2

    .line 2583
    const/4 v7, 0x1

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 2592
    .end local v3    # "rawValue":I
    .end local v4    # "tag":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$MediaControl;
    :catch_0
    move-exception v1

    .line 2593
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    throw v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2597
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v7

    .line 2598
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v8

    iput-object v8, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 2599
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->makeExtensionsImmutable()V

    .line 2600
    throw v7

    .line 2585
    .restart local v3    # "rawValue":I
    .restart local v4    # "tag":I
    .restart local v6    # "value":Lcom/example/tutorial/VideoProto$MediaControl;
    :cond_2
    :try_start_2
    iget v7, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->bitField0_:I

    or-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->bitField0_:I

    .line 2586
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 2594
    .end local v3    # "rawValue":I
    .end local v4    # "tag":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$MediaControl;
    :catch_1
    move-exception v1

    .line 2595
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v7, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 2596
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    .line 2595
    invoke-direct {v7, v8}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 2596
    invoke-virtual {v7, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    .line 2595
    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 2568
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$MediaControlRequest;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 2556
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$MediaControlRequest;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 2536
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 2649
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->memoizedIsInitialized:B

    .line 2667
    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->memoizedSerializedSize:I

    .line 2537
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 2538
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$MediaControlRequest;)V
    .locals 0

    .prologue
    .line 2535
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$MediaControlRequest;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 2539
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 2649
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->memoizedIsInitialized:B

    .line 2667
    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->memoizedSerializedSize:I

    .line 2539
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$MediaControlRequest;Lcom/example/tutorial/VideoProto$MediaControl;)V
    .locals 0

    .prologue
    .line 2632
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$MediaControlRequest;I)V
    .locals 0

    .prologue
    .line 2629
    iput p1, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 2531
    sget-boolean v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$MediaControlRequest;
    .locals 1

    .prologue
    .line 2543
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$MediaControlRequest;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 2604
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MediaControlRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$8()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    .line 2647
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 2648
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    .locals 1

    .prologue
    .line 2742
    # invokes: Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->create()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->access$17()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$MediaControlRequest;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$MediaControlRequest;

    .prologue
    .line 2745
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->newBuilder()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MediaControlRequest;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$MediaControlRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2722
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2728
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$MediaControlRequest;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 2692
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlRequest;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 2698
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$MediaControlRequest;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2733
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlRequest;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2739
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$MediaControlRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2712
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2718
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$MediaControlRequest;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 2702
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlRequest;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 2708
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    return-object v0
.end method


# virtual methods
.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MediaControlRequest;
    .locals 1

    .prologue
    .line 2547
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$MediaControlRequest;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MediaControlRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MediaControlRequest;

    move-result-object v0

    return-object v0
.end method

.method public getMediaControl()Lcom/example/tutorial/VideoProto$MediaControl;
    .locals 1

    .prologue
    .line 2643
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    return-object v0
.end method

.method public getParserForType()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$MediaControlRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2626
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 2669
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->memoizedSerializedSize:I

    .line 2670
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 2679
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 2672
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 2673
    iget v2, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 2675
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$MediaControl;->getNumber()I

    move-result v2

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 2677
    :cond_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 2678
    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->memoizedSerializedSize:I

    move v1, v0

    .line 2679
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 2554
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasMediaControl()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 2637
    iget v1, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->bitField0_:I

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
    .line 2609
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MediaControlRequest_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$90()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 2611
    const-class v1, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    const-class v2, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    .line 2610
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 2609
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 2651
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->memoizedIsInitialized:B

    .line 2652
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 2655
    :goto_0
    return v1

    .line 2652
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 2654
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    .locals 1

    .prologue
    .line 2743
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->newBuilder()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 2752
    new-instance v0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;)V

    .line 2753
    .local v0, "builder":Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->newBuilderForType()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->newBuilderForType()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    .locals 1

    .prologue
    .line 2747
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->newBuilder(Lcom/example/tutorial/VideoProto$MediaControlRequest;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->toBuilder()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->toBuilder()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

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
    .line 2686
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

    .line 2660
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->getSerializedSize()I

    .line 2661
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 2662
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MediaControl;->getNumber()I

    move-result v0

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 2664
    :cond_0
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 2665
    return-void
.end method
