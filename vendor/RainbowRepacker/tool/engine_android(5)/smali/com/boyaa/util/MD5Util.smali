.class public Lcom/boyaa/util/MD5Util;
.super Ljava/lang/Object;
.source "MD5Util.java"


# static fields
.field private static final KEventResponse:Ljava/lang/String; = "event_verify_md5"

.field private static hexDigits:[C = null

.field private static final kResult:Ljava/lang/String; = "result"

.field private static final kResultDifference:I = -0x1

.field private static final kResultSame:I = 0x1

.field private static final kfilePath:Ljava/lang/String; = "filePath"

.field private static final kmd5:Ljava/lang/String; = "MD5"

.field private static final kstrDictName:Ljava/lang/String; = "verifyMD5"

.field private static messagedigest:Ljava/security/MessageDigest;

.field private static result:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 33
    const/16 v1, 0x10

    new-array v1, v1, [C

    fill-array-data v1, :array_0

    sput-object v1, Lcom/boyaa/util/MD5Util;->hexDigits:[C

    .line 34
    const/4 v1, 0x0

    sput-object v1, Lcom/boyaa/util/MD5Util;->messagedigest:Ljava/security/MessageDigest;

    .line 38
    :try_start_0
    const-string v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    sput-object v1, Lcom/boyaa/util/MD5Util;->messagedigest:Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    :goto_0
    return-void

    .line 39
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_0
    move-exception v0

    .line 40
    .restart local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0

    .line 33
    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()I
    .locals 1

    .prologue
    .line 35
    sget v0, Lcom/boyaa/util/MD5Util;->result:I

    return v0
.end method

.method private static appendHexPair(BLjava/lang/StringBuffer;)V
    .locals 4
    .param p0, "bt"    # B
    .param p1, "stringbuffer"    # Ljava/lang/StringBuffer;

    .prologue
    .line 113
    sget-object v2, Lcom/boyaa/util/MD5Util;->hexDigits:[C

    and-int/lit16 v3, p0, 0xf0

    shr-int/lit8 v3, v3, 0x4

    aget-char v0, v2, v3

    .line 115
    .local v0, "c0":C
    sget-object v2, Lcom/boyaa/util/MD5Util;->hexDigits:[C

    and-int/lit8 v3, p0, 0xf

    aget-char v1, v2, v3

    .line 116
    .local v1, "c1":C
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 117
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 118
    return-void
.end method

.method private static bufferToHex([B)Ljava/lang/String;
    .locals 2
    .param p0, "bytes"    # [B

    .prologue
    .line 100
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lcom/boyaa/util/MD5Util;->bufferToHex([BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static bufferToHex([BII)Ljava/lang/String;
    .locals 4
    .param p0, "bytes"    # [B
    .param p1, "m"    # I
    .param p2, "n"    # I

    .prologue
    .line 104
    new-instance v2, Ljava/lang/StringBuffer;

    mul-int/lit8 v3, p2, 0x2

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 105
    .local v2, "stringbuffer":Ljava/lang/StringBuffer;
    add-int v0, p1, p2

    .line 106
    .local v0, "k":I
    move v1, p1

    .local v1, "l":I
    :goto_0
    if-lt v1, v0, :cond_0

    .line 109
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 107
    :cond_0
    aget-byte v3, p0, v1

    invoke-static {v3, v2}, Lcom/boyaa/util/MD5Util;->appendHexPair(BLjava/lang/StringBuffer;)V

    .line 106
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static getFileMD5String(Ljava/io/File;)Ljava/lang/String;
    .locals 5
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 90
    .local v1, "fis":Ljava/io/InputStream;
    const/16 v3, 0x400

    new-array v0, v3, [B

    .line 91
    .local v0, "buffer":[B
    const/4 v2, 0x0

    .line 92
    .local v2, "numRead":I
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-gtz v2, :cond_0

    .line 95
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 96
    sget-object v3, Lcom/boyaa/util/MD5Util;->messagedigest:Ljava/security/MessageDigest;

    invoke-virtual {v3}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    invoke-static {v3}, Lcom/boyaa/util/MD5Util;->bufferToHex([B)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 93
    :cond_0
    sget-object v3, Lcom/boyaa/util/MD5Util;->messagedigest:Ljava/security/MessageDigest;

    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v2}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_0
.end method

.method public static startVerify()V
    .locals 4

    .prologue
    .line 48
    const-string v2, "verifyMD5"

    const-string v3, "filePath"

    invoke-static {v2, v3}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 49
    .local v1, "filePath":Ljava/lang/String;
    const-string v2, "verifyMD5"

    const-string v3, "MD5"

    invoke-static {v2, v3}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 51
    .local v0, "MD5":Ljava/lang/String;
    invoke-static {v1, v0}, Lcom/boyaa/util/MD5Util;->verify(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 52
    const/4 v2, 0x1

    sput v2, Lcom/boyaa/util/MD5Util;->result:I

    .line 56
    :goto_0
    sget-object v2, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v3, Lcom/boyaa/util/MD5Util$1;

    invoke-direct {v3}, Lcom/boyaa/util/MD5Util$1;-><init>()V

    invoke-virtual {v2, v3}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 64
    return-void

    .line 54
    :cond_0
    const/4 v2, -0x1

    sput v2, Lcom/boyaa/util/MD5Util;->result:I

    goto :goto_0
.end method

.method public static string2MD5(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "inStr"    # Ljava/lang/String;

    .prologue
    .line 124
    const/4 v5, 0x0

    .line 126
    .local v5, "md5":Ljava/security/MessageDigest;
    :try_start_0
    const-string v8, "MD5"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 132
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 133
    .local v1, "charArray":[C
    array-length v8, v1

    new-array v0, v8, [B

    .line 135
    .local v0, "byteArray":[B
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v8, v1

    if-lt v4, v8, :cond_0

    .line 137
    invoke-virtual {v5, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v6

    .line 138
    .local v6, "md5Bytes":[B
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 139
    .local v3, "hexValue":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    :goto_1
    array-length v8, v6

    if-lt v4, v8, :cond_1

    .line 145
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .end local v0    # "byteArray":[B
    .end local v1    # "charArray":[C
    .end local v3    # "hexValue":Ljava/lang/StringBuffer;
    .end local v4    # "i":I
    .end local v6    # "md5Bytes":[B
    :goto_2
    return-object v8

    .line 127
    :catch_0
    move-exception v2

    .line 128
    .local v2, "e":Ljava/lang/Exception;
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 129
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 130
    const-string v8, ""

    goto :goto_2

    .line 136
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "byteArray":[B
    .restart local v1    # "charArray":[C
    .restart local v4    # "i":I
    :cond_0
    aget-char v8, v1, v4

    int-to-byte v8, v8

    aput-byte v8, v0, v4

    .line 135
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 140
    .restart local v3    # "hexValue":Ljava/lang/StringBuffer;
    .restart local v6    # "md5Bytes":[B
    :cond_1
    aget-byte v8, v6, v4

    and-int/lit16 v7, v8, 0xff

    .line 141
    .local v7, "val":I
    const/16 v8, 0x10

    if-ge v7, v8, :cond_2

    .line 142
    const-string v8, "0"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 143
    :cond_2
    invoke-static {v7}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 139
    add-int/lit8 v4, v4, 0x1

    goto :goto_1
.end method

.method public static verify(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .param p0, "filepath"    # Ljava/lang/String;
    .param p1, "md5"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 73
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 74
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_1

    .line 84
    .end local v1    # "file":Ljava/io/File;
    :cond_0
    :goto_0
    return v3

    .line 77
    .restart local v1    # "file":Ljava/io/File;
    :cond_1
    invoke-static {v1}, Lcom/boyaa/util/MD5Util;->getFileMD5String(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    .line 78
    .local v2, "md5Now":Ljava/lang/String;
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eqz v4, :cond_0

    .line 79
    const/4 v3, 0x1

    goto :goto_0

    .line 81
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "md5Now":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 82
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
