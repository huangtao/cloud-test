.class public final Lcom/example/tutorial/VideoProto$VideoMessage;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$VideoMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VideoMessage"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    }
.end annotation


# static fields
.field public static final MESSAGE_BODY_FIELD_NUMBER:I = 0x2

.field public static final MESSAGE_HEAD_FIELD_NUMBER:I = 0x1

.field public static PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$VideoMessage;",
            ">;"
        }
    .end annotation
.end field

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$VideoMessage;

.field private static final serialVersionUID:J


# instance fields
.field private bitField0_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private messageBody_:Lcom/google/protobuf/ByteString;

.field private messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 2041
    new-instance v0, Lcom/example/tutorial/VideoProto$VideoMessage$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$VideoMessage$1;-><init>()V

    .line 2040
    sput-object v0, Lcom/example/tutorial/VideoProto$VideoMessage;->PARSER:Lcom/google/protobuf/Parser;

    .line 2508
    new-instance v0, Lcom/example/tutorial/VideoProto$VideoMessage;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$VideoMessage;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$VideoMessage;->defaultInstance:Lcom/example/tutorial/VideoProto$VideoMessage;

    .line 2509
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoMessage;->defaultInstance:Lcom/example/tutorial/VideoProto$VideoMessage;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$VideoMessage;->initFields()V

    .line 2510
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

    .line 1975
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 2098
    iput-byte v6, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->memoizedIsInitialized:B

    .line 2119
    iput v6, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->memoizedSerializedSize:I

    .line 1979
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$VideoMessage;->initFields()V

    .line 1980
    const/4 v2, 0x0

    .line 1982
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v5

    .line 1984
    .local v5, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 1985
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 2024
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 2025
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage;->makeExtensionsImmutable()V

    .line 2027
    return-void

    .line 1986
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v4

    .line 1987
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 1992
    invoke-virtual {p0, p1, v5, p2, v4}, Lcom/example/tutorial/VideoProto$VideoMessage;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v6

    .line 1993
    if-nez v6, :cond_0

    .line 1994
    const/4 v0, 0x1

    .line 1996
    goto :goto_0

    .line 1989
    :sswitch_0
    const/4 v0, 0x1

    .line 1990
    goto :goto_0

    .line 1999
    :sswitch_1
    const/4 v3, 0x0

    .line 2000
    .local v3, "subBuilder":Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    iget v6, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->bitField0_:I

    and-int/lit8 v6, v6, 0x1

    const/4 v7, 0x1

    if-ne v6, v7, :cond_2

    .line 2001
    iget-object v6, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    invoke-virtual {v6}, Lcom/example/tutorial/VideoProto$MessageHead;->toBuilder()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v3

    .line 2003
    :cond_2
    sget-object v6, Lcom/example/tutorial/VideoProto$MessageHead;->PARSER:Lcom/google/protobuf/Parser;

    invoke-virtual {p1, v6, p2}, Lcom/google/protobuf/CodedInputStream;->readMessage(Lcom/google/protobuf/Parser;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite;

    move-result-object v6

    check-cast v6, Lcom/example/tutorial/VideoProto$MessageHead;

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    .line 2004
    if-eqz v3, :cond_3

    .line 2005
    iget-object v6, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    invoke-virtual {v3, v6}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    .line 2006
    invoke-virtual {v3}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    .line 2008
    :cond_3
    iget v6, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->bitField0_:I

    or-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->bitField0_:I
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 2018
    .end local v3    # "subBuilder":Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .end local v4    # "tag":I
    :catch_0
    move-exception v1

    .line 2019
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2023
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v6

    .line 2024
    invoke-virtual {v5}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v7

    iput-object v7, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 2025
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage;->makeExtensionsImmutable()V

    .line 2026
    throw v6

    .line 2012
    .restart local v4    # "tag":I
    :sswitch_2
    :try_start_2
    iget v6, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->bitField0_:I

    or-int/lit8 v6, v6, 0x2

    iput v6, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->bitField0_:I

    .line 2013
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBytes()Lcom/google/protobuf/ByteString;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->messageBody_:Lcom/google/protobuf/ByteString;
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 2020
    .end local v4    # "tag":I
    :catch_1
    move-exception v1

    .line 2021
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v6, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 2022
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    .line 2021
    invoke-direct {v6, v7}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 2022
    invoke-virtual {v6, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v6

    .line 2021
    throw v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1987
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_1
        0x12 -> :sswitch_2
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$VideoMessage;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 1975
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$VideoMessage;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 1955
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 2098
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->memoizedIsInitialized:B

    .line 2119
    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->memoizedSerializedSize:I

    .line 1956
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 1957
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$VideoMessage;)V
    .locals 0

    .prologue
    .line 1954
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$VideoMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 1958
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 2098
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->memoizedIsInitialized:B

    .line 2119
    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->memoizedSerializedSize:I

    .line 1958
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$VideoMessage;Lcom/example/tutorial/VideoProto$MessageHead;)V
    .locals 0

    .prologue
    .line 2058
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$VideoMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .prologue
    .line 2080
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->messageBody_:Lcom/google/protobuf/ByteString;

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$VideoMessage;I)V
    .locals 0

    .prologue
    .line 2055
    iput p1, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->bitField0_:I

    return-void
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 1950
    sget-boolean v0, Lcom/example/tutorial/VideoProto$VideoMessage;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 1

    .prologue
    .line 1962
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoMessage;->defaultInstance:Lcom/example/tutorial/VideoProto$VideoMessage;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 2030
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoMessage_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$5()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    .line 2095
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->getDefaultInstance()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    .line 2096
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->messageBody_:Lcom/google/protobuf/ByteString;

    .line 2097
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 1

    .prologue
    .line 2198
    # invokes: Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->create()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->access$17()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$VideoMessage;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$VideoMessage;

    .prologue
    .line 2201
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoMessage;->newBuilder()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$VideoMessage;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2178
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoMessage;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2184
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoMessage;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 2148
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoMessage;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 2154
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoMessage;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2189
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoMessage;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2195
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoMessage;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2168
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoMessage;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2174
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoMessage;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 2158
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoMessage;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 2164
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoMessage;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$VideoMessage;

    return-object v0
