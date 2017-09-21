.class Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;
.super Ljava/lang/Object;
.source "ApkMerge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/engine/patchupdate/ApkMerge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MD5Util"
.end annotation


# static fields
.field private static final KEventResponse:Ljava/lang/String; = "event_verify_md5"

.field private static hexDigits:[C = null

.field private static final kResult:Ljava/lang/String; = "result"

.field private static final kResultDifference:I = -0x1

.field private static final kResultSame:I = 0x1

.field private static final kfilePath:Ljava/lang/String; = "filePath"

.field private static final kfilePathCallback:Ljava/lang/String; = "filePathCallback"

.field private static final kmd5:Ljava/lang/String; = "MD5"

.field private static final kstrDictName:Ljava/lang/String; = "verifyMD5"

.field private static messagedigest:Ljava/security/MessageDigest;

.field private static result:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 173
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->hexDigits:[C

    .line 174
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->messagedigest:Ljava/security/MessageDigest;

    .line 178
    :try_start_0
    const-string v0, "MD5"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    sput-object v0, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->messagedigest:Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    :goto_0
    return-void

    .line 179
    :catch_0
    move-exception v0

    goto :goto_0

    .line 173
    nop

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

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100()I
    .locals 1

    .prologue
    .line 163
    sget v0, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->result:I

    return v0
.end method

.method private static appendHexPair(BLjava/lang/StringBuffer;)V
    .locals 4
    .param p0, "bt"    # B
    .param p1, "stringbuffer"    # Ljava/lang/StringBuffer;

    .prologue
    .line 252
    sget-object v2, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->hexDigits:[C

    and-int/lit16 v3, p0, 0xf0

    shr-int/lit8 v3, v3, 0x4

    aget-char v0, v2, v3

    .line 254
    .local v0, "c0":C
    sget-object v2, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->hexDigits:[C

    and-int/lit8 v3, p0, 0xf

    aget-char v1, v2, v3

    .line 255
    .local v1, "c1":C
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 256
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 257
    return-void
.end method

.method private static bufferToHex([B)Ljava/lang/String;
    .locals 2
    .param p0, "bytes"    # [B

    .prologue
    .line 239
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->bufferToHex([BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static bufferToHex([BII)Ljava/lang/String;
    .locals 4
    .param p0, "bytes"    # [B
    .param p1, "m"    # I
    .param p2, "n"    # I

    .prologue
    .line 243
    new-instance v2, Ljava/lang/StringBuffer;

    mul-int/lit8 v3, p2, 0x2

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 244
    .local v2, "stringbuffer":Ljava/lang/StringBuffer;
    add-int v0, p1, p2

    .line 245
    .local v0, "k":I
    move v1, p1

    .local v1, "l":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 246
    aget-byte v3, p0, v1

    invoke-static {v3, v2}, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->appendHexPair(BLjava/lang/StringBuffer;)V

    .line 245
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 248
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static getFileMD5String(Ljava/io/File;)Ljava/lang/String;
    .locals 5
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 228
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 229
    .local v1, "fis":Ljava/io/InputStream;
    const/16 v3, 0x400

    new-array v0, v3, [B

    .line 230
    .local v0, "buffer":[B
    const/4 v2, 0x0

    .line 231
    .local v2, "numRead":I
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-lez v2, :cond_0

    .line 232
    sget-object v3, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->messagedigest:Ljava/security/MessageDigest;

    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v2}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_0

    .line 234
    :cond_0
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 235
    sget-object v3, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->messagedigest:Ljava/security/MessageDigest;

    invoke-virtual {v3}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    invoke-static {v3}, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->bufferToHex([B)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static startVerify()V
    .locals 4

    .prologue
    .line 187
    const-string v2, "verifyMD5"

    const-string v3, "filePath"

    invoke-static {v2, v3}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 188
    .local v1, "filePath":Ljava/lang/String;
    const-string v2, "verifyMD5"

    const-string v3, "MD5"

    invoke-static {v2, v3}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 190
    .local v0, "MD5":Ljava/lang/String;
    invoke-static {v1, v0}, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->verify(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 191
    const/4 v2, 0x1

    sput v2, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->result:I

    .line 195
    :goto_0
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v2

    new-instance v3, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util$1;

    invoke-direct {v3, v1}, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util$1;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/boyaa/engine/made/AppActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 204
    return-void

    .line 193
    :cond_0
    const/4 v2, -0x1

    sput v2, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->result:I

    goto :goto_0
.end method

.method public static verify(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p0, "filepath"    # Ljava/lang/String;
    .param p1, "md5"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 213
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 214
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    .line 223
    .end local v0    # "file":Ljava/io/File;
    :cond_0
    :goto_0
    return v2

    .line 217
    .restart local v0    # "file":Ljava/io/File;
    :cond_1
    invoke-static {v0}, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->getFileMD5String(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    .line 218
    .local v1, "md5Now":Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_0

    .line 219
    const/4 v2, 0x1

    goto :goto_0

    .line 221
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "md5Now":Ljava/lang/String;
    :catch_0
    move-exception v3

    goto :goto_0
.end method
