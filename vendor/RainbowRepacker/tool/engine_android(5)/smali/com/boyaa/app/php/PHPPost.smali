.class public Lcom/boyaa/app/php/PHPPost;
.super Ljava/lang/Object;
.source "PHPPost.java"


# static fields
.field private static countTry502:I

.field private static countTryOther:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 32
    sput v0, Lcom/boyaa/app/php/PHPPost;->countTry502:I

    .line 33
    sput v0, Lcom/boyaa/app/php/PHPPost;->countTryOther:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static httpGetPic(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    .locals 26
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "try502"    # I

    .prologue
    .line 41
    if-eqz p0, :cond_0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v23

    if-nez v23, :cond_2

    .line 42
    :cond_0
    const/4 v2, 0x0

    .line 122
    :cond_1
    :goto_0
    return-object v2

    .line 43
    :cond_2
    sget v23, Lcom/boyaa/app/php/PHPPost;->countTry502:I

    const/16 v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v24

    if-gt v0, v1, :cond_3

    sget v23, Lcom/boyaa/app/php/PHPPost;->countTryOther:I

    const/16 v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_4

    .line 44
    :cond_3
    const/4 v2, 0x0

    goto :goto_0

    .line 45
    :cond_4
    const/4 v2, 0x0

    .line 46
    .local v2, "bitmap":Landroid/graphics/Bitmap;
    const/16 v21, 0x0

    .line 47
    .local v21, "url":Ljava/net/URL;
    const/4 v4, 0x0

    .line 48
    .local v4, "connection":Ljava/net/URLConnection;
    const/4 v11, 0x0

    .line 49
    .local v11, "httpConnection":Ljava/net/HttpURLConnection;
    const/4 v12, 0x0

    .line 50
    .local v12, "in":Ljava/io/InputStream;
    sget-object v5, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    .line 51
    .local v5, "context":Landroid/content/Context;
    invoke-static {v5}, Lcom/boyaa/engine/made/APNUtil;->hasProxy(Landroid/content/Context;)Z

    move-result v8

    .line 53
    .local v8, "hasProxy":Z
    if-eqz v8, :cond_7

    .line 54
    :try_start_0
    invoke-static {v5}, Lcom/boyaa/engine/made/APNUtil;->getApnProxy(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v18

    .line 55
    .local v18, "proxyIP":Ljava/lang/String;
    invoke-static {v5}, Lcom/boyaa/engine/made/APNUtil;->getApnPort(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v19

    .line 56
    .local v19, "proxyPort":Ljava/lang/String;
    const/4 v9, 0x0

    .line 57
    .local v9, "host":Ljava/lang/String;
    const/16 v16, 0x0

    .line 58
    .local v16, "path":Ljava/lang/String;
    const-string v23, "http://"

    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->length()I

    move-result v10

    .line 59
    .local v10, "hostIndex":I
    const/16 v23, 0x2f

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1, v10}, Ljava/lang/String;->indexOf(II)I

    move-result v17

    .line 60
    .local v17, "pathIndex":I
    if-gez v17, :cond_6

    .line 61
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 62
    const-string v16, ""

    .line 67
    :goto_1
    new-instance v23, Ljava/lang/StringBuilder;

    const-string v24, "http://"

    invoke-direct/range {v23 .. v24}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ":"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 68
    .local v14, "newUri":Ljava/lang/String;
    new-instance v22, Ljava/net/URL;

    move-object/from16 v0, v22

    invoke-direct {v0, v14}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    .end local v21    # "url":Ljava/net/URL;
    .local v22, "url":Ljava/net/URL;
    :try_start_1
    invoke-virtual/range {v22 .. v22}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v23

    move-object/from16 v0, v23

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v4, v0

    .line 70
    const-string v23, "X-Online-Host"

    move-object/from16 v0, v23

    invoke-virtual {v4, v0, v9}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object/from16 v21, v22

    .line 76
    .end local v9    # "host":Ljava/lang/String;
    .end local v10    # "hostIndex":I
    .end local v14    # "newUri":Ljava/lang/String;
    .end local v16    # "path":Ljava/lang/String;
    .end local v17    # "pathIndex":I
    .end local v18    # "proxyIP":Ljava/lang/String;
    .end local v19    # "proxyPort":Ljava/lang/String;
    .end local v22    # "url":Ljava/net/URL;
    .restart local v21    # "url":Ljava/net/URL;
    :goto_2
    :try_start_2
    move-object v0, v4

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v11, v0

    .line 77
    const/16 v23, 0x2

    move/from16 v0, p1

    move/from16 v1, v23

    if-eq v0, v1, :cond_5

    .line 79
    const/16 v23, 0x1

    move/from16 v0, v23

    invoke-virtual {v11, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 80
    const/16 v23, 0x1

    move/from16 v0, v23

    invoke-virtual {v11, v0}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 81
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v11, v0}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 82
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v11, v0}, Ljava/net/HttpURLConnection;->setAllowUserInteraction(Z)V

    .line 83
    const-string v23, "GET"

    move-object/from16 v0, v23

    invoke-virtual {v11, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 86
    :cond_5
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->connect()V

    .line 88
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v20

    .line 89
    .local v20, "responseCode":I
    const/16 v23, 0xc8

    move/from16 v0, v20

    move/from16 v1, v23

    if-ne v0, v1, :cond_9

    .line 90
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v12

    .line 91
    new-instance v15, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v15}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 92
    .local v15, "outstream":Ljava/io/ByteArrayOutputStream;
    const/16 v23, 0x200

    move/from16 v0, v23

    new-array v3, v0, [B

    .line 93
    .local v3, "buffer":[B
    const/4 v13, -0x1

    .line 94
    .local v13, "len":I
    :goto_3
    invoke-virtual {v12, v3}, Ljava/io/InputStream;->read([B)I

    move-result v13

    const/16 v23, -0x1

    move/from16 v0, v23

    if-ne v13, v0, :cond_8

    .line 97
    invoke-virtual {v15}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    .line 98
    .local v6, "data":[B
    invoke-virtual {v15}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 99
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V

    .line 100
    const/16 v23, 0x0

    array-length v0, v6

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    invoke-static {v6, v0, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    .line 117
    if-eqz v11, :cond_1

    .line 118
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 119
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 64
    .end local v3    # "buffer":[B
    .end local v6    # "data":[B
    .end local v13    # "len":I
    .end local v15    # "outstream":Ljava/io/ByteArrayOutputStream;
    .end local v20    # "responseCode":I
    .restart local v9    # "host":Ljava/lang/String;
    .restart local v10    # "hostIndex":I
    .restart local v16    # "path":Ljava/lang/String;
    .restart local v17    # "pathIndex":I
    .restart local v18    # "proxyIP":Ljava/lang/String;
    .restart local v19    # "proxyPort":Ljava/lang/String;
    :cond_6
    :try_start_3
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v10, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 65
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v16

    goto/16 :goto_1

    .line 73
    .end local v9    # "host":Ljava/lang/String;
    .end local v10    # "hostIndex":I
    .end local v16    # "path":Ljava/lang/String;
    .end local v17    # "pathIndex":I
    .end local v18    # "proxyIP":Ljava/lang/String;
    .end local v19    # "proxyPort":Ljava/lang/String;
    :cond_7
    new-instance v22, Ljava/net/URL;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 74
    .end local v21    # "url":Ljava/net/URL;
    .restart local v22    # "url":Ljava/net/URL;
    :try_start_4
    invoke-virtual/range {v22 .. v22}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result-object v4

    move-object/from16 v21, v22

    .end local v22    # "url":Ljava/net/URL;
    .restart local v21    # "url":Ljava/net/URL;
    goto/16 :goto_2

    .line 95
    .restart local v3    # "buffer":[B
    .restart local v13    # "len":I
    .restart local v15    # "outstream":Ljava/io/ByteArrayOutputStream;
    .restart local v20    # "responseCode":I
    :cond_8
    const/16 v23, 0x0

    :try_start_5
    move/from16 v0, v23

    invoke-virtual {v15, v3, v0, v13}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_3

    .line 112
    .end local v3    # "buffer":[B
    .end local v13    # "len":I
    .end local v15    # "outstream":Ljava/io/ByteArrayOutputStream;
    .end local v20    # "responseCode":I
    :catch_0
    move-exception v7

    .line 113
    .local v7, "e":Ljava/lang/Exception;
    :goto_4
    :try_start_6
    const-string v23, "PHPPost"

    invoke-virtual {v7}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    const-string v23, "PHPPost"

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 117
    if-eqz v11, :cond_1

    .line 118
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 119
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 102
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v20    # "responseCode":I
    :cond_9
    :try_start_7
    const-string v23, "PHPPost"

    new-instance v24, Ljava/lang/StringBuilder;

    const-string v25, "responseCode="

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    const/16 v23, 0x1f6

    move/from16 v0, v23

    move/from16 v1, v20

    if-ne v0, v1, :cond_a

    const/16 v23, 0x1

    move/from16 v0, v23

    move/from16 v1, p1

    if-ne v0, v1, :cond_a

    .line 104
    sget v23, Lcom/boyaa/app/php/PHPPost;->countTry502:I

    add-int/lit8 v23, v23, 0x1

    sput v23, Lcom/boyaa/app/php/PHPPost;->countTry502:I

    .line 105
    const/16 v23, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-static {v0, v1}, Lcom/boyaa/app/php/PHPPost;->httpGetPic(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-result-object v2

    .line 117
    .end local v2    # "bitmap":Landroid/graphics/Bitmap;
    if-eqz v11, :cond_1

    .line 118
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 119
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 107
    .restart local v2    # "bitmap":Landroid/graphics/Bitmap;
    :cond_a
    :try_start_8
    sget v23, Lcom/boyaa/app/php/PHPPost;->countTryOther:I

    add-int/lit8 v23, v23, 0x1

    sput v23, Lcom/boyaa/app/php/PHPPost;->countTryOther:I

    .line 108
    const/16 v23, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-static {v0, v1}, Lcom/boyaa/app/php/PHPPost;->httpGetPic(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    move-result-object v2

    .line 117
    .end local v2    # "bitmap":Landroid/graphics/Bitmap;
    if-eqz v11, :cond_1

    .line 118
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 119
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 116
    .end local v20    # "responseCode":I
    .restart local v2    # "bitmap":Landroid/graphics/Bitmap;
    :catchall_0
    move-exception v23

    .line 117
    :goto_5
    if-eqz v11, :cond_b

    .line 118
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 119
    const/4 v11, 0x0

    .line 121
    :cond_b
    throw v23

    .line 116
    .end local v21    # "url":Ljava/net/URL;
    .restart local v22    # "url":Ljava/net/URL;
    :catchall_1
    move-exception v23

    move-object/from16 v21, v22

    .end local v22    # "url":Ljava/net/URL;
    .restart local v21    # "url":Ljava/net/URL;
    goto :goto_5

    .line 112
    .end local v21    # "url":Ljava/net/URL;
    .restart local v22    # "url":Ljava/net/URL;
    :catch_1
    move-exception v7

    move-object/from16 v21, v22

    .end local v22    # "url":Ljava/net/URL;
    .restart local v21    # "url":Ljava/net/URL;
    goto/16 :goto_4
.end method

.method public static loadPic(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "uri"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 35
    sput v0, Lcom/boyaa/app/php/PHPPost;->countTry502:I

    .line 36
    sput v0, Lcom/boyaa/app/php/PHPPost;->countTryOther:I

    .line 37
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/boyaa/app/php/PHPPost;->httpGetPic(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