.end method


# virtual methods
.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 1

    .prologue
    .line 1966
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoMessage;->defaultInstance:Lcom/example/tutorial/VideoProto$VideoMessage;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v0

    return-object v0
.end method

.method public getMessageBody()Lcom/google/protobuf/ByteString;
    .locals 1

    .prologue
    .line 2091
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->messageBody_:Lcom/google/protobuf/ByteString;

    return-object v0
.end method

.method public getMessageHead()Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 1

    .prologue
    .line 2069
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    return-object v0
.end method

.method public getMessageHeadOrBuilder()Lcom/example/tutorial/VideoProto$MessageHeadOrBuilder;
    .locals 1

    .prologue
    .line 2075
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    return-object v0
.end method

.method public getParserForType()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$VideoMessage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2052
    sget-object v0, Lcom/example/tutorial/VideoProto$VideoMessage;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 2121
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->memoizedSerializedSize:I

    .line 2122
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 2135
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 2124
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 2125
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    if-ne v2, v3, :cond_1

    .line 2127
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->computeMessageSize(ILcom/google/protobuf/MessageLite;)I

    move-result v2

    add-int/2addr v0, v2

    .line 2129
    :cond_1
    iget v2, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-ne v2, v4, :cond_2

    .line 2131
    iget-object v2, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->messageBody_:Lcom/google/protobuf/ByteString;

    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v2

    add-int/2addr v0, v2

    .line 2133
    :cond_2
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 2134
    iput v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->memoizedSerializedSize:I

    move v1, v0

    .line 2135
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 1973
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public hasMessageBody()Z
    .locals 2

    .prologue
    .line 2085
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->bitField0_:I

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

.method public hasMessageHead()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 2063
    iget v1, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->bitField0_:I

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
    .line 2035
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_VideoMessage_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$89()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 2037
    const-class v1, Lcom/example/tutorial/VideoProto$VideoMessage;

    const-class v2, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    .line 2036
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 2035
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 2100
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->memoizedIsInitialized:B

    .line 2101
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 2104
    :goto_0
    return v1

    .line 2101
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 2103
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 1

    .prologue
    .line 2199
    invoke-static {}, Lcom/example/tutorial/VideoProto$VideoMessage;->newBuilder()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 2208
    new-instance v0, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$VideoMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$VideoMessage$Builder;)V

    .line 2209
    .local v0, "builder":Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage;->newBuilderForType()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage;->newBuilderForType()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;
    .locals 1

    .prologue
    .line 2203
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$VideoMessage;->newBuilder(Lcom/example/tutorial/VideoProto$VideoMessage;)Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage;->toBuilder()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage;->toBuilder()Lcom/example/tutorial/VideoProto$VideoMessage$Builder;

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
    .line 2142
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

    .line 2109
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage;->getSerializedSize()I

    .line 2110
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_0

    .line 2111
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->messageHead_:Lcom/example/tutorial/VideoProto$MessageHead;

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->writeMessage(ILcom/google/protobuf/MessageLite;)V

    .line 2113
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_1

    .line 2114
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$VideoMessage;->messageBody_:Lcom/google/protobuf/ByteString;

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    .line 2116
    :cond_1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$VideoMessage;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 2117
    return-void
.end method
