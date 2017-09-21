.class public Lcom/boyaa/videodemo/utils/ByteUtils;
.super Ljava/lang/Object;
.source "ByteUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static append([B[B)[B
    .locals 4
    .param p0, "src1"    # [B
    .param p1, "src2"    # [B

    .prologue
    const/4 v3, 0x0

    .line 175
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [B

    .line 176
    .local v0, "ret":[B
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 177
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 178
    return-object v0
.end method

.method public static bitsToInt(BII)I
    .locals 5
    .param p0, "b"    # B
    .param p1, "pos"    # I
    .param p2, "count"    # I

    .prologue
    .line 204
    rsub-int/lit8 v4, p1, 0x8

    sub-int/2addr v4, p2

    shr-int v4, p0, v4

    int-to-byte v3, v4

    .line 206
    .local v3, "tmp":B
    const/4 v2, 0x0

    .line 207
    .local v2, "ret":I
    const/4 v1, 0x1

    .line 208
    .local v1, "mask":B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p2, :cond_0

    .line 212
    return v2

    .line 209
    :cond_0
    and-int v4, v3, v1

    add-int/2addr v2, v4

    .line 210
    shl-int/lit8 v4, v1, 0x1

    int-to-byte v1, v4

    .line 208
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static bytesArrayToGBString([B)Ljava/lang/String;
    .locals 2
    .param p0, "bytes"    # [B

    .prologue
    .line 134
    :try_start_0
    new-instance v0, Ljava/lang/String;

    const-string v1, "GB2312"

    invoke-direct {v0, p0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    :goto_0
    return-object v0

    .line 135
    :catch_0
    move-exception v0

    .line 137
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

    goto :goto_0
.end method

.method public static bytesArrayToInt([B)I
    .locals 5
    .param p0, "bytes"    # [B

    .prologue
    const/4 v1, 0x4

    .line 157
    if-eqz p0, :cond_0

    array-length v3, p0

    if-nez v3, :cond_2

    .line 158
    :cond_0
    const/4 v2, 0x0

    .line 164
    :cond_1
    return v2

    .line 159
    :cond_2
    array-length v3, p0

    if-le v3, v1, :cond_3

    .line 160
    .local v1, "leng":I
    :goto_0
    const/4 v2, 0x0

    .line 161
    .local v2, "ret":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_1

    .line 162
    shl-int/lit8 v3, v2, 0x8

    aget-byte v4, p0, v0

    and-int/lit16 v4, v4, 0xff

    add-int v2, v3, v4

    .line 161
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 159
    .end local v0    # "i":I
    .end local v1    # "leng":I
    .end local v2    # "ret":I
    :cond_3
    array-length v1, p0

    goto :goto_0
.end method

.method public static bytesArrayToString([B)Ljava/lang/String;
    .locals 3
    .param p0, "bytes"    # [B

    .prologue
    .line 117
    if-nez p0, :cond_0

    .line 118
    const-string v1, ""

    .line 123
    :goto_0
    return-object v1

    .line 121
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_1

    aget-byte v1, p0, v0

    if-nez v1, :cond_2

    .line 123
    :cond_1
    new-instance v1, Ljava/lang/String;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2, v0}, Ljava/lang/String;-><init>([BII)V

    goto :goto_0

    .line 121
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static bytesToShorts([BII)[S
    .locals 6
    .param p0, "source"    # [B
    .param p1, "startPos"    # I
    .param p2, "byteLength"    # I

    .prologue
    .line 261
    div-int/lit8 v3, p2, 0x2

    new-array v2, v3, [S

    .line 262
    .local v2, "shorts":[S
    if-ltz p1, :cond_0

    rem-int/lit8 v3, p2, 0x2

    if-nez v3, :cond_0

    if-eqz p0, :cond_0

    .line 263
    array-length v3, p0

    add-int v4, p1, p2

    add-int/lit8 v4, v4, -0x1

    if-ge v3, v4, :cond_2

    .line 264
    :cond_0
    const/4 v2, 0x0

    .line 272
    .end local v2    # "shorts":[S
    :cond_1
    return-object v2

    .line 266
    .restart local v2    # "shorts":[S
    :cond_2
    const/4 v1, 0x0

    .line 267
    .local v1, "j":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    div-int/lit8 v3, p2, 0x2

    if-ge v0, v3, :cond_1

    .line 268
    aget-byte v3, p0, v1

    add-int/lit8 v4, v1, 0x1

    aget-byte v4, p0, v4

    const/4 v5, 0x2

    invoke-static {v3, v4, v5}, Lcom/boyaa/videodemo/utils/ByteUtils;->bytesToshort(BBI)S

    move-result v3

    aput-short v3, v2, v0

    .line 269
    add-int/lit8 v1, v1, 0x2

    .line 267
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static bytesToshort(BBI)S
    .locals 3
    .param p0, "b0"    # B
    .param p1, "b1"    # B
    .param p2, "byteLength"    # I

    .prologue
    .line 276
    const/4 v2, 0x2

    if-eq p2, v2, :cond_0

    .line 277
    const/4 v1, 0x0

    .line 290
    :goto_0
    return v1

    .line 278
    :cond_0
    const/4 v0, 0x0

    .line 279
    .local v0, "i":I
    const/4 v1, 0x0

    .line 280
    .local v1, "out":S
    if-gez p0, :cond_1

    .line 281
    add-int/lit16 v0, p0, 0x100

    .line 284
    :goto_1
    add-int v2, v1, v0

    int-to-short v1, v2

    .line 285
    if-gez p1, :cond_2

    .line 286
    add-int/lit16 v0, p1, 0x100

    .line 289
    :goto_2
    shl-int/lit8 v2, v0, 0x8

    add-int/2addr v2, v1

    int-to-short v1, v2

    .line 290
    goto :goto_0

    .line 283
    :cond_1
    move v0, p0

    goto :goto_1

    .line 288
    :cond_2
    move v0, p1

    goto :goto_2
.end method

.method public static merge([B[BI)V
    .locals 2
    .param p0, "bytes"    # [B
    .param p1, "src"    # [B
    .param p2, "pos"    # I

    .prologue
    .line 189
    const/4 v0, 0x0

    array-length v1, p1

    invoke-static {p1, v0, p0, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 190
    return-void
.end method

.method private static putShort([BIS)V
    .locals 2
    .param p0, "b"    # [B
    .param p1, "off"    # I
    .param p2, "val"    # S

    .prologue
    .line 255
    add-int/lit8 v0, p1, 0x1

    ushr-int/lit8 v1, p2, 0x0

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 256
    add-int/lit8 v0, p1, 0x0

    ushr-int/lit8 v1, p2, 0x8

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 257
    return-void
.end method

.method public static readBytesArray([BII)[B
    .locals 2
    .param p0, "src"    # [B
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 105
    new-array v0, p2, [B

    .line 106
    .local v0, "ret":[B
    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 107
    return-object v0
.end method

.method public static readShortArray([SII)[S
    .locals 2
    .param p0, "src"    # [S
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 294
    new-array v0, p2, [S

    .line 295
    .local v0, "ret":[S
    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 296
    return-object v0
.end method

.method public static readUint16FromBytesArray([BI)I
    .locals 3
    .param p0, "bytes"    # [B
    .param p1, "pos"    # I

    .prologue
    const/4 v0, 0x0

    .line 40
    if-eqz p0, :cond_0

    array-length v1, p0

    if-gtz v1, :cond_1

    .line 48
    :cond_0
    :goto_0
    return v0

    .line 44
    :cond_1
    array-length v1, p0

    const/4 v2, 0x2

    if-ge v1, v2, :cond_2

    .line 45
    invoke-static {p0, v0}, Lcom/boyaa/videodemo/utils/ByteUtils;->readUint8FromBytesArray([BI)I

    move-result v0

    goto :goto_0

    .line 48
    :cond_2
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    .line 49
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    .line 48
    add-int/2addr v0, v1

    goto :goto_0
.end method

.method public static readUint32FromBytesArray([BI)I
    .locals 3
    .param p0, "bytes"    # [B
    .param p1, "pos"    # I

    .prologue
    const/4 v0, 0x0

    .line 65
    if-eqz p0, :cond_0

    array-length v1, p0

    if-gtz v1, :cond_1

    .line 73
    :cond_0
    :goto_0
    return v0

    .line 69
    :cond_1
    array-length v1, p0

    const/4 v2, 0x4

    if-ge v1, v2, :cond_2

    .line 70
    invoke-static {p0, v0}, Lcom/boyaa/videodemo/utils/ByteUtils;->readUint16FromBytesArray([BI)I

    move-result v0

    goto :goto_0

    .line 73
    :cond_2
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x18

    .line 74
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    .line 73
    add-int/2addr v0, v1

    .line 75
    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    .line 73
    add-int/2addr v0, v1

    .line 76
    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    .line 73
    add-int/2addr v0, v1

    goto :goto_0
.end method

.method public static readUint8FromBytesArray([BI)I
    .locals 1
    .param p0, "bytes"    # [B
    .param p1, "pos"    # I

    .prologue
    .line 15
    if-eqz p0, :cond_0

    array-length v0, p0

    if-gtz v0, :cond_1

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    return v0

    :cond_1
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    goto :goto_0
.end method

.method public static shortToByte(S)[B
    .locals 5
    .param p0, "number"    # S

    .prologue
    .line 244
    move v2, p0

    .line 245
    .local v2, "temp":I
    const/4 v3, 0x2

    new-array v0, v3, [B

    .line 246
    .local v0, "b":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-lt v1, v3, :cond_0

    .line 251
    return-object v0

    .line 247
    :cond_0
    new-instance v3, Ljava/lang/Integer;

    and-int/lit16 v4, v2, 0xff

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v3}, Ljava/lang/Integer;->byteValue()B

    move-result v3

    aput-byte v3, v0, v1

    .line 249
    shr-int/lit8 v2, v2, 0x8

    .line 246
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static shortToByteArray(S)[B
    .locals 5
    .param p0, "s"    # S

    .prologue
    const/4 v4, 0x2

    .line 229
    new-array v2, v4, [B

    .line 230
    .local v2, "shortBuf":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v4, :cond_0

    .line 234
    return-object v2

    .line 231
    :cond_0
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    sub-int/2addr v3, v0

    mul-int/lit8 v1, v3, 0x8

    .line 232
    .local v1, "offset":I
    ushr-int v3, p0, v1

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 230
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static shortsToByteArray([S)[B
    .locals 6
    .param p0, "shorts"    # [S

    .prologue
    .line 216
    array-length v5, p0

    mul-int/lit8 v5, v5, 0x2

    new-array v4, v5, [B

    .line 217
    .local v4, "shortsBuf":[B
    const/4 v2, 0x0

    .line 218
    .local v2, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v5, p0

    if-lt v0, v5, :cond_0

    .line 225
    return-object v4

    .line 219
    :cond_0
    aget-short v5, p0, v0

    invoke-static {v5}, Lcom/boyaa/videodemo/utils/ByteUtils;->shortToByte(S)[B

    move-result-object v3

    .line 220
    .local v3, "shortBuf":[B
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1
    const/4 v5, 0x2

    if-lt v1, v5, :cond_1

    .line 218
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 221
    :cond_1
    aget-byte v5, v3, v1

    aput-byte v5, v4, v2

    .line 222
    add-int/lit8 v2, v2, 0x1

    .line 220
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public static stringToGBString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 147
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lcom/boyaa/videodemo/utils/ByteUtils;->bytesArrayToGBString([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static writeUint16ToBytesArray([BII)V
    .locals 2
    .param p0, "bytes"    # [B
    .param p1, "idx"    # I
    .param p2, "val"    # I

    .prologue
    .line 53
    shr-int/lit8 v0, p2, 0x8

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 54
    add-int/lit8 v0, p1, 0x1

    and-int/lit16 v1, p2, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 55
    return-void
.end method

.method public static writeUint32ArrayToBytesArray([BI[I)V
    .locals 4
    .param p0, "bytes"    # [B
    .param p1, "pos"    # I
    .param p2, "val"    # [I

    .prologue
    .line 87
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p2

    if-lt v0, v2, :cond_0

    .line 94
    return-void

    .line 88
    :cond_0
    aget v1, p2, v0

    .line 89
    .local v1, "v":I
    mul-int/lit8 v2, v0, 0x4

    add-int/2addr v2, p1

    shr-int/lit8 v3, v1, 0x18

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p0, v2

    .line 90
    add-int/lit8 v2, p1, 0x1

    mul-int/lit8 v3, v0, 0x4

    add-int/2addr v2, v3

    shr-int/lit8 v3, v1, 0x10

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p0, v2

    .line 91
    add-int/lit8 v2, p1, 0x2

    mul-int/lit8 v3, v0, 0x4

    add-int/2addr v2, v3

    shr-int/lit8 v3, v1, 0x8

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p0, v2

    .line 92
    add-int/lit8 v2, p1, 0x3

    mul-int/lit8 v3, v0, 0x4

    add-int/2addr v2, v3

    and-int/lit16 v3, v1, 0xff

    int-to-byte v3, v3

    aput-byte v3, p0, v2

    .line 87
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static writeUint32ToBytesArray([BII)V
    .locals 2
    .param p0, "bytes"    # [B
    .param p1, "pos"    # I
    .param p2, "val"    # I

    .prologue
    .line 80
    shr-int/lit8 v0, p2, 0x18

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 81
    add-int/lit8 v0, p1, 0x1

    shr-int/lit8 v1, p2, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 82
    add-int/lit8 v0, p1, 0x2

    shr-int/lit8 v1, p2, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 83
    add-int/lit8 v0, p1, 0x3

    and-int/lit16 v1, p2, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 84
    return-void
.end method

.method public static writeUint8ToBytesArray([BII)V
    .locals 1
    .param p0, "bytes"    # [B
    .param p1, "pos"    # I
    .param p2, "val"    # I

    .prologue
    .line 29
    and-int/lit16 v0, p2, 0xff

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 30
    return-void
.end method
