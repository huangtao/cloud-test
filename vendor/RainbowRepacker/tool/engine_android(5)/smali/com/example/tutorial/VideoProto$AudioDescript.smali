.class public final Lcom/example/tutorial/VideoProto$AudioDescript;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$AudioDescriptOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AudioDescript"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    }
.end annotation


# static fields
.field public static final DST_SEAT_ID_FIELD_NUMBER:I = 0x3

.field public static final DST_USER_ID_FIELD_NUMBER:I = 0x2

.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$AudioDescript;",
            ">;"
        }
    .end annotation
.end field

.field public static final TIME_STAMP_FIELD_NUMBER:I = 0x1

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$AudioDescript;

.field private static final serialVersionUID:J


# instance fields
.field private bitField0_:I

.field private dstSeatId_:I

.field private dstUserId_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private timeStamp_:J

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 16403
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioDescript$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioDescript$1;-><init>()V

    .line 16402
    sput-object v0, Lcom/example/tutorial/VideoProto$AudioDescript;->PARSER:Lcom/google/protobuf/Parser;

    .line 16902
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioDescript;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$AudioDescript;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$AudioDescript;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 16903
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioDescript;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioDescript;->initFields()V

    .line 16904
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

    .line 16340
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 16495
    iput-byte v5, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->memoizedIsInitialized:B

    .line 16519
    iput v5, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->memoizedSerializedSize:I

    .line 16344
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioDescript;->initFields()V

    .line 16345
    const/4 v2, 0x0

    .line 16347
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v4

    .line 16349
    .local v4, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 16350
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 16386
    invoke-virtual {v4}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v5

    iput-object v5, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 16387
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript;->makeExtensionsImmutable()V

    .line 16389
    return-void

    .line 16351
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v3

    .line 16352
    .local v3, "tag":I
    sparse-switch v3, :sswitch_data_0

    .line 16357
    invoke-virtual {p0, p1, v4, p2, v3}, Lcom/example/tutorial/VideoProto$AudioDescript;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v5

    .line 16358
    if-nez v5, :cond_0

    .line 16359
    const/4 v0, 0x1

    .line 16361
    goto :goto_0

    .line 16354
    :sswitch_0
    const/4 v0, 0x1

    .line 16355
    goto :goto_0

    .line 16364
    :sswitch_1
    iget v5, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->bitField0_:I

    or-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->bitField0_:I

    .line 16365
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt64()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->timeStamp_:J
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 16380
    .end local v3    # "tag":I
    :catch_0
    move-exception v1

    .line 16381
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v5

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16385
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v5

    .line 16386
    invoke-virtual {v4}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 16387
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript;->makeExtensionsImmutable()V

    .line 16388
    throw v5

    .line 16369
    .restart local v3    # "tag":I
    :sswitch_2
    :try_start_2
    iget v5, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->bitField0_:I

    or-int/lit8 v5, v5, 0x2

    iput v5, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->bitField0_:I

    .line 16370
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v5

    iput v5, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->dstUserId_:I
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 16382
    .end local v3    # "tag":I
    :catch_1
    move-exception v1

    .line 16383
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v5, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 16384
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 16383
    invoke-direct {v5, v6}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 16384
    invoke-virtual {v5, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v5

    .line 16383
    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 16374
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v3    # "tag":I
    :sswitch_3
    :try_start_4
    iget v5, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->bitField0_:I

    or-int/lit8 v5, v5, 0x4

    iput v5, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->bitField0_:I

    .line 16375
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v5

    iput v5, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->dstSeatId_:I
    :try_end_4
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 16352
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x10 -> :sswitch_2
        0x18 -> :sswitch_3
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$AudioDescript;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 16340
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioDescript;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 16320
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 16495
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->memoizedIsInitialized:B

    .line 16519
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->memoizedSerializedSize:I

    .line 16321
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 16322
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$AudioDescript;)V
    .locals 0

    .prologue
    .line 16319
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$AudioDescript;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 16323
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 16495
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->memoizedIsInitialized:B

    .line 16519
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->memoizedSerializedSize:I

    .line 16323
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$AudioDescript;J)V
    .locals 0

    .prologue
    .line 16420
    iput-wide p1, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->timeStamp_:J

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$AudioDescript;I)V
    .locals 0

    .prologue
    .line 16444
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->dstUserId_:I

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$AudioDescript;I)V
    .locals 0

    .prologue
    .line 16468
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->dstSeatId_:I

    return-void
