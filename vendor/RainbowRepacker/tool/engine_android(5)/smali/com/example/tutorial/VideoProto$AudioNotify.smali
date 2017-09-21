.class public final Lcom/example/tutorial/VideoProto$AudioNotify;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$AudioNotifyOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AudioNotify"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    }
.end annotation


# static fields
.field public static final AUDIO_DATA_FIELD_NUMBER:I = 0x4

.field public static final AUDIO_DESCRIPT_FIELD_NUMBER:I = 0x3

.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$AudioNotify;",
            ">;"
        }
    .end annotation
.end field

.field public static final SEAT_ID_FIELD_NUMBER:I = 0x2

.field public static final SEND_USER_ID_FIELD_NUMBER:I = 0x1

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$AudioNotify;

.field private static final serialVersionUID:J


# instance fields
.field private audioData_:Lcom/google/protobuf/ByteString;

.field private audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

.field private bitField0_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private seatId_:I

.field private sendUserId_:I

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 17779
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioNotify$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioNotify$1;-><init>()V

    .line 17778
    sput-object v0, Lcom/example/tutorial/VideoProto$AudioNotify;->PARSER:Lcom/google/protobuf/Parser;

    .line 18494
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioNotify;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$AudioNotify;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$AudioNotify;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioNotify;

    .line 18495
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioNotify;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioNotify;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioNotify;->initFields()V

    .line 18496
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

    .line 17703
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 17906
    iput-byte v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->memoizedIsInitialized:B

    .line 17933
    iput v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->memoizedSerializedSize:I

    .line 17707
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioNotify;->initFields()V

    .line 17708
    const/4 v2, 0x0

    .line 17710
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 17712
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 17713
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 17762
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 17763
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify;->makeExtensionsImmutable()V

    .line 17765
    return-void

    .line 17714
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 17715
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 17720
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$AudioNotify;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v6

    .line 17721
    if-nez v6, :cond_0

    .line 17722
    const/4 v0, 0x1

    .line 17724
    goto :goto_0

    .line 17717
    :sswitch_0
    const/4 v0, 0x1

    .line 17718
    goto :goto_0

    .line 17727
    :sswitch_1
    iget v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    or-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    .line 17728
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v6

    iput v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->sendUserId_:I
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 17756
    .end local v4    # "tag":I
    :catch_0
    move-exception v1

    .line 17757
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17761
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v6

    .line 17762
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 17763
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify;->makeExtensionsImmutable()V

    .line 17764
    throw v6

    .line 17732
    .restart local v4    # "tag":I
    :sswitch_2
    :try_start_2
    iget v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    or-int/lit8 v6, v6, 0x2

    iput v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    .line 17733
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v6

    iput v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->seatId_:I
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 17758
    .end local v4    # "tag":I
    :catch_1
    move-exception v1

    .line 17759
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v6, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 17760
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    .line 17759
    invoke-direct {v6, v7}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 17760
    invoke-virtual {v6, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    .line 17759
    throw v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 17737
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v4    # "tag":I
    :sswitch_3
    const/4 v3, 0x0

    .line 17738
    .local v3, "subBuilder":Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    :try_start_4
    iget v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    and-int/lit8 v6, v6, 0x4

    const/4 v7, 0x4

    if-ne v6, v7, :cond_2

    .line 17739
    iget-object v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$AudioDescript;->toBuilder()Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    move-result-object v3

    .line 17741
    :cond_2
    sget-object v6, Lcom/example/tutorial/VideoProto$AudioDescript;->PARSER:Lcom/google/protobuf/Parser;

    invoke-virtual {p1, v6, p2}, Lcom/google/protobuf/CodedInputStream;->readMessage(Lcom/google/protobuf/Parser;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite;

    move-result-object v6

    check-cast v6, Lcom/example/tutorial/VideoProto$AudioDescript;

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 17742
    if-eqz v3, :cond_3

    .line 17743
    iget-object v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-virtual {v3, v6}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioDescript;)Lcom/example/tutorial/VideoProto$AudioDescript$Builder;

    .line 17744
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$AudioDescript$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 17746
    :cond_3
    iget v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    or-int/lit8 v6, v6, 0x4

    iput v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    goto/16 :goto_0

    .line 17750
    .end local v3    # "subBuilder":Lcom/example/tutorial/VideoProto$AudioDescript$Builder;
    :sswitch_4
    iget v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    or-int/lit8 v6, v6, 0x8

    iput v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    .line 17751
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBytes()Lcom/google/protobuf/ByteString;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->audioData_:Lcom/google/protobuf/ByteString;
    :try_end_4
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 17715
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x10 -> :sswitch_2
        0x1a -> :sswitch_3
        0x22 -> :sswitch_4
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$AudioNotify;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 17703
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioNotify;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 17683
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 17906
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->memoizedIsInitialized:B

    .line 17933
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->memoizedSerializedSize:I

    .line 17684
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 17685
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$AudioNotify;)V
    .locals 0

    .prologue
    .line 17682
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$AudioNotify;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 17686
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 17906
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->memoizedIsInitialized:B

    .line 17933
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->memoizedSerializedSize:I

    .line 17686
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$AudioNotify;I)V
    .locals 0

    .prologue
    .line 17796
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->sendUserId_:I

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$AudioNotify;I)V
    .locals 0

    .prologue
    .line 17820
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->seatId_:I

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$AudioNotify;Lcom/example/tutorial/VideoProto$AudioDescript;)V
    .locals 0

    .prologue
    .line 17844
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    return-void
.end method

