.class public final Lcom/example/tutorial/VideoProto$MessageHead;
.super Lcom/google/protobuf/GeneratedMessage;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$MessageHeadOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MessageHead"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    }
.end annotation


# static fields
.field public static final AUTH_KEY_FIELD_NUMBER:I = 0x4

.field public static final CLIENT_VERSION_FIELD_NUMBER:I = 0x2

.field public static final MESSAGE_BODY_NAME_FIELD_NUMBER:I = 0x5

.field public static PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$MessageHead;",
            ">;"
        }
    .end annotation
.end field

.field public static final USER_ID_FIELD_NUMBER:I = 0x3

.field private static final defaultInstance:Lcom/example/tutorial/VideoProto$MessageHead;

.field private static final serialVersionUID:J


# instance fields
.field private authKey_:Ljava/lang/Object;

.field private bitField0_:I

.field private clientVersion_:I

.field private memoizedIsInitialized:B

.field private memoizedSerializedSize:I

.field private messageBodyName_:Ljava/lang/Object;

.field private final unknownFields:Lcom/google/protobuf/UnknownFieldSet;

.field private userId_:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 1152
    new-instance v0, Lcom/example/tutorial/VideoProto$MessageHead$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$MessageHead$1;-><init>()V

    .line 1151
    sput-object v0, Lcom/example/tutorial/VideoProto$MessageHead;->PARSER:Lcom/google/protobuf/Parser;

    .line 1909
    new-instance v0, Lcom/example/tutorial/VideoProto$MessageHead;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/example/tutorial/VideoProto$MessageHead;-><init>(Z)V

    sput-object v0, Lcom/example/tutorial/VideoProto$MessageHead;->defaultInstance:Lcom/example/tutorial/VideoProto$MessageHead;

    .line 1910
    sget-object v0, Lcom/example/tutorial/VideoProto$MessageHead;->defaultInstance:Lcom/example/tutorial/VideoProto$MessageHead;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$MessageHead;->initFields()V

    .line 1911
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

    .line 1084
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 1331
    iput-byte v5, p0, Lcom/example/tutorial/VideoProto$MessageHead;->memoizedIsInitialized:B

    .line 1358
    iput v5, p0, Lcom/example/tutorial/VideoProto$MessageHead;->memoizedSerializedSize:I

    .line 1088
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->initFields()V

    .line 1089
    const/4 v2, 0x0

    .line 1091
    .local v2, "mutable_bitField0_":I
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->newBuilder()Lcom/google/protobuf/UnknownFieldSet$Builder;

    move-result-object v4

    .line 1093
    .local v4, "unknownFields":Lcom/google/protobuf/UnknownFieldSet$Builder;
    const/4 v0, 0x0

    .line 1094
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 1135
    invoke-virtual {v4}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v5

    iput-object v5, p0, Lcom/example/tutorial/VideoProto$MessageHead;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 1136
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->makeExtensionsImmutable()V

    .line 1138
    return-void

    .line 1095
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readTag()I

    move-result v3

    .line 1096
    .local v3, "tag":I
    sparse-switch v3, :sswitch_data_0

    .line 1101
    invoke-virtual {p0, p1, v4, p2, v3}, Lcom/example/tutorial/VideoProto$MessageHead;->parseUnknownField(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/UnknownFieldSet$Builder;Lcom/google/protobuf/ExtensionRegistryLite;I)Z

    move-result v5

    .line 1102
    if-nez v5, :cond_0

    .line 1103
    const/4 v0, 0x1

    .line 1105
    goto :goto_0

    .line 1098
    :sswitch_0
    const/4 v0, 0x1

    .line 1099
    goto :goto_0

    .line 1108
    :sswitch_1
    iget v5, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    or-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    .line 1109
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v5

    iput v5, p0, Lcom/example/tutorial/VideoProto$MessageHead;->clientVersion_:I
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 1129
    .end local v3    # "tag":I
    :catch_0
    move-exception v1

    .line 1130
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v5

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1134
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v5

    .line 1135
    invoke-virtual {v4}, Lcom/google/protobuf/UnknownFieldSet$Builder;->build()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v6

    iput-object v6, p0, Lcom/example/tutorial/VideoProto$MessageHead;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 1136
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->makeExtensionsImmutable()V

    .line 1137
    throw v5

    .line 1113
    .restart local v3    # "tag":I
    :sswitch_2
    :try_start_2
    iget v5, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    or-int/lit8 v5, v5, 0x2

    iput v5, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    .line 1114
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readInt32()I

    move-result v5

    iput v5, p0, Lcom/example/tutorial/VideoProto$MessageHead;->userId_:I
    :try_end_2
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1131
    .end local v3    # "tag":I
    :catch_1
    move-exception v1

    .line 1132
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v5, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 1133
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    .line 1132
    invoke-direct {v5, v6}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 1133
    invoke-virtual {v5, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v5

    .line 1132
    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1118
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v3    # "tag":I
    :sswitch_3
    :try_start_4
    iget v5, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    or-int/lit8 v5, v5, 0x4

    iput v5, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    .line 1119
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBytes()Lcom/google/protobuf/ByteString;

    move-result-object v5

    iput-object v5, p0, Lcom/example/tutorial/VideoProto$MessageHead;->authKey_:Ljava/lang/Object;

    goto :goto_0

    .line 1123
    :sswitch_4
    iget v5, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    or-int/lit8 v5, v5, 0x8

    iput v5, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    .line 1124
    invoke-virtual {p1}, Lcom/google/protobuf/CodedInputStream;->readBytes()Lcom/google/protobuf/ByteString;

    move-result-object v5

    iput-object v5, p0, Lcom/example/tutorial/VideoProto$MessageHead;->messageBodyName_:Ljava/lang/Object;
    :try_end_4
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 1096
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x10 -> :sswitch_1
        0x18 -> :sswitch_2
        0x22 -> :sswitch_3
        0x2a -> :sswitch_4
    .end sparse-switch
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;Lcom/example/tutorial/VideoProto$MessageHead;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 1084
    invoke-direct {p0, p1, p2}, Lcom/example/tutorial/VideoProto$MessageHead;-><init>(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)V

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

    .line 1064
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    .line 1331
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->memoizedIsInitialized:B

    .line 1358
    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->memoizedSerializedSize:I

    .line 1065
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    .line 1066
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$MessageHead;)V
    .locals 0

    .prologue
    .line 1063
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$MessageHead;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;)V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "noInit"    # Z

    .prologue
    const/4 v0, -0x1

    .line 1067
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage;-><init>()V

    .line 1331
    iput-byte v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->memoizedIsInitialized:B

    .line 1358
    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->memoizedSerializedSize:I

    .line 1067
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSet;->getDefaultInstance()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-void
.end method

