.class public Lcom/boyaa/app/file/FileUpload;
.super Ljava/lang/Object;
.source "FileUpload.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "FileUpload"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method private addParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "twoHyphens"    # Ljava/lang/String;
    .param p4, "boundary"    # Ljava/lang/String;
    .param p5, "lineEnd"    # Ljava/lang/String;

    .prologue
    .line 162
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 163
    const-string v1, "Content-Disposition: form-data; name=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 164
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 162
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private nonAsciiToUnicode(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 172
    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 173
    .local v2, "retStr":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v1, v3, :cond_0

    .line 182
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 174
    :cond_0
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 176
    .local v0, "code":I
    if-ltz v0, :cond_1

    const/16 v3, 0x7f

    if-gt v0, v3, :cond_1

    .line 177
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 173
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 179
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\\u"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1
.end method


# virtual methods
.method public upload(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/boyaa/app/common/RequestResult;
    .locals 28
    .param p1, "urlStr"    # Ljava/lang/String;
    .param p2, "filePath"    # Ljava/lang/String;
    .param p3, "fileName"    # Ljava/lang/String;
    .param p4, "timeout"    # I
    .param p5, "time"    # Ljava/lang/String;
    .param p6, "sigkey"    # Ljava/lang/String;
    .param p7, "fileKey"    # Ljava/lang/String;
    .param p8, "mimeType"    # Ljava/lang/String;
    .param p9, "app"    # Ljava/lang/String;
    .param p10, "action"    # Ljava/lang/String;

    .prologue
    .line 32
    new-instance v23, Lcom/boyaa/app/common/RequestResult;

    invoke-direct/range {v23 .. v23}, Lcom/boyaa/app/common/RequestResult;-><init>()V

    .line 33
    .local v23, "result":Lcom/boyaa/app/common/RequestResult;
    const/4 v13, 0x0

    .line 34
    .local v13, "connection":Ljava/net/HttpURLConnection;
    const/16 v19, 0x0

    .line 35
    .local v19, "outStream":Ljava/io/DataOutputStream;
    const-string v7, "\r\n"

    .line 36
    .local v7, "lineEnd":Ljava/lang/String;
    const-string v5, "--"

    .line 37
    .local v5, "twoHyphens":Ljava/lang/String;
    const-string v6, "*****"

    .line 45
    .local v6, "boundary":Ljava/lang/String;
    const/high16 v18, 0x100000

    .line 46
    .local v18, "maxBufferSize":I
    const/16 v2, 0x1388

    move/from16 v0, p4

    if-ge v0, v2, :cond_0

    const/16 v25, 0x1388

    .line 48
    .local v25, "timeout2":I
    :goto_0
    const/16 v16, 0x0

    .line 50
    .local v16, "fileInputStream":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v15, Ljava/io/File;

    move-object/from16 v0, p2

    invoke-direct {v15, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 51
    .local v15, "file":Ljava/io/File;
    const-string v2, "FileUpload"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u4e0a\u4f20\u6587\u4ef6\uff1a"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    new-instance v17, Ljava/io/FileInputStream;

    move-object/from16 v0, v17

    invoke-direct {v0, v15}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/ProtocolException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4

    .line 53
    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .local v17, "fileInputStream":Ljava/io/FileInputStream;
    :try_start_1
    const-string v2, "FileUpload"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u83b7\u5f97\u6587\u4ef6\u8f93\u5165\u6d41\u6210\u529f\uff0c\u6587\u4ef6\u5927\u5c0f\uff1a"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Ljava/io/FileInputStream;->available()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_e
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_c
    .catch Ljava/net/ProtocolException; {:try_start_1 .. :try_end_1} :catch_a
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_1 .. :try_end_1} :catch_8
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6

    .line 60
    :try_start_2
    const-string v2, "FileUpload"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u8bf7\u6c42url:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    new-instance v26, Ljava/net/URL;

    move-object/from16 v0, v26

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 62
    .local v26, "url":Ljava/net/URL;
    invoke-virtual/range {v26 .. v26}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v13, v0

    .line 63
    move/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 64
    const/4 v2, 0x1

    invoke-virtual {v13, v2}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 65
    const/4 v2, 0x1

    invoke-virtual {v13, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 66
    const/4 v2, 0x0

    invoke-virtual {v13, v2}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 68
    const-string v2, "POST"

    invoke-virtual {v13, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 69
    const-string v2, "Connection"

    const-string v3, "Keep-Alive"

    invoke-virtual {v13, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    const-string v2, "Content-Type"

    .line 71
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "multipart/form-data;boundary="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 70
    invoke-virtual {v13, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    new-instance v20, Ljava/io/DataOutputStream;

    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-direct {v0, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_c
    .catch Ljava/net/ProtocolException; {:try_start_2 .. :try_end_2} :catch_a
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_2 .. :try_end_2} :catch_8
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_6

    .line 74
    .end local v19    # "outStream":Ljava/io/DataOutputStream;
    .local v20, "outStream":Ljava/io/DataOutputStream;
    :try_start_3
    const-string v3, "app"

    move-object/from16 v2, p0

    move-object/from16 v4, p9

    invoke-direct/range {v2 .. v7}, Lcom/boyaa/app/file/FileUpload;->addParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 76
    const-string v3, "action"

    move-object/from16 v2, p0

    move-object/from16 v4, p10

    invoke-direct/range {v2 .. v7}, Lcom/boyaa/app/file/FileUpload;->addParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 78
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 80
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Content-Disposition: form-data; name=\""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p7

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\";filename=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 81
    const-string v3, "Content-Type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p8

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 82
    const-string v3, "Content-Transfer-Encoding: binary"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 80
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 84
    invoke-virtual/range {v17 .. v17}, Ljava/io/FileInputStream;->available()I

    move-result v11

    .line 85
    .local v11, "bytesAvailable":I
    const-string v2, "FileUpload"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u6587\u4ef6\u5927\u5c0f\uff1a"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    move/from16 v0, v18

    invoke-static {v11, v0}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 87
    .local v9, "bufferSize":I
    new-array v8, v9, [B

    .line 89
    .local v8, "buffer":[B
    const/4 v2, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v8, v2, v9}, Ljava/io/FileInputStream;->read([BII)I

    move-result v12

    .line 91
    .local v12, "bytesRead":I
    :goto_1
    if-gtz v12, :cond_1

    .line 98
    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 99
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 101
    invoke-virtual/range {v17 .. v17}, Ljava/io/FileInputStream;->close()V

    .line 102
    invoke-virtual/range {v20 .. v20}, Ljava/io/DataOutputStream;->flush()V

    .line 103
    invoke-virtual/range {v20 .. v20}, Ljava/io/DataOutputStream;->close()V

    .line 104
    const-string v2, "FileUpload"

    const-string v3, "\u5411\u670d\u52a1\u5668\u5199\u6570\u636e\u5b8c\u6210"

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_d
    .catch Ljava/net/ProtocolException; {:try_start_3 .. :try_end_3} :catch_b
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_3 .. :try_end_3} :catch_9
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_7

    .line 128
    :try_start_4
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v22

    .line 129
    .local v22, "responseCode":I
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    .line 130
    .local v21, "response":Ljava/lang/StringBuilder;
    const-string v2, "FileUpload"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u4e0a\u4f20\u6587\u4ef6\u670d\u52a1\u5668\u8fd4\u56de responseCode\uff1a"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    const/16 v2, 0xc8

    move/from16 v0, v22

    if-ne v0, v2, :cond_3

    .line 132
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v27

    .line 133
    .local v27, "urlStream":Ljava/io/InputStream;
    new-instance v10, Ljava/io/BufferedReader;

    .line 134
    new-instance v2, Ljava/io/InputStreamReader;

    move-object/from16 v0, v27

    invoke-direct {v2, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 133
    invoke-direct {v10, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 135
    .local v10, "bufferedReader":Ljava/io/BufferedReader;
    const-string v24, ""

    .line 136
    .local v24, "sCurrentLine":Ljava/lang/String;
    :goto_2
    invoke-virtual {v10}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v24

    if-nez v24, :cond_2

    .line 139
    invoke-virtual {v10}, Ljava/io/BufferedReader;->close()V

    .line 140
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 141
    const-string v2, "FileUpload"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u8bfb\u6570\u636e\u5b8c\u6210 \u7ed3\u679c\uff1a"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    const/4 v2, 0x1

    move-object/from16 v0, v23

    iput v2, v0, Lcom/boyaa/app/common/RequestResult;->code:I

    .line 144
    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v23

    iput-object v2, v0, Lcom/boyaa/app/common/RequestResult;->retStr:Ljava/lang/String;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_5

    move-object/from16 v19, v20

    .line 156
    .end local v8    # "buffer":[B
    .end local v9    # "bufferSize":I
    .end local v10    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v11    # "bytesAvailable":I
    .end local v12    # "bytesRead":I
    .end local v15    # "file":Ljava/io/File;
    .end local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v20    # "outStream":Ljava/io/DataOutputStream;
    .end local v21    # "response":Ljava/lang/StringBuilder;
    .end local v22    # "responseCode":I
    .end local v24    # "sCurrentLine":Ljava/lang/String;
    .end local v26    # "url":Ljava/net/URL;
    .end local v27    # "urlStream":Ljava/io/InputStream;
    .restart local v19    # "outStream":Ljava/io/DataOutputStream;
    :goto_3
    return-object v23

    .end local v25    # "timeout2":I
    :cond_0
    move/from16 v25, p4

    .line 46
    goto/16 :goto_0

    .line 54
    .restart local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v25    # "timeout2":I
    :catch_0
    move-exception v14

    .line 55
    .local v14, "e":Ljava/io/FileNotFoundException;
    :goto_4
    :try_start_5
    const-string v2, "FileUpload"

    invoke-virtual {v14}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    const/4 v2, -0x1

    move-object/from16 v0, v23

    iput v2, v0, Lcom/boyaa/app/common/RequestResult;->code:I
    :try_end_5
    .catch Ljava/net/MalformedURLException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/net/ProtocolException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_3

    .line 105
    .end local v14    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v14

    .line 106
    .local v14, "e":Ljava/net/MalformedURLException;
    :goto_5
    const/4 v2, -0x1

    move-object/from16 v0, v23

    iput v2, v0, Lcom/boyaa/app/common/RequestResult;->code:I

    .line 107
    const-string v2, "FileUpload"

    invoke-virtual {v14}, Ljava/net/MalformedURLException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 92
    .end local v14    # "e":Ljava/net/MalformedURLException;
    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v19    # "outStream":Ljava/io/DataOutputStream;
    .restart local v8    # "buffer":[B
    .restart local v9    # "bufferSize":I
    .restart local v11    # "bytesAvailable":I
    .restart local v12    # "bytesRead":I
    .restart local v15    # "file":Ljava/io/File;
    .restart local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v26    # "url":Ljava/net/URL;
    :cond_1
    const/4 v2, 0x0

    :try_start_6
    move-object/from16 v0, v20

    invoke-virtual {v0, v8, v2, v9}, Ljava/io/DataOutputStream;->write([BII)V

    .line 93
    invoke-virtual/range {v17 .. v17}, Ljava/io/FileInputStream;->available()I

    move-result v11

    .line 94
    move/from16 v0, v18

    invoke-static {v11, v0}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 95
    const/4 v2, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v8, v2, v9}, Ljava/io/FileInputStream;->read([BII)I
    :try_end_6
    .catch Ljava/net/MalformedURLException; {:try_start_6 .. :try_end_6} :catch_d
    .catch Ljava/net/ProtocolException; {:try_start_6 .. :try_end_6} :catch_b
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_6 .. :try_end_6} :catch_9
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_7

    move-result v12

    goto/16 :goto_1

    .line 109
    .end local v8    # "buffer":[B
    .end local v9    # "bufferSize":I
    .end local v11    # "bytesAvailable":I
    .end local v12    # "bytesRead":I
    .end local v15    # "file":Ljava/io/File;
    .end local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v20    # "outStream":Ljava/io/DataOutputStream;
    .end local v26    # "url":Ljava/net/URL;
    .restart local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v19    # "outStream":Ljava/io/DataOutputStream;
    :catch_2
    move-exception v14

    .line 110
    .local v14, "e":Ljava/net/ProtocolException;
    :goto_6
    const/4 v2, -0x1

    move-object/from16 v0, v23

    iput v2, v0, Lcom/boyaa/app/common/RequestResult;->code:I

    .line 111
    invoke-virtual {v14}, Ljava/net/ProtocolException;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v23

    iput-object v2, v0, Lcom/boyaa/app/common/RequestResult;->retStr:Ljava/lang/String;

    .line 112
    const-string v2, "FileUpload"

    invoke-virtual {v14}, Ljava/net/ProtocolException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 114
    .end local v14    # "e":Ljava/net/ProtocolException;
    :catch_3
    move-exception v14

    .line 115
    .local v14, "e":Lorg/apache/http/conn/ConnectTimeoutException;
    :goto_7
    const/4 v2, 0x0

    move-object/from16 v0, v23

    iput v2, v0, Lcom/boyaa/app/common/RequestResult;->code:I

    .line 116
    invoke-virtual {v14}, Lorg/apache/http/conn/ConnectTimeoutException;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v23

    iput-object v2, v0, Lcom/boyaa/app/common/RequestResult;->retStr:Ljava/lang/String;

    .line 117
    const-string v2, "FileUpload"

    invoke-virtual {v14}, Lorg/apache/http/conn/ConnectTimeoutException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 119
    .end local v14    # "e":Lorg/apache/http/conn/ConnectTimeoutException;
    :catch_4
    move-exception v14

    .line 120
    .local v14, "e":Ljava/io/IOException;
    :goto_8
    const/4 v2, 0x0

    move-object/from16 v0, v23

    iput v2, v0, Lcom/boyaa/app/common/RequestResult;->code:I

    .line 121
    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v23

    iput-object v2, v0, Lcom/boyaa/app/common/RequestResult;->retStr:Ljava/lang/String;

    .line 122
    const-string v2, "FileUpload"

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 137
    .end local v14    # "e":Ljava/io/IOException;
    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v19    # "outStream":Ljava/io/DataOutputStream;
    .restart local v8    # "buffer":[B
    .restart local v9    # "bufferSize":I
    .restart local v10    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v11    # "bytesAvailable":I
    .restart local v12    # "bytesRead":I
    .restart local v15    # "file":Ljava/io/File;
    .restart local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v21    # "response":Ljava/lang/StringBuilder;
    .restart local v22    # "responseCode":I
    .restart local v24    # "sCurrentLine":Ljava/lang/String;
    .restart local v26    # "url":Ljava/net/URL;
    .restart local v27    # "urlStream":Ljava/io/InputStream;
    :cond_2
    :try_start_7
    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    goto/16 :goto_2

    .line 149
    .end local v10    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v21    # "response":Ljava/lang/StringBuilder;
    .end local v22    # "responseCode":I
    .end local v24    # "sCurrentLine":Ljava/lang/String;
    .end local v27    # "urlStream":Ljava/io/InputStream;
    :catch_5
    move-exception v14

    .line 150
    .restart local v14    # "e":Ljava/io/IOException;
    const/4 v2, -0x1

    move-object/from16 v0, v23

    iput v2, v0, Lcom/boyaa/app/common/RequestResult;->code:I

    .line 151
    const-string v2, "FileUpload"

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .end local v14    # "e":Ljava/io/IOException;
    :goto_9
    move-object/from16 v19, v20

    .line 156
    .end local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v19    # "outStream":Ljava/io/DataOutputStream;
    goto/16 :goto_3

    .line 147
    .end local v19    # "outStream":Ljava/io/DataOutputStream;
    .restart local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v21    # "response":Ljava/lang/StringBuilder;
    .restart local v22    # "responseCode":I
    :cond_3
    const/4 v2, -0x1

    :try_start_8
    move-object/from16 v0, v23

    iput v2, v0, Lcom/boyaa/app/common/RequestResult;->code:I
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    goto :goto_9

    .line 119
    .end local v8    # "buffer":[B
    .end local v9    # "bufferSize":I
    .end local v11    # "bytesAvailable":I
    .end local v12    # "bytesRead":I
    .end local v20    # "outStream":Ljava/io/DataOutputStream;
    .end local v21    # "response":Ljava/lang/StringBuilder;
    .end local v22    # "responseCode":I
    .end local v26    # "url":Ljava/net/URL;
    .restart local v19    # "outStream":Ljava/io/DataOutputStream;
    :catch_6
    move-exception v14

    move-object/from16 v16, v17

    .end local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v16    # "fileInputStream":Ljava/io/FileInputStream;
    goto :goto_8

    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v19    # "outStream":Ljava/io/DataOutputStream;
    .restart local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v26    # "url":Ljava/net/URL;
    :catch_7
    move-exception v14

    move-object/from16 v16, v17

    .end local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v16    # "fileInputStream":Ljava/io/FileInputStream;
    move-object/from16 v19, v20

    .end local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v19    # "outStream":Ljava/io/DataOutputStream;
    goto :goto_8

    .line 114
    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v26    # "url":Ljava/net/URL;
    .restart local v17    # "fileInputStream":Ljava/io/FileInputStream;
    :catch_8
    move-exception v14

    move-object/from16 v16, v17

    .end local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v16    # "fileInputStream":Ljava/io/FileInputStream;
    goto :goto_7

    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v19    # "outStream":Ljava/io/DataOutputStream;
    .restart local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v26    # "url":Ljava/net/URL;
    :catch_9
    move-exception v14

    move-object/from16 v16, v17

    .end local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v16    # "fileInputStream":Ljava/io/FileInputStream;
    move-object/from16 v19, v20

    .end local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v19    # "outStream":Ljava/io/DataOutputStream;
    goto :goto_7

    .line 109
    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v26    # "url":Ljava/net/URL;
    .restart local v17    # "fileInputStream":Ljava/io/FileInputStream;
    :catch_a
    move-exception v14

    move-object/from16 v16, v17

    .end local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v16    # "fileInputStream":Ljava/io/FileInputStream;
    goto/16 :goto_6

    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v19    # "outStream":Ljava/io/DataOutputStream;
    .restart local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v26    # "url":Ljava/net/URL;
    :catch_b
    move-exception v14

    move-object/from16 v16, v17

    .end local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v16    # "fileInputStream":Ljava/io/FileInputStream;
    move-object/from16 v19, v20

    .end local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v19    # "outStream":Ljava/io/DataOutputStream;
    goto/16 :goto_6

    .line 105
    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v26    # "url":Ljava/net/URL;
    .restart local v17    # "fileInputStream":Ljava/io/FileInputStream;
    :catch_c
    move-exception v14

    move-object/from16 v16, v17

    .end local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v16    # "fileInputStream":Ljava/io/FileInputStream;
    goto/16 :goto_5

    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v19    # "outStream":Ljava/io/DataOutputStream;
    .restart local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v26    # "url":Ljava/net/URL;
    :catch_d
    move-exception v14

    move-object/from16 v16, v17

    .end local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v16    # "fileInputStream":Ljava/io/FileInputStream;
    move-object/from16 v19, v20

    .end local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v19    # "outStream":Ljava/io/DataOutputStream;
    goto/16 :goto_5

    .line 54
    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v26    # "url":Ljava/net/URL;
    .restart local v17    # "fileInputStream":Ljava/io/FileInputStream;
    :catch_e
    move-exception v14

    move-object/from16 v16, v17

    .end local v17    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v16    # "fileInputStream":Ljava/io/FileInputStream;
    goto/16 :goto_4
.end method
