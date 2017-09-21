.class public final Lcom/example/tutorial/VideoProto$PublishAudioRequest;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$PublishAudioRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PublishAudioRequest"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    }
.end annotation


# static fields
.field public static final AUDIO_DATA_FIELD_NUMBER:I = 0x2

.field public static final AUDIO_DESCRIPT_FIELD_NUMBER:I = 0x1

.field public static PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$PublishAudioRequest;",
            ">;"
        }
    .end annotation
.end field

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$PublishAudioRequest;

.field private static final serialVersionUID:J


# instance fields
.field private audioData_:Lcom/google/protobuf/ByteString;

.field private audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

.field private bitField0_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 17050
    new-instance v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$1;-><init>()V

    .line 17049
    sput-object v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->PARSER:Lcom/google/protobuf/Parser;

    .line 17585
    new-instance v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    .line 17586
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->initFields()V

    .line 17587
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

    .line 16984
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 17127
    iput-byte v6, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->memoizedIsInitialized:B

    .line 17148
    iput v6, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->memoizedSerializedSize:I

    .line 16988
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->initFields()V

    .line 16989
    const/4 v2, 0x0

    .line 16991
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 16993
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 16994
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 17033
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 17034
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->makeExtensionsImmutable()V

    .line 17036
    return-void

    .line 16995
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 16996
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 17001
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v6

    .line 17002
    if-nez v6, :cond_0

    .line 17003
    const/4 v0, 0x1

    .line 17005
    goto :goto_0

    .line 16998
    :sswitch_0
    const/4 v0, 0x1

    .line 16999
    goto :goto_0

    .line 17008
    :sswitch_1
    const/4 v3, 0x0

    .line 17009
    .local v3, "subBuilder":Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    iget v6, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->bitField0_:I

    and-int/lit8 v6, v6, 0x1

    const/4 v7, 0x1

    if-ne v6, v7, :cond_2

    .line 17010
    iget-object v6, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$AudioDescript;->toBuilder()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v3

    .line 17012
    :cond_2
    sget-object v6, Lcom/example/tutorial/VideoProto$AudioDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-virtual {p1, v6, p2}, Lcom/google/protobuf/CodedInputStream;->readMessage(Lcom/google/protobuf/Parser;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite;

    move-result-object v6

    check-cast v6, Lcom/example/tutorial/VideoProto$AudioDescript;

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 17013
    if-eqz v3, :cond_3

    .line 17014
    iget-object v6, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-virtual {v3, v6}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    .line 17015
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 17017
    :cond_3
    iget v6, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->bitField0_:I

    or-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->bitField0_:I
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 17027
    .end local v3    # "subBuilder":Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    .end local v4    # "tag":I
    :catch_0
    move-exception v1

    .line 17028
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17032
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v6

    .line 17033
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 17034
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->makeExtensionsImmutable()V

    .line 17035
    throw v6

    .line 17021
    .restart local v4    # "tag":I
    :sswitch_2
    :try_start_2
    iget v6, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->bitField0_:I

    or-int/lit8 v6, v6, 0x2

    iput v6, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->bitField0_:I

    .line 17022
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBytes()Lcom/google/protobuf/ByteString;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->audioData_:Lcom/google/protobuf/ByteString;
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 17029
    .end local v4    # "tag":I
    :catch_1
    move-exception v1

    .line 17030
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v6, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 17031
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    .line 17030
    invoke-direct {v6, v7}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 17031
    invoke-virtual {v6, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    .line 17030
    throw v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 16996
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_1
        0x12 -> :sswitch_2
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$PublishAudioRequest;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 16984
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 16964
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 17127
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->memoizedIsInitialized:B

    .line 17148
    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->memoizedSerializedSize:I

    .line 16965
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 16966
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$PublishAudioRequest;)V
    .locals 0

    .prologue
    .line 16963
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 16967
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 17127
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->memoizedIsInitialized:B

    .line 17148
    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->memoizedSerializedSize:I

    .line 16967
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$PublishAudioRequest;Lcom/example/tutorial/VideoProto$AudioDescript;)V
    .locals 0

    .prologue
    .line 17067
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$PublishAudioRequest;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .prologue
    .line 17101
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->audioData_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$PublishAudioRequest;I)V
    .locals 0

    .prologue
    .line 17064
    iput p1, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 16959
    sget-boolean v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    .locals 1

    .prologue
    .line 16971
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 17039
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PublishAudioRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$65()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    .line 17124
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 17125
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->audioData_:Lcom/google/protobuf/ByteString;

    .line 17126
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 1

    .prologue
    .line 17227
    # invokes: Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->create()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->access$17()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$PublishAudioRequest;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    .prologue
    .line 17230
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->newBuilder()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$PublishAudioRequest;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 17207
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 17213
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 17177
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 17183
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 17218
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 17224
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 17197
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 17203
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 17187
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 17193
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    return-object v0
.end method


# virtual methods
.method public getAudioData()Lcom/google/protobuf/ByteString;
    .locals 1

    .prologue
    .line 17120
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->audioData_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getAudioDescript()Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1

    .prologue
    .line 17086
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    return-object v0
.end method

.method public getAudioDescriptOrBuilder()Lcom/example/tutorial/VideoProto$AudioDescriptOrBuilder;
    .locals 1

    .prologue
    .line 17096
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PublishAudioRequest;
    .locals 1

    .prologue
    .line 16975
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->defaultInstance:Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$PublishAudioRequest;

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
            "Lcom/example/tutorial/VideoProto$PublishAudioRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 17061
    sget-object v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 17150
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->memoizedSerializedSize:I

    .line 17151
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 17164
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 17153
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 17154
    iget v2, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 17156
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeMessageSize(ILcom/google/protobuf/MessageLite;)I

    move-result v2

    add-int/2addr v0, v2

    .line 17158
    :cond_1
    iget v2, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-ne v2, v4, :cond_2

    .line 17160
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->audioData_:Lcom/google/protobuf/ByteString;

    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v2

    add-int/2addr v0, v2

    .line 17162
    :cond_2
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 17163
    iput v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->memoizedSerializedSize:I

    move v1, v0

    .line 17164
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 16982
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasAudioData()Z
    .locals 2

    .prologue
    .line 17110
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->bitField0_:I

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

.method public hasAudioDescript()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 17076
    iget v1, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->bitField0_:I

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
    .line 17044
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_PublishAudioRequest_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$109()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 17046
    const-class v1, Lcom/example/tutorial/VideoProto$PublishAudioRequest;

    const-class v2, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    .line 17045
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 17044
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 17129
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->memoizedIsInitialized:B

    .line 17130
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 17133
    :goto_0
    return v1

    .line 17130
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 17132
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 1

    .prologue
    .line 17228
    invoke-static {}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->newBuilder()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 17237
    new-instance v0, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;)V

    .line 17238
    .local v0, "builder":Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->newBuilderForType()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->newBuilderForType()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;
    .locals 1

    .prologue
    .line 17232
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->newBuilder(Lcom/example/tutorial/VideoProto$PublishAudioRequest;)Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->toBuilder()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->toBuilder()Lcom/example/tutorial/VideoProto$PublishAudioRequest$Builder;

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
    .line 17171
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

    .line 17138
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->getSerializedSize()I

    .line 17139
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 17140
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeMessage(ILcom/google/protobuf/MessageLite;)V

    .line 17142
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_1

    .line 17143
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->audioData_:Lcom/google/protobuf/ByteString;

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    .line 17145
    :cond_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$PublishAudioRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 17146
    return-void
.end method
