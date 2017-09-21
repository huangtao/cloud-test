.class public Lcom/boyaa/app/image/UploadHeadImage;
.super Ljava/lang/Object;
.source "UploadHeadImage.java"


# static fields
.field static final CAMERA_WITH_DATA:I = 0x0

.field private static final IMG_SIZE:I = 0x12c

.field public static final METHOD_VISITOR_UPLOADICON:Ljava/lang/String; = "IconAndroid.upload"

.field static final PHOTO_PICKED_WITH_DATA:I = 0x1

.field public static final SEX_FEMAIL:I = 0x1

.field public static final SEX_MAIL:I = 0x0

.field public static final SEX_SECRET:I = 0x2

.field private static final TAG:Ljava/lang/String; = "UserManager"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static final addParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "twoHyphens"    # Ljava/lang/String;
    .param p3, "boundary"    # Ljava/lang/String;
    .param p4, "lineEnd"    # Ljava/lang/String;

    .prologue
    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 199
    const-string v1, "Content-Disposition: form-data; name=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 200
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 198
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static comPressBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 8
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v1, 0x0

    .line 285
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    .line 286
    .local v3, "height":I
    const/high16 v0, 0x43960000    # 300.0f

    int-to-float v2, v3

    div-float v7, v0, v2

    .line 287
    .local v7, "scale":F
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 288
    .local v5, "matrix":Landroid/graphics/Matrix;
    invoke-virtual {v5, v7, v7}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 289
    const/4 v6, 0x1

    move-object v0, p0

    move v2, v1

    move v4, v3

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static getCropImageIntent(Landroid/net/Uri;)Landroid/content/Intent;
    .locals 5
    .param p0, "photoUri"    # Landroid/net/Uri;

    .prologue
    const/16 v4, 0x12c

    const/4 v3, 0x1

    .line 219
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.camera.action.CROP"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 220
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "image/*"

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 221
    const-string v1, "crop"

    const-string v2, "true"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 222
    const-string v1, "aspectX"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 223
    const-string v1, "aspectY"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 224
    const-string v1, "outputX"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 225
    const-string v1, "outputY"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 226
    const-string v1, "return-data"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 227
    return-object v0
.end method

.method public static getPhotoFileName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 207
    new-instance v0, Ljava/sql/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/sql/Date;-><init>(J)V

    .line 208
    .local v0, "date":Ljava/sql/Date;
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 209
    const-string v2, "\'IMG\'_yyyyMMdd_HHmmss"

    .line 208
    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 210
    .local v1, "dateFormat":Ljava/text/SimpleDateFormat;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ".jpg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static uploadPhoto(Lcom/boyaa/enginedlqp/maindevelop/Game;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p0, "activity"    # Lcom/boyaa/enginedlqp/maindevelop/Game;
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "filePath"    # Ljava/lang/String;
    .param p3, "paramMap"    # Ljava/util/Map;
    .param p4, "strDicName"    # Ljava/lang/String;
    .param p5, "imageName"    # Ljava/lang/String;
    .param p6, "uri"    # Ljava/lang/String;

    .prologue
    .line 240
    const-string v7, "\u4e0a\u4f20\u56fe\u7247"

    const/4 v8, 0x0

    new-instance v0, Lcom/boyaa/app/image/UploadHeadImage$1;

    move-object v1, p2

    move-object v2, p3

    move-object v3, p6

    move-object v4, p0

    move-object v5, p5

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/boyaa/app/image/UploadHeadImage$1;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Lcom/boyaa/enginedlqp/maindevelop/Game;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0, v7, v8, v0}, Lcom/boyaa/app/common/ThreadTask;->start(Landroid/app/Activity;Ljava/lang/String;ZLcom/boyaa/app/common/OnThreadTask;)V

    .line 282
    return-void
.end method

