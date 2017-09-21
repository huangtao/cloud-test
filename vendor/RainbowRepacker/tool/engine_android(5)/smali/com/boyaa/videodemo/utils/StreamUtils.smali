.class public Lcom/boyaa/videodemo/utils/StreamUtils;
.super Ljava/lang/Object;
.source "StreamUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static DealNewData(Ljava/io/InputStream;)V
    .locals 11
    .param p0, "ins"    # Ljava/io/InputStream;

    .prologue
    const/16 v10, 0x2800

    const/4 v9, 0x4

    .line 204
    if-nez p0, :cond_1

    .line 271
    :cond_0
    :goto_0
    return-void

    .line 207
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v2

    .line 208
    .local v2, "iAvi":I
    const/4 v6, 0x4

    new-array v1, v6, [B

    .line 209
    .local v1, "dataLen":[B
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    .line 211
    const/4 v4, 0x0

    .line 213
    .local v4, "iPackageLength":I
    const/4 v6, 0x0

    invoke-static {v1, v6}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->bytesToInt([BI)I

    move-result v4

    .line 215
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v3

    .line 216
    .local v3, "iBvi":I
    add-int/lit8 v5, v4, -0x4

    .line 217
    .local v5, "protoDataLen":I
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v6

    if-ne v5, v6, :cond_2

    .line 221
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    .line 223
    const-string v6, "Parase"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "111 Parase Length == "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "Stream Len== "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    if-le v4, v9, :cond_0

    if-ge v4, v10, :cond_0

    .line 226
    new-array v0, v5, [B

    .line 227
    .local v0, "data":[B
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    goto :goto_0

    .line 268
    .end local v0    # "data":[B
    .end local v1    # "dataLen":[B
    .end local v2    # "iAvi":I
    .end local v3    # "iBvi":I
    .end local v4    # "iPackageLength":I
    .end local v5    # "protoDataLen":I
    :catch_0
    move-exception v6

    goto :goto_0

    .line 233
    .restart local v1    # "dataLen":[B
    .restart local v2    # "iAvi":I
    .restart local v3    # "iBvi":I
    .restart local v4    # "iPackageLength":I
    .restart local v5    # "protoDataLen":I
    :cond_2
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 236
    const-string v6, "Parase"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "222 Parase Length == "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "Stream Len== "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    if-le v4, v9, :cond_0

    if-ge v4, v10, :cond_0

    .line 239
    new-array v0, v5, [B

    .line 240
    .restart local v0    # "data":[B
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    .line 242
    invoke-static {p0}, Lcom/boyaa/videodemo/utils/StreamUtils;->DealNewData(Ljava/io/InputStream;)V

    goto/16 :goto_0

    .line 248
    .end local v0    # "data":[B
    :cond_3
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v6

    if-le v5, v6, :cond_0

    .line 251
    const-string v6, "Parase"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "333  Parase Length == "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "Stream Len== "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    if-le v4, v9, :cond_4

    if-le v4, v10, :cond_5

    .line 254
    :cond_4
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    goto/16 :goto_0

    .line 258
    :cond_5
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    .line 260
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v6

    new-array v0, v6, [B

    .line 261
    .restart local v0    # "data":[B
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    .line 263
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v6

    invoke-virtual {v6, v4}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataLength(I)V

    .line 264
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v6

    invoke-virtual {v6, v0}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setData([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0
.end method

.method public static closeInputStream(Ljava/io/InputStream;)Z
    .locals 2
    .param p0, "inStream"    # Ljava/io/InputStream;

    .prologue
    .line 303
    if-eqz p0, :cond_0

    .line 304
    :try_start_0
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 306
    :cond_0
    const/4 v1, 0x1

    .line 309
    :goto_0
    return v1

    .line 307
    :catch_0
    move-exception v0

    .line 308
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 309
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static closeOutputStream(Ljava/io/OutputStream;)Z
    .locals 2
    .param p0, "outStream"    # Ljava/io/OutputStream;

    .prologue
    .line 315
    if-eqz p0, :cond_0

    .line 316
    :try_start_0
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 317
    :cond_0
    const/4 v1, 0x1

    .line 320
    :goto_0
    return v1

    .line 318
    :catch_0
    move-exception v0

    .line 319
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 320
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static parseStream2Array(Ljava/io/InputStream;)[B
    .locals 6
    .param p0, "inStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 280
    if-nez p0, :cond_1

    .line 293
    :cond_0
    :goto_0
    return-object v3

    .line 283
    :cond_1
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v2

    .line 284
    .local v2, "iValue":I
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v4

    if-lez v4, :cond_0

    .line 286
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 287
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v3

    new-array v1, v3, [B

    .line 289
    .local v1, "buf":[B
    :goto_1
    :try_start_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_2

    .line 292
    const-string v3, "Parase"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "222 Parase Length == "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    array-length v5, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "Stream Len== "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 296
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    goto :goto_0

    .line 290
    :cond_2
    :try_start_1
    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 295
    :catchall_0
    move-exception v3

    .line 296
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 297
    throw v3
.end method

.method public static parseStream2Byte(Ljava/io/InputStream;)[B
    .locals 14
    .param p0, "ins"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v13, 0x2800

    const/4 v12, 0x4

    const/4 v8, 0x0

    .line 56
    if-nez p0, :cond_1

    .line 192
    :cond_0
    :goto_0
    return-object v8

    .line 59
    :cond_1
    const/4 v4, 0x0

    .line 60
    .local v4, "iAvi":I
    :try_start_0
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v4

    .line 62
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getDataFin()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 64
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getDataLength()I

    move-result v9

    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    invoke-virtual {v10}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getData()[B

    move-result-object v10

    array-length v10, v10

    sub-int v5, v9, v10

    .line 65
    .local v5, "iDataRemain":I
    if-gez v5, :cond_2

    .line 67
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    goto :goto_0

    .line 190
    .end local v5    # "iDataRemain":I
    :catch_0
    move-exception v9

    goto :goto_0

    .line 70
    .restart local v5    # "iDataRemain":I
    :cond_2
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v9

    add-int/lit8 v9, v9, 0x4

    if-le v5, v9, :cond_3

    .line 76
    const-string v9, "Parase"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "003 Parase Length == "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "Stream Len== "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    .line 80
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v9

    new-array v1, v9, [B

    .line 81
    .local v1, "data":[B
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    .line 83
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v9

    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v10

    invoke-virtual {v10}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getData()[B

    move-result-object v10

    invoke-static {v10, v1}, Lcom/boyaa/videodemo/utils/ByteUtils;->append([B[B)[B

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setData([B)V

    goto/16 :goto_0

    .line 88
    .end local v1    # "data":[B
    :cond_3
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v9

    add-int/lit8 v9, v9, 0x4

    if-ne v5, v9, :cond_4

    .line 90
    const-string v9, "Parase"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "001 Parase Length == "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "Stream Len== "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    .line 92
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v9

    new-array v3, v9, [B

    .line 93
    .local v3, "dataReamin":[B
    invoke-virtual {p0, v3}, Ljava/io/InputStream;->read([B)I

    .line 95
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getData()[B

    move-result-object v9

    invoke-static {v9, v3}, Lcom/boyaa/videodemo/utils/ByteUtils;->append([B[B)[B

    move-result-object v8

    goto/16 :goto_0

    .line 97
    .end local v3    # "dataReamin":[B
    :cond_4
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v9

    add-int/lit8 v9, v9, 0x4

    if-ge v5, v9, :cond_0

    .line 99
    const-string v9, "Parase"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "002 Parase Length == "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "Stream Len== "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    add-int/lit8 v9, v5, -0x4

    new-array v3, v9, [B

    .line 101
    .restart local v3    # "dataReamin":[B
    invoke-virtual {p0, v3}, Ljava/io/InputStream;->read([B)I

    .line 103
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v9

    invoke-virtual {v9}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getData()[B

    move-result-object v9

    invoke-static {v9, v3}, Lcom/boyaa/videodemo/utils/ByteUtils;->append([B[B)[B

    .line 105
    invoke-static {p0}, Lcom/boyaa/videodemo/utils/StreamUtils;->DealNewData(Ljava/io/InputStream;)V

    goto/16 :goto_0

    .line 112
    .end local v3    # "dataReamin":[B
    .end local v5    # "iDataRemain":I
    :cond_5
    const/4 v9, 0x4

    new-array v2, v9, [B

    .line 113
    .local v2, "dataLen":[B
    invoke-virtual {p0, v2}, Ljava/io/InputStream;->read([B)I

    .line 115
    const/4 v6, 0x0

    .line 117
    .local v6, "iPackageLength":I
    if-eqz v2, :cond_6

    .line 119
    const/4 v9, 0x0

    invoke-static {v2, v9}, Lcom/boyaa/videodemo/utils/ProtoBufParser;->bytesToInt([BI)I

    move-result v6

    .line 121
    :cond_6
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v0

    .line 122
    .local v0, "bAvi":I
    add-int/lit8 v7, v6, -0x4

    .line 123
    .local v7, "protoDataLen":I
    if-lez v7, :cond_0

    .line 125
    if-le v7, v13, :cond_7

    .line 127
    const-string v9, "Parase"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "09090909 Parase Length ="

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 131
    :cond_7
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v9

    if-ne v7, v9, :cond_9

    .line 134
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    .line 136
    const-string v9, "Parase"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "1 Parase Length == "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "Stream Len== "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    if-le v6, v12, :cond_8

    if-ge v6, v13, :cond_8

    .line 139
    new-array v1, v7, [B

    .line 140
    .restart local v1    # "data":[B
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    goto/16 :goto_0

    .line 145
    .end local v1    # "data":[B
    :cond_8
    const-string v9, "Parase"

    const-string v10, "1 \u65e0\u6548\u6570\u636e"

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 149
    :cond_9
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v9

    if-le v7, v9, :cond_c

    .line 152
    const-string v9, "Parase"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "3 Parase Length == "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "Stream Len== "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    if-le v6, v12, :cond_a

    if-le v6, v13, :cond_b

    .line 155
    :cond_a
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    goto/16 :goto_0

    .line 159
    :cond_b
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataFin(Z)V

    .line 161
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v9

    new-array v1, v9, [B

    .line 162
    .restart local v1    # "data":[B
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    .line 164
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v9

    invoke-virtual {v9, v6}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setDataLength(I)V

    .line 165
    invoke-static {}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->getInstance()Lcom/boyaa/videodemo/utils/VideoDataBuffer;

    move-result-object v9

    invoke-virtual {v9, v1}, Lcom/boyaa/videodemo/utils/VideoDataBuffer;->setData([B)V

    goto/16 :goto_0

    .line 169
    .end local v1    # "data":[B
    :cond_c
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v9

    if-ge v7, v9, :cond_0

    .line 172
    const-string v9, "Parase"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "2 Parase Length == "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "Stream Len== "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/boyaa/videodemo/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    if-le v6, v12, :cond_0

    if-ge v6, v13, :cond_0

    .line 175
    new-array v1, v7, [B

    .line 176
    .restart local v1    # "data":[B
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    .line 178
    invoke-static {p0}, Lcom/boyaa/videodemo/utils/StreamUtils;->DealNewData(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0
.end method

.method public static readAll(Ljava/io/InputStream;[B)V
    .locals 3
    .param p0, "ins"    # Ljava/io/InputStream;
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 12
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 29
    :cond_0
    :goto_0
    return-void

    .line 15
    :cond_1
    array-length v0, p1

    .line 17
    .local v0, "len":I
    :goto_1
    if-lez v0, :cond_0

    .line 18
    :try_start_0
    array-length v2, p1

    sub-int/2addr v2, v0

    invoke-virtual {p0, p1, v2, v0}, Ljava/io/InputStream;->read([BII)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 19
    .local v1, "read":I
    if-ltz v1, :cond_0

    .line 24
    sub-int/2addr v0, v1

    goto :goto_1

    .line 26
    .end local v1    # "read":I
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static skipAll(Ljava/io/InputStream;I)V
    .locals 4
    .param p0, "inStream"    # Ljava/io/InputStream;
    .param p1, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    if-nez p0, :cond_2

    .line 50
    :goto_0
    return-void

    .line 42
    :cond_0
    int-to-long v2, p1

    invoke-virtual {p0, v2, v3}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 43
    .local v0, "skip":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gez v2, :cond_1

    .line 44
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Socket closed."

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 47
    :cond_1
    int-to-long v2, p1

    sub-long/2addr v2, v0

    long-to-int p1, v2

    .line 41
    .end local v0    # "skip":J
    :cond_2
    if-gtz p1, :cond_0

    goto :goto_0
.end method
