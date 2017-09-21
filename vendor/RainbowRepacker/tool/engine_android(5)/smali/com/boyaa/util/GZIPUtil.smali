.class public Lcom/boyaa/util/GZIPUtil;
.super Ljava/lang/Object;
.source "GZIPUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static doCompressFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p0, "inFileName"    # Ljava/lang/String;
    .param p1, "outFileName"    # Ljava/lang/String;

    .prologue
    .line 30
    const/4 v4, 0x0

    .line 32
    .local v4, "out":Ljava/util/zip/GZIPOutputStream;
    :try_start_0
    new-instance v5, Ljava/util/zip/GZIPOutputStream;

    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v4    # "out":Ljava/util/zip/GZIPOutputStream;
    .local v5, "out":Ljava/util/zip/GZIPOutputStream;
    move-object v4, v5

    .line 36
    .end local v5    # "out":Ljava/util/zip/GZIPOutputStream;
    .restart local v4    # "out":Ljava/util/zip/GZIPOutputStream;
    :goto_0
    const/4 v1, 0x0

    .line 38
    .local v1, "in":Ljava/io/FileInputStream;
    :try_start_1
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .end local v1    # "in":Ljava/io/FileInputStream;
    .local v2, "in":Ljava/io/FileInputStream;
    move-object v1, v2

    .line 42
    .end local v2    # "in":Ljava/io/FileInputStream;
    .restart local v1    # "in":Ljava/io/FileInputStream;
    :goto_1
    const/16 v6, 0x400

    :try_start_2
    new-array v0, v6, [B

    .line 44
    .local v0, "buf":[B
    :goto_2
    invoke-virtual {v1, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    .local v3, "len":I
    if-gtz v3, :cond_0

    .line 47
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 49
    invoke-virtual {v4}, Ljava/util/zip/GZIPOutputStream;->finish()V

    .line 50
    invoke-virtual {v4}, Ljava/util/zip/GZIPOutputStream;->close()V

    .line 55
    .end local v0    # "buf":[B
    .end local v1    # "in":Ljava/io/FileInputStream;
    .end local v3    # "len":I
    :goto_3
    return-void

    .line 45
    .restart local v0    # "buf":[B
    .restart local v1    # "in":Ljava/io/FileInputStream;
    .restart local v3    # "len":I
    :cond_0
    const/4 v6, 0x0

    invoke-virtual {v4, v0, v6, v3}, Ljava/util/zip/GZIPOutputStream;->write([BII)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2

    .line 52
    .end local v0    # "buf":[B
    .end local v1    # "in":Ljava/io/FileInputStream;
    .end local v3    # "len":I
    :catch_0
    move-exception v6

    goto :goto_3

    .line 39
    .restart local v1    # "in":Ljava/io/FileInputStream;
    :catch_1
    move-exception v6

    goto :goto_1

    .line 33
    .end local v1    # "in":Ljava/io/FileInputStream;
    :catch_2
    move-exception v6

    goto :goto_0
.end method

.method public static doCompressString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p0, "sourceString"    # Ljava/lang/String;
    .param p1, "sourceCharset"    # Ljava/lang/String;
    .param p2, "outCharset"    # Ljava/lang/String;

    .prologue
    .line 131
    const-string v10, ""

    .line 132
    .local v10, "result":Ljava/lang/String;
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_0

    move-object v11, v10

    .line 191
    .end local v10    # "result":Ljava/lang/String;
    .local v11, "result":Ljava/lang/String;
    :goto_0
    return-object v11

    .line 136
    .end local v11    # "result":Ljava/lang/String;
    .restart local v10    # "result":Ljava/lang/String;
    :cond_0
    const/4 v8, 0x0

    .line 137
    .local v8, "inBytes":[B
    const/4 v1, 0x0

    .line 138
    .local v1, "byteIn":Ljava/io/ByteArrayInputStream;
    const/4 v3, 0x0

    .line 139
    .local v3, "byteOut":Ljava/io/ByteArrayOutputStream;
    const/4 v6, 0x0

    .line 143
    .local v6, "gzipOut":Ljava/util/zip/GZIPOutputStream;
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 144
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    .line 148
    :goto_1
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v8}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_a
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    .end local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .local v2, "byteIn":Ljava/io/ByteArrayInputStream;
    :try_start_1
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_b
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 150
    .end local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .local v4, "byteOut":Ljava/io/ByteArrayOutputStream;
    const/16 v12, 0x400

    :try_start_2
    new-array v0, v12, [B

    .line 152
    .local v0, "buffer":[B
    new-instance v7, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v7, v4}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_c
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 154
    .end local v6    # "gzipOut":Ljava/util/zip/GZIPOutputStream;
    .local v7, "gzipOut":Ljava/util/zip/GZIPOutputStream;
    :goto_2
    :try_start_3
    invoke-virtual {v2, v0}, Ljava/io/ByteArrayInputStream;->read([B)I

    move-result v9

    .local v9, "length":I
    if-gtz v9, :cond_5

    .line 157
    invoke-virtual {v7}, Ljava/util/zip/GZIPOutputStream;->finish()V

    .line 159
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_9

    .line 160
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    move-result-object v10

    .line 169
    :goto_3
    if-eqz v2, :cond_1

    .line 171
    :try_start_4
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 176
    :cond_1
    :goto_4
    if-eqz v7, :cond_2

    .line 178
    :try_start_5
    invoke-virtual {v7}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 183
    :cond_2
    :goto_5
    if-eqz v4, :cond_3

    .line 185
    :try_start_6
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    :cond_3
    :goto_6
    move-object v11, v10

    .line 164
    .end local v10    # "result":Ljava/lang/String;
    .restart local v11    # "result":Ljava/lang/String;
    goto :goto_0

    .line 146
    .end local v0    # "buffer":[B
    .end local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .end local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "gzipOut":Ljava/util/zip/GZIPOutputStream;
    .end local v9    # "length":I
    .end local v11    # "result":Ljava/lang/String;
    .restart local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v6    # "gzipOut":Ljava/util/zip/GZIPOutputStream;
    .restart local v10    # "result":Ljava/lang/String;
    :cond_4
    :try_start_7
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_a
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-result-object v8

    goto :goto_1

    .line 155
    .end local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzipOut":Ljava/util/zip/GZIPOutputStream;
    .restart local v0    # "buffer":[B
    .restart local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzipOut":Ljava/util/zip/GZIPOutputStream;
    .restart local v9    # "length":I
    :cond_5
    const/4 v12, 0x0

    :try_start_8
    invoke-virtual {v7, v0, v12, v9}, Ljava/util/zip/GZIPOutputStream;->write([BII)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    goto :goto_2

    .line 166
    .end local v9    # "length":I
    :catch_0
    move-exception v5

    move-object v6, v7

    .end local v7    # "gzipOut":Ljava/util/zip/GZIPOutputStream;
    .restart local v6    # "gzipOut":Ljava/util/zip/GZIPOutputStream;
    move-object v3, v4

    .end local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .line 167
    .end local v0    # "buffer":[B
    .end local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .local v5, "e":Ljava/lang/Exception;
    :goto_7
    :try_start_9
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 169
    if-eqz v1, :cond_6

    .line 171
    :try_start_a
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_4

    .line 176
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_6
    :goto_8
    if-eqz v6, :cond_7

    .line 178
    :try_start_b
    invoke-virtual {v6}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_5

    .line 183
    :cond_7
    :goto_9
    if-eqz v3, :cond_8

    .line 185
    :try_start_c
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_6

    :cond_8
    :goto_a
    move-object v11, v10

    .line 191
    .end local v10    # "result":Ljava/lang/String;
    .restart local v11    # "result":Ljava/lang/String;
    goto :goto_0

    .line 162
    .end local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzipOut":Ljava/util/zip/GZIPOutputStream;
    .end local v11    # "result":Ljava/lang/String;
    .restart local v0    # "buffer":[B
    .restart local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzipOut":Ljava/util/zip/GZIPOutputStream;
    .restart local v9    # "length":I
    .restart local v10    # "result":Ljava/lang/String;
    :cond_9
    :try_start_d
    invoke-virtual {v4, p2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_0
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    move-result-object v10

    goto :goto_3

    .line 172
    :catch_1
    move-exception v5

    .line 173
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    .line 179
    .end local v5    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v5

    .line 180
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_5

    .line 186
    .end local v5    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v5

    .line 187
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_6

    .line 172
    .end local v0    # "buffer":[B
    .end local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .end local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "gzipOut":Ljava/util/zip/GZIPOutputStream;
    .end local v9    # "length":I
    .restart local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .local v5, "e":Ljava/lang/Exception;
    .restart local v6    # "gzipOut":Ljava/util/zip/GZIPOutputStream;
    :catch_4
    move-exception v5

    .line 173
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_8

    .line 179
    .end local v5    # "e":Ljava/io/IOException;
    :catch_5
    move-exception v5

    .line 180
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_9

    .line 186
    .end local v5    # "e":Ljava/io/IOException;
    :catch_6
    move-exception v5

    .line 187
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_a

    .line 168
    .end local v5    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v12

    .line 169
    :goto_b
    if-eqz v1, :cond_a

    .line 171
    :try_start_e
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_7

    .line 176
    :cond_a
    :goto_c
    if-eqz v6, :cond_b

    .line 178
    :try_start_f
    invoke-virtual {v6}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_8

    .line 183
    :cond_b
    :goto_d
    if-eqz v3, :cond_c

    .line 185
    :try_start_10
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_9

    .line 190
    :cond_c
    :goto_e
    throw v12

    .line 172
    :catch_7
    move-exception v5

    .line 173
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_c

    .line 179
    .end local v5    # "e":Ljava/io/IOException;
    :catch_8
    move-exception v5

    .line 180
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_d

    .line 186
    .end local v5    # "e":Ljava/io/IOException;
    :catch_9
    move-exception v5

    .line 187
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_e

    .line 168
    .end local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .end local v5    # "e":Ljava/io/IOException;
    .restart local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    :catchall_1
    move-exception v12

    move-object v1, v2

    .end local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    goto :goto_b

    .end local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    :catchall_2
    move-exception v12

    move-object v3, v4

    .end local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    goto :goto_b

    .end local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzipOut":Ljava/util/zip/GZIPOutputStream;
    .restart local v0    # "buffer":[B
    .restart local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzipOut":Ljava/util/zip/GZIPOutputStream;
    :catchall_3
    move-exception v12

    move-object v6, v7

    .end local v7    # "gzipOut":Ljava/util/zip/GZIPOutputStream;
    .restart local v6    # "gzipOut":Ljava/util/zip/GZIPOutputStream;
    move-object v3, v4

    .end local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    goto :goto_b

    .line 166
    .end local v0    # "buffer":[B
    :catch_a
    move-exception v5

    goto :goto_7

    .end local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    :catch_b
    move-exception v5

    move-object v1, v2

    .end local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    goto :goto_7

    .end local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    :catch_c
    move-exception v5

    move-object v3, v4

    .end local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    goto :goto_7
.end method

.method public static doUncompressFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p0, "inFileName"    # Ljava/lang/String;
    .param p1, "outFileName"    # Ljava/lang/String;

    .prologue
    .line 65
    const/4 v1, 0x0

    .line 67
    .local v1, "in":Ljava/util/zip/GZIPInputStream;
    :try_start_0
    new-instance v2, Ljava/util/zip/GZIPInputStream;

    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v6}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "in":Ljava/util/zip/GZIPInputStream;
    .local v2, "in":Ljava/util/zip/GZIPInputStream;
    move-object v1, v2

    .line 71
    .end local v2    # "in":Ljava/util/zip/GZIPInputStream;
    .restart local v1    # "in":Ljava/util/zip/GZIPInputStream;
    :goto_0
    const/4 v4, 0x0

    .line 73
    .local v4, "out":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .end local v4    # "out":Ljava/io/FileOutputStream;
    .local v5, "out":Ljava/io/FileOutputStream;
    move-object v4, v5

    .line 77
    .end local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v4    # "out":Ljava/io/FileOutputStream;
    :goto_1
    const/16 v6, 0x400

    :try_start_2
    new-array v0, v6, [B

    .line 79
    .local v0, "buf":[B
    :goto_2
    invoke-virtual {v1, v0}, Ljava/util/zip/GZIPInputStream;->read([B)I

    move-result v3

    .local v3, "len":I
    if-gtz v3, :cond_0

    .line 83
    invoke-virtual {v1}, Ljava/util/zip/GZIPInputStream;->close()V

    .line 84
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 88
    .end local v0    # "buf":[B
    .end local v3    # "len":I
    .end local v4    # "out":Ljava/io/FileOutputStream;
    :goto_3
    return-void

    .line 80
    .restart local v0    # "buf":[B
    .restart local v3    # "len":I
    .restart local v4    # "out":Ljava/io/FileOutputStream;
    :cond_0
    const/4 v6, 0x0

    invoke-virtual {v4, v0, v6, v3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2

    .line 86
    .end local v0    # "buf":[B
    .end local v3    # "len":I
    .end local v4    # "out":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v6

    goto :goto_3

    .line 74
    .restart local v4    # "out":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v6

    goto :goto_1

    .line 68
    .end local v4    # "out":Ljava/io/FileOutputStream;
    :catch_2
    move-exception v6

    goto :goto_0
.end method

.method public static doUncompressString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p0, "sourceString"    # Ljava/lang/String;
    .param p1, "sourceCharset"    # Ljava/lang/String;
    .param p2, "outCharset"    # Ljava/lang/String;

    .prologue
    .line 202
    const-string v10, ""

    .line 203
    .local v10, "result":Ljava/lang/String;
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_0

    move-object v11, v10

    .line 262
    .end local v10    # "result":Ljava/lang/String;
    .local v11, "result":Ljava/lang/String;
    :goto_0
    return-object v11

    .line 207
    .end local v11    # "result":Ljava/lang/String;
    .restart local v10    # "result":Ljava/lang/String;
    :cond_0
    const/4 v8, 0x0

    .line 208
    .local v8, "inBytes":[B
    const/4 v1, 0x0

    .line 209
    .local v1, "byteIn":Ljava/io/ByteArrayInputStream;
    const/4 v3, 0x0

    .line 210
    .local v3, "byteOut":Ljava/io/ByteArrayOutputStream;
    const/4 v6, 0x0

    .line 214
    .local v6, "gzipIn":Ljava/util/zip/GZIPInputStream;
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 215
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    .line 220
    :goto_1
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v8}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_a
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 221
    .end local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .local v2, "byteIn":Ljava/io/ByteArrayInputStream;
    :try_start_1
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_b
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 222
    .end local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .local v4, "byteOut":Ljava/io/ByteArrayOutputStream;
    const/16 v12, 0x400

    :try_start_2
    new-array v0, v12, [B

    .line 224
    .local v0, "buffer":[B
    new-instance v7, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v7, v2}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_c
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 226
    .end local v6    # "gzipIn":Ljava/util/zip/GZIPInputStream;
    .local v7, "gzipIn":Ljava/util/zip/GZIPInputStream;
    :goto_2
    :try_start_3
    invoke-virtual {v7, v0}, Ljava/util/zip/GZIPInputStream;->read([B)I

    move-result v9

    .local v9, "length":I
    if-gtz v9, :cond_5

    .line 230
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_9

    .line 231
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    move-result-object v10

    .line 240
    :goto_3
    if-eqz v7, :cond_1

    .line 242
    :try_start_4
    invoke-virtual {v7}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 247
    :cond_1
    :goto_4
    if-eqz v2, :cond_2

    .line 249
    :try_start_5
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 254
    :cond_2
    :goto_5
    if-eqz v4, :cond_3

    .line 256
    :try_start_6
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    :cond_3
    :goto_6
    move-object v11, v10

    .line 235
    .end local v10    # "result":Ljava/lang/String;
    .restart local v11    # "result":Ljava/lang/String;
    goto :goto_0

    .line 217
    .end local v0    # "buffer":[B
    .end local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .end local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "gzipIn":Ljava/util/zip/GZIPInputStream;
    .end local v9    # "length":I
    .end local v11    # "result":Ljava/lang/String;
    .restart local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v6    # "gzipIn":Ljava/util/zip/GZIPInputStream;
    .restart local v10    # "result":Ljava/lang/String;
    :cond_4
    :try_start_7
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_a
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-result-object v8

    goto :goto_1

    .line 227
    .end local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzipIn":Ljava/util/zip/GZIPInputStream;
    .restart local v0    # "buffer":[B
    .restart local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzipIn":Ljava/util/zip/GZIPInputStream;
    .restart local v9    # "length":I
    :cond_5
    const/4 v12, 0x0

    :try_start_8
    invoke-virtual {v4, v0, v12, v9}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    goto :goto_2

    .line 237
    .end local v9    # "length":I
    :catch_0
    move-exception v5

    move-object v6, v7

    .end local v7    # "gzipIn":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "gzipIn":Ljava/util/zip/GZIPInputStream;
    move-object v3, v4

    .end local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .line 238
    .end local v0    # "buffer":[B
    .end local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .local v5, "e":Ljava/lang/Exception;
    :goto_7
    :try_start_9
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 240
    if-eqz v6, :cond_6

    .line 242
    :try_start_a
    invoke-virtual {v6}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_4

    .line 247
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_6
    :goto_8
    if-eqz v1, :cond_7

    .line 249
    :try_start_b
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_5

    .line 254
    :cond_7
    :goto_9
    if-eqz v3, :cond_8

    .line 256
    :try_start_c
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_6

    :cond_8
    :goto_a
    move-object v11, v10

    .line 262
    .end local v10    # "result":Ljava/lang/String;
    .restart local v11    # "result":Ljava/lang/String;
    goto :goto_0

    .line 233
    .end local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzipIn":Ljava/util/zip/GZIPInputStream;
    .end local v11    # "result":Ljava/lang/String;
    .restart local v0    # "buffer":[B
    .restart local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzipIn":Ljava/util/zip/GZIPInputStream;
    .restart local v9    # "length":I
    .restart local v10    # "result":Ljava/lang/String;
    :cond_9
    :try_start_d
    invoke-virtual {v4, p2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_0
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    move-result-object v10

    goto :goto_3

    .line 243
    :catch_1
    move-exception v5

    .line 244
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    .line 250
    .end local v5    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v5

    .line 251
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_5

    .line 257
    .end local v5    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v5

    .line 258
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_6

    .line 243
    .end local v0    # "buffer":[B
    .end local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .end local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "gzipIn":Ljava/util/zip/GZIPInputStream;
    .end local v9    # "length":I
    .restart local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .local v5, "e":Ljava/lang/Exception;
    .restart local v6    # "gzipIn":Ljava/util/zip/GZIPInputStream;
    :catch_4
    move-exception v5

    .line 244
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_8

    .line 250
    .end local v5    # "e":Ljava/io/IOException;
    :catch_5
    move-exception v5

    .line 251
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_9

    .line 257
    .end local v5    # "e":Ljava/io/IOException;
    :catch_6
    move-exception v5

    .line 258
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_a

    .line 239
    .end local v5    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v12

    .line 240
    :goto_b
    if-eqz v6, :cond_a

    .line 242
    :try_start_e
    invoke-virtual {v6}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_7

    .line 247
    :cond_a
    :goto_c
    if-eqz v1, :cond_b

    .line 249
    :try_start_f
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_8

    .line 254
    :cond_b
    :goto_d
    if-eqz v3, :cond_c

    .line 256
    :try_start_10
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_9

    .line 261
    :cond_c
    :goto_e
    throw v12

    .line 243
    :catch_7
    move-exception v5

    .line 244
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_c

    .line 250
    .end local v5    # "e":Ljava/io/IOException;
    :catch_8
    move-exception v5

    .line 251
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_d

    .line 257
    .end local v5    # "e":Ljava/io/IOException;
    :catch_9
    move-exception v5

    .line 258
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_e

    .line 239
    .end local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .end local v5    # "e":Ljava/io/IOException;
    .restart local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    :catchall_1
    move-exception v12

    move-object v1, v2

    .end local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    goto :goto_b

    .end local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    :catchall_2
    move-exception v12

    move-object v3, v4

    .end local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    goto :goto_b

    .end local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzipIn":Ljava/util/zip/GZIPInputStream;
    .restart local v0    # "buffer":[B
    .restart local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzipIn":Ljava/util/zip/GZIPInputStream;
    :catchall_3
    move-exception v12

    move-object v6, v7

    .end local v7    # "gzipIn":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "gzipIn":Ljava/util/zip/GZIPInputStream;
    move-object v3, v4

    .end local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    goto :goto_b

    .line 237
    .end local v0    # "buffer":[B
    :catch_a
    move-exception v5

    goto :goto_7

    .end local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    :catch_b
    move-exception v5

    move-object v1, v2

    .end local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    goto :goto_7

    .end local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    .end local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    :catch_c
    move-exception v5

    move-object v3, v4

    .end local v4    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "byteOut":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "byteIn":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "byteIn":Ljava/io/ByteArrayInputStream;
    goto :goto_7
.end method

.method public static unzipString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p0, "zippedText"    # Ljava/lang/String;
    .param p1, "srcCharset"    # Ljava/lang/String;
    .param p2, "outCharset"    # Ljava/lang/String;

    .prologue
    .line 98
    const/4 v6, 0x0

    .line 99
    .local v6, "unzipped":Ljava/lang/String;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_0

    const-string p1, "utf-8"

    .line 100
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    const-string p2, "utf-8"

    .line 102
    :cond_1
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v7

    .line 104
    .local v7, "zbytes":[B
    array-length v8, v7

    add-int/lit8 v8, v8, 0x1

    new-array v5, v8, [B

    .line 105
    .local v5, "input":[B
    const/4 v8, 0x0

    const/4 v9, 0x0

    array-length v10, v7

    invoke-static {v7, v8, v5, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 106
    array-length v8, v7

    const/4 v9, 0x0

    aput-byte v9, v5, v8

    .line 107
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 108
    .local v1, "bin":Ljava/io/ByteArrayInputStream;
    new-instance v4, Ljava/util/zip/InflaterInputStream;

    invoke-direct {v4, v1}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 109
    .local v4, "in":Ljava/util/zip/InflaterInputStream;
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    const/16 v8, 0x200

    invoke-direct {v2, v8}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 111
    .local v2, "bout":Ljava/io/ByteArrayOutputStream;
    :goto_0
    invoke-virtual {v4}, Ljava/util/zip/InflaterInputStream;->read()I

    move-result v0

    .local v0, "b":I
    const/4 v8, -0x1

    if-ne v0, v8, :cond_2

    .line 114
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V

    .line 115
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 116
    invoke-virtual {v2, p2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 120
    .end local v0    # "b":I
    .end local v1    # "bin":Ljava/io/ByteArrayInputStream;
    .end local v2    # "bout":Ljava/io/ByteArrayOutputStream;
    .end local v4    # "in":Ljava/util/zip/InflaterInputStream;
    .end local v5    # "input":[B
    .end local v7    # "zbytes":[B
    :goto_1
    return-object v6

    .line 112
    .restart local v0    # "b":I
    .restart local v1    # "bin":Ljava/io/ByteArrayInputStream;
    .restart local v2    # "bout":Ljava/io/ByteArrayOutputStream;
    .restart local v4    # "in":Ljava/util/zip/InflaterInputStream;
    .restart local v5    # "input":[B
    .restart local v7    # "zbytes":[B
    :cond_2
    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 117
    .end local v0    # "b":I
    .end local v1    # "bin":Ljava/io/ByteArrayInputStream;
    .end local v2    # "bout":Ljava/io/ByteArrayOutputStream;
    .end local v4    # "in":Ljava/util/zip/InflaterInputStream;
    .end local v5    # "input":[B
    .end local v7    # "zbytes":[B
    :catch_0
    move-exception v3

    .line 118
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static zipString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B
    .locals 6
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "srcCharset"    # Ljava/lang/String;
    .param p2, "outCharset"    # Ljava/lang/String;

    .prologue
    .line 266
    const/4 v4, 0x0

    .line 267
    .local v4, "zipped":[B
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    const-string p1, "utf-8"

    .line 268
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    const-string p2, "utf-8"

    .line 270
    :cond_1
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    .line 275
    .local v3, "zbytes":[B
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 276
    .local v0, "bout":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Ljava/util/zip/DeflaterOutputStream;

    invoke-direct {v2, v0}, Ljava/util/zip/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 277
    .local v2, "out":Ljava/util/zip/DeflaterOutputStream;
    invoke-virtual {v2, v3}, Ljava/util/zip/DeflaterOutputStream;->write([B)V

    .line 278
    invoke-virtual {v2}, Ljava/util/zip/DeflaterOutputStream;->close()V

    .line 279
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 284
    .end local v0    # "bout":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "out":Ljava/util/zip/DeflaterOutputStream;
    .end local v3    # "zbytes":[B
    :goto_0
    return-object v4

    .line 280
    :catch_0
    move-exception v1

    .line 281
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