.method public static uploadVisitorIcon(Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/app/php/PHPResult;Ljava/lang/String;)Z
    .locals 32
    .param p0, "filePath"    # Ljava/lang/String;
    .param p1, "paramMap"    # Ljava/util/Map;
    .param p2, "result"    # Lcom/boyaa/app/php/PHPResult;
    .param p3, "uri"    # Ljava/lang/String;

    .prologue
    .line 55
    const/4 v10, 0x0

    .line 56
    .local v10, "connection":Ljava/net/HttpURLConnection;
    const/16 v20, 0x0

    .line 57
    .local v20, "outStream":Ljava/io/DataOutputStream;
    const-string v18, "\r\n"

    .line 58
    .local v18, "lineEnd":Ljava/lang/String;
    const-string v25, "--"

    .line 59
    .local v25, "twoHyphens":Ljava/lang/String;
    const-string v4, "*****"

    .line 65
    .local v4, "boundary":Ljava/lang/String;
    const/high16 v19, 0x100000

    .line 68
    .local v19, "maxBufferSize":I
    const/4 v14, 0x0

    .line 70
    .local v14, "fileInputStream":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v13, Ljava/io/File;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 72
    .local v13, "file":Ljava/io/File;
    new-instance v15, Ljava/io/FileInputStream;

    invoke-direct {v15, v13}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_c
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    .line 81
    .end local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .local v15, "fileInputStream":Ljava/io/FileInputStream;
    :try_start_1
    new-instance v26, Ljava/net/URL;

    move-object/from16 v0, v26

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 82
    .local v26, "url":Ljava/net/URL;
    invoke-virtual/range {v26 .. v26}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v29

    move-object/from16 v0, v29

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v10, v0

    .line 83
    const/16 v29, 0x2710

    move/from16 v0, v29

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 84
    const/16 v29, 0x2710

    move/from16 v0, v29

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 85
    const/16 v29, 0x1

    move/from16 v0, v29

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 86
    const/16 v29, 0x1

    move/from16 v0, v29

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 87
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 89
    const-string v29, "POST"

    move-object/from16 v0, v29

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 90
    const-string v29, "Accept-Encoding"

    const-string v30, ""

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-virtual {v10, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    const-string v29, "Connection"

    const-string v30, "Keep-Alive"

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-virtual {v10, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    const-string v29, "Content-Type"

    .line 93
    new-instance v30, Ljava/lang/StringBuilder;

    const-string v31, "multipart/form-data;boundary="

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v30

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    .line 92
    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-virtual {v10, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    new-instance v21, Ljava/io/DataOutputStream;

    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v29

    move-object/from16 v0, v21

    move-object/from16 v1, v29

    invoke-direct {v0, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_d
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_1 .. :try_end_1} :catch_a
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_8
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_6

    .line 102
    .end local v20    # "outStream":Ljava/io/DataOutputStream;
    .local v21, "outStream":Ljava/io/DataOutputStream;
    :try_start_2
    invoke-interface/range {p1 .. p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v29

    invoke-interface/range {v29 .. v29}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .line 104
    .local v16, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-nez v29, :cond_0

    .line 117
    new-instance v29, Ljava/lang/StringBuilder;

    invoke-static/range {v25 .. v25}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v30

    invoke-direct/range {v29 .. v30}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, v21

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 118
    new-instance v29, Ljava/lang/StringBuilder;

    const-string v30, "Content-Disposition: form-data; name=\"icon\";filename=\"avator.jpg\""

    invoke-direct/range {v29 .. v30}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    move-object/from16 v0, v29

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    .line 121
    const-string v30, "Content-Type: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    .line 122
    const-string v30, "application/octet-stream"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    .line 123
    move-object/from16 v0, v29

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    .line 124
    const-string v30, "Content-Transfer-Encoding: binary"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    .line 118
    move-object/from16 v0, v21

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 125
    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 127
    invoke-virtual {v15}, Ljava/io/FileInputStream;->available()I

    move-result v8

    .line 128
    .local v8, "bytesAvailable":I
    const-string v29, ""

    new-instance v30, Ljava/lang/StringBuilder;

    const-string v31, "\u6587\u4ef6\u5927\u5c0f\uff1a"

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v30

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v29 .. v30}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    move/from16 v0, v19

    invoke-static {v8, v0}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 130
    .local v6, "bufferSize":I
    new-array v5, v6, [B

    .line 132
    .local v5, "buffer":[B
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v15, v5, v0, v6}, Ljava/io/FileInputStream;->read([BII)I

    move-result v9

    .line 134
    .local v9, "bytesRead":I
    :goto_1
    if-gtz v9, :cond_1

    .line 141
    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 142
    new-instance v29, Ljava/lang/StringBuilder;

    invoke-static/range {v25 .. v25}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v30

    invoke-direct/range {v29 .. v30}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, v21

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 144
    invoke-virtual {v15}, Ljava/io/FileInputStream;->close()V

    .line 145
    invoke-virtual/range {v21 .. v21}, Ljava/io/DataOutputStream;->flush()V

    .line 146
    invoke-virtual/range {v21 .. v21}, Ljava/io/DataOutputStream;->close()V

    .line 147
    const-string v29, "UserManager"

    const-string v30, "\u5f80\u670d\u52a1\u5668\u5199\u6570\u636e\u5b8c\u6210"

    invoke-static/range {v29 .. v30}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_2 .. :try_end_2} :catch_b
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_9
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_7

    .line 169
    :try_start_3
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v23

    .line 170
    .local v23, "responseCode":I
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    .line 171
    .local v22, "response":Ljava/lang/StringBuilder;
    const-string v29, "UserManager"

    new-instance v30, Ljava/lang/StringBuilder;

    const-string v31, "\u4e0a\u4f20\u5934\u50cf\uff0c\u670d\u52a1\u5668\u8fd4\u56de\uff1a"

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v30

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v29 .. v30}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    const/16 v29, 0xc8

    move/from16 v0, v23

    move/from16 v1, v29

    if-ne v0, v1, :cond_3

    .line 173
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v27

    .line 174
    .local v27, "urlStream":Ljava/io/InputStream;
    new-instance v7, Ljava/io/BufferedReader;

    .line 175
    new-instance v29, Ljava/io/InputStreamReader;

    move-object/from16 v0, v29

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 174
    move-object/from16 v0, v29

    invoke-direct {v7, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 176
    .local v7, "bufferedReader":Ljava/io/BufferedReader;
    const-string v24, ""

    .line 177
    .local v24, "sCurrentLine":Ljava/lang/String;
    :goto_2
    invoke-virtual {v7}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v24

    if-nez v24, :cond_2

    .line 180
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V

    .line 181
    const-string v29, "UserManager"

    const-string v30, "\u8bfb\u6570\u636e\u5b8c\u6210"

    invoke-static/range {v29 .. v30}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 183
    const-string v29, "UserManager"

    new-instance v30, Ljava/lang/StringBuilder;

    const-string v31, "\u7ed3\u679c\uff1a"

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v29 .. v30}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    const/16 v29, 0x0

    move/from16 v0, v29

    move-object/from16 v1, p2

    iput v0, v1, Lcom/boyaa/app/php/PHPResult;->code:I

    .line 185
    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, p2

    iput-object v0, v1, Lcom/boyaa/app/php/PHPResult;->json:Ljava/lang/String;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_5

    .line 186
    const/16 v29, 0x1

    move-object/from16 v20, v21

    .line 193
    .end local v5    # "buffer":[B
    .end local v6    # "bufferSize":I
    .end local v7    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v8    # "bytesAvailable":I
    .end local v9    # "bytesRead":I
    .end local v13    # "file":Ljava/io/File;
    .end local v15    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v16    # "it":Ljava/util/Iterator;
    .end local v21    # "outStream":Ljava/io/DataOutputStream;
    .end local v22    # "response":Ljava/lang/StringBuilder;
    .end local v23    # "responseCode":I
    .end local v24    # "sCurrentLine":Ljava/lang/String;
    .end local v26    # "url":Ljava/net/URL;
    .end local v27    # "urlStream":Ljava/io/InputStream;
    .restart local v20    # "outStream":Ljava/io/DataOutputStream;
    :goto_3
    return v29

    .line 74
    .restart local v14    # "fileInputStream":Ljava/io/FileInputStream;
    :catch_0
    move-exception v11

    .line 75
    .local v11, "e":Ljava/io/FileNotFoundException;
    :try_start_4
    const-string v29, "DEBUG"

    const-string v30, "[FileNotFoundException]"

    invoke-static/range {v29 .. v30}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    const/16 v29, -0x2

    move/from16 v0, v29

    move-object/from16 v1, p2

    iput v0, v1, Lcom/boyaa/app/php/PHPResult;->code:I
    :try_end_4
    .catch Ljava/net/MalformedURLException; {:try_start_4 .. :try_end_4} :catch_c
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 77
    const/16 v29, 0x0

    goto :goto_3

    .line 106
    .end local v11    # "e":Ljava/io/FileNotFoundException;
    .end local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v13    # "file":Ljava/io/File;
    .restart local v15    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v16    # "it":Ljava/util/Iterator;
    .restart local v21    # "outStream":Ljava/io/DataOutputStream;
    .restart local v26    # "url":Ljava/net/URL;
    :cond_0
    :try_start_5
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/Map$Entry;

    .line 108
    .local v12, "entry":Ljava/util/Map$Entry;
    invoke-interface {v12}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v17

    .line 110
    .local v17, "key":Ljava/lang/Object;
    invoke-interface {v12}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v28

    .line 112
    .local v28, "value":Ljava/lang/Object;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    move-object/from16 v2, v25

    move-object/from16 v3, v18

    invoke-static {v0, v1, v2, v4, v3}, Lcom/boyaa/app/image/UploadHeadImage;->addParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, v21

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/net/MalformedURLException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_5 .. :try_end_5} :catch_b
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_9
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_7

    goto/16 :goto_0

    .line 148
    .end local v12    # "entry":Ljava/util/Map$Entry;
    .end local v16    # "it":Ljava/util/Iterator;
    .end local v17    # "key":Ljava/lang/Object;
    .end local v28    # "value":Ljava/lang/Object;
    :catch_1
    move-exception v11

    move-object v14, v15

    .end local v15    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v14    # "fileInputStream":Ljava/io/FileInputStream;
    move-object/from16 v20, v21

    .line 149
    .end local v13    # "file":Ljava/io/File;
    .end local v21    # "outStream":Ljava/io/DataOutputStream;
    .end local v26    # "url":Ljava/net/URL;
    .local v11, "e":Ljava/net/MalformedURLException;
    .restart local v20    # "outStream":Ljava/io/DataOutputStream;
    :goto_4
    const/16 v29, -0x2

    move/from16 v0, v29

    move-object/from16 v1, p2

    iput v0, v1, Lcom/boyaa/app/php/PHPResult;->code:I

    .line 150
    const-string v29, "DEBUG"

    const-string v30, "[MalformedURLException while sending a picture]"

    invoke-static/range {v29 .. v30}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    const/16 v29, 0x0

    goto :goto_3

    .line 135
    .end local v11    # "e":Ljava/net/MalformedURLException;
    .end local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v5    # "buffer":[B
    .restart local v6    # "bufferSize":I
    .restart local v8    # "bytesAvailable":I
    .restart local v9    # "bytesRead":I
    .restart local v13    # "file":Ljava/io/File;
    .restart local v15    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v16    # "it":Ljava/util/Iterator;
    .restart local v21    # "outStream":Ljava/io/DataOutputStream;
    .restart local v26    # "url":Ljava/net/URL;
    :cond_1
    const/16 v29, 0x0

    :try_start_6
    move-object/from16 v0, v21

    move/from16 v1, v29

    invoke-virtual {v0, v5, v1, v6}, Ljava/io/DataOutputStream;->write([BII)V

    .line 136
    invoke-virtual {v15}, Ljava/io/FileInputStream;->available()I

    move-result v8

    .line 137
    move/from16 v0, v19

    invoke-static {v8, v0}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 138
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v15, v5, v0, v6}, Ljava/io/FileInputStream;->read([BII)I
    :try_end_6
    .catch Ljava/net/MalformedURLException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_6 .. :try_end_6} :catch_b
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_9
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_7

    move-result v9

    goto/16 :goto_1

    .line 152
    .end local v5    # "buffer":[B
    .end local v6    # "bufferSize":I
    .end local v8    # "bytesAvailable":I
    .end local v9    # "bytesRead":I
    .end local v13    # "file":Ljava/io/File;
    .end local v15    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v16    # "it":Ljava/util/Iterator;
    .end local v21    # "outStream":Ljava/io/DataOutputStream;
    .end local v26    # "url":Ljava/net/URL;
    .restart local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v20    # "outStream":Ljava/io/DataOutputStream;
    :catch_2
    move-exception v11

    .line 153
    .local v11, "e":Lorg/apache/http/conn/ConnectTimeoutException;
    :goto_5
    const/16 v29, -0x1

    move/from16 v0, v29

    move-object/from16 v1, p2

    iput v0, v1, Lcom/boyaa/app/php/PHPResult;->code:I

    .line 154
    const-string v29, "DEBUG"

    const-string v30, "[ConnectTimeoutException while sending a picture]"

    invoke-static/range {v29 .. v30}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    const/16 v29, 0x0

    goto/16 :goto_3

    .line 157
    .end local v11    # "e":Lorg/apache/http/conn/ConnectTimeoutException;
    :catch_3
    move-exception v11

    .line 158
    .local v11, "e":Ljava/io/IOException;
    :goto_6
    const/16 v29, -0x2

    move/from16 v0, v29

    move-object/from16 v1, p2

    iput v0, v1, Lcom/boyaa/app/php/PHPResult;->code:I

    .line 159
    const-string v29, "DEBUG"

    const-string v30, "[IOException while sending a picture]"

    invoke-static/range {v29 .. v30}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    const/16 v29, 0x0

    goto/16 :goto_3

    .line 161
    .end local v11    # "e":Ljava/io/IOException;
    :catch_4
    move-exception v11

    .line 162
    .local v11, "e":Ljava/lang/Exception;
    :goto_7
    const/16 v29, -0x1

    move/from16 v0, v29

    move-object/from16 v1, p2

    iput v0, v1, Lcom/boyaa/app/php/PHPResult;->code:I

    .line 163
    const-string v29, "DEBUG"

    const-string v30, "[Exception while sending a picture]"

    invoke-static/range {v29 .. v30}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    const/16 v29, 0x0

    goto/16 :goto_3

    .line 178
    .end local v11    # "e":Ljava/lang/Exception;
    .end local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v5    # "buffer":[B
    .restart local v6    # "bufferSize":I
    .restart local v7    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v8    # "bytesAvailable":I
    .restart local v9    # "bytesRead":I
    .restart local v13    # "file":Ljava/io/File;
    .restart local v15    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v16    # "it":Ljava/util/Iterator;
    .restart local v21    # "outStream":Ljava/io/DataOutputStream;
    .restart local v22    # "response":Ljava/lang/StringBuilder;
    .restart local v23    # "responseCode":I
    .restart local v24    # "sCurrentLine":Ljava/lang/String;
    .restart local v26    # "url":Ljava/net/URL;
    .restart local v27    # "urlStream":Ljava/io/InputStream;
    :cond_2
    :try_start_7
    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    goto/16 :goto_2

    .line 188
    .end local v7    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v22    # "response":Ljava/lang/StringBuilder;
    .end local v23    # "responseCode":I
    .end local v24    # "sCurrentLine":Ljava/lang/String;
    .end local v27    # "urlStream":Ljava/io/InputStream;
    :catch_5
    move-exception v11

    .line 189
    .local v11, "e":Ljava/io/IOException;
    invoke-virtual {v11}, Ljava/io/IOException;->printStackTrace()V

    .line 190
    const/16 v29, -0x2

    move/from16 v0, v29

    move-object/from16 v1, p2

    iput v0, v1, Lcom/boyaa/app/php/PHPResult;->code:I

    .line 193
    .end local v11    # "e":Ljava/io/IOException;
    :cond_3
    const/16 v29, 0x0

    move-object/from16 v20, v21

    .end local v21    # "outStream":Ljava/io/DataOutputStream;
    .restart local v20    # "outStream":Ljava/io/DataOutputStream;
    goto/16 :goto_3

    .line 161
    .end local v5    # "buffer":[B
    .end local v6    # "bufferSize":I
    .end local v8    # "bytesAvailable":I
    .end local v9    # "bytesRead":I
    .end local v16    # "it":Ljava/util/Iterator;
    .end local v26    # "url":Ljava/net/URL;
    :catch_6
    move-exception v11

    move-object v14, v15

    .end local v15    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v14    # "fileInputStream":Ljava/io/FileInputStream;
    goto :goto_7

    .end local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v15    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v21    # "outStream":Ljava/io/DataOutputStream;
    .restart local v26    # "url":Ljava/net/URL;
    :catch_7
    move-exception v11

    move-object v14, v15

    .end local v15    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v14    # "fileInputStream":Ljava/io/FileInputStream;
    move-object/from16 v20, v21

    .end local v21    # "outStream":Ljava/io/DataOutputStream;
    .restart local v20    # "outStream":Ljava/io/DataOutputStream;
    goto :goto_7

    .line 157
    .end local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v26    # "url":Ljava/net/URL;
    .restart local v15    # "fileInputStream":Ljava/io/FileInputStream;
    :catch_8
    move-exception v11

    move-object v14, v15

    .end local v15    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v14    # "fileInputStream":Ljava/io/FileInputStream;
    goto :goto_6

    .end local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v15    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v21    # "outStream":Ljava/io/DataOutputStream;
    .restart local v26    # "url":Ljava/net/URL;
    :catch_9
    move-exception v11

    move-object v14, v15

    .end local v15    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v14    # "fileInputStream":Ljava/io/FileInputStream;
    move-object/from16 v20, v21

    .end local v21    # "outStream":Ljava/io/DataOutputStream;
    .restart local v20    # "outStream":Ljava/io/DataOutputStream;
    goto :goto_6

    .line 152
    .end local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v26    # "url":Ljava/net/URL;
    .restart local v15    # "fileInputStream":Ljava/io/FileInputStream;
    :catch_a
    move-exception v11

    move-object v14, v15

    .end local v15    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v14    # "fileInputStream":Ljava/io/FileInputStream;
    goto :goto_5

    .end local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v15    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v21    # "outStream":Ljava/io/DataOutputStream;
    .restart local v26    # "url":Ljava/net/URL;
    :catch_b
    move-exception v11

    move-object v14, v15

    .end local v15    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v14    # "fileInputStream":Ljava/io/FileInputStream;
    move-object/from16 v20, v21

    .end local v21    # "outStream":Ljava/io/DataOutputStream;
    .restart local v20    # "outStream":Ljava/io/DataOutputStream;
    goto :goto_5

    .line 148
    .end local v13    # "file":Ljava/io/File;
    .end local v26    # "url":Ljava/net/URL;
    :catch_c
    move-exception v11

    goto/16 :goto_4

    .end local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v13    # "file":Ljava/io/File;
    .restart local v15    # "fileInputStream":Ljava/io/FileInputStream;
    :catch_d
    move-exception v11

    move-object v14, v15

    .end local v15    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v14    # "fileInputStream":Ljava/io/FileInputStream;
    goto/16 :goto_4
.end method
