.class public Lcom/boyaa/app/image/UploadFeedbackImage;
.super Ljava/lang/Object;
.source "UploadFeedbackImage.java"


# static fields
.field public static final METHOD_VISITOR_UPLOADICON:Ljava/lang/String; = "IconAndroid.upload"

.field private static final TAG:Ljava/lang/String; = "UploadFeedbackImage"

.field private static api:Ljava/lang/String;

.field private static uploadFileName:Ljava/lang/String;


# instance fields
.field activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

.field bundle:Landroid/os/Bundle;

.field private imagePath:Ljava/lang/String;

.field final paramMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private strDicName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 47
    const-string v0, ""

    sput-object v0, Lcom/boyaa/app/image/UploadFeedbackImage;->uploadFileName:Ljava/lang/String;

    .line 49
    const-string v0, ""

    sput-object v0, Lcom/boyaa/app/image/UploadFeedbackImage;->api:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/Game;Landroid/os/Bundle;)V
    .locals 6
    .param p1, "activity"    # Lcom/boyaa/enginedlqp/maindevelop/Game;
    .param p2, "bundle"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object v3, p0, Lcom/boyaa/app/image/UploadFeedbackImage;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    .line 45
    iput-object v3, p0, Lcom/boyaa/app/image/UploadFeedbackImage;->bundle:Landroid/os/Bundle;

    .line 46
    const-string v3, ""

    iput-object v3, p0, Lcom/boyaa/app/image/UploadFeedbackImage;->imagePath:Ljava/lang/String;

    .line 48
    const-string v3, "uploadFeedbackImage"

    iput-object v3, p0, Lcom/boyaa/app/image/UploadFeedbackImage;->strDicName:Ljava/lang/String;

    .line 50
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/boyaa/app/image/UploadFeedbackImage;->paramMap:Ljava/util/HashMap;

    .line 53
    iput-object p1, p0, Lcom/boyaa/app/image/UploadFeedbackImage;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    .line 54
    iput-object p2, p0, Lcom/boyaa/app/image/UploadFeedbackImage;->bundle:Landroid/os/Bundle;

    .line 55
    invoke-static {}, Lcom/boyaa/app/common/SDTools;->isExternalStorageWriteable()Z

    move-result v3

    if-nez v3, :cond_1

    .line 56
    iget-object v3, p0, Lcom/boyaa/app/image/UploadFeedbackImage;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    const v4, 0x7f07003a

    .line 57
    const/4 v5, 0x0

    .line 56
    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    .line 57
    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 72
    :cond_0
    :goto_0
    return-void

    .line 60
    :cond_1
    const-string v3, "data"

    invoke-virtual {p2, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 61
    .local v2, "jsonstr":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 63
    :try_start_0
    const-string v3, "guangli.liu"

    invoke-static {v3, v2}, Lcom/boyaa/app/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 65
    .local v1, "jsonResult":Lorg/json/JSONObject;
    const-string v3, "imagePath"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/app/image/UploadFeedbackImage;->imagePath:Ljava/lang/String;

    .line 66
    const-string v3, "uploadFileName"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/boyaa/app/image/UploadFeedbackImage;->uploadFileName:Ljava/lang/String;

    .line 67
    const-string v3, "api"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/boyaa/app/image/UploadFeedbackImage;->api:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 68
    .end local v1    # "jsonResult":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 69
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method static synthetic access$0(Lcom/boyaa/app/image/UploadFeedbackImage;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/boyaa/app/image/UploadFeedbackImage;->strDicName:Ljava/lang/String;

    return-object v0
.end method

.method private static final addParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "twoHyphens"    # Ljava/lang/String;
    .param p3, "boundary"    # Ljava/lang/String;
    .param p4, "lineEnd"    # Ljava/lang/String;

    .prologue
    .line 204
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 205
    const-string v1, "Content-Disposition: form-data; name=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 206
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 204
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPhotoFileName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 211
    new-instance v0, Ljava/sql/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/sql/Date;-><init>(J)V

    .line 212
    .local v0, "date":Ljava/sql/Date;
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 213
    const-string v2, "\'IMG\'_yyyyMMdd_HHmmss"

    .line 212
    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 214
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

.method public static uploadFeedbackImage(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Lcom/boyaa/app/php/PHPResult;)Z
    .locals 27
    .param p0, "filePath"    # Ljava/lang/String;
    .param p1, "surl"    # Ljava/lang/String;
    .param p3, "result"    # Lcom/boyaa/app/php/PHPResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/boyaa/app/php/PHPResult;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 83
    .local p2, "paramMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v9, 0x0

    .line 84
    .local v9, "connection":Ljava/net/HttpURLConnection;
    const/16 v16, 0x0

    .line 86
    .local v16, "outStream":Ljava/io/DataOutputStream;
    const-string v14, "\r\n"

    .line 87
    .local v14, "lineEnd":Ljava/lang/String;
    const-string v21, "--"

    .line 88
    .local v21, "twoHyphens":Ljava/lang/String;
    const-string v3, "*****"

    .line 94
    .local v3, "boundary":Ljava/lang/String;
    const/high16 v15, 0x100000

    .line 97
    .local v15, "maxBufferSize":I
    const/4 v12, 0x0

    .line 99
    .local v12, "fileInputStream":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v11, Ljava/io/File;

    move-object/from16 v0, p0

    invoke-direct {v11, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 101
    .local v11, "file":Ljava/io/File;
    new-instance v13, Ljava/io/FileInputStream;

    invoke-direct {v13, v11}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 108
    .end local v12    # "fileInputStream":Ljava/io/FileInputStream;
    .local v13, "fileInputStream":Ljava/io/FileInputStream;
    :try_start_1
    new-instance v22, Ljava/net/URL;

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 109
    .local v22, "url":Ljava/net/URL;
    invoke-virtual/range {v22 .. v22}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v24

    move-object/from16 v0, v24

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v9, v0

    .line 110
    const/16 v24, 0x2710

    move/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 111
    const/16 v24, 0x1

    move/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 112
    const/16 v24, 0x1

    move/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 113
    const/16 v24, 0x0

    move/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 115
    const-string v24, "POST"

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 116
    const-string v24, "Connection"

    const-string v25, "Keep-Alive"

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-virtual {v9, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    const-string v24, "Content-Type"

    .line 118
    new-instance v25, Ljava/lang/StringBuilder;

    const-string v26, "multipart/form-data;boundary="

    invoke-direct/range {v25 .. v26}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 117
    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-virtual {v9, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    new-instance v17, Ljava/io/DataOutputStream;

    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v24

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4

    .line 129
    .end local v16    # "outStream":Ljava/io/DataOutputStream;
    .local v17, "outStream":Ljava/io/DataOutputStream;
    :try_start_2
    const-string v24, "api"

    sget-object v25, Lcom/boyaa/app/image/UploadFeedbackImage;->api:Ljava/lang/String;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2, v3, v14}, Lcom/boyaa/app/image/UploadFeedbackImage;->addParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 131
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 133
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 134
    new-instance v24, Ljava/lang/StringBuilder;

    const-string v25, "Content-Disposition: form-data; name=\"pfile\";filename=\""

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v25, Lcom/boyaa/app/image/UploadFeedbackImage;->uploadFileName:Ljava/lang/String;

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    .line 135
    const-string v25, "\""

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    .line 136
    move-object/from16 v0, v24

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    .line 137
    const-string v25, "Content-Type: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    .line 138
    const-string v25, "application/octet-stream"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    .line 139
    move-object/from16 v0, v24

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    .line 140
    const-string v25, "Content-Transfer-Encoding: binary"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    .line 134
    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 141
    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 143
    invoke-virtual {v13}, Ljava/io/FileInputStream;->available()I

    move-result v7

    .line 145
    .local v7, "bytesAvailable":I
    invoke-static {v7, v15}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 146
    .local v5, "bufferSize":I
    new-array v4, v5, [B

    .line 148
    .local v4, "buffer":[B
    const/16 v24, 0x0

    move/from16 v0, v24

    invoke-virtual {v13, v4, v0, v5}, Ljava/io/FileInputStream;->read([BII)I

    move-result v8

    .line 150
    .local v8, "bytesRead":I
    :goto_0
    if-gtz v8, :cond_0

    .line 157
    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 158
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 160
    invoke-virtual {v13}, Ljava/io/FileInputStream;->close()V

    .line 161
    invoke-virtual/range {v17 .. v17}, Ljava/io/DataOutputStream;->flush()V

    .line 162
    invoke-virtual/range {v17 .. v17}, Ljava/io/DataOutputStream;->close()V
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_7
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5

    .line 176
    :try_start_3
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v19

    .line 177
    .local v19, "responseCode":I
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    .line 179
    .local v18, "response":Ljava/lang/StringBuilder;
    const/16 v24, 0xc8

    move/from16 v0, v19

    move/from16 v1, v24

    if-ne v0, v1, :cond_2

    .line 180
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v23

    .line 181
    .local v23, "urlStream":Ljava/io/InputStream;
    new-instance v6, Ljava/io/BufferedReader;

    .line 182
    new-instance v24, Ljava/io/InputStreamReader;

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 181
    move-object/from16 v0, v24

    invoke-direct {v6, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 183
    .local v6, "bufferedReader":Ljava/io/BufferedReader;
    const-string v20, ""

    .line 184
    .local v20, "sCurrentLine":Ljava/lang/String;
    :goto_1
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v20

    if-nez v20, :cond_1

    .line 187
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V

    .line 189
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 191
    const/16 v24, 0x0

    move/from16 v0, v24

    move-object/from16 v1, p3

    iput v0, v1, Lcom/boyaa/app/php/PHPResult;->code:I

    .line 192
    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p3

    iput-object v0, v1, Lcom/boyaa/app/php/PHPResult;->json:Ljava/lang/String;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 193
    const/16 v24, 0x1

    move-object/from16 v16, v17

    .line 199
    .end local v4    # "buffer":[B
    .end local v5    # "bufferSize":I
    .end local v6    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v7    # "bytesAvailable":I
    .end local v8    # "bytesRead":I
    .end local v11    # "file":Ljava/io/File;
    .end local v13    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v17    # "outStream":Ljava/io/DataOutputStream;
    .end local v18    # "response":Ljava/lang/StringBuilder;
    .end local v19    # "responseCode":I
    .end local v20    # "sCurrentLine":Ljava/lang/String;
    .end local v22    # "url":Ljava/net/URL;
    .end local v23    # "urlStream":Ljava/io/InputStream;
    .restart local v16    # "outStream":Ljava/io/DataOutputStream;
    :goto_2
    return v24

    .line 103
    .restart local v12    # "fileInputStream":Ljava/io/FileInputStream;
    :catch_0
    move-exception v10

    .line 104
    .local v10, "e":Ljava/io/FileNotFoundException;
    :try_start_4
    const-string v24, "DEBUG"

    const-string v25, "[FileNotFoundException]"

    invoke-static/range {v24 .. v25}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    const/16 v24, -0x2

    move/from16 v0, v24

    move-object/from16 v1, p3

    iput v0, v1, Lcom/boyaa/app/php/PHPResult;->code:I
    :try_end_4
    .catch Ljava/net/MalformedURLException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 106
    const/16 v24, 0x0

    goto :goto_2

    .line 151
    .end local v10    # "e":Ljava/io/FileNotFoundException;
    .end local v12    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v16    # "outStream":Ljava/io/DataOutputStream;
    .restart local v4    # "buffer":[B
    .restart local v5    # "bufferSize":I
    .restart local v7    # "bytesAvailable":I
    .restart local v8    # "bytesRead":I
    .restart local v11    # "file":Ljava/io/File;
    .restart local v13    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v17    # "outStream":Ljava/io/DataOutputStream;
    .restart local v22    # "url":Ljava/net/URL;
    :cond_0
    const/16 v24, 0x0

    :try_start_5
    move-object/from16 v0, v17

    move/from16 v1, v24

    invoke-virtual {v0, v4, v1, v5}, Ljava/io/DataOutputStream;->write([BII)V

    .line 152
    invoke-virtual {v13}, Ljava/io/FileInputStream;->available()I

    move-result v7

    .line 153
    invoke-static {v7, v15}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 154
    const/16 v24, 0x0

    move/from16 v0, v24

    invoke-virtual {v13, v4, v0, v5}, Ljava/io/FileInputStream;->read([BII)I
    :try_end_5
    .catch Ljava/net/MalformedURLException; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5

    move-result v8

    goto/16 :goto_0

    .line 164
    .end local v4    # "buffer":[B
    .end local v5    # "bufferSize":I
    .end local v7    # "bytesAvailable":I
    .end local v8    # "bytesRead":I
    .end local v11    # "file":Ljava/io/File;
    .end local v13    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v17    # "outStream":Ljava/io/DataOutputStream;
    .end local v22    # "url":Ljava/net/URL;
    .restart local v12    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v16    # "outStream":Ljava/io/DataOutputStream;
    :catch_1
    move-exception v10

    .line 165
    .local v10, "e":Ljava/net/MalformedURLException;
    :goto_3
    const/16 v24, -0x2

    move/from16 v0, v24

    move-object/from16 v1, p3

    iput v0, v1, Lcom/boyaa/app/php/PHPResult;->code:I

    .line 166
    const-string v24, "DEBUG"

    const-string v25, "[MalformedURLException while sending a picture]"

    invoke-static/range {v24 .. v25}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    const/16 v24, 0x0

    goto :goto_2

    .line 168
    .end local v10    # "e":Ljava/net/MalformedURLException;
    :catch_2
    move-exception v10

    .line 169
    .local v10, "e":Ljava/io/IOException;
    :goto_4
    const/16 v24, -0x2

    move/from16 v0, v24

    move-object/from16 v1, p3

    iput v0, v1, Lcom/boyaa/app/php/PHPResult;->code:I

    .line 170
    const-string v24, "DEBUG"

    const-string v25, "[IOException while sending a picture]"

    invoke-static/range {v24 .. v25}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    const/16 v24, 0x0

    goto :goto_2

    .line 185
    .end local v10    # "e":Ljava/io/IOException;
    .end local v12    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v16    # "outStream":Ljava/io/DataOutputStream;
    .restart local v4    # "buffer":[B
    .restart local v5    # "bufferSize":I
    .restart local v6    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v7    # "bytesAvailable":I
    .restart local v8    # "bytesRead":I
    .restart local v11    # "file":Ljava/io/File;
    .restart local v13    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v17    # "outStream":Ljava/io/DataOutputStream;
    .restart local v18    # "response":Ljava/lang/StringBuilder;
    .restart local v19    # "responseCode":I
    .restart local v20    # "sCurrentLine":Ljava/lang/String;
    .restart local v22    # "url":Ljava/net/URL;
    .restart local v23    # "urlStream":Ljava/io/InputStream;
    :cond_1
    :try_start_6
    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    goto :goto_1

    .line 195
    .end local v6    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v18    # "response":Ljava/lang/StringBuilder;
    .end local v19    # "responseCode":I
    .end local v20    # "sCurrentLine":Ljava/lang/String;
    .end local v23    # "urlStream":Ljava/io/InputStream;
    :catch_3
    move-exception v10

    .line 196
    .restart local v10    # "e":Ljava/io/IOException;
    const/16 v24, -0x2

    move/from16 v0, v24

    move-object/from16 v1, p3

    iput v0, v1, Lcom/boyaa/app/php/PHPResult;->code:I

    .line 199
    .end local v10    # "e":Ljava/io/IOException;
    :cond_2
    const/16 v24, 0x0

    move-object/from16 v16, v17

    .end local v17    # "outStream":Ljava/io/DataOutputStream;
    .restart local v16    # "outStream":Ljava/io/DataOutputStream;
    goto :goto_2

    .line 168
    .end local v4    # "buffer":[B
    .end local v5    # "bufferSize":I
    .end local v7    # "bytesAvailable":I
    .end local v8    # "bytesRead":I
    .end local v22    # "url":Ljava/net/URL;
    :catch_4
    move-exception v10

    move-object v12, v13

    .end local v13    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v12    # "fileInputStream":Ljava/io/FileInputStream;
    goto :goto_4

    .end local v12    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v16    # "outStream":Ljava/io/DataOutputStream;
    .restart local v13    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v17    # "outStream":Ljava/io/DataOutputStream;
    .restart local v22    # "url":Ljava/net/URL;
    :catch_5
    move-exception v10

    move-object v12, v13

    .end local v13    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v12    # "fileInputStream":Ljava/io/FileInputStream;
    move-object/from16 v16, v17

    .end local v17    # "outStream":Ljava/io/DataOutputStream;
    .restart local v16    # "outStream":Ljava/io/DataOutputStream;
    goto :goto_4

    .line 164
    .end local v12    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v22    # "url":Ljava/net/URL;
    .restart local v13    # "fileInputStream":Ljava/io/FileInputStream;
    :catch_6
    move-exception v10

    move-object v12, v13

    .end local v13    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v12    # "fileInputStream":Ljava/io/FileInputStream;
    goto :goto_3

    .end local v12    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v16    # "outStream":Ljava/io/DataOutputStream;
    .restart local v13    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v17    # "outStream":Ljava/io/DataOutputStream;
    .restart local v22    # "url":Ljava/net/URL;
    :catch_7
    move-exception v10

    move-object v12, v13

    .end local v13    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v12    # "fileInputStream":Ljava/io/FileInputStream;
    move-object/from16 v16, v17

    .end local v17    # "outStream":Ljava/io/DataOutputStream;
    .restart local v16    # "outStream":Ljava/io/DataOutputStream;
    goto :goto_3
.end method


# virtual methods
.method public doUploadPhotoAction()V
    .locals 5

    .prologue
    .line 219
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/boyaa/app/image/UploadFeedbackImage;->imagePath:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/boyaa/app/image/UploadFeedbackImage;->uploadFileName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 220
    .local v0, "filePath":Ljava/lang/String;
    iget-object v1, p0, Lcom/boyaa/app/image/UploadFeedbackImage;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    const-string v2, "\u4e0a\u4f20\u56fe\u7247"

    const/4 v3, 0x0

    new-instance v4, Lcom/boyaa/app/image/UploadFeedbackImage$1;

    invoke-direct {v4, p0, v0}, Lcom/boyaa/app/image/UploadFeedbackImage$1;-><init>(Lcom/boyaa/app/image/UploadFeedbackImage;Ljava/lang/String;)V

    invoke-static {v1, v2, v3, v4}, Lcom/boyaa/app/common/ThreadTask;->start(Landroid/app/Activity;Ljava/lang/String;ZLcom/boyaa/app/common/OnThreadTask;)V

    .line 267
    return-void
.end method
