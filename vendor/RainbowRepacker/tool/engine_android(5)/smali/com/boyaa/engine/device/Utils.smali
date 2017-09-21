.class public Lcom/boyaa/engine/device/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static bmp2File(Landroid/graphics/Bitmap;Ljava/lang/String;Landroid/graphics/Bitmap$CompressFormat;I)Ljava/lang/String;
    .locals 8
    .param p0, "bmp"    # Landroid/graphics/Bitmap;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "format"    # Landroid/graphics/Bitmap$CompressFormat;
    .param p3, "quality"    # I

    .prologue
    const/4 v6, 0x0

    .line 121
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    if-ne v5, p2, :cond_1

    const-string v5, ".png"

    :goto_0
    invoke-static {v5}, Lcom/boyaa/engine/device/Utils;->randomFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 122
    .local v3, "fileName":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 123
    .local v4, "fullPath":Ljava/lang/String;
    invoke-static {v3}, Lcom/boyaa/engine/device/Utils;->deleteFile(Ljava/lang/String;)Z

    .line 124
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 126
    .local v2, "file":Ljava/io/File;
    :try_start_0
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    const/4 v1, 0x0

    .line 133
    .local v1, "fOut":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v1, Ljava/io/FileOutputStream;

    .end local v1    # "fOut":Ljava/io/FileOutputStream;
    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 138
    .restart local v1    # "fOut":Ljava/io/FileOutputStream;
    invoke-virtual {p0, p2, p3, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 140
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V

    .line 141
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 142
    const/4 v1, 0x0

    .line 148
    if-eqz v1, :cond_0

    .line 149
    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5

    .line 150
    const/4 v1, 0x0

    .line 158
    .end local v1    # "fOut":Ljava/io/FileOutputStream;
    .end local v3    # "fileName":Ljava/lang/String;
    :cond_0
    :goto_1
    return-object v3

    .line 121
    .end local v2    # "file":Ljava/io/File;
    .end local v4    # "fullPath":Ljava/lang/String;
    :cond_1
    const-string v5, ".jpg"

    goto :goto_0

    .line 127
    .restart local v2    # "file":Ljava/io/File;
    .restart local v3    # "fileName":Ljava/lang/String;
    .restart local v4    # "fullPath":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 128
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    move-object v3, v6

    .line 129
    goto :goto_1

    .line 134
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 135
    .local v0, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    move-object v3, v6

    .line 136
    goto :goto_1

    .line 143
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    .restart local v1    # "fOut":Ljava/io/FileOutputStream;
    :catch_2
    move-exception v0

    .line 144
    .local v0, "e":Ljava/io/IOException;
    :try_start_4
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 148
    if-eqz v1, :cond_2

    .line 149
    :try_start_5
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 150
    const/4 v1, 0x0

    :cond_2
    move-object v3, v6

    .line 145
    goto :goto_1

    .line 153
    :catch_3
    move-exception v0

    .line 154
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v3, v6

    .line 155
    goto :goto_1

    .line 146
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    .line 148
    if-eqz v1, :cond_3

    .line 149
    :try_start_6
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    .line 150
    const/4 v1, 0x0

    .line 157
    :cond_3
    throw v5

    .line 153
    :catch_4
    move-exception v0

    .line 154
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v3, v6

    .line 155
    goto :goto_1

    .line 153
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_5
    move-exception v0

    .line 154
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v3, v6

    .line 155
    goto :goto_1
.end method

.method public static calcScaleSize(Ljava/lang/String;II)Landroid/graphics/Point;
    .locals 6
    .param p0, "file"    # Ljava/lang/String;
    .param p1, "outW"    # I
    .param p2, "outH"    # I

    .prologue
    .line 92
    invoke-static {p0}, Lcom/boyaa/engine/device/Utils;->getBitmapSize(Ljava/lang/String;)Landroid/graphics/Point;

    move-result-object v2

    .line 93
    .local v2, "size":Landroid/graphics/Point;
    iget v1, v2, Landroid/graphics/Point;->x:I

    .line 94
    .local v1, "originW":I
    iget v0, v2, Landroid/graphics/Point;->y:I

    .line 96
    .local v0, "originH":I
    if-gtz p1, :cond_1

    if-gtz p2, :cond_1

    .line 98
    move p1, v1

    .line 99
    move p2, v0

    .line 116
    :cond_0
    :goto_0
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3, p1, p2}, Landroid/graphics/Point;-><init>(II)V

    return-object v3

    .line 101
    :cond_1
    if-lez p1, :cond_2

    if-gtz p2, :cond_0

    .line 103
    :cond_2
    if-gtz p1, :cond_3

    .line 105
    int-to-float v3, v1

    int-to-float v4, p2

    int-to-float v5, v0

    div-float/2addr v4, v5

    mul-float/2addr v3, v4

    float-to-int p1, v3

    .line 106
    goto :goto_0

    .line 109
    :cond_3
    int-to-float v3, v0

    int-to-float v4, p1

    int-to-float v5, v1

    div-float/2addr v4, v5

    mul-float/2addr v3, v4

    float-to-int p2, v3

    goto :goto_0
.end method