.end method

.method static synthetic access$13(Lcom/example/tutorial/VideoProto$AudioDescript;I)V
    .locals 0

    .prologue
    .line 16417
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 16315
    sget-boolean v0, Lcom/example/tutorial/VideoProto$AudioDescript;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1

    .prologue
    .line 16327
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioDescript;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioDescript;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 16392
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioDescript_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$62()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 16491
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->timeStamp_:J

    .line 16492
    iput v2, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->dstUserId_:I

    .line 16493
    iput v2, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->dstSeatId_:I

    .line 16494
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 1

    .prologue
    .line 16602
    # invokes: Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->create()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->access$17()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$AudioDescript;

    .prologue
    .line 16605
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->newBuilder()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 16582
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescript;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 16588
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescript;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 16552
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescript;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 16558
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescript;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 16593
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescript;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 16599
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescript;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 16572
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescript;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 16578
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescript;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 16562
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescript;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 16568
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioDescript;

    return-object v0
.end method


# virtual methods
.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1

    .prologue
    .line 16331
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioDescript;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioDescript;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    return-object v0
.end method

.method public getDstSeatId()I
    .locals 1

    .prologue
    .line 16487
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->dstSeatId_:I

    return v0
.end method

.method public getDstUserId()I
    .locals 1

    .prologue
    .line 16463
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->dstUserId_:I

    return v0
.end method

.method public getParserForType()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$AudioDescript;",
            ">;"
        }
    .end annotation

    .prologue
    .line 16414
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioDescript;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 16521
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->memoizedSerializedSize:I

    .line 16522
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 16539
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 16524
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 16525
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v4, :cond_1

    .line 16527
    iget-wide v2, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->timeStamp_:J

    invoke-static {v4, v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeInt64Size(IJ)I

    move-result v2

    add-int/2addr v0, v2

    .line 16529
    :cond_1
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-ne v2, v5, :cond_2

    .line 16531
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->dstUserId_:I

    invoke-static {v5, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 16533
    :cond_2
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->bitField0_:I

    and-int/lit8 v2, v2, 0x4

    const/4 v3, 0x4

    if-ne v2, v3, :cond_3

    .line 16535
    const/4 v2, 0x3

    iget v3, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->dstSeatId_:I

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 16537
    :cond_3
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 16538
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->memoizedSerializedSize:I

    move v1, v0

    .line 16539
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public getTimeStamp()J
    .locals 2

    .prologue
    .line 16439
    iget-wide v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->timeStamp_:J

    return-wide v0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 16338
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasDstSeatId()Z
    .locals 2

    .prologue
    .line 16477
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->bitField0_:I

    and-int/lit8 v0, v0, 0x4

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasDstUserId()Z
    .locals 2

    .prologue
    .line 16453
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->bitField0_:I

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

.method public hasTimeStamp()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 16429
    iget v1, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->bitField0_:I

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
    .line 16397
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioDescript_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$108()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 16399
    const-class v1, Lcom/example/tutorial/VideoProto$AudioDescript;

    const-class v2, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    .line 16398
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 16397
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 16497
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->memoizedIsInitialized:B

    .line 16498
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 16501
    :goto_0
    return v1

    .line 16498
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 16500
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 1

    .prologue
    .line 16603
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->newBuilder()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 16612
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$AudioDescript$Builder;)V

    .line 16613
    .local v0, "builder":Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript;->newBuilderForType()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioDescript;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript;->newBuilderForType()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .locals 1

    .prologue
    .line 16607
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$AudioDescript;->newBuilder(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript;->toBuilder()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript;->toBuilder()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

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
    .line 16546
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage;->writeReplace()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 4
    .param p1, "output"    # Lcom/google/protobuf/CodedOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 16506
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript;->getSerializedSize()I

    .line 16507
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v2, :cond_0

    .line 16508
    iget-wide v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->timeStamp_:J

    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeInt64(IJ)V

    .line 16510
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v3, :cond_1

    .line 16511
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->dstUserId_:I

    invoke-virtual {p1, v3, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 16513
    :cond_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->bitField0_:I

    and-int/lit8 v0, v0, 0x4

    const/4 v1, 0x4

    if-ne v0, v1, :cond_2

    .line 16514
    const/4 v0, 0x3

    iget v1, p0, Lcom/example/tutorial/VideoProto$AudioDescript;->dstSeatId_:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 16516
    :cond_2
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioDescript;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 16517
    return-void
.end method
