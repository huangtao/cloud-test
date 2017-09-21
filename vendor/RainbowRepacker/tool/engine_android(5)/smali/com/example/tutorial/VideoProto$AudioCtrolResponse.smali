.class public final Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$AudioCtrolResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AudioCtrolResponse"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    }
.end annotation


# static fields
.field public static final MEDIA_CONTROL_FIELD_NUMBER:I = 0x2

.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$AudioCtrolResponse;",
            ">;"
        }
    .end annotation
.end field

.field public static final RESULT_FIELD_NUMBER:I = 0x1

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

.field private static final serialVersionUID:J


# instance fields
.field private bitField0_:I

.field private mediaControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private result_:Lcom/example/tutorial/VideoProto$ResultID;

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 20795
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$1;-><init>()V

    .line 20794
    sput-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->PARSER:Lcom/google/protobuf/Parser;

    .line 21166
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    .line 21167
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->initFields()V

    .line 21168
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

    .line 20725
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 20846
    iput-byte v7, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->memoizedIsInitialized:B

    .line 20867
    iput v7, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->memoizedSerializedSize:I

    .line 20729
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->initFields()V

    .line 20730
    const/4 v2, 0x0

    .line 20732
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 20734
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 20735
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 20778
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 20779
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->makeExtensionsImmutable()V

    .line 20781
    return-void

    .line 20736
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 20737
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 20742
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v7

    .line 20743
    if-nez v7, :cond_0

    .line 20744
    const/4 v0, 0x1

    .line 20746
    goto :goto_0

    .line 20739
    :sswitch_0
    const/4 v0, 0x1

    .line 20740
    goto :goto_0

    .line 20749
    :sswitch_1
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 20750
    .local v3, "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$ResultID;->valueOf(I)Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v6

    .line 20751
    .local v6, "value":Lcom/example/tutorial/VideoProto$ResultID;
    if-nez v6, :cond_2

    .line 20752
    const/4 v7, 0x1

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 20772
    .end local v3    # "rawValue":I
    .end local v4    # "tag":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$ResultID;
    :catch_0
    move-exception v1

    .line 20773
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    throw v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20777
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v7

    .line 20778
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v8

    iput-object v8, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 20779
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->makeExtensionsImmutable()V

    .line 20780
    throw v7

    .line 20754
    .restart local v3    # "rawValue":I
    .restart local v4    # "tag":I
    .restart local v6    # "value":Lcom/example/tutorial/VideoProto$ResultID;
    :cond_2
    :try_start_2
    iget v7, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->bitField0_:I

    or-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->bitField0_:I

    .line 20755
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 20774
    .end local v3    # "rawValue":I
    .end local v4    # "tag":I
    .end local v6    # "value":Lcom/example/tutorial/VideoProto$ResultID;
    :catch_1
    move-exception v1

    .line 20775
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v7, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 20776
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    .line 20775
    invoke-direct {v7, v8}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 20776
    invoke-virtual {v7, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v7

    .line 20775
    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 20760
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v4    # "tag":I
    :sswitch_2
    :try_start_4
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readEnum()I

    move-result v3

    .line 20761
    .restart local v3    # "rawValue":I
    invoke-static {v3}, Lcom/example/tutorial/VideoProto$AudioCtrol;->valueOf(I)Lcom/example/tutorial/VideoProto$AudioCtrol;

    move-result-object v6

    .line 20762
    .local v6, "value":Lcom/example/tutorial/VideoProto$AudioCtrol;
    if-nez v6, :cond_3

    .line 20763
    const/4 v7, 0x2

    invoke-virtual {v5, v7, v3}, Lcom/google/protobuf/UnknownFieldSet$Builder;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSet$Builder;

    goto :goto_0

    .line 20765
    :cond_3
    iget v7, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->bitField0_:I

    or-int/lit8 v7, v7, 0x2

    iput v7, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->bitField0_:I

    .line 20766
    iput-object v6, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->mediaControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;
    :try_end_4
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 20737
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x10 -> :sswitch_2
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$AudioCtrolResponse;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 20725
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 20705
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 20846
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->memoizedIsInitialized:B

    .line 20867
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->memoizedSerializedSize:I

    .line 20706
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 20707
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$AudioCtrolResponse;)V
    .locals 0

    .prologue
    .line 20704
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 20708
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 20846
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->memoizedIsInitialized:B

    .line 20867
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->memoizedSerializedSize:I

    .line 20708
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$AudioCtrolResponse;Lcom/example/tutorial/VideoProto$ResultID;)V
    .locals 0

    .prologue
    .line 20812
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$AudioCtrolResponse;Lcom/example/tutorial/VideoProto$AudioCtrol;)V
    .locals 0

    .prologue
    .line 20828
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->mediaControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$AudioCtrolResponse;I)V
    .locals 0

    .prologue
    .line 20809
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 20700
    sget-boolean v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    .locals 1

    .prologue
    .line 20712
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 20784
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCtrolResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$83()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    .line 20843
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 20844
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->mediaControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 20845
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    .locals 1

    .prologue
    .line 20946
    # invokes: Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->create()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->access$17()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$AudioCtrolResponse;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    .prologue
    .line 20949
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->newBuilder()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCtrolResponse;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20926
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20932
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 20896
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 20902
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20937
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20943
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20916
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20922
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 20906
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 20912
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    return-object v0
.end method


# virtual methods
.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    .locals 1

    .prologue
    .line 20716
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    move-result-object v0

    return-object v0
.end method

.method public getMediaControl()Lcom/example/tutorial/VideoProto$AudioCtrol;
    .locals 1

    .prologue
    .line 20839
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->mediaControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    return-object v0
.end method

.method public getParserForType()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$AudioCtrolResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 20806
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getResult()Lcom/example/tutorial/VideoProto$ResultID;
    .locals 1

    .prologue
    .line 20823
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 20869
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->memoizedSerializedSize:I

    .line 20870
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 20883
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 20872
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 20873
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 20875
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$ResultID;->getNumber()I

    move-result v2

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 20877
    :cond_1
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-ne v2, v4, :cond_2

    .line 20879
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->mediaControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    invoke-virtual {v2}, Lcom/example/tutorial/VideoProto$AudioCtrol;->getNumber()I

    move-result v2

    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 20881
    :cond_2
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 20882
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->memoizedSerializedSize:I

    move v1, v0

    .line 20883
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 20723
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasMediaControl()Z
    .locals 2

    .prologue
    .line 20833
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->bitField0_:I

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

    .line 20817
    iget v1, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->bitField0_:I

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
    .line 20789
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCtrolResponse_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$115()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 20791
    const-class v1, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    const-class v2, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    .line 20790
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 20789
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 20848
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->memoizedIsInitialized:B

    .line 20849
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 20852
    :goto_0
    return v1

    .line 20849
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 20851
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    .locals 1

    .prologue
    .line 20947
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->newBuilder()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 20956
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;)V

    .line 20957
    .local v0, "builder":Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->newBuilderForType()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->newBuilderForType()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    .locals 1

    .prologue
    .line 20951
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->newBuilder(Lcom/example/tutorial/VideoProto$AudioCtrolResponse;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->toBuilder()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->toBuilder()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

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
    .line 20890
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

    .line 20857
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->getSerializedSize()I

    .line 20858
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 20859
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$ResultID;->getNumber()I

    move-result v0

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 20861
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_1

    .line 20862
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->mediaControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$AudioCtrol;->getNumber()I

    move-result v0

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->writeEnum(II)V

    .line 20864
    :cond_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 20865
    return-void
.end method
