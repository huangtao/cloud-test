.class public Lcom/boyaa/entity/statistics/UploadDumpFile;
.super Ljava/lang/Object;
.source "UploadDumpFile.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final TAG:Ljava/lang/String; = "UploadDumpFile"

.field private static final kFileSuffix:Ljava/lang/String; = ".zip"


# instance fields
.field private mAction:Ljava/lang/String;

.field private mApp:Ljava/lang/String;

.field private mFileKey:Ljava/lang/String;

.field private mFilePath:Ljava/lang/String;

.field private mMimeType:Ljava/lang/String;

.field private mSigkey:Ljava/lang/String;

.field private mTime:I

.field private mTimeout:I

.field private mUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

.method private callLua()V
    .locals 2

    .prologue
    .line 85
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/entity/statistics/UploadDumpFile$1;

    invoke-direct {v1, p0}, Lcom/boyaa/entity/statistics/UploadDumpFile$1;-><init>(Lcom/boyaa/entity/statistics/UploadDumpFile;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 92
    return-void
.end method

.method private getEndFilePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 73
    const-string v2, ","

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 74
    .local v1, "endFilePathArr":[Ljava/lang/String;
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    aget-object v0, v1, v2

    .line 75
    .local v0, "endFilePath":Ljava/lang/String;
    return-object v0
.end method

.method private getFilePathPrefix(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 95
    const-string v0, ""

    .line 96
    .local v0, "filePathPrefix":Ljava/lang/String;
    const-string v2, "."

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 97
    .local v1, "lenPrefix":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 98
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 102
    :goto_0
    return-object v0

    .line 100
    :cond_0
    const-string v2, "UploadDumpFile"

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
    .line 106
    invoke-direct {p0, p1}, Lcom/boyaa/entity/statistics/UploadDumpFile;->getFilePathPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 107
    .local v2, "filePath2":Ljava/lang/String;
    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 108
    .local v0, "fileIndexOf":I
    const-string v1, ""

    .line 109
    .local v1, "fileName":Ljava/lang/String;
    const/4 v3, -0x1

    if-eq v0, v3, :cond_0

    .line 110
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

    .line 114
    :goto_0
    return-object v1

    .line 112
    :cond_0
    const-string v3, "UploadDumpFile"

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
    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {p0, p1}, Lcom/boyaa/entity/statistics/UploadDumpFile;->getFilePathPrefix(Ljava/lang/String;)Ljava/lang/String;

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


# virtual methods
.method public execute(Ljava/lang/String;)V
    .locals 6
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 31
    const/4 v1, 0x0

    .line 33
    .local v1, "jsonResult":Lorg/json/JSONObject;
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .end local v1    # "jsonResult":Lorg/json/JSONObject;
    .local v2, "jsonResult":Lorg/json/JSONObject;
    :try_start_1
    const-string v3, "url"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mUrl:Ljava/lang/String;

    .line 35
    const-string v3, "filePath"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mFilePath:Ljava/lang/String;

    .line 36
    const-string v3, "timeout"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mTimeout:I

    .line 37
    const-string v3, "time"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mTime:I

    .line 38
    const-string v3, "sigkey"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mSigkey:Ljava/lang/String;

    .line 39
    const-string v3, "fileKey"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mFileKey:Ljava/lang/String;

    .line 40
    const-string v3, "mimeType"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mMimeType:Ljava/lang/String;

    .line 41
    const-string v3, "app"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mApp:Ljava/lang/String;

    .line 42
    const-string v3, "action"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mAction:Ljava/lang/String;

    .line 43
    new-instance v3, Ljava/lang/Thread;

    invoke-direct {v3, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v1, v2

    .line 50
    .end local v2    # "jsonResult":Lorg/json/JSONObject;
    .restart local v1    # "jsonResult":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 44
    :catch_0
    move-exception v0

    .line 45
    .local v0, "e":Lorg/json/JSONException;
    :goto_1
    const-string v3, "UploadDumpFile"

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

    .line 46
    const-string v3, "NativeEvent.dumpFileUploadCallBack"

    invoke-static {v3}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->call_lua(Ljava/lang/String;)I

    goto :goto_0

    .line 44
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
    .locals 17

    .prologue
    .line 53
    new-instance v14, Lcom/boyaa/app/common/RequestResult;

    invoke-direct {v14}, Lcom/boyaa/app/common/RequestResult;-><init>()V

    .line 54
    .local v14, "requestResult":Lcom/boyaa/app/common/RequestResult;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mFilePath:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/boyaa/entity/statistics/UploadDumpFile;->getEndFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 55
    .local v12, "filePath":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/boyaa/entity/statistics/UploadDumpFile;->getZipFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 56
    .local v3, "zipFilePath":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/boyaa/entity/statistics/UploadDumpFile;->getZipFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 57
    .local v4, "zipFileName":Ljava/lang/String;
    new-instance v16, Lcom/boyaa/app/file/ZipUtil;

    invoke-direct/range {v16 .. v16}, Lcom/boyaa/app/file/ZipUtil;-><init>()V

    .line 58
    .local v16, "zipUtil":Lcom/boyaa/app/file/ZipUtil;
    move-object/from16 v0, v16

    invoke-virtual {v0, v12, v3}, Lcom/boyaa/app/file/ZipUtil;->zipFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 59
    .local v15, "zipResult":Ljava/lang/String;
    if-nez v15, :cond_0

    .line 60
    const/4 v2, -0x1

    iput v2, v14, Lcom/boyaa/app/common/RequestResult;->code:I

    .line 61
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/entity/statistics/UploadDumpFile;->callLua()V

    .line 69
    :goto_0
    return-void

    .line 64
    :cond_0
    new-instance v1, Lcom/boyaa/app/file/FileUpload;

    invoke-direct {v1}, Lcom/boyaa/app/file/FileUpload;-><init>()V

    .line 65
    .local v1, "fileUpload":Lcom/boyaa/app/file/FileUpload;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mUrl:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mTimeout:I

    new-instance v6, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget v7, v0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mTime:I

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mSigkey:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mFileKey:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mMimeType:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mApp:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/boyaa/entity/statistics/UploadDumpFile;->mAction:Ljava/lang/String;

    invoke-virtual/range {v1 .. v11}, Lcom/boyaa/app/file/FileUpload;->upload(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/boyaa/app/common/RequestResult;

    move-result-object v14

    .line 66
    new-instance v13, Lcom/boyaa/app/file/FileUtil;

    invoke-direct {v13}, Lcom/boyaa/app/file/FileUtil;-><init>()V

    .line 67
    .local v13, "fileUtil":Lcom/boyaa/app/file/FileUtil;
    invoke-static {v3}, Lcom/boyaa/app/file/FileUtil;->deleteFile(Ljava/lang/String;)Z

    .line 68
    invoke-direct/range {p0 .. p0}, Lcom/boyaa/entity/statistics/UploadDumpFile;->callLua()V

    goto :goto_0
.end method