.method static synthetic access$10(Lcom/example/tutorial/VideoProto$MessageHead;I)V
    .locals 0

    .prologue
    .line 1169
    iput p1, p0, Lcom/example/tutorial/VideoProto$MessageHead;->clientVersion_:I

    return-void
.end method

.method static synthetic access$11(Lcom/example/tutorial/VideoProto$MessageHead;I)V
    .locals 0

    .prologue
    .line 1193
    iput p1, p0, Lcom/example/tutorial/VideoProto$MessageHead;->userId_:I

    return-void
.end method

.method static synthetic access$12(Lcom/example/tutorial/VideoProto$MessageHead;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1217
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$MessageHead;->authKey_:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$13(Lcom/example/tutorial/VideoProto$MessageHead;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1272
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$MessageHead;->messageBodyName_:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$14(Lcom/example/tutorial/VideoProto$MessageHead;I)V
    .locals 0

    .prologue
    .line 1166
    iput p1, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    return-void
.end method

.method static synthetic access$15(Lcom/example/tutorial/VideoProto$MessageHead;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1217
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->authKey_:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$16(Lcom/example/tutorial/VideoProto$MessageHead;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1272
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->messageBodyName_:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 1059
    sget-boolean v0, Lcom/example/tutorial/VideoProto$MessageHead;->alwaysUseFieldBuilders:Z

    return v0
.end method

.method public static getDefaultInstance()Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 1

    .prologue
    .line 1071
    sget-object v0, Lcom/example/tutorial/VideoProto$MessageHead;->defaultInstance:Lcom/example/tutorial/VideoProto$MessageHead;

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 1141
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MessageHead_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$2()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private initFields()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 1326
    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->clientVersion_:I

    .line 1327
    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->userId_:I

    .line 1328
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->authKey_:Ljava/lang/Object;

    .line 1329
    const-string v0, ""

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->messageBodyName_:Ljava/lang/Object;

    .line 1330
    return-void
.end method

.method public static newBuilder()Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1

    .prologue
    .line 1445
    # invokes: Lcom/example/tutorial/VideoProto$MessageHead$Builder;->create()Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->access$17()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static newBuilder(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1
    .param p0, "prototype"    # Lcom/example/tutorial/VideoProto$MessageHead;

    .prologue
    .line 1448
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->newBuilder()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1425
    sget-object v0, Lcom/example/tutorial/VideoProto$MessageHead;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MessageHead;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1431
    sget-object v0, Lcom/example/tutorial/VideoProto$MessageHead;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MessageHead;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 1395
    sget-object v0, Lcom/example/tutorial/VideoProto$MessageHead;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MessageHead;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 1
    .param p0, "data"    # Lcom/google/protobuf/ByteString;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 1401
    sget-object v0, Lcom/example/tutorial/VideoProto$MessageHead;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MessageHead;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1436
    sget-object v0, Lcom/example/tutorial/VideoProto$MessageHead;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MessageHead;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 1
    .param p0, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1442
    sget-object v0, Lcom/example/tutorial/VideoProto$MessageHead;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MessageHead;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1415
    sget-object v0, Lcom/example/tutorial/VideoProto$MessageHead;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MessageHead;

    return-object v0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 1
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1421
    sget-object v0, Lcom/example/tutorial/VideoProto$MessageHead;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MessageHead;

    return-object v0
.end method

.method public static parseFrom([B)Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 1405
    sget-object v0, Lcom/example/tutorial/VideoProto$MessageHead;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MessageHead;

    return-object v0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .prologue
    .line 1411
    sget-object v0, Lcom/example/tutorial/VideoProto$MessageHead;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v0, p0, p1}, Lcom/google/protobuf/Parser;->parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MessageHead;

    return-object v0
.end method


# virtual methods
.method public getAuthKey()Ljava/lang/String;
    .locals 4

    .prologue
    .line 1236
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$MessageHead;->authKey_:Ljava/lang/Object;

    .line 1237
    .local v1, "ref":Ljava/lang/Object;
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 1238
    check-cast v1, Ljava/lang/String;

    .line 1246
    .end local v1    # "ref":Ljava/lang/Object;
    :goto_0
    return-object v1

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    move-object v0, v1

    .line 1241
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 1242
    .local v0, "bs":Lcom/google/protobuf/ByteString;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v2

    .line 1243
    .local v2, "s":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->isValidUtf8()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1244
    iput-object v2, p0, Lcom/example/tutorial/VideoProto$MessageHead;->authKey_:Ljava/lang/Object;

    :cond_1
    move-object v1, v2

    .line 1246
    goto :goto_0
.end method

.method public getAuthKeyBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 1258
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$MessageHead;->authKey_:Ljava/lang/Object;

    .line 1259
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 1262
    check-cast v1, Ljava/lang/String;

    .line 1261
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 1263
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->authKey_:Ljava/lang/Object;

    .line 1266
    .end local v0    # "b":Lcom/google/protobuf/ByteString;
    :goto_0
    return-object v0

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    check-cast v1, Lcom/google/protobuf/ByteString;

    .end local v1    # "ref":Ljava/lang/Object;
    move-object v0, v1

    goto :goto_0
.end method

.method public getClientVersion()I
    .locals 1

    .prologue
    .line 1188
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->clientVersion_:I

    return v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MessageHead;
    .locals 1

    .prologue
    .line 1075
    sget-object v0, Lcom/example/tutorial/VideoProto$MessageHead;->defaultInstance:Lcom/example/tutorial/VideoProto$MessageHead;

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MessageHead;

    move-result-object v0

    return-object v0
.end method

.method public getMessageBodyName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 1291
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$MessageHead;->messageBodyName_:Ljava/lang/Object;

    .line 1292
    .local v1, "ref":Ljava/lang/Object;
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 1293
    check-cast v1, Ljava/lang/String;

    .line 1301
    .end local v1    # "ref":Ljava/lang/Object;
    :goto_0
    return-object v1

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    move-object v0, v1

    .line 1296
    check-cast v0, Lcom/google/protobuf/ByteString;

    .line 1297
    .local v0, "bs":Lcom/google/protobuf/ByteString;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    move-result-object v2

    .line 1298
    .local v2, "s":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->isValidUtf8()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1299
    iput-object v2, p0, Lcom/example/tutorial/VideoProto$MessageHead;->messageBodyName_:Ljava/lang/Object;

    :cond_1
    move-object v1, v2

    .line 1301
    goto :goto_0
.end method

.method public getMessageBodyNameBytes()Lcom/google/protobuf/ByteString;
    .locals 3

    .prologue
    .line 1313
    iget-object v1, p0, Lcom/example/tutorial/VideoProto$MessageHead;->messageBodyName_:Ljava/lang/Object;

    .line 1314
    .local v1, "ref":Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 1317
    check-cast v1, Ljava/lang/String;

    .line 1316
    .end local v1    # "ref":Ljava/lang/Object;
    invoke-static {v1}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    move-result-object v0

    .line 1318
    .local v0, "b":Lcom/google/protobuf/ByteString;
    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->messageBodyName_:Ljava/lang/Object;

    .line 1321
    .end local v0    # "b":Lcom/google/protobuf/ByteString;
    :goto_0
    return-object v0

    .restart local v1    # "ref":Ljava/lang/Object;
    :cond_0
    check-cast v1, Lcom/google/protobuf/ByteString;

    .end local v1    # "ref":Ljava/lang/Object;
    move-object v0, v1

    goto :goto_0
.end method

.method public getParserForType()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser",
            "<",
            "Lcom/example/tutorial/VideoProto$MessageHead;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1163
    sget-object v0, Lcom/example/tutorial/VideoProto$MessageHead;->PARSER:Lcom/google/protobuf/Parser;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 6

    .prologue
    const/4 v5, 0x4

    const/4 v4, 0x2

    .line 1360
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->memoizedSerializedSize:I

    .line 1361
    .local v0, "size":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    move v1, v0

    .line 1382
    .end local v0    # "size":I
    .local v1, "size":I
    :goto_0
    return v1

    .line 1363
    .end local v1    # "size":I
    .restart local v0    # "size":I
    :cond_0
    const/4 v0, 0x0

    .line 1364
    iget v2, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    and-int/lit8 v2, v2, 0x1

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 1366
    iget v2, p0, Lcom/example/tutorial/VideoProto$MessageHead;->clientVersion_:I

    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 1368
    :cond_1
    iget v2, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    and-int/lit8 v2, v2, 0x2

    if-ne v2, v4, :cond_2

    .line 1370
    const/4 v2, 0x3

    iget v3, p0, Lcom/example/tutorial/VideoProto$MessageHead;->userId_:I

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v2

    add-int/2addr v0, v2

    .line 1372
    :cond_2
    iget v2, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    and-int/lit8 v2, v2, 0x4

    if-ne v2, v5, :cond_3

    .line 1374
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->getAuthKeyBytes()Lcom/google/protobuf/ByteString;

    move-result-object v2

    invoke-static {v5, v2}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v2

    add-int/2addr v0, v2

    .line 1376
    :cond_3
    iget v2, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    and-int/lit8 v2, v2, 0x8

    const/16 v3, 0x8

    if-ne v2, v3, :cond_4

    .line 1378
    const/4 v2, 0x5

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->getMessageBodyNameBytes()Lcom/google/protobuf/ByteString;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v2

    add-int/2addr v0, v2

    .line 1380
    :cond_4
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/protobuf/UnknownFieldSet;->getSerializedSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 1381
    iput v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->memoizedSerializedSize:I

    move v1, v0

    .line 1382
    .end local v0    # "size":I
    .restart local v1    # "size":I
    goto :goto_0
.end method

.method public final getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;
    .locals 1

    .prologue
    .line 1082
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->unknownFields:Lcom/google/protobuf/UnknownFieldSet;

    return-object v0
.end method

.method public getUserId()I
    .locals 1

    .prologue
    .line 1212
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->userId_:I

    return v0
.end method

.method public hasAuthKey()Z
    .locals 2

    .prologue
    .line 1226
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

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

.method public hasClientVersion()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 1178
    iget v1, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasMessageBodyName()Z
    .locals 2

    .prologue
    .line 1281
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

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

.method public hasUserId()Z
    .locals 2

    .prologue
    .line 1202
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

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

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    .locals 3

    .prologue
    .line 1146
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MessageHead_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$88()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 1148
    const-class v1, Lcom/example/tutorial/VideoProto$MessageHead;

    const-class v2, Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    .line 1147
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 1146
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 1333
    iget-byte v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->memoizedIsInitialized:B

    .line 1334
    .local v0, "isInitialized":B
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    .line 1337
    :goto_0
    return v1

    .line 1334
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 1336
    :cond_1
    iput-byte v1, p0, Lcom/example/tutorial/VideoProto$MessageHead;->memoizedIsInitialized:B

    goto :goto_0
.end method

.method public newBuilderForType()Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1

    .prologue
    .line 1446
    invoke-static {}, Lcom/example/tutorial/VideoProto$MessageHead;->newBuilder()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 2
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 1455
    new-instance v0, Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/example/tutorial/VideoProto$MessageHead$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$MessageHead$Builder;)V

    .line 1456
    .local v0, "builder":Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->newBuilderForType()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$MessageHead;->newBuilderForType(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->newBuilderForType()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toBuilder()Lcom/example/tutorial/VideoProto$MessageHead$Builder;
    .locals 1

    .prologue
    .line 1450
    invoke-static {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->newBuilder(Lcom/example/tutorial/VideoProto$MessageHead;)Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->toBuilder()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->toBuilder()Lcom/example/tutorial/VideoProto$MessageHead$Builder;

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
    .line 1389
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

    .line 1342
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->getSerializedSize()I

    .line 1343
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 1344
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->clientVersion_:I

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 1346
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_1

    .line 1347
    const/4 v0, 0x3

    iget v1, p0, Lcom/example/tutorial/VideoProto$MessageHead;->userId_:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    .line 1349
    :cond_1
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    and-int/lit8 v0, v0, 0x4

    if-ne v0, v3, :cond_2

    .line 1350
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->getAuthKeyBytes()Lcom/google/protobuf/ByteString;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    .line 1352
    :cond_2
    iget v0, p0, Lcom/example/tutorial/VideoProto$MessageHead;->bitField0_:I

    and-int/lit8 v0, v0, 0x8

    const/16 v1, 0x8

    if-ne v0, v1, :cond_3

    .line 1353
    const/4 v0, 0x5

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->getMessageBodyNameBytes()Lcom/google/protobuf/ByteString;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    .line 1355
    :cond_3
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MessageHead;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSet;->writeTo(Lcom/google/protobuf/CodedOutputStream;)V

    .line 1356
    return-void
.end method
