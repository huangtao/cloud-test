.class public final Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$NotifyAudioCtrolOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "NotifyAudioCtrol"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    }
.end annotation


# static fields
.field public static final AUDIO_CONTROL_FIELD_NUMBER:I = 0x3

.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;",
            ">;"
        }
    .end annotation
.end field

.field public static final SEAT_ID_FIELD_NUMBER:I = 0x2

.field public static final USER_ID_FIELD_NUMBER:I = 0x1

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

.field private static final serialVersionUID:J


# instance fields
.field private audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

.field private bitField0_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private seatId_:I

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;

.field private userId_:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 21319
    new-instance v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$1;-><init>()V

    .line 21318
    sput-object v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->PARSER:Lcom/google/protobuf/Parser;

    .line 21797
    new-instance v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->defaultInstance:Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    .line 21798
    sget-object v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->defaultInstance:Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->initFields()V

    .line 21799
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

    .line 21250
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 21403
    iput-byte v7, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->memoizedIsInitialized:B

    .line 21427
    iput v7, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->memoizedSerializedSize:I

    .line 21254
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->initFields()V

    .line 21255
    const/4 v2, 0x0

    .line 21257
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 21259
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 21260
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 21302
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 21303
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->makeExtensionsImmutable()V

    .line 21305
    return-void

    .line 21261
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 21262
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 21267
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v7

    .line 21268
    if-nez v7, :cond_0

    .line 21269
    const/4 v0, 0x1

    .line 21271
    goto :goto_0

    .line 21264
    :sswitch_0
    const/4 v0, 0x1

    .line 21265
    goto :goto_0

    .line 21274
    :sswitch_1
    iget v7, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->bitField0_:I

    or-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->bitField0_:I

    .line 21275
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->userId_:I
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 21296
    .end local v4    # "tag":I
    :catch_0
    move-exception v1

    .line 21297
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    throw v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21301
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v7

    .line 21302
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v8

    iput-object v8, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 21303
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->makeExtensionsImmutable()V

    .line 21304
    throw v7

    .line 21279
    .restart local v4    # "tag":I
    :sswitch_2
    :try_start_2
    iget v7, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->bitField0_:I

    or-int/lit8 v7, v7, 0x2

    iput v7, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->bitField0_:I

    .line 21280
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v7

    iput v7, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->seatId_:I
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 21298
    .end local v4    # "tag":I
    :catch_1
    move-exception v1

    .line 21299
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v7, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 21300
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    .line 21299
    invoke-direct {v7, v8}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 21300
    invoke-virtual {v7, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    .line 21299
    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 21284
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v4    # "tag":I
    :sswitch_3
    :try_start_4
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 21285
    .local v3, "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$AudioCtrol;->valueOf(I)Lcom/example/tutorial/VideoProto$AudioCtrol;

    move-result-object v6

    .line 21286
    .local v6, "value":Lcom/example/tutorial/VideoProto$AudioCtrol;
    if-nez v6, :cond_2

    .line 21287
    const/4 v7, 0x3

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;

    goto :goto_0

    .line 21289
    :cond_2
    iget v7, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->bitField0_:I

    or-int/lit8 v7, v7, 0x4

    iput v7, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->bitField0_:I

    .line 21290
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;
    :try_end_4
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 21262
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x10 -> :sswitch_2
        0x18 -> :sswitch_3
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 21250
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 21230
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 21403
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->memoizedIsInitialized:B

    .line 21427
    iput v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->memoizedSerializedSize:I

    .line 21231
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 21232
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;)V
    .locals 0

    .prologue
    .line 21229
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 21233
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 21403
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->memoizedIsInitialized:B

    .line 21427
    iput v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->memoizedSerializedSize:I

    .line 21233
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;I)V
    .locals 0

    .prologue
    .line 21336
    iput p1, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->userId_:I

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;I)V
    .locals 0

    .prologue
    .line 21360
    iput p1, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->seatId_:I

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;Lcom/example/tutorial/VideoProto$AudioCtrol;)V
    .locals 0

    .prologue
    .line 21384
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    return-void
.end method

