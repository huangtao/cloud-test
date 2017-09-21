.class public Lcom/boyaa/entity/statistics/UploadLogFile;
.super Ljava/lang/Object;
.source "UploadLogFile.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final TAG:Ljava/lang/String; = "UploadLogFile"

.field private static final kFileSuffix:Ljava/lang/String; = ".zip"


# instance fields
.field private mAction:Ljava/lang/String;

.field private mApp:Ljava/lang/String;

.field private mDate:Ljava/lang/String;

.field private mFileKey:Ljava/lang/String;

.field private mFilePath:Ljava/lang/String;

.field private mFile_seq:Ljava/lang/String;

.field private mMid:Ljava/lang/String;

.field private mMimeType:Ljava/lang/String;

.field private mModule:Ljava/lang/String;

.field private mResult:I

.field private mTimeout:I

.field private mType:Ljava/lang/String;

.field private mUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const/4 v0, 0x0

    iput v0, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mResult:I

    .line 52
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/entity/statistics/UploadLogFile;)I
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mResult:I

    return v0
.end method

.method static synthetic access$1(Lcom/boyaa/entity/statistics/UploadLogFile;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mModule:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2(Lcom/boyaa/entity/statistics/UploadLogFile;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mFilePath:Ljava/lang/String;

    return-object v0
.end method

.method private addParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "twoHyphens"    # Ljava/lang/String;
    .param p4, "boundary"    # Ljava/lang/String;
    .param p5, "lineEnd"    # Ljava/lang/String;

    .prologue
    .line 293
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 294
    const-string v1, "Content-Disposition: form-data; name=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 295
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 293
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private callLua()V
    .locals 2

    .prologue
    .line 115
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/entity/statistics/UploadLogFile$1;

    invoke-direct {v1, p0}, Lcom/boyaa/entity/statistics/UploadLogFile$1;-><init>(Lcom/boyaa/entity/statistics/UploadLogFile;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 126
    return-void
.end method

.method private getEndFilePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 103
    const-string v2, ","

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 104
    .local v1, "endFilePathArr":[Ljava/lang/String;
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    aget-object v0, v1, v2

    .line 105
    .local v0, "endFilePath":Ljava/lang/String;
    return-object v0
.end method

.method private getFilePathPrefix(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 129
    const-string v0, ""

    .line 130
    .local v0, "filePathPrefix":Ljava/lang/String;
    const-string v2, "."

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 131
    .local v1, "lenPrefix":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 132
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 136
    :goto_0
    return-object v0

    .line 134
    :cond_0
    const-string v2, "UploadLogFile"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u6587\u4ef6\u540d\u5f02\u5e38 filePath:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private getZipFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 140
    invoke-direct {p0, p1}, Lcom/boyaa/entity/statistics/UploadLogFile;->getFilePathPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 141
    .local v2, "filePath2":Ljava/lang/String;
    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 142
    .local v0, "fileIndexOf":I
    const-string v1, ""

    .line 143
    .local v1, "fileName":Ljava/lang/String;
    const/4 v3, -0x1

    if-eq v0, v3, :cond_0

    .line 144
    new-instance v3, Ljava/lang/StringBuilder;

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ".zip"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 148
    :goto_0
    return-object v1

    .line 146
    :cond_0
    const-string v3, "UploadLogFile"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "\u6587\u4ef6\u540d\u5f02\u5e38 filePath:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private getZipFilePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {p0, p1}, Lcom/boyaa/entity/statistics/UploadLogFile;->getFilePathPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ".zip"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private uploadFile(Ljava/lang/String;Ljava/lang/String;)Lcom/boyaa/app/common/RequestResult;
    .locals 28
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;

    .prologue
    .line 152
    new-instance v23, Lcom/boyaa/app/common/RequestResult;

    invoke-direct/range {v23 .. v23}, Lcom/boyaa/app/common/RequestResult;-><init>()V

    .line 153
    .local v23, "result":Lcom/boyaa/app/common/RequestResult;
    const/4 v13, 0x0

    .line 154
    .local v13, "connection":Ljava/net/HttpURLConnection;
    const/16 v19, 0x0

    .line 155
    .local v19, "outStream":Ljava/io/DataOutputStream;
    const-string v7, "\r\n"

    .line 156
    .local v7, "lineEnd":Ljava/lang/String;
    const-string v5, "--"

    .line 157
    .local v5, "twoHyphens":Ljava/lang/String;
    const-string v6, "*****"

    .line 165
    .local v6, "boundary":Ljava/lang/String;
    const/high16 v18, 0x100000

    .line 166
    .local v18, "maxBufferSize":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/boyaa/entity/statistics/UploadLogFile;->mTimeout:I

    const/16 v3, 0x1388

    if-ge v2, v3, :cond_0

    const/16 v25, 0x1388

    .line 168
    .local v25, "timeout2":I
    :goto_0
    const/16 v16, 0x0

    .line 170
    .local v16, "fileInputStream":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v15, Ljava/io/File;

    move-object/from16 v0, p1

    invoke-direct {v15, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 171
    .local v15, "file":Ljava/io/File;
    const-string v2, "UploadLogFile"

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

    .line 172
    new-instance v17, Ljava/io/FileInputStream;

    move-object/from16 v0, v17

    invoke-direct {v0, v15}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/ProtocolException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4

    .line 173
    .end local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .local v17, "fileInputStream":Ljava/io/FileInputStream;
    :try_start_1
    const-string v2, "UploadLogFile"

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

    .line 180
    :try_start_2
    const-string v2, "UploadLogFile"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u8bf7\u6c42url:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/entity/statistics/UploadLogFile;->mUrl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    new-instance v26, Ljava/net/URL;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/entity/statistics/UploadLogFile;->mUrl:Ljava/lang/String;

    move-object/from16 v0, v26

    invoke-direct {v0, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 182
    .local v26, "url":Ljava/net/URL;
    invoke-virtual/range {v26 .. v26}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v13, v0

    .line 183
    move/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 184
    const/4 v2, 0x1

    invoke-virtual {v13, v2}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 185
    const/4 v2, 0x1

    invoke-virtual {v13, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 186
    const/4 v2, 0x0

    invoke-virtual {v13, v2}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 188
    const-string v2, "POST"

    invoke-virtual {v13, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 189
    const-string v2, "Connection"

    const-string v3, "Keep-Alive"

    invoke-virtual {v13, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    const-string v2, "Content-Type"

    .line 191
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "multipart/form-data;boundary="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 190
    invoke-virtual {v13, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
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

    .line 194
    .end local v19    # "outStream":Ljava/io/DataOutputStream;
    .local v20, "outStream":Ljava/io/DataOutputStream;
    :try_start_3
    const-string v3, "app"

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/entity/statistics/UploadLogFile;->mApp:Ljava/lang/String;

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/boyaa/entity/statistics/UploadLogFile;->addParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 196
    const-string v3, "action"

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/entity/statistics/UploadLogFile;->mAction:Ljava/lang/String;

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/boyaa/entity/statistics/UploadLogFile;->addParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 198
    const-string v3, "mid"

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/entity/statistics/UploadLogFile;->mMid:Ljava/lang/String;

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/boyaa/entity/statistics/UploadLogFile;->addParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 200
    const-string v3, "date"

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/entity/statistics/UploadLogFile;->mDate:Ljava/lang/String;

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/boyaa/entity/statistics/UploadLogFile;->addParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 202
    const-string v3, "module"

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/entity/statistics/UploadLogFile;->mModule:Ljava/lang/String;

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/boyaa/entity/statistics/UploadLogFile;->addParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 204
    const-string v3, "type"

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/entity/statistics/UploadLogFile;->mType:Ljava/lang/String;

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/boyaa/entity/statistics/UploadLogFile;->addParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 206
    const-string v3, "file_seq"

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/boyaa/entity/statistics/UploadLogFile;->mFile_seq:Ljava/lang/String;

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/boyaa/entity/statistics/UploadLogFile;->addParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 209
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

    .line 211
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Content-Disposition: form-data; name=\""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/boyaa/entity/statistics/UploadLogFile;->mFileKey:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\";filename=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 212
    const-string v3, "Content-Type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/boyaa/entity/statistics/UploadLogFile;->mMimeType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 213
    const-string v3, "Content-Transfer-Encoding: binary"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 211
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 215
    invoke-virtual/range {v17 .. v17}, Ljava/io/FileInputStream;->available()I

    move-result v11

    .line 216
    .local v11, "bytesAvailable":I
    const-string v2, "UploadLogFile"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u6587\u4ef6\u5927\u5c0f\uff1a"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    move/from16 v0, v18

    invoke-static {v11, v0}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 218
    .local v9, "bufferSize":I
    new-array v8, v9, [B

    .line 220
    .local v8, "buffer":[B
    const/4 v2, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v8, v2, v9}, Ljava/io/FileInputStream;->read([BII)I

    move-result v12

    .line 222
    .local v12, "bytesRead":I
    :goto_1
    if-gtz v12, :cond_1

    .line 229
    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 230
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

    .line 232
    invoke-virtual/range {v17 .. v17}, Ljava/io/FileInputStream;->close()V

    .line 233
    invoke-virtual/range {v20 .. v20}, Ljava/io/DataOutputStream;->flush()V

    .line 234
    invoke-virtual/range {v20 .. v20}, Ljava/io/DataOutputStream;->close()V

    .line 235
    const-string v2, "UploadLogFile"

    const-string v3, "\u5411\u670d\u52a1\u5668\u5199\u6570\u636e\u5b8c\u6210"

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_d
    .catch Ljava/net/ProtocolException; {:try_start_3 .. :try_end_3} :catch_b
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_3 .. :try_end_3} :catch_9
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_7

    .line 259
    :try_start_4
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v22

    .line 260
    .local v22, "responseCode":I
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    .line 261
    .local v21, "response":Ljava/lang/StringBuilder;
    const-string v2, "UploadLogFile"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u4e0a\u4f20\u6587\u4ef6\u670d\u52a1\u5668\u8fd4\u56de responseCode\uff1a"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    const/16 v2, 0xc8

    move/from16 v0, v22

    if-ne v0, v2, :cond_3

    .line 263
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v27

    .line 264
    .local v27, "urlStream":Ljava/io/InputStream;
    new-instance v10, Ljava/io/BufferedReader;

    .line 265
    new-instance v2, Ljava/io/InputStreamReader;

    move-object/from16 v0, v27

    invoke-direct {v2, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 264
    invoke-direct {v10, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 266
    .local v10, "bufferedReader":Ljava/io/BufferedReader;
    const-string v24, ""

    .line 267
    .local v24, "sCurrentLine":Ljava/lang/String;
    :goto_2
    invoke-virtual {v10}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v24

    if-nez v24, :cond_2

    .line 270
    invoke-virtual {v10}, Ljava/io/BufferedReader;->close()V

    .line 271
    invoke-virtual {v13}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 272
    const-string v2, "UploadLogFile"

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

    .line 274
    const/4 v2, 0x1

    move-object/from16 v0, v23

    iput v2, v0, Lcom/boyaa/app/common/RequestResult;->code:I

    .line 275
    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v23

    iput-object v2, v0, Lcom/boyaa/app/common/RequestResult;->retStr:Ljava/lang/String;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_5

    move-object/from16 v19, v20

    .line 287
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

    .line 166
    .end local v25    # "timeout2":I
    :cond_0
    move-object/from16 v0, p0

    iget v0, v0, Lcom/boyaa/entity/statistics/UploadLogFile;->mTimeout:I

    move/from16 v25, v0

    goto/16 :goto_0

    .line 174
    .restart local v16    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v25    # "timeout2":I
    :catch_0
    move-exception v14

    .line 175
    .local v14, "e":Ljava/io/FileNotFoundException;
    :goto_4
    :try_start_5
    const-string v2, "UploadLogFile"

    invoke-virtual {v14}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    const/4 v2, -0x1

    move-object/from16 v0, v23

    iput v2, v0, Lcom/boyaa/app/common/RequestResult;->code:I
    :try_end_5
    .catch Ljava/net/MalformedURLException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/net/ProtocolException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_3

    .line 236
    .end local v14    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v14

    .line 237
    .local v14, "e":Ljava/net/MalformedURLException;
    :goto_5
    const/4 v2, -0x1

    move-object/from16 v0, v23

    iput v2, v0, Lcom/boyaa/app/common/RequestResult;->code:I

    .line 238
    const-string v2, "UploadLogFile"

    invoke-virtual {v14}, Ljava/net/MalformedURLException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 223
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

    .line 224
    invoke-virtual/range {v17 .. v17}, Ljava/io/FileInputStream;->available()I

    move-result v11

    .line 225
    move/from16 v0, v18

    invoke-static {v11, v0}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 226
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

    .line 240
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

    .line 241
    .local v14, "e":Ljava/net/ProtocolException;
    :goto_6
    const/4 v2, -0x1

    move-object/from16 v0, v23

    iput v2, v0, Lcom/boyaa/app/common/RequestResult;->code:I

    .line 242
    invoke-virtual {v14}, Ljava/net/ProtocolException;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v23

    iput-object v2, v0, Lcom/boyaa/app/common/RequestResult;->retStr:Ljava/lang/String;

    .line 243
    const-string v2, "UploadLogFile"

    invoke-virtual {v14}, Ljava/net/ProtocolException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 245
    .end local v14    # "e":Ljava/net/ProtocolException;
    :catch_3
    move-exception v14

    .line 246
    .local v14, "e":Lorg/apache/http/conn/ConnectTimeoutException;
    :goto_7
    const/4 v2, 0x0

    move-object/from16 v0, v23

    iput v2, v0, Lcom/boyaa/app/common/RequestResult;->code:I

    .line 247
    invoke-virtual {v14}, Lorg/apache/http/conn/ConnectTimeoutException;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v23

    iput-object v2, v0, Lcom/boyaa/app/common/RequestResult;->retStr:Ljava/lang/String;

    .line 248
    const-string v2, "UploadLogFile"

    invoke-virtual {v14}, Lorg/apache/http/conn/ConnectTimeoutException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 250
    .end local v14    # "e":Lorg/apache/http/conn/ConnectTimeoutException;
    :catch_4
    move-exception v14

    .line 251
    .local v14, "e":Ljava/io/IOException;
    :goto_8
    const/4 v2, 0x0

    move-object/from16 v0, v23

    iput v2, v0, Lcom/boyaa/app/common/RequestResult;->code:I

    .line 252
    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v23

    iput-object v2, v0, Lcom/boyaa/app/common/RequestResult;->retStr:Ljava/lang/String;

    .line 253
    const-string v2, "UploadLogFile"

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 268
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

    .line 280
    .end local v10    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v21    # "response":Ljava/lang/StringBuilder;
    .end local v22    # "responseCode":I
    .end local v24    # "sCurrentLine":Ljava/lang/String;
    .end local v27    # "urlStream":Ljava/io/InputStream;
    :catch_5
    move-exception v14

    .line 281
    .restart local v14    # "e":Ljava/io/IOException;
    const/4 v2, -0x1

    move-object/from16 v0, v23

    iput v2, v0, Lcom/boyaa/app/common/RequestResult;->code:I

    .line 282
    const-string v2, "UploadLogFile"

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .end local v14    # "e":Ljava/io/IOException;
    :goto_9
    move-object/from16 v19, v20

    .line 287
    .end local v20    # "outStream":Ljava/io/DataOutputStream;
    .restart local v19    # "outStream":Ljava/io/DataOutputStream;
    goto/16 :goto_3

    .line 278
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

    .line 250
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

    .line 245
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

    .line 240
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

    .line 236
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

    .line 174
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


# virtual methods
.method public execute(Ljava/lang/String;)V
    .locals 6
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 54
    const/4 v1, 0x0

    .line 56
    .local v1, "jsonResult":Lorg/json/JSONObject;
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .end local v1    # "jsonResult":Lorg/json/JSONObject;
    .local v2, "jsonResult":Lorg/json/JSONObject;
    :try_start_1
    const-string v3, "url"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mUrl:Ljava/lang/String;

    .line 58
    const-string v3, "timeout"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mTimeout:I

    .line 59
    const-string v3, "fileKey"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mFileKey:Ljava/lang/String;

    .line 60
    const-string v3, "mimeType"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mMimeType:Ljava/lang/String;

    .line 61
    const-string v3, "app"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mApp:Ljava/lang/String;

    .line 62
    const-string v3, "action"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mAction:Ljava/lang/String;

    .line 63
    const-string v3, "mid"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mMid:Ljava/lang/String;

    .line 64
    const-string v3, "date"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mDate:Ljava/lang/String;

    .line 65
    const-string v3, "module"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mModule:Ljava/lang/String;

    .line 66
    const-string v3, "type"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mType:Ljava/lang/String;

    .line 67
    const-string v3, "file_seq"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mFile_seq:Ljava/lang/String;

    .line 68
    const-string v3, "filePath"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mFilePath:Ljava/lang/String;

    .line 70
    new-instance v3, Ljava/lang/Thread;

    invoke-direct {v3, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v1, v2

    .line 77
    .end local v2    # "jsonResult":Lorg/json/JSONObject;
    .restart local v1    # "jsonResult":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 71
    :catch_0
    move-exception v0

    .line 72
    .local v0, "e":Lorg/json/JSONException;
    :goto_1
    const-string v3, "UploadLogFile"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "\u53c2\u6570\u6709\u8bef:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/boyaa/app/debug/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    invoke-direct {p0}, Lcom/boyaa/entity/statistics/UploadLogFile;->callLua()V

    goto :goto_0

    .line 71
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "jsonResult":Lorg/json/JSONObject;
    .restart local v2    # "jsonResult":Lorg/json/JSONObject;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "jsonResult":Lorg/json/JSONObject;
    .restart local v1    # "jsonResult":Lorg/json/JSONObject;
    goto :goto_1
.end method

.method public run()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    .line 80
    new-instance v2, Lcom/boyaa/app/common/RequestResult;

    invoke-direct {v2}, Lcom/boyaa/app/common/RequestResult;-><init>()V

    .line 81
    .local v2, "requestResult":Lcom/boyaa/app/common/RequestResult;
    iget-object v8, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mFilePath:Ljava/lang/String;

    invoke-direct {p0, v8}, Lcom/boyaa/entity/statistics/UploadLogFile;->getEndFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "filePath":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/boyaa/entity/statistics/UploadLogFile;->getZipFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 83
    .local v5, "zipFilePath":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/boyaa/entity/statistics/UploadLogFile;->getZipFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 84
    .local v4, "zipFileName":Ljava/lang/String;
    new-instance v7, Lcom/boyaa/app/file/ZipUtil;

    invoke-direct {v7}, Lcom/boyaa/app/file/ZipUtil;-><init>()V

    .line 85
    .local v7, "zipUtil":Lcom/boyaa/app/file/ZipUtil;
    invoke-virtual {v7, v0, v5}, Lcom/boyaa/app/file/ZipUtil;->zipFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 86
    .local v6, "zipResult":Ljava/lang/String;
    if-nez v6, :cond_0

    .line 87
    const/4 v8, -0x1

    iput v8, v2, Lcom/boyaa/app/common/RequestResult;->code:I

    .line 88
    invoke-direct {p0}, Lcom/boyaa/entity/statistics/UploadLogFile;->callLua()V

    .line 99
    :goto_0
    return-void

    .line 92
    :cond_0
    invoke-direct {p0, v5, v4}, Lcom/boyaa/entity/statistics/UploadLogFile;->uploadFile(Ljava/lang/String;Ljava/lang/String;)Lcom/boyaa/app/common/RequestResult;

    move-result-object v3

    .line 93
    .local v3, "result":Lcom/boyaa/app/common/RequestResult;
    iget v8, v3, Lcom/boyaa/app/common/RequestResult;->code:I

    if-ne v8, v9, :cond_1

    .line 94
    iput v9, p0, Lcom/boyaa/entity/statistics/UploadLogFile;->mResult:I

    .line 96
    :cond_1
    new-instance v1, Lcom/boyaa/app/file/FileUtil;

    invoke-direct {v1}, Lcom/boyaa/app/file/FileUtil;-><init>()V

    .line 97
    .local v1, "fileUtil":Lcom/boyaa/app/file/FileUtil;
    invoke-static {v5}, Lcom/boyaa/app/file/FileUtil;->deleteFile(Ljava/lang/String;)Z

    .line 98
    invoke-direct {p0}, Lcom/boyaa/entity/statistics/UploadLogFile;->callLua()V

    goto :goto_0
.end method
