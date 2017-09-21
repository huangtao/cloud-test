.class public Lcom/boyaa/engine/common/UploadDumpFile;
.super Ljava/lang/Object;
.source "UploadDumpFile.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final TAG:Ljava/lang/String; = "UploadDumpFile"

.field private static final URL:Ljava/lang/String; = "http://mvusspus01.boyaagame.com/report3.php"

.field private static final kFileSuffix:Ljava/lang/String; = ".zip"

.field private static mUploadDumpFile:Lcom/boyaa/engine/common/UploadDumpFile;


# instance fields
.field private appid:Ljava/lang/String;

.field private count502:I

.field private dumps:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private filePath:Ljava/lang/String;

.field private mAppActivity:Lcom/boyaa/engine/made/AppActivity;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/boyaa/engine/common/UploadDumpFile;->dumps:Ljava/util/List;

    .line 46
    const/4 v0, 0x0

    iput v0, p0, Lcom/boyaa/engine/common/UploadDumpFile;->count502:I

    .line 56
    return-void
.end method

.method private deleteFile(Ljava/lang/String;)Z
    .locals 2
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 332
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 333
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 335
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    .line 337
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getDumpPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 311
    if-eqz p1, :cond_0

    const-string v7, ""

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 322
    :cond_0
    :goto_0
    return-object v6

    .line 313
    :cond_1
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 314
    .local v5, "root":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 315
    .local v2, "files":[Ljava/io/File;
    if-eqz v2, :cond_0

    .line 317
    move-object v0, v2

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1
    if-ge v3, v4, :cond_3

    aget-object v1, v0, v3

    .line 318
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/boyaa/engine/common/UploadDumpFile;->getFilePathSuffix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, ".dmp"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 319
    iget-object v6, p0, Lcom/boyaa/engine/common/UploadDumpFile;->dumps:Ljava/util/List;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 317
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 322
    .end local v1    # "file":Ljava/io/File;
    :cond_3
    iget-object v6, p0, Lcom/boyaa/engine/common/UploadDumpFile;->dumps:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_4

    iget-object v6, p0, Lcom/boyaa/engine/common/UploadDumpFile;->dumps:Ljava/util/List;

    iget-object v7, p0, Lcom/boyaa/engine/common/UploadDumpFile;->dumps:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    goto :goto_0

    :cond_4
    const-string v6, ""

    goto :goto_0
.end method

.method private getFilePathPrefix(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 227
    const-string v0, ""

    .line 228
    .local v0, "filePathPrefix":Ljava/lang/String;
    const-string v2, "."

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 229
    .local v1, "lenPrefix":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 230
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 234
    :goto_0
    return-object v0

    .line 232
    :cond_0
    const-string v2, "UploadDumpFile"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u6587\u4ef6\u540d\u5f02\u5e38 filePath:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private getFilePathSuffix(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 243
    const-string v0, ""

    .line 244
    .local v0, "filePathPrefix":Ljava/lang/String;
    const-string v2, "."

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 245
    .local v1, "lenPrefix":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 246
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 250
    :goto_0
    return-object v0

    .line 248
    :cond_0
    const-string v2, "UploadDumpFile"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u6587\u4ef6\u540d\u5f02\u5e38 filePath:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getInstance()Lcom/boyaa/engine/common/UploadDumpFile;
    .locals 1

    .prologue
    .line 63
    sget-object v0, Lcom/boyaa/engine/common/UploadDumpFile;->mUploadDumpFile:Lcom/boyaa/engine/common/UploadDumpFile;

    if-nez v0, :cond_0

    .line 64
    new-instance v0, Lcom/boyaa/engine/common/UploadDumpFile;

    invoke-direct {v0}, Lcom/boyaa/engine/common/UploadDumpFile;-><init>()V

    sput-object v0, Lcom/boyaa/engine/common/UploadDumpFile;->mUploadDumpFile:Lcom/boyaa/engine/common/UploadDumpFile;

    .line 66
    :cond_0
    sget-object v0, Lcom/boyaa/engine/common/UploadDumpFile;->mUploadDumpFile:Lcom/boyaa/engine/common/UploadDumpFile;

    return-object v0
.end method

.method private getZipFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 260
    invoke-direct {p0, p1}, Lcom/boyaa/engine/common/UploadDumpFile;->getFilePathPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 261
    .local v2, "filePath2":Ljava/lang/String;
    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 262
    .local v0, "fileIndexOf":I
    const-string v1, ""

    .line 263
    .local v1, "fileName":Ljava/lang/String;
    const/4 v3, -0x1

    if-eq v0, v3, :cond_0

    .line 264
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".zip"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 268
    :goto_0
    return-object v1

    .line 266
    :cond_0
    const-string v3, "UploadDumpFile"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u6587\u4ef6\u540d\u5f02\u5e38 filePath:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private getZipFilePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 218
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p1}, Lcom/boyaa/engine/common/UploadDumpFile;->getFilePathPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".zip"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private isWifi()Z
    .locals 5

    .prologue
    const/4 v2, 0x1

    .line 346
    iget-object v3, p0, Lcom/boyaa/engine/common/UploadDumpFile;->mAppActivity:Lcom/boyaa/engine/made/AppActivity;

    const-string v4, "connectivity"

    invoke-virtual {v3, v4}, Lcom/boyaa/engine/made/AppActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 348
    .local v1, "connectivityManager":Landroid/net/ConnectivityManager;
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 349
    .local v0, "activeNetInfo":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v3

    if-ne v3, v2, :cond_0

    .line 353
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private upload(Ljava/lang/String;)V
    .locals 35
    .param p1, "zipPath"    # Ljava/lang/String;

    .prologue
    .line 106
    const/4 v10, 0x0

    .line 110
    .local v10, "connection":Ljava/net/HttpURLConnection;
    const/high16 v20, 0x100000

    .line 111
    .local v20, "maxBufferSize":I
    const/16 v21, 0x0

    .line 112
    .local v21, "outStream":Ljava/io/DataOutputStream;
    const/4 v15, 0x0

    .line 113
    .local v15, "fStream":Ljava/io/FileInputStream;
    const/4 v6, 0x0

    .line 114
    .local v6, "bufferedReader":Ljava/io/BufferedReader;
    const/16 v18, 0x0

    .line 116
    .local v18, "inStream":Ljava/io/InputStream;
    :try_start_0
    new-instance v16, Ljava/io/FileInputStream;

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_12
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 117
    .end local v15    # "fStream":Ljava/io/FileInputStream;
    .local v16, "fStream":Ljava/io/FileInputStream;
    :try_start_1
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Lcom/boyaa/engine/made/AppActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v24

    .line 118
    .local v24, "pm":Landroid/content/pm/PackageManager;
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Lcom/boyaa/engine/made/AppActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v23

    .line 119
    .local v23, "pkgName":Ljava/lang/String;
    const/16 v31, 0x0

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    move/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v31

    move-object/from16 v0, v31

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    move-object/from16 v30, v0

    .line 120
    .local v30, "version":Ljava/lang/String;
    const/16 v31, 0x0

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    move/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v31

    move-object/from16 v0, v24

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 121
    .local v3, "appName":Ljava/lang/String;
    const-string v31, "UTF-8"

    move-object/from16 v0, v31

    invoke-static {v3, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 122
    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "http://mvusspus01.boyaagame.com/report3.php?version="

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "&appid="

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/engine/common/UploadDumpFile;->appid:Ljava/lang/String;

    move-object/from16 v32, v0

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "&project_name="

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    .line 123
    .local v29, "urlStr":Ljava/lang/String;
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "\u8bf7\u6c42url:"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    new-instance v28, Ljava/net/URL;

    invoke-direct/range {v28 .. v29}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 125
    .local v28, "url":Ljava/net/URL;
    invoke-virtual/range {v28 .. v28}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v31

    move-object/from16 v0, v31

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v10, v0

    .line 126
    const/16 v31, 0x1f4

    move/from16 v0, v31

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 127
    const/16 v31, 0x1f4

    move/from16 v0, v31

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 128
    const/16 v31, 0x1

    move/from16 v0, v31

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 129
    const/16 v31, 0x1

    move/from16 v0, v31

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 130
    const/16 v31, 0x0

    move/from16 v0, v31

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 131
    const-string v31, "POST"

    move-object/from16 v0, v31

    invoke-virtual {v10, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 132
    const-string v31, "Connection"

    const-string v32, "Keep-Alive"

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    invoke-virtual {v10, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    new-instance v22, Ljava/io/DataOutputStream;

    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v31

    move-object/from16 v0, v22

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_13
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 134
    .end local v21    # "outStream":Ljava/io/DataOutputStream;
    .local v22, "outStream":Ljava/io/DataOutputStream;
    :try_start_2
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileInputStream;->available()I

    move-result v8

    .line 135
    .local v8, "bytesAvailable":I
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "\u6587\u4ef6\u5927\u5c0f\uff1a"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    move/from16 v0, v20

    invoke-static {v8, v0}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 137
    .local v5, "bufferSize":I
    new-array v4, v5, [B

    .line 138
    .local v4, "buffer":[B
    :goto_0
    const/16 v31, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v31

    invoke-virtual {v0, v4, v1, v5}, Ljava/io/FileInputStream;->read([BII)I

    move-result v31

    if-lez v31, :cond_0

    .line 139
    const/16 v31, 0x0

    move-object/from16 v0, v22

    move/from16 v1, v31

    invoke-virtual {v0, v4, v1, v5}, Ljava/io/DataOutputStream;->write([BII)V

    .line 140
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileInputStream;->available()I

    move-result v8

    .line 141
    move/from16 v0, v20

    invoke-static {v8, v0}, Ljava/lang/Math;->min(II)I

    move-result v5

    goto :goto_0

    .line 143
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v26

    .line 144
    .local v26, "startTime":J
    invoke-virtual/range {v22 .. v22}, Ljava/io/DataOutputStream;->flush()V

    .line 145
    const-string v31, "UploadDumpFile"

    const-string v32, "\u5411\u670d\u52a1\u5668\u5199\u6570\u636e\u5b8c\u6210"

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v9

    .line 147
    .local v9, "code":I
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v31

    sub-long v11, v31, v26

    .line 148
    .local v11, "consumingTime":J
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "\u4e0a\u4f20\u6587\u4ef6\u670d\u52a1\u5668\u8fd4\u56de responseCode\uff1a"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, ",\u8017\u65f6\uff1a"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    const-wide/32 v33, 0xf4240

    div-long v33, v11, v33

    invoke-virtual/range {v32 .. v34}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, "ms"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    const/16 v31, 0xc8

    move/from16 v0, v31

    if-ne v9, v0, :cond_12

    .line 150
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    .local v25, "response":Ljava/lang/StringBuilder;
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v18

    .line 152
    new-instance v7, Ljava/io/BufferedReader;

    new-instance v31, Ljava/io/InputStreamReader;

    move-object/from16 v0, v31

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v31

    invoke-direct {v7, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 154
    .end local v6    # "bufferedReader":Ljava/io/BufferedReader;
    .local v7, "bufferedReader":Ljava/io/BufferedReader;
    :try_start_3
    const-string v19, ""

    .line 155
    .local v19, "line":Ljava/lang/String;
    :goto_1
    invoke-virtual {v7}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v19

    if-eqz v19, :cond_5

    .line 156
    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 174
    .end local v19    # "line":Ljava/lang/String;
    :catch_0
    move-exception v14

    move-object v6, v7

    .end local v7    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v6    # "bufferedReader":Ljava/io/BufferedReader;
    move-object/from16 v15, v16

    .end local v16    # "fStream":Ljava/io/FileInputStream;
    .restart local v15    # "fStream":Ljava/io/FileInputStream;
    move-object/from16 v21, v22

    .line 175
    .end local v3    # "appName":Ljava/lang/String;
    .end local v4    # "buffer":[B
    .end local v5    # "bufferSize":I
    .end local v8    # "bytesAvailable":I
    .end local v9    # "code":I
    .end local v11    # "consumingTime":J
    .end local v22    # "outStream":Ljava/io/DataOutputStream;
    .end local v23    # "pkgName":Ljava/lang/String;
    .end local v24    # "pm":Landroid/content/pm/PackageManager;
    .end local v25    # "response":Ljava/lang/StringBuilder;
    .end local v26    # "startTime":J
    .end local v28    # "url":Ljava/net/URL;
    .end local v29    # "urlStr":Ljava/lang/String;
    .end local v30    # "version":Ljava/lang/String;
    .local v14, "e":Ljava/lang/Exception;
    .restart local v21    # "outStream":Ljava/io/DataOutputStream;
    :goto_2
    :try_start_4
    const-string v31, "UploadDumpFile"

    invoke-virtual {v14}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 177
    if-eqz v21, :cond_1

    .line 179
    :try_start_5
    invoke-virtual/range {v21 .. v21}, Ljava/io/DataOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_6

    .line 185
    .end local v14    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_3
    if-eqz v15, :cond_2

    .line 187
    :try_start_6
    invoke-virtual {v15}, Ljava/io/FileInputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_7

    .line 193
    :cond_2
    :goto_4
    if-eqz v6, :cond_3

    .line 195
    :try_start_7
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_8

    .line 201
    :cond_3
    :goto_5
    if-eqz v18, :cond_4

    .line 203
    :try_start_8
    invoke-virtual/range {v18 .. v18}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_9

    .line 210
    :cond_4
    :goto_6
    return-void

    .line 158
    .end local v6    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v15    # "fStream":Ljava/io/FileInputStream;
    .end local v21    # "outStream":Ljava/io/DataOutputStream;
    .restart local v3    # "appName":Ljava/lang/String;
    .restart local v4    # "buffer":[B
    .restart local v5    # "bufferSize":I
    .restart local v7    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v8    # "bytesAvailable":I
    .restart local v9    # "code":I
    .restart local v11    # "consumingTime":J
    .restart local v16    # "fStream":Ljava/io/FileInputStream;
    .restart local v19    # "line":Ljava/lang/String;
    .restart local v22    # "outStream":Ljava/io/DataOutputStream;
    .restart local v23    # "pkgName":Ljava/lang/String;
    .restart local v24    # "pm":Landroid/content/pm/PackageManager;
    .restart local v25    # "response":Ljava/lang/StringBuilder;
    .restart local v26    # "startTime":J
    .restart local v28    # "url":Ljava/net/URL;
    .restart local v29    # "urlStr":Ljava/lang/String;
    .restart local v30    # "version":Ljava/lang/String;
    :cond_5
    :try_start_9
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 159
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "response : "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    const-string v32, "1"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-nez v31, :cond_6

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    const-string v32, "1-1"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-eqz v31, :cond_c

    .line 161
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/engine/common/UploadDumpFile;->dumps:Ljava/util/List;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .local v17, "i$":Ljava/util/Iterator;
    :goto_7
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v31

    if-eqz v31, :cond_b

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 162
    .local v13, "dump":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/boyaa/engine/common/UploadDumpFile;->deleteFile(Ljava/lang/String;)Z
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_7

    .line 177
    .end local v13    # "dump":Ljava/lang/String;
    .end local v17    # "i$":Ljava/util/Iterator;
    .end local v19    # "line":Ljava/lang/String;
    :catchall_0
    move-exception v31

    move-object v6, v7

    .end local v7    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v6    # "bufferedReader":Ljava/io/BufferedReader;
    move-object/from16 v15, v16

    .end local v16    # "fStream":Ljava/io/FileInputStream;
    .restart local v15    # "fStream":Ljava/io/FileInputStream;
    move-object/from16 v21, v22

    .end local v3    # "appName":Ljava/lang/String;
    .end local v4    # "buffer":[B
    .end local v5    # "bufferSize":I
    .end local v8    # "bytesAvailable":I
    .end local v9    # "code":I
    .end local v11    # "consumingTime":J
    .end local v22    # "outStream":Ljava/io/DataOutputStream;
    .end local v23    # "pkgName":Ljava/lang/String;
    .end local v24    # "pm":Landroid/content/pm/PackageManager;
    .end local v25    # "response":Ljava/lang/StringBuilder;
    .end local v26    # "startTime":J
    .end local v28    # "url":Ljava/net/URL;
    .end local v29    # "urlStr":Ljava/lang/String;
    .end local v30    # "version":Ljava/lang/String;
    .restart local v21    # "outStream":Ljava/io/DataOutputStream;
    :goto_8
    if-eqz v21, :cond_7

    .line 179
    :try_start_a
    invoke-virtual/range {v21 .. v21}, Ljava/io/DataOutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_2

    .line 185
    :cond_7
    :goto_9
    if-eqz v15, :cond_8

    .line 187
    :try_start_b
    invoke-virtual {v15}, Ljava/io/FileInputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_3

    .line 193
    :cond_8
    :goto_a
    if-eqz v6, :cond_9

    .line 195
    :try_start_c
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_4

    .line 201
    :cond_9
    :goto_b
    if-eqz v18, :cond_a

    .line 203
    :try_start_d
    invoke-virtual/range {v18 .. v18}, Ljava/io/InputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_5

    .line 177
    :cond_a
    :goto_c
    throw v31

    .line 164
    .end local v6    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v15    # "fStream":Ljava/io/FileInputStream;
    .end local v21    # "outStream":Ljava/io/DataOutputStream;
    .restart local v3    # "appName":Ljava/lang/String;
    .restart local v4    # "buffer":[B
    .restart local v5    # "bufferSize":I
    .restart local v7    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v8    # "bytesAvailable":I
    .restart local v9    # "code":I
    .restart local v11    # "consumingTime":J
    .restart local v16    # "fStream":Ljava/io/FileInputStream;
    .restart local v17    # "i$":Ljava/util/Iterator;
    .restart local v19    # "line":Ljava/lang/String;
    .restart local v22    # "outStream":Ljava/io/DataOutputStream;
    .restart local v23    # "pkgName":Ljava/lang/String;
    .restart local v24    # "pm":Landroid/content/pm/PackageManager;
    .restart local v25    # "response":Ljava/lang/StringBuilder;
    .restart local v26    # "startTime":J
    .restart local v28    # "url":Ljava/net/URL;
    .restart local v29    # "urlStr":Ljava/lang/String;
    .restart local v30    # "version":Ljava/lang/String;
    :cond_b
    :try_start_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/boyaa/engine/common/UploadDumpFile;->dumps:Ljava/util/List;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Ljava/util/List;->clear()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_0
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    .end local v17    # "i$":Ljava/util/Iterator;
    :cond_c
    move-object v6, v7

    .line 177
    .end local v7    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v19    # "line":Ljava/lang/String;
    .end local v25    # "response":Ljava/lang/StringBuilder;
    .restart local v6    # "bufferedReader":Ljava/io/BufferedReader;
    :cond_d
    :goto_d
    if-eqz v22, :cond_e

    .line 179
    :try_start_f
    invoke-virtual/range {v22 .. v22}, Ljava/io/DataOutputStream;->close()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_a

    .line 185
    :cond_e
    :goto_e
    if-eqz v16, :cond_f

    .line 187
    :try_start_10
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileInputStream;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_b

    .line 193
    :cond_f
    :goto_f
    if-eqz v6, :cond_10

    .line 195
    :try_start_11
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_c

    .line 201
    :cond_10
    :goto_10
    if-eqz v18, :cond_11

    .line 203
    :try_start_12
    invoke-virtual/range {v18 .. v18}, Ljava/io/InputStream;->close()V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_d

    :cond_11
    :goto_11
    move-object/from16 v15, v16

    .end local v16    # "fStream":Ljava/io/FileInputStream;
    .restart local v15    # "fStream":Ljava/io/FileInputStream;
    move-object/from16 v21, v22

    .line 209
    .end local v22    # "outStream":Ljava/io/DataOutputStream;
    .restart local v21    # "outStream":Ljava/io/DataOutputStream;
    goto/16 :goto_6

    .line 166
    .end local v15    # "fStream":Ljava/io/FileInputStream;
    .end local v21    # "outStream":Ljava/io/DataOutputStream;
    .restart local v16    # "fStream":Ljava/io/FileInputStream;
    .restart local v22    # "outStream":Ljava/io/DataOutputStream;
    :cond_12
    const/16 v31, 0x1f6

    move/from16 v0, v31

    if-ne v9, v0, :cond_d

    .line 167
    :try_start_13
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "502times:"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, p0

    iget v0, v0, Lcom/boyaa/engine/common/UploadDumpFile;->count502:I

    move/from16 v33, v0

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    move-object/from16 v0, p0

    iget v0, v0, Lcom/boyaa/engine/common/UploadDumpFile;->count502:I

    move/from16 v31, v0
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_1
    .catchall {:try_start_13 .. :try_end_13} :catchall_3

    const/16 v32, 0x3

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_17

    .line 177
    if-eqz v22, :cond_13

    .line 179
    :try_start_14
    invoke-virtual/range {v22 .. v22}, Ljava/io/DataOutputStream;->close()V
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_e

    .line 185
    :cond_13
    :goto_12
    if-eqz v16, :cond_14

    .line 187
    :try_start_15
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileInputStream;->close()V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_15} :catch_f

    .line 193
    :cond_14
    :goto_13
    if-eqz v6, :cond_15

    .line 195
    :try_start_16
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_16} :catch_10

    .line 201
    :cond_15
    :goto_14
    if-eqz v18, :cond_16

    .line 203
    :try_start_17
    invoke-virtual/range {v18 .. v18}, Ljava/io/InputStream;->close()V
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_17} :catch_11

    :cond_16
    :goto_15
    move-object/from16 v15, v16

    .end local v16    # "fStream":Ljava/io/FileInputStream;
    .restart local v15    # "fStream":Ljava/io/FileInputStream;
    move-object/from16 v21, v22

    .line 169
    .end local v22    # "outStream":Ljava/io/DataOutputStream;
    .restart local v21    # "outStream":Ljava/io/DataOutputStream;
    goto/16 :goto_6

    .line 171
    .end local v15    # "fStream":Ljava/io/FileInputStream;
    .end local v21    # "outStream":Ljava/io/DataOutputStream;
    .restart local v16    # "fStream":Ljava/io/FileInputStream;
    .restart local v22    # "outStream":Ljava/io/DataOutputStream;
    :cond_17
    :try_start_18
    move-object/from16 v0, p0

    iget v0, v0, Lcom/boyaa/engine/common/UploadDumpFile;->count502:I

    move/from16 v31, v0

    add-int/lit8 v31, v31, 0x1

    move/from16 v0, v31

    move-object/from16 v1, p0

    iput v0, v1, Lcom/boyaa/engine/common/UploadDumpFile;->count502:I

    .line 172
    invoke-direct/range {p0 .. p1}, Lcom/boyaa/engine/common/UploadDumpFile;->upload(Ljava/lang/String;)V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_1
    .catchall {:try_start_18 .. :try_end_18} :catchall_3

    goto :goto_d

    .line 174
    .end local v4    # "buffer":[B
    .end local v5    # "bufferSize":I
    .end local v8    # "bytesAvailable":I
    .end local v9    # "code":I
    .end local v11    # "consumingTime":J
    .end local v26    # "startTime":J
    :catch_1
    move-exception v14

    move-object/from16 v15, v16

    .end local v16    # "fStream":Ljava/io/FileInputStream;
    .restart local v15    # "fStream":Ljava/io/FileInputStream;
    move-object/from16 v21, v22

    .end local v22    # "outStream":Ljava/io/DataOutputStream;
    .restart local v21    # "outStream":Ljava/io/DataOutputStream;
    goto/16 :goto_2

    .line 180
    .end local v3    # "appName":Ljava/lang/String;
    .end local v23    # "pkgName":Ljava/lang/String;
    .end local v24    # "pm":Landroid/content/pm/PackageManager;
    .end local v28    # "url":Ljava/net/URL;
    .end local v29    # "urlStr":Ljava/lang/String;
    .end local v30    # "version":Ljava/lang/String;
    :catch_2
    move-exception v14

    .line 181
    .local v14, "e":Ljava/io/IOException;
    const-string v32, "UploadDumpFile"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "e : "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_9

    .line 188
    .end local v14    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v14

    .line 189
    .restart local v14    # "e":Ljava/io/IOException;
    const-string v32, "UploadDumpFile"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "e : "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_a

    .line 196
    .end local v14    # "e":Ljava/io/IOException;
    :catch_4
    move-exception v14

    .line 197
    .restart local v14    # "e":Ljava/io/IOException;
    const-string v32, "UploadDumpFile"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "e : "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_b

    .line 204
    .end local v14    # "e":Ljava/io/IOException;
    :catch_5
    move-exception v14

    .line 205
    .restart local v14    # "e":Ljava/io/IOException;
    const-string v32, "UploadDumpFile"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "e : "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_c

    .line 180
    .local v14, "e":Ljava/lang/Exception;
    :catch_6
    move-exception v14

    .line 181
    .local v14, "e":Ljava/io/IOException;
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "e : "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 188
    .end local v14    # "e":Ljava/io/IOException;
    :catch_7
    move-exception v14

    .line 189
    .restart local v14    # "e":Ljava/io/IOException;
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "e : "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_4

    .line 196
    .end local v14    # "e":Ljava/io/IOException;
    :catch_8
    move-exception v14

    .line 197
    .restart local v14    # "e":Ljava/io/IOException;
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "e : "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_5

    .line 204
    .end local v14    # "e":Ljava/io/IOException;
    :catch_9
    move-exception v14

    .line 205
    .restart local v14    # "e":Ljava/io/IOException;
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "e : "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_6

    .line 180
    .end local v14    # "e":Ljava/io/IOException;
    .end local v15    # "fStream":Ljava/io/FileInputStream;
    .end local v21    # "outStream":Ljava/io/DataOutputStream;
    .restart local v3    # "appName":Ljava/lang/String;
    .restart local v4    # "buffer":[B
    .restart local v5    # "bufferSize":I
    .restart local v8    # "bytesAvailable":I
    .restart local v9    # "code":I
    .restart local v11    # "consumingTime":J
    .restart local v16    # "fStream":Ljava/io/FileInputStream;
    .restart local v22    # "outStream":Ljava/io/DataOutputStream;
    .restart local v23    # "pkgName":Ljava/lang/String;
    .restart local v24    # "pm":Landroid/content/pm/PackageManager;
    .restart local v26    # "startTime":J
    .restart local v28    # "url":Ljava/net/URL;
    .restart local v29    # "urlStr":Ljava/lang/String;
    .restart local v30    # "version":Ljava/lang/String;
    :catch_a
    move-exception v14

    .line 181
    .restart local v14    # "e":Ljava/io/IOException;
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "e : "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_e

    .line 188
    .end local v14    # "e":Ljava/io/IOException;
    :catch_b
    move-exception v14

    .line 189
    .restart local v14    # "e":Ljava/io/IOException;
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "e : "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_f

    .line 196
    .end local v14    # "e":Ljava/io/IOException;
    :catch_c
    move-exception v14

    .line 197
    .restart local v14    # "e":Ljava/io/IOException;
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "e : "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_10

    .line 204
    .end local v14    # "e":Ljava/io/IOException;
    :catch_d
    move-exception v14

    .line 205
    .restart local v14    # "e":Ljava/io/IOException;
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "e : "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_11

    .line 180
    .end local v14    # "e":Ljava/io/IOException;
    :catch_e
    move-exception v14

    .line 181
    .restart local v14    # "e":Ljava/io/IOException;
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "e : "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_12

    .line 188
    .end local v14    # "e":Ljava/io/IOException;
    :catch_f
    move-exception v14

    .line 189
    .restart local v14    # "e":Ljava/io/IOException;
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "e : "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_13

    .line 196
    .end local v14    # "e":Ljava/io/IOException;
    :catch_10
    move-exception v14

    .line 197
    .restart local v14    # "e":Ljava/io/IOException;
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "e : "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_14

    .line 204
    .end local v14    # "e":Ljava/io/IOException;
    :catch_11
    move-exception v14

    .line 205
    .restart local v14    # "e":Ljava/io/IOException;
    const-string v31, "UploadDumpFile"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "e : "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual {v14}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_15

    .line 177
    .end local v3    # "appName":Ljava/lang/String;
    .end local v4    # "buffer":[B
    .end local v5    # "bufferSize":I
    .end local v8    # "bytesAvailable":I
    .end local v9    # "code":I
    .end local v11    # "consumingTime":J
    .end local v14    # "e":Ljava/io/IOException;
    .end local v16    # "fStream":Ljava/io/FileInputStream;
    .end local v22    # "outStream":Ljava/io/DataOutputStream;
    .end local v23    # "pkgName":Ljava/lang/String;
    .end local v24    # "pm":Landroid/content/pm/PackageManager;
    .end local v26    # "startTime":J
    .end local v28    # "url":Ljava/net/URL;
    .end local v29    # "urlStr":Ljava/lang/String;
    .end local v30    # "version":Ljava/lang/String;
    .restart local v15    # "fStream":Ljava/io/FileInputStream;
    .restart local v21    # "outStream":Ljava/io/DataOutputStream;
    :catchall_1
    move-exception v31

    goto/16 :goto_8

    .end local v15    # "fStream":Ljava/io/FileInputStream;
    .restart local v16    # "fStream":Ljava/io/FileInputStream;
    :catchall_2
    move-exception v31

    move-object/from16 v15, v16

    .end local v16    # "fStream":Ljava/io/FileInputStream;
    .restart local v15    # "fStream":Ljava/io/FileInputStream;
    goto/16 :goto_8

    .end local v15    # "fStream":Ljava/io/FileInputStream;
    .end local v21    # "outStream":Ljava/io/DataOutputStream;
    .restart local v3    # "appName":Ljava/lang/String;
    .restart local v16    # "fStream":Ljava/io/FileInputStream;
    .restart local v22    # "outStream":Ljava/io/DataOutputStream;
    .restart local v23    # "pkgName":Ljava/lang/String;
    .restart local v24    # "pm":Landroid/content/pm/PackageManager;
    .restart local v28    # "url":Ljava/net/URL;
    .restart local v29    # "urlStr":Ljava/lang/String;
    .restart local v30    # "version":Ljava/lang/String;
    :catchall_3
    move-exception v31

    move-object/from16 v15, v16

    .end local v16    # "fStream":Ljava/io/FileInputStream;
    .restart local v15    # "fStream":Ljava/io/FileInputStream;
    move-object/from16 v21, v22

    .end local v22    # "outStream":Ljava/io/DataOutputStream;
    .restart local v21    # "outStream":Ljava/io/DataOutputStream;
    goto/16 :goto_8

    .line 174
    .end local v3    # "appName":Ljava/lang/String;
    .end local v23    # "pkgName":Ljava/lang/String;
    .end local v24    # "pm":Landroid/content/pm/PackageManager;
    .end local v28    # "url":Ljava/net/URL;
    .end local v29    # "urlStr":Ljava/lang/String;
    .end local v30    # "version":Ljava/lang/String;
    :catch_12
    move-exception v14

    goto/16 :goto_2

    .end local v15    # "fStream":Ljava/io/FileInputStream;
    .restart local v16    # "fStream":Ljava/io/FileInputStream;
    :catch_13
    move-exception v14

    move-object/from16 v15, v16

    .end local v16    # "fStream":Ljava/io/FileInputStream;
    .restart local v15    # "fStream":Ljava/io/FileInputStream;
    goto/16 :goto_2
.end method

.method private zipFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "zipFilePath"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 277
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 280
    .local v4, "file":Ljava/io/File;
    :try_start_0
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 281
    .local v5, "fis":Ljava/io/FileInputStream;
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 282
    .local v0, "bis":Ljava/io/BufferedInputStream;
    const/16 v11, 0x400

    new-array v2, v11, [B

    .line 284
    .local v2, "buf":[B
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 285
    .local v6, "fos":Ljava/io/FileOutputStream;
    new-instance v1, Ljava/io/BufferedOutputStream;

    invoke-direct {v1, v6}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 286
    .local v1, "bos":Ljava/io/BufferedOutputStream;
    new-instance v9, Ljava/util/zip/ZipOutputStream;

    invoke-direct {v9, v1}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 287
    .local v9, "zos":Ljava/util/zip/ZipOutputStream;
    new-instance v8, Ljava/util/zip/ZipEntry;

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v8, v11}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 288
    .local v8, "ze":Ljava/util/zip/ZipEntry;
    invoke-virtual {v9, v8}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 289
    :goto_0
    invoke-virtual {v0, v2}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v7

    .local v7, "len":I
    const/4 v11, -0x1

    if-eq v7, v11, :cond_0

    .line 290
    const/4 v11, 0x0

    invoke-virtual {v9, v2, v11, v7}, Ljava/util/zip/ZipOutputStream;->write([BII)V

    .line 291
    invoke-virtual {v9}, Ljava/util/zip/ZipOutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 295
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .end local v2    # "buf":[B
    .end local v5    # "fis":Ljava/io/FileInputStream;
    .end local v6    # "fos":Ljava/io/FileOutputStream;
    .end local v7    # "len":I
    .end local v8    # "ze":Ljava/util/zip/ZipEntry;
    .end local v9    # "zos":Ljava/util/zip/ZipOutputStream;
    :catch_0
    move-exception v3

    .line 296
    .local v3, "e":Ljava/io/FileNotFoundException;
    const-string v11, "UploadDumpFile"

    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object p2, v10

    .line 302
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    .end local p2    # "zipFilePath":Ljava/lang/String;
    :goto_1
    return-object p2

    .line 293
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    .restart local v1    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v2    # "buf":[B
    .restart local v5    # "fis":Ljava/io/FileInputStream;
    .restart local v6    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "len":I
    .restart local v8    # "ze":Ljava/util/zip/ZipEntry;
    .restart local v9    # "zos":Ljava/util/zip/ZipOutputStream;
    .restart local p2    # "zipFilePath":Ljava/lang/String;
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V

    .line 294
    invoke-virtual {v9}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 298
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .end local v2    # "buf":[B
    .end local v5    # "fis":Ljava/io/FileInputStream;
    .end local v6    # "fos":Ljava/io/FileOutputStream;
    .end local v7    # "len":I
    .end local v8    # "ze":Ljava/util/zip/ZipEntry;
    .end local v9    # "zos":Ljava/util/zip/ZipOutputStream;
    :catch_1
    move-exception v3

    .line 299
    .local v3, "e":Ljava/io/IOException;
    const-string v11, "UploadDumpFile"

    invoke-virtual {v3}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object p2, v10

    .line 300
    goto :goto_1
.end method


# virtual methods
.method public execute(Lcom/boyaa/engine/made/AppActivity;Ljava/lang/String;)V
    .locals 2
    .param p1, "appActivity"    # Lcom/boyaa/engine/made/AppActivity;
    .param p2, "appid"    # Ljava/lang/String;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/boyaa/engine/common/UploadDumpFile;->mAppActivity:Lcom/boyaa/engine/made/AppActivity;

    .line 77
    iput-object p2, p0, Lcom/boyaa/engine/common/UploadDumpFile;->appid:Ljava/lang/String;

    .line 78
    if-eqz p2, :cond_0

    const-string v0, ""

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 84
    :cond_0
    :goto_0
    return-void

    .line 79
    :cond_1
    invoke-direct {p0}, Lcom/boyaa/engine/common/UploadDumpFile;->isWifi()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 80
    const-string v0, "storage_outer_root"

    invoke-static {v0}, Lcom/boyaa/engine/made/Sys;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/boyaa/engine/common/UploadDumpFile;->getDumpPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/engine/common/UploadDumpFile;->filePath:Ljava/lang/String;

    .line 81
    iget-object v0, p0, Lcom/boyaa/engine/common/UploadDumpFile;->filePath:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/engine/common/UploadDumpFile;->filePath:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 82
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public run()V
    .locals 3

    .prologue
    .line 92
    iget-object v2, p0, Lcom/boyaa/engine/common/UploadDumpFile;->filePath:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/boyaa/engine/common/UploadDumpFile;->getZipFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 93
    .local v0, "zipFilePath":Ljava/lang/String;
    iget-object v2, p0, Lcom/boyaa/engine/common/UploadDumpFile;->filePath:Ljava/lang/String;

    invoke-direct {p0, v2, v0}, Lcom/boyaa/engine/common/UploadDumpFile;->zipFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 94
    .local v1, "zipResult":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 99
    :goto_0
    return-void

    .line 97
    :cond_0
    invoke-direct {p0, v0}, Lcom/boyaa/engine/common/UploadDumpFile;->upload(Ljava/lang/String;)V

    .line 98
    invoke-direct {p0, v0}, Lcom/boyaa/engine/common/UploadDumpFile;->deleteFile(Ljava/lang/String;)Z

    goto :goto_0
.end method
