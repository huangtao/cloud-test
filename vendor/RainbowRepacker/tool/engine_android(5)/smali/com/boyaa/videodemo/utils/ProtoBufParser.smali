.class public Lcom/boyaa/videodemo/utils/ProtoBufParser;
.super Ljava/lang/Object;
.source "ProtoBufParser.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ProtoBufParser"

.field public static final TAG_NOT_TLV:I


# instance fields
.field private videoMsg:Lcom/example/tutorial/VideoProto$VideoMessage;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/ProtoBufParser;->videoMsg:Lcom/example/tutorial/VideoProto$VideoMessage;

    .line 25
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;IZ)V
    .locals 1
    .param p1, "ins"    # Ljava/io/InputStream;
    .param p2, "len"    # I
    .param p3, "isNotPF"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/ProtoBufParser;->videoMsg:Lcom/example/tutorial/VideoProto$VideoMessage;

    .line 28
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->parse(Ljava/io/InputStream;IZ)V

    .line 29
    return-void
.end method

.method public static bytesToInt([BI)I
    .locals 2
    .param p0, "ary"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 89
    const/4 v0, 0x3

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    .line 90
    const/4 v1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    .line 89
    or-int/2addr v0, v1

    .line 91
    const/4 v1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    .line 89
    or-int/2addr v0, v1

    .line 92
    const/4 v1, 0x0

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    .line 89
    or-int/2addr v0, v1

    return v0
.end method

.method public static intToBytes2(I)[B
    .locals 3
    .param p0, "value"    # I

    .prologue
    .line 98
    const/4 v1, 0x4

    new-array v0, v1, [B

    .line 99
    .local v0, "src":[B
    const/4 v1, 0x0

    shr-int/lit8 v2, p0, 0x18

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 100
    const/4 v1, 0x1

    shr-int/lit8 v2, p0, 0x10

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 101
    const/4 v1, 0x2

    shr-int/lit8 v2, p0, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 102
    const/4 v1, 0x3

    and-int/lit16 v2, p0, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 103
    return-object v0
.end method

.method public static toByteArray(Ljava/lang/Object;)[B
    .locals 4
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 113
    const/4 v1, 0x0

    .line 114
    .local v1, "bytes":[B
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 116
    .local v0, "bos":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    new-instance v3, Ljava/io/ObjectOutputStream;

    invoke-direct {v3, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 117
    .local v3, "oos":Ljava/io/ObjectOutputStream;
    invoke-virtual {v3, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 118
    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->flush()V

    .line 119
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 120
    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->close()V

    .line 121
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 125
    .end local v3    # "oos":Ljava/io/ObjectOutputStream;
    :goto_0
    return-object v1

    .line 122
    :catch_0
    move-exception v2

    .line 123
    .local v2, "ex":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public getVideoMessage()Lcom/example/tutorial/VideoProto$VideoMessage;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/ProtoBufParser;->videoMsg:Lcom/example/tutorial/VideoProto$VideoMessage;

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/ProtoBufParser;->videoMsg:Lcom/example/tutorial/VideoProto$VideoMessage;

    .line 84
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public parse(Ljava/io/InputStream;IZ)V
    .locals 2
    .param p1, "ins"    # Ljava/io/InputStream;
    .param p2, "len"    # I
    .param p3, "isNotPF"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    const/4 v1, 0x0

    .line 42
    .local v1, "iPackageLength":I
    invoke-static {p1}, Lcom/boyaa/videodemo/utils/StreamUtils;->parseStream2Byte(Ljava/io/InputStream;)[B

    move-result-object v0

    .line 57
    .local v0, "data":[B
    invoke-virtual {p0, v0}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->parseData([B)V

    .line 67
    return-void
.end method

.method public parseData([B)V
    .locals 2
    .param p1, "data"    # [B

    .prologue
    .line 72
    :try_start_0
    invoke-static {p1}, Lcom/example/tutorial/VideoProto$VideoMessage;->parseFrom([B)Lcom/example/tutorial/VideoProto$VideoMessage;

    move-result-object v1

    iput-object v1, p0, Lcom/boyaa/videodemo/utils/ProtoBufParser;->videoMsg:Lcom/example/tutorial/VideoProto$VideoMessage;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    :goto_0
    return-void

    .line 73
    :catch_0
    move-exception v0

    .line 75
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