.method public static deleteFile(Ljava/lang/String;)Z
    .locals 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 19
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 20
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 21
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    .line 23
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getBitmapSize(Ljava/lang/String;)Landroid/graphics/Point;
    .locals 4
    .param p0, "file"    # Ljava/lang/String;

    .prologue
    .line 27
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 28
    .local v0, "bmOptions":Landroid/graphics/BitmapFactory$Options;
    const/4 v3, 0x1

    iput-boolean v3, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 29
    invoke-static {p0, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 30
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 31
    .local v2, "originW":I
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 32
    .local v1, "originH":I
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3, v2, v1}, Landroid/graphics/Point;-><init>(II)V

    return-object v3
.end method

.method public static randomFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "ext"    # Ljava/lang/String;

    .prologue
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static scaleAndSaveBitmap(Ljava/lang/String;IILjava/lang/String;Landroid/graphics/Bitmap$CompressFormat;I)Ljava/lang/String;
    .locals 14
    .param p0, "file"    # Ljava/lang/String;
    .param p1, "outW"    # I
    .param p2, "outH"    # I
    .param p3, "outPath"    # Ljava/lang/String;
    .param p4, "format"    # Landroid/graphics/Bitmap$CompressFormat;
    .param p5, "quality"    # I

    .prologue
    .line 37
    invoke-static {p0}, Lcom/boyaa/engine/device/Utils;->getBitmapSize(Ljava/lang/String;)Landroid/graphics/Point;

    move-result-object v10

    .line 38
    .local v10, "size":Landroid/graphics/Point;
    iget v8, v10, Landroid/graphics/Point;->x:I

    .line 39
    .local v8, "originW":I
    iget v7, v10, Landroid/graphics/Point;->y:I

    .line 43
    .local v7, "originH":I
    if-gtz p1, :cond_0

    if-gtz p2, :cond_0

    .line 45
    const/4 v9, 0x1

    .line 46
    .local v9, "scaleFactor":I
    move p1, v8

    .line 47
    move/from16 p2, v7

    .line 68
    :goto_0
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 69
    .local v3, "bmOptions":Landroid/graphics/BitmapFactory$Options;
    const/4 v11, 0x0

    iput-boolean v11, v3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 70
    iput v9, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 71
    const/4 v11, 0x1

    iput-boolean v11, v3, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 73
    invoke-static {p0, v3}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 76
    .local v4, "bmp":Landroid/graphics/Bitmap;
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v11

    if-eq v11, p1, :cond_4

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    move/from16 v0, p2

    if-eq v11, v0, :cond_4

    .line 78
    const/4 v11, 0x1

    move/from16 v0, p2

    invoke-static {v4, p1, v0, v11}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 79
    .local v5, "bmpNew":Landroid/graphics/Bitmap;
    move-object/from16 v0, p3

    move-object/from16 v1, p4

    move/from16 v2, p5

    invoke-static {v5, v0, v1, v2}, Lcom/boyaa/engine/device/Utils;->bmp2File(Landroid/graphics/Bitmap;Ljava/lang/String;Landroid/graphics/Bitmap$CompressFormat;I)Ljava/lang/String;

    move-result-object v6

    .line 80
    .local v6, "newFile":Ljava/lang/String;
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->recycle()V

    .line 86
    .end local v5    # "bmpNew":Landroid/graphics/Bitmap;
    :goto_1
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    .line 87
    return-object v6

    .line 49
    .end local v3    # "bmOptions":Landroid/graphics/BitmapFactory$Options;
    .end local v4    # "bmp":Landroid/graphics/Bitmap;
    .end local v6    # "newFile":Ljava/lang/String;
    .end local v9    # "scaleFactor":I
    :cond_0
    if-lez p1, :cond_1

    if-gtz p2, :cond_3

    .line 51
    :cond_1
    if-gtz p1, :cond_2

    .line 53
    div-int v9, v7, p2

    .line 54
    .restart local v9    # "scaleFactor":I
    int-to-float v11, v8

    move/from16 v0, p2

    int-to-float v12, v0

    int-to-float v13, v7

    div-float/2addr v12, v13

    mul-float/2addr v11, v12

    float-to-int p1, v11

    .line 55
    goto :goto_0

    .line 58
    .end local v9    # "scaleFactor":I
    :cond_2
    div-int v9, v8, p1

    .line 59
    .restart local v9    # "scaleFactor":I
    int-to-float v11, v7

    int-to-float v12, p1

    int-to-float v13, v8

    div-float/2addr v12, v13

    mul-float/2addr v11, v12

    float-to-int v0, v11

    move/from16 p2, v0

    .line 61
    goto :goto_0

    .line 64
    .end local v9    # "scaleFactor":I
    :cond_3
    div-int v11, v8, p1

    div-int v12, v7, p2

    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v9

    .restart local v9    # "scaleFactor":I
    goto :goto_0

    .line 84
    .restart local v3    # "bmOptions":Landroid/graphics/BitmapFactory$Options;
    .restart local v4    # "bmp":Landroid/graphics/Bitmap;
    :cond_4
    move-object/from16 v0, p3

    move-object/from16 v1, p4

    move/from16 v2, p5

    invoke-static {v4, v0, v1, v2}, Lcom/boyaa/engine/device/Utils;->bmp2File(Landroid/graphics/Bitmap;Ljava/lang/String;Landroid/graphics/Bitmap$CompressFormat;I)Ljava/lang/String;

    move-result-object v6

    .restart local v6    # "newFile":Ljava/lang/String;
    goto :goto_1
.end method