.method static synthetic access$13(Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;I)V
    .locals 0

    .prologue
    .line 21333
    iput p1, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 21225
    sget-boolean v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .locals 1

    .prologue
    .line 21237
    sget-object v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->defaultInstance:Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 21308
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_NotifyAudioCtrol_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$86()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 21399
    iput v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->userId_:I

    .line 21400
    iput v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->seatId_:I

    .line 21401
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 21402
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 1

    .prologue
    .line 21510
    # invokes: Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->create()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->access$17()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    .prologue
    .line 21513
    invoke-static {}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->newBuilder()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 21490
    sget-object v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 21496
    sget-object v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 21460
    sget-object v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 21466
    sget-object v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 21501
    sget-object v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 21507
    sget-object v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 21480
    sget-object v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 21486
    sget-object v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 21470
    sget-object v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 21476
    sget-object v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    return-object v0
.end method


# virtual methods
.method public getAudioControl()Lcom/example/tutorial/VideoProto$AudioCtrol;
    .locals 1

    .prologue
    .line 21395
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;
    .locals 1

    .prologue
    .line 21241
    sget-object v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->defaultInstance:Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

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
            "Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;",
            ">;"
        }
    .end annotation

    .prologue
    .line 21330
    sget-object v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSeatId()I
    .locals 1

    .prologue
    .line 21379
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->seatId_:I

    return v0
.end method

.method public getSerializedSize()I
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 21429
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->memoizedSerializedSize:I

    .line 21430
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 21447
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 21432
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 21433
    iget v2, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 21435
    iget v2, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->userId_:I

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 21437
    :cond_1
    iget v2, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-ne v2, v4, :cond_2

    .line 21439
    iget v2, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->seatId_:I

    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 21441
    :cond_2
    iget v2, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->bitField0_:I

    and-int/lit8 v2, v2, 0x4

    const/4 v3, 0x4

    if-ne v2, v3, :cond_3

    .line 21443
    const/4 v2, 0x3

    iget-object v3, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$AudioCtrol;->getNumber()I

    move-result v3

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 21445
    :cond_3
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 21446
    iput v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->memoizedSerializedSize:I

    move v1, v0

    .line 21447
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 21248
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public getUserId()I
    .locals 1

    .prologue
    .line 21355
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->userId_:I

    return v0
.end method

.method public hasAudioControl()Z
    .locals 2

    .prologue
    .line 21389
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->bitField0_:I

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

.method public hasSeatId()Z
    .locals 2

    .prologue
    .line 21369
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->bitField0_:I

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

.method public hasUserId()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 21345
    iget v1, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->bitField0_:I

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
    .line 21313
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_NotifyAudioCtrol_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$116()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 21315
    const-class v1, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;

    const-class v2, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    .line 21314
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 21313
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 21405
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->memoizedIsInitialized:B

    .line 21406
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 21409
    :goto_0
    return v1

    .line 21406
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 21408
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 1

    .prologue
    .line 21511
    invoke-static {}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->newBuilder()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 21520
    new-instance v0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;)V

    .line 21521
    .local v0, "builder":Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->newBuilderForType()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->newBuilderForType()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;
    .locals 1

    .prologue
    .line 21515
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->newBuilder(Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;)Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->toBuilder()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->toBuilder()Lcom/example/tutorial/VideoProto$NotifyAudioCtrol$Builder;

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
    .line 21454
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

    .line 21414
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->getSerializedSize()I

    .line 21415
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 21416
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->userId_:I

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 21418
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_1

    .line 21419
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->seatId_:I

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 21421
    :cond_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->bitField0_:I

    and-int/lit8 v0, v0, 0x4

    const/4 v1, 0x4

    if-ne v0, v1, :cond_2

    .line 21422
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->audioControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    invoke-virtual {v1}, Lcom/example/tutorial/VideoProto$AudioCtrol;->getNumber()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 21424
    :cond_2
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$NotifyAudioCtrol;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 21425
    return-void
.end method