.method static synthetic access$13(Lcom/example/tutorial/VideoProto$AudioNotify;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .prologue
    .line 17878
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->audioData_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method static synthetic access$14(Lcom/example/tutorial/VideoProto$AudioNotify;I)V
    .locals 0

    .prologue
    .line 17793
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 17678
    sget-boolean v0, Lcom/example/tutorial/VideoProto$AudioNotify;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioNotify;
    .locals 1

    .prologue
    .line 17690
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioNotify;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioNotify;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 17768
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioNotify_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$68()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 17901
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->sendUserId_:I

    .line 17902
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->seatId_:I

    .line 17903
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioDescript;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioDescript;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    .line 17904
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->audioData_:Lcom/google/protobuf/ByteString;

    .line 17905
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 1

    .prologue
    .line 18020
    # invokes: Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->create()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->access$17()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$AudioNotify;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$AudioNotify;

    .prologue
    .line 18023
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioNotify;->newBuilder()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioNotify;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$AudioNotify;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 18000
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioNotify;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioNotify;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 18006
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioNotify;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$AudioNotify;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 17970
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioNotify;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioNotify;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 17976
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioNotify;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$AudioNotify;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 18011
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioNotify;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioNotify;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 18017
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioNotify;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$AudioNotify;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 17990
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioNotify;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioNotify;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 17996
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioNotify;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$AudioNotify;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 17980
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioNotify;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioNotify;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 17986
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioNotify;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioNotify;

    return-object v0
.end method


# virtual methods
.method public getAudioData()Lcom/google/protobuf/ByteString;
    .locals 1

    .prologue
    .line 17897
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->audioData_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getAudioDescript()Lcom/example/tutorial/VideoProto$AudioDescript;
    .locals 1

    .prologue
    .line 17863
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    return-object v0
.end method

.method public getAudioDescriptOrBuilder()Lcom/example/tutorial/VideoProto$AudioDescriptOrBuilder;
    .locals 1

    .prologue
    .line 17873
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioNotify;
    .locals 1

    .prologue
    .line 17694
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioNotify;->defaultInstance:Lcom/example/tutorial/VideoProto$AudioNotify;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioNotify;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioNotify;

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
            "Lcom/example/tutorial/VideoProto$AudioNotify;",
            ">;"
        }
    .end annotation

    .prologue
    .line 17790
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioNotify;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSeatId()I
    .locals 1

    .prologue
    .line 17839
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->seatId_:I

    return v0
.end method

.method public getSendUserId()I
    .locals 1

    .prologue
    .line 17815
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->sendUserId_:I

    return v0
.end method

.method public getSerializedSize()I
    .locals 6

    .prologue
    const/4 v5, 0x4

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 17935
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->memoizedSerializedSize:I

    .line 17936
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 17957
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 17938
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 17939
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 17941
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->sendUserId_:I

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 17943
    :cond_1
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-ne v2, v4, :cond_2

    .line 17945
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->seatId_:I

    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 17947
    :cond_2
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    and-int/lit8 v2, v2, 0x4

    if-ne v2, v5, :cond_3

    .line 17949
    const/4 v2, 0x3

    iget-object v3, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeMessageSize(ILcom/google/protobuf/MessageLite;)I

    move-result v2

    add-int/2addr v0, v2

    .line 17951
    :cond_3
    iget v2, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    and-int/lit8 v2, v2, 0x8

    const/16 v3, 0x8

    if-ne v2, v3, :cond_4

    .line 17953
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->audioData_:Lcom/google/protobuf/ByteString;

    invoke-static {v5, v2}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v2

    add-int/2addr v0, v2

    .line 17955
    :cond_4
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 17956
    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->memoizedSerializedSize:I

    move v1, v0

    .line 17957
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 17701
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasAudioData()Z
    .locals 2

    .prologue
    .line 17887
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    and-int/lit8 v0, v0, 0x8

    const/16 v1, 0x8

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
    .line 17853
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

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
    .line 17829
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

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

    .line 17805
    iget v1, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

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
    .line 17773
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioNotify_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$110()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 17775
    const-class v1, Lcom/example/tutorial/VideoProto$AudioNotify;

    const-class v2, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    .line 17774
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 17773
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 17908
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->memoizedIsInitialized:B

    .line 17909
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 17912
    :goto_0
    return v1

    .line 17909
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 17911
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 1

    .prologue
    .line 18021
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioNotify;->newBuilder()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 18030
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$AudioNotify$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$AudioNotify$Builder;)V

    .line 18031
    .local v0, "builder":Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify;->newBuilderForType()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioNotify;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify;->newBuilderForType()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;
    .locals 1

    .prologue
    .line 18025
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$AudioNotify;->newBuilder(Lcom/example/tutorial/VideoProto$AudioNotify;)Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify;->toBuilder()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify;->toBuilder()Lcom/example/tutorial/VideoProto$AudioNotify$Builder;

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
    .line 17964
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
    const/4 v3, 0x4

    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 17917
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify;->getSerializedSize()I

    .line 17918
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 17919
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->sendUserId_:I

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 17921
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_1

    .line 17922
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->seatId_:I

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 17924
    :cond_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    and-int/lit8 v0, v0, 0x4

    if-ne v0, v3, :cond_2

    .line 17925
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->audioDescript_:Lcom/example/tutorial/VideoProto$AudioDescript;

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeMessage(ILcom/google/protobuf/MessageLite;)V

    .line 17927
    :cond_2
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->bitField0_:I

    and-int/lit8 v0, v0, 0x8

    const/16 v1, 0x8

    if-ne v0, v1, :cond_3

    .line 17928
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioNotify;->audioData_:Lcom/google/protobuf/ByteString;

    invoke-virtual {p1, v3, v0}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    .line 17930
    :cond_3
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioNotify;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 17931
    return-void
.end method
