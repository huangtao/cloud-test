.class public Lcom/boyaa/downloader/network/FileDownloader;
.super Ljava/lang/Object;
.source "FileDownloader.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private block:I

.field private data:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private downloadSize:I

.field private downloadUrl:Ljava/lang/String;

.field private fileSize:I

.field private isDownloading:Z

.field private mContext:Landroid/content/Context;

.field private mFinishListener:Lcom/boyaa/downloader/network/DownloadFinishListener;

.field private mListener:Lcom/boyaa/downloader/network/DownloadProgressListener;

.field private mLogDao:Lcom/boyaa/downloader/dao/DownloadLogDao;

.field private saveFile:Ljava/io/File;

.field private stopped:Z

.field private threads:[Lcom/boyaa/downloader/network/DownloadThread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-class v0, Lcom/boyaa/downloader/network/FileDownloader;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/boyaa/downloader/network/FileDownloader;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;I)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "downloadUrl"    # Ljava/lang/String;
    .param p3, "fileSaveDir"    # Ljava/io/File;
    .param p4, "threadNum"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 193
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/boyaa/downloader/network/FileDownloader;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;ILcom/boyaa/downloader/network/DownloaderCreatedListener;)V

    .line 194
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;ILcom/boyaa/downloader/network/DownloaderCreatedListener;)V
    .locals 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "downloadUrl"    # Ljava/lang/String;
    .param p3, "fileSaveDir"    # Ljava/io/File;
    .param p4, "threadNum"    # I
    .param p5, "createdListener"    # Lcom/boyaa/downloader/network/DownloaderCreatedListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v9, 0x0

    iput v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadSize:I

    .line 40
    const/4 v9, 0x0

    iput v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->fileSize:I

    .line 56
    new-instance v9, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v9}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->data:Ljava/util/Map;

    .line 81
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->isDownloading:Z

    .line 86
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->stopped:Z

    .line 207
    iput-object p1, p0, Lcom/boyaa/downloader/network/FileDownloader;->mContext:Landroid/content/Context;

    .line 208
    iput-object p2, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadUrl:Ljava/lang/String;

    .line 209
    new-instance v9, Lcom/boyaa/downloader/dao/DownloadLogDao;

    iget-object v10, p0, Lcom/boyaa/downloader/network/FileDownloader;->mContext:Landroid/content/Context;

    invoke-direct {v9, v10}, Lcom/boyaa/downloader/dao/DownloadLogDao;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->mLogDao:Lcom/boyaa/downloader/dao/DownloadLogDao;

    .line 210
    new-instance v7, Ljava/net/URL;

    iget-object v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadUrl:Ljava/lang/String;

    invoke-direct {v7, v9}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 213
    .local v7, "url":Ljava/net/URL;
    invoke-virtual/range {p3 .. p3}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_0

    .line 214
    invoke-virtual/range {p3 .. p3}, Ljava/io/File;->mkdirs()Z

    .line 216
    :cond_0
    move/from16 v0, p4

    new-array v9, v0, [Lcom/boyaa/downloader/network/DownloadThread;

    iput-object v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    .line 218
    const/4 v1, 0x0

    .line 220
    .local v1, "conn":Ljava/net/HttpURLConnection;
    invoke-static {p1}, Lcom/boyaa/engine/made/APNUtil;->hasProxy(Landroid/content/Context;)Z

    move-result v8

    .line 222
    .local v8, "useProxy":Z
    if-eqz v8, :cond_1

    .line 223
    invoke-direct {p0, p1}, Lcom/boyaa/downloader/network/FileDownloader;->getProxy(Landroid/content/Context;)Ljava/net/Proxy;

    move-result-object v6

    .line 224
    .local v6, "proxy":Ljava/net/Proxy;
    invoke-virtual {v7, v6}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v1

    .end local v1    # "conn":Ljava/net/HttpURLConnection;
    check-cast v1, Ljava/net/HttpURLConnection;

    .line 231
    .end local v6    # "proxy":Ljava/net/Proxy;
    .restart local v1    # "conn":Ljava/net/HttpURLConnection;
    :goto_0
    const/16 v9, 0x1388

    invoke-virtual {v1, v9}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 232
    const-string v9, "GET"

    invoke-virtual {v1, v9}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 234
    const-string v9, "Accept"

    .line 235
    const-string v10, "image/gif, image/jpeg, image/pjpeg, image/pjpeg, application/x-shockwave-flash, application/xaml+xml, application/vnd.ms-xpsdocument, application/x-ms-xbap, application/x-ms-application, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, */*"

    .line 233
    invoke-virtual {v1, v9, v10}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    const-string v9, "Accept-Language"

    const-string v10, "zh-CN"

    invoke-virtual {v1, v9, v10}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    const-string v9, "Referer"

    invoke-virtual {v1, v9, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    const-string v9, "Charset"

    const-string v10, "UTF-8"

    invoke-virtual {v1, v9, v10}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    const-string v9, "User-Agent"

    .line 241
    const-string v10, "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)"

    .line 239
    invoke-virtual {v1, v9, v10}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    const-string v9, "Connection"

    const-string v10, "Keep-Alive"

    invoke-virtual {v1, v9, v10}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    .line 244
    invoke-static {v1}, Lcom/boyaa/downloader/network/FileDownloader;->printResponseHeader(Ljava/net/HttpURLConnection;)V

    .line 246
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v9

    const/16 v10, 0xc8

    if-ne v9, v10, :cond_9

    .line 247
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v9

    iput v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->fileSize:I

    .line 248
    iget v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->fileSize:I

    if-gtz v9, :cond_2

    .line 249
    new-instance v9, Ljava/lang/Exception;

    const-string v10, "Unkown file size!"

    invoke-direct {v9, v10}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v9

    .line 227
    :cond_1
    invoke-virtual {v7}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    .end local v1    # "conn":Ljava/net/HttpURLConnection;
    check-cast v1, Ljava/net/HttpURLConnection;

    .restart local v1    # "conn":Ljava/net/HttpURLConnection;
    goto :goto_0

    .line 251
    :cond_2
    invoke-direct {p0, v1}, Lcom/boyaa/downloader/network/FileDownloader;->getFileName(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v3

    .line 252
    .local v3, "filename":Ljava/lang/String;
    new-instance v9, Ljava/io/File;

    move-object/from16 v0, p3

    invoke-direct {v9, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->saveFile:Ljava/io/File;

    .line 254
    iget-object v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->mLogDao:Lcom/boyaa/downloader/dao/DownloadLogDao;

    invoke-virtual {v9, p2}, Lcom/boyaa/downloader/dao/DownloadLogDao;->getData(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v5

    .line 259
    .local v5, "logdata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v9

    if-lez v9, :cond_3

    .line 260
    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_5

    .line 264
    :cond_3
    iget-object v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->data:Ljava/util/Map;

    invoke-interface {v9}, Ljava/util/Map;->size()I

    move-result v9

    iget-object v10, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    array-length v10, v10

    if-ne v9, v10, :cond_7

    .line 265
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    iget-object v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    array-length v9, v9

    if-lt v4, v9, :cond_6

    .line 275
    .end local v4    # "i":I
    :goto_3
    iget v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->fileSize:I

    iget-object v10, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    array-length v10, v10

    rem-int/2addr v9, v10

    if-nez v9, :cond_8

    iget v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->fileSize:I

    .line 276
    iget-object v10, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    array-length v10, v10

    div-int/2addr v9, v10

    .line 275
    :goto_4
    iput v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->block:I

    .line 279
    if-eqz p5, :cond_4

    .line 280
    iget v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->fileSize:I

    move-object/from16 v0, p5

    invoke-interface {v0, v9}, Lcom/boyaa/downloader/network/DownloaderCreatedListener;->onCreated(I)V

    .line 286
    :cond_4
    return-void

    .line 260
    :cond_5
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 261
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    iget-object v12, p0, Lcom/boyaa/downloader/network/FileDownloader;->data:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-interface {v12, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 266
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .restart local v4    # "i":I
    :cond_6
    iget v10, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadSize:I

    iget-object v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->data:Ljava/util/Map;

    add-int/lit8 v11, v4, 0x1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v9, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    add-int/2addr v9, v10

    iput v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadSize:I

    .line 265
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 271
    .end local v4    # "i":I
    :cond_7
    iget-object v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->mLogDao:Lcom/boyaa/downloader/dao/DownloadLogDao;

    invoke-virtual {v9, p2}, Lcom/boyaa/downloader/dao/DownloadLogDao;->delete(Ljava/lang/String;)V

    goto :goto_3

    .line 277
    :cond_8
    iget v9, p0, Lcom/boyaa/downloader/network/FileDownloader;->fileSize:I

    iget-object v10, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    array-length v10, v10

    div-int/2addr v9, v10

    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    .line 284
    .end local v3    # "filename":Ljava/lang/String;
    .end local v5    # "logdata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :cond_9
    new-instance v9, Ljava/lang/Exception;

    const-string v10, "server no response!!"

    invoke-direct {v9, v10}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v9
.end method

.method private getFileName(Ljava/net/HttpURLConnection;)Ljava/lang/String;
    .locals 7
    .param p1, "conn"    # Ljava/net/HttpURLConnection;

    .prologue
    .line 307
    iget-object v4, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadUrl:Ljava/lang/String;

    iget-object v5, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadUrl:Ljava/lang/String;

    const/16 v6, 0x2f

    invoke-virtual {v5, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 309
    .local v0, "filename":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v4, ""

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 310
    :cond_0
    const/4 v1, 0x0

    .line 311
    .local v1, "i":I
    :goto_0
    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->getHeaderField(I)Ljava/lang/String;

    move-result-object v3

    .line 313
    .local v3, "mine":Ljava/lang/String;
    if-nez v3, :cond_2

    .line 321
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".tmp"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .end local v1    # "i":I
    .end local v3    # "mine":Ljava/lang/String;
    :cond_1
    move-object v4, v0

    .line 324
    :goto_1
    return-object v4

    .line 315
    .restart local v1    # "i":I
    .restart local v3    # "mine":Ljava/lang/String;
    :cond_2
    const-string v4, "content-disposition"

    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->getHeaderFieldKey(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 316
    const-string v4, ".*filename=(.*)"

    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 317
    .local v2, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_3

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 310
    .end local v2    # "m":Ljava/util/regex/Matcher;
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static getHttpResponseHeader(Ljava/net/HttpURLConnection;)Ljava/util/Map;
    .locals 4
    .param p0, "http"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/HttpURLConnection;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 437
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 439
    .local v0, "header":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 440
    .local v1, "i":I
    :goto_0
    invoke-virtual {p0, v1}, Ljava/net/HttpURLConnection;->getHeaderField(I)Ljava/lang/String;

    move-result-object v2

    .line 441
    .local v2, "mine":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 445
    return-object v0

    .line 442
    :cond_0
    invoke-virtual {p0, v1}, Ljava/net/HttpURLConnection;->getHeaderFieldKey(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 439
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private getProxy(Landroid/content/Context;)Ljava/net/Proxy;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 294
    invoke-static {p1}, Lcom/boyaa/engine/made/APNUtil;->getApnProxy(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 295
    .local v0, "host":Ljava/lang/String;
    invoke-static {p1}, Lcom/boyaa/engine/made/APNUtil;->getApnPortInt(Landroid/content/Context;)I

    move-result v1

    .line 296
    .local v1, "port":I
    new-instance v3, Ljava/net/InetSocketAddress;

    invoke-direct {v3, v0, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 297
    .local v3, "sa":Ljava/net/SocketAddress;
    new-instance v2, Ljava/net/Proxy;

    sget-object v4, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    invoke-direct {v2, v4, v3}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    .line 298
    .local v2, "proxy":Ljava/net/Proxy;
    return-object v2
.end method

.method private static log(Ljava/lang/String;)V
    .locals 0
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 468
    return-void
.end method

.method private static printResponseHeader(Ljava/net/HttpURLConnection;)V
    .locals 6
    .param p0, "http"    # Ljava/net/HttpURLConnection;

    .prologue
    .line 453
    invoke-static {p0}, Lcom/boyaa/downloader/network/FileDownloader;->getHttpResponseHeader(Ljava/net/HttpURLConnection;)Ljava/util/Map;

    move-result-object v1

    .line 456
    .local v1, "header":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 460
    return-void

    .line 456
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 457
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ":"

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 458
    .local v2, "key":Ljava/lang/String;
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/boyaa/downloader/network/FileDownloader;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 457
    .end local v2    # "key":Ljava/lang/String;
    :cond_1
    const-string v2, ""

    goto :goto_1
.end method

.method private update()V
    .locals 3

    .prologue
    .line 178
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->mLogDao:Lcom/boyaa/downloader/dao/DownloadLogDao;

    iget-object v1, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadUrl:Ljava/lang/String;

    iget-object v2, p0, Lcom/boyaa/downloader/network/FileDownloader;->data:Ljava/util/Map;

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/downloader/dao/DownloadLogDao;->update(Ljava/lang/String;Ljava/util/Map;)V

    .line 181
    return-void
.end method


# virtual methods
.method protected declared-synchronized append(I)V
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 161
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadSize:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadSize:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 162
    monitor-exit p0

    return-void

    .line 161
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDownloadSize()I
    .locals 1

    .prologue
    .line 153
    iget v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadSize:I

    return v0
.end method

.method public getDownloadUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getFileSize()I
    .locals 1

    .prologue
    .line 144
    iget v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->fileSize:I

    return v0
.end method

.method public getThreadSize()I
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    array-length v0, v0

    return v0
.end method

.method public isDownloading()Z
    .locals 1

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->isDownloading:Z

    return v0
.end method

.method public setDownloadFinishListener(Lcom/boyaa/downloader/network/DownloadFinishListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/boyaa/downloader/network/DownloadFinishListener;

    .prologue
    .line 124
    iget-boolean v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->isDownloading:Z

    if-eqz v0, :cond_0

    .line 125
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Download task has started!!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 127
    :cond_0
    if-eqz p1, :cond_1

    .line 128
    iput-object p1, p0, Lcom/boyaa/downloader/network/FileDownloader;->mFinishListener:Lcom/boyaa/downloader/network/DownloadFinishListener;

    .line 130
    :cond_1
    return-void
.end method

.method public setDownloadProgressListener(Lcom/boyaa/downloader/network/DownloadProgressListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/boyaa/downloader/network/DownloadProgressListener;

    .prologue
    .line 109
    iget-boolean v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->isDownloading:Z

    if-eqz v0, :cond_0

    .line 110
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Download task has started!!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_0
    if-eqz p1, :cond_1

    .line 113
    iput-object p1, p0, Lcom/boyaa/downloader/network/FileDownloader;->mListener:Lcom/boyaa/downloader/network/DownloadProgressListener;

    .line 115
    :cond_1
    return-void
.end method

.method public stopDownload()V
    .locals 1

    .prologue
    .line 96
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->stopped:Z

    .line 97
    return-void
.end method

.method public syncDownload()I
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v14, 0x0

    .line 333
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->isDownloading:Z

    .line 335
    :try_start_0
    new-instance v12, Ljava/io/RandomAccessFile;

    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->saveFile:Ljava/io/File;

    const-string v1, "rw"

    invoke-direct {v12, v0, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 336
    .local v12, "randOut":Ljava/io/RandomAccessFile;
    iget v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->fileSize:I

    if-lez v0, :cond_0

    .line 337
    iget v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->fileSize:I

    int-to-long v0, v0

    invoke-virtual {v12, v0, v1}, Ljava/io/RandomAccessFile;->setLength(J)V

    .line 338
    :cond_0
    invoke-virtual {v12}, Ljava/io/RandomAccessFile;->close()V

    .line 339
    new-instance v2, Ljava/net/URL;

    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadUrl:Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 341
    .local v2, "url":Ljava/net/URL;
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->data:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    iget-object v1, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    array-length v1, v1

    if-eq v0, v1, :cond_1

    .line 342
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->data:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 344
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    array-length v0, v0

    if-lt v9, v0, :cond_5

    .line 349
    .end local v9    # "i":I
    :cond_1
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_1
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    array-length v0, v0

    if-lt v9, v0, :cond_6

    .line 364
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->mLogDao:Lcom/boyaa/downloader/dao/DownloadLogDao;

    iget-object v1, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/boyaa/downloader/network/FileDownloader;->data:Ljava/util/Map;

    invoke-virtual {v0, v1, v3}, Lcom/boyaa/downloader/dao/DownloadLogDao;->insert(Ljava/lang/String;Ljava/util/Map;)V

    .line 365
    const/4 v11, 0x1

    .line 367
    .local v11, "notFinish":Z
    :goto_2
    if-eqz v11, :cond_2

    iget-boolean v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->stopped:Z

    if-eqz v0, :cond_8

    .line 405
    :cond_2
    iget-boolean v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->stopped:Z

    if-eqz v0, :cond_3

    .line 406
    const/4 v9, 0x0

    :goto_3
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    array-length v0, v0

    if-lt v9, v0, :cond_e

    .line 413
    :cond_3
    if-nez v11, :cond_4

    .line 415
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->mLogDao:Lcom/boyaa/downloader/dao/DownloadLogDao;

    iget-object v1, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/boyaa/downloader/dao/DownloadLogDao;->delete(Ljava/lang/String;)V

    .line 418
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->mFinishListener:Lcom/boyaa/downloader/network/DownloadFinishListener;

    if-eqz v0, :cond_4

    .line 419
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->mFinishListener:Lcom/boyaa/downloader/network/DownloadFinishListener;

    iget-object v1, p0, Lcom/boyaa/downloader/network/FileDownloader;->saveFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/boyaa/downloader/network/DownloadFinishListener;->onDownloadFinshed(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 426
    :cond_4
    iput-boolean v14, p0, Lcom/boyaa/downloader/network/FileDownloader;->isDownloading:Z

    .line 428
    iget v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadSize:I

    return v0

    .line 345
    .end local v11    # "notFinish":Z
    :cond_5
    :try_start_1
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->data:Ljava/util/Map;

    add-int/lit8 v1, v9, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 350
    :cond_6
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->data:Ljava/util/Map;

    add-int/lit8 v1, v9, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 352
    .local v7, "downLength":I
    iget v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->block:I

    if-ge v7, v0, :cond_7

    .line 353
    iget v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadSize:I

    iget v1, p0, Lcom/boyaa/downloader/network/FileDownloader;->fileSize:I

    if-ge v0, v1, :cond_7

    .line 354
    iget-object v13, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    new-instance v0, Lcom/boyaa/downloader/network/DownloadThread;

    .line 355
    iget-object v3, p0, Lcom/boyaa/downloader/network/FileDownloader;->saveFile:Ljava/io/File;

    iget v4, p0, Lcom/boyaa/downloader/network/FileDownloader;->block:I

    iget-object v1, p0, Lcom/boyaa/downloader/network/FileDownloader;->data:Ljava/util/Map;

    add-int/lit8 v5, v9, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 356
    add-int/lit8 v6, v9, 0x1

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/boyaa/downloader/network/DownloadThread;-><init>(Lcom/boyaa/downloader/network/FileDownloader;Ljava/net/URL;Ljava/io/File;III)V

    .line 354
    aput-object v0, v13, v9

    .line 358
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    aget-object v0, v0, v9

    invoke-virtual {v0}, Lcom/boyaa/downloader/network/DownloadThread;->start()V

    .line 349
    :goto_4
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_1

    .line 360
    :cond_7
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    const/4 v1, 0x0

    aput-object v1, v0, v9
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_4

    .line 422
    .end local v2    # "url":Ljava/net/URL;
    .end local v7    # "downLength":I
    .end local v9    # "i":I
    .end local v12    # "randOut":Ljava/io/RandomAccessFile;
    :catch_0
    move-exception v8

    .line 423
    .local v8, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    .line 424
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "file download fail!!"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 425
    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    .line 426
    iput-boolean v14, p0, Lcom/boyaa/downloader/network/FileDownloader;->isDownloading:Z

    .line 427
    throw v0

    .line 369
    .restart local v2    # "url":Ljava/net/URL;
    .restart local v9    # "i":I
    .restart local v11    # "notFinish":Z
    .restart local v12    # "randOut":Ljava/io/RandomAccessFile;
    :cond_8
    const/4 v11, 0x0

    .line 371
    const/4 v9, 0x0

    :goto_5
    :try_start_3
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    array-length v0, v0

    if-lt v9, v0, :cond_a

    .line 395
    invoke-direct {p0}, Lcom/boyaa/downloader/network/FileDownloader;->update()V

    .line 397
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->mListener:Lcom/boyaa/downloader/network/DownloadProgressListener;

    if-eqz v0, :cond_9

    .line 398
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->mListener:Lcom/boyaa/downloader/network/DownloadProgressListener;

    iget v1, p0, Lcom/boyaa/downloader/network/FileDownloader;->downloadSize:I

    invoke-interface {v0, v1}, Lcom/boyaa/downloader/network/DownloadProgressListener;->onDownloadSize(I)V

    .line 401
    :cond_9
    const-wide/16 v0, 0x7d0

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_2

    .line 372
    :cond_a
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    aget-object v0, v0, v9

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    aget-object v0, v0, v9

    invoke-virtual {v0}, Lcom/boyaa/downloader/network/DownloadThread;->isFinish()Z

    move-result v0

    if-nez v0, :cond_d

    .line 373
    const/4 v11, 0x1

    .line 383
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    aget-object v0, v0, v9

    invoke-virtual {v0}, Lcom/boyaa/downloader/network/DownloadThread;->getDownLength()J

    move-result-wide v0

    const-wide/16 v3, -0x1

    cmp-long v0, v0, v3

    if-nez v0, :cond_d

    .line 384
    const/4 v10, 0x0

    .local v10, "j":I
    :goto_6
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    array-length v0, v0

    if-lt v10, v0, :cond_b

    .line 389
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "download exception"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 385
    :cond_b
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    aget-object v0, v0, v10

    if-eqz v0, :cond_c

    .line 386
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    aget-object v0, v0, v10

    invoke-virtual {v0}, Lcom/boyaa/downloader/network/DownloadThread;->stopDownload()V

    .line 384
    :cond_c
    add-int/lit8 v10, v10, 0x1

    goto :goto_6

    .line 371
    .end local v10    # "j":I
    :cond_d
    add-int/lit8 v9, v9, 0x1

    goto :goto_5

    .line 407
    :cond_e
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    aget-object v0, v0, v9

    if-eqz v0, :cond_f

    .line 408
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->threads:[Lcom/boyaa/downloader/network/DownloadThread;

    aget-object v0, v0, v9

    invoke-virtual {v0}, Lcom/boyaa/downloader/network/DownloadThread;->stopDownload()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 406
    :cond_f
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_3
.end method

.method protected update(II)V
    .locals 3
    .param p1, "threadId"    # I
    .param p2, "pos"    # I

    .prologue
    .line 170
    iget-object v0, p0, Lcom/boyaa/downloader/network/FileDownloader;->data:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    return-void
.end method
