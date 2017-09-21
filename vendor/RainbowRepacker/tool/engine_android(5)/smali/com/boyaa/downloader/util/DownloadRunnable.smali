.class public Lcom/boyaa/downloader/util/DownloadRunnable;
.super Ljava/lang/Object;
.source "DownloadRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/downloader/util/DownloadRunnable$IDownloadResponse;
    }
.end annotation


# static fields
.field private static isCanceled:Z


# instance fields
.field private mResponseListener:Lcom/boyaa/downloader/util/DownloadRunnable$IDownloadResponse;

.field private saveFilePath:Ljava/lang/String;

.field private timeout:I

.field private timerPeriod:I

.field private url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x0

    sput-boolean v0, Lcom/boyaa/downloader/util/DownloadRunnable;->isCanceled:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IILcom/boyaa/downloader/util/DownloadRunnable$IDownloadResponse;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "saveFilePath"    # Ljava/lang/String;
    .param p3, "timeout"    # I
    .param p4, "timerPeriod"    # I
    .param p5, "mResponseListener"    # Lcom/boyaa/downloader/util/DownloadRunnable$IDownloadResponse;

    .prologue
    const/4 v0, 0x0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object v0, p0, Lcom/boyaa/downloader/util/DownloadRunnable;->url:Ljava/lang/String;

    .line 27
    iput-object v0, p0, Lcom/boyaa/downloader/util/DownloadRunnable;->saveFilePath:Ljava/lang/String;

    .line 29
    const/16 v0, 0x2710

    iput v0, p0, Lcom/boyaa/downloader/util/DownloadRunnable;->timeout:I

    .line 30
    const/16 v0, 0xc8

    iput v0, p0, Lcom/boyaa/downloader/util/DownloadRunnable;->timerPeriod:I

    .line 35
    iput-object p1, p0, Lcom/boyaa/downloader/util/DownloadRunnable;->url:Ljava/lang/String;

    .line 36
    iput-object p2, p0, Lcom/boyaa/downloader/util/DownloadRunnable;->saveFilePath:Ljava/lang/String;

    .line 37
    iput p3, p0, Lcom/boyaa/downloader/util/DownloadRunnable;->timeout:I

    .line 38
    iput p4, p0, Lcom/boyaa/downloader/util/DownloadRunnable;->timerPeriod:I

    .line 39
    iput-object p5, p0, Lcom/boyaa/downloader/util/DownloadRunnable;->mResponseListener:Lcom/boyaa/downloader/util/DownloadRunnable$IDownloadResponse;

    .line 40
    return-void
.end method

.method private getDownloadedFileSize(Ljava/lang/String;)J
    .locals 4
    .param p1, "saveFilePath"    # Ljava/lang/String;

    .prologue
    .line 172
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 173
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 175
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 177
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 180
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 190
    .end local v1    # "file":Ljava/io/File;
    :goto_0
    const-wide/16 v2, 0x0

    :goto_1
    return-wide v2

    .line 184
    .restart local v1    # "file":Ljava/io/File;
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->length()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    goto :goto_1

    .line 186
    .end local v1    # "file":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 188
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private getServerFileLength(ILjava/net/HttpURLConnection;)I
    .locals 5
    .param p1, "code"    # I
    .param p2, "mConnection"    # Ljava/net/HttpURLConnection;

    .prologue
    .line 199
    const/16 v3, 0xc8

    if-ne p1, v3, :cond_0

    .line 201
    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v3

    .line 219
    :goto_0
    return v3

    .line 203
    :cond_0
    const/16 v3, 0xce

    if-ne p1, v3, :cond_1

    .line 205
    const-string v3, "Content-Range"

    invoke-virtual {p2, v3}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, "Content_Range":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 208
    const-string v3, "/"

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 209
    .local v2, "receInfo":[Ljava/lang/String;
    array-length v3, v2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 212
    const/4 v3, 0x1

    :try_start_0
    aget-object v3, v2, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    goto :goto_0

    .line 213
    :catch_0
    move-exception v1

    .line 214
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 219
    .end local v0    # "Content_Range":Ljava/lang/String;
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "receInfo":[Ljava/lang/String;
    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static setCancel(Z)V
    .locals 0
    .param p0, "isCanceled"    # Z

    .prologue
    .line 51
    sput-boolean p0, Lcom/boyaa/downloader/util/DownloadRunnable;->isCanceled:Z

    .line 52
    return-void
.end method


# virtual methods
.method public download(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/downloader/util/DownloadRunnable$IDownloadResponse;)V
    .locals 26
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "saveFilePath"    # Ljava/lang/String;
    .param p3, "mResponseListener"    # Lcom/boyaa/downloader/util/DownloadRunnable$IDownloadResponse;

    .prologue
    .line 56
    const/4 v6, 0x0

    .line 57
    .local v6, "mConnection":Ljava/net/HttpURLConnection;
    const/4 v7, 0x0

    .line 58
    .local v7, "mInputStream":Ljava/io/InputStream;
    const/4 v14, 0x0

    .line 60
    .local v14, "raf":Ljava/io/RandomAccessFile;
    :try_start_0
    const-string v22, "DownloadRunnable"

    new-instance v23, Ljava/lang/StringBuilder;

    const-string v24, "url:"

    invoke-direct/range {v23 .. v24}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    new-instance v8, Ljava/net/URL;

    move-object/from16 v0, p1

    invoke-direct {v8, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 62
    .local v8, "mURL":Ljava/net/URL;
    invoke-virtual {v8}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v22

    move-object/from16 v0, v22

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v6, v0

    .line 63
    move-object/from16 v0, p0

    iget v0, v0, Lcom/boyaa/downloader/util/DownloadRunnable;->timeout:I

    move/from16 v22, v0

    move/from16 v0, v22

    invoke-virtual {v6, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 64
    const/16 v22, 0x2710

    move/from16 v0, v22

    invoke-virtual {v6, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 65
    const/16 v22, 0x1

    move/from16 v0, v22

    invoke-virtual {v6, v0}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 66
    const-string v22, "GET"

    move-object/from16 v0, v22

    invoke-virtual {v6, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 67
    const-string v22, "Accept"

    const-string v23, "*/*"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v6, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    const-string v22, "Connection"

    const-string v23, "Keep-Alive"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v6, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    const-string v22, "Accept-Encoding"

    const-string v23, "identity"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v6, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/boyaa/downloader/util/DownloadRunnable;->getDownloadedFileSize(Ljava/lang/String;)J

    move-result-wide v18

    .line 73
    .local v18, "startPos":J
    const-wide/16 v22, 0x0

    cmp-long v22, v18, v22

    if-lez v22, :cond_0

    .line 75
    const-string v22, "Range"

    new-instance v23, Ljava/lang/StringBuilder;

    const-string v24, "bytes="

    invoke-direct/range {v23 .. v24}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v23

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "-"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v6, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    :cond_0
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->connect()V

    .line 80
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v17

    .line 81
    .local v17, "responseCode":I
    const-string v22, "DownloadRunnable"

    new-instance v23, Ljava/lang/StringBuilder;

    const-string v24, "code:"

    invoke-direct/range {v23 .. v24}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v23

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    const/16 v22, 0xc8

    move/from16 v0, v17

    move/from16 v1, v22

    if-eq v0, v1, :cond_1

    const/16 v22, 0xce

    move/from16 v0, v17

    move/from16 v1, v22

    if-ne v0, v1, :cond_f

    .line 84
    :cond_1
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1, v6}, Lcom/boyaa/downloader/util/DownloadRunnable;->getServerFileLength(ILjava/net/HttpURLConnection;)I

    move-result v5

    .line 85
    .local v5, "fileLength":I
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    .line 86
    new-instance v15, Ljava/io/RandomAccessFile;

    const-string v22, "rw"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-direct {v15, v0, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_b
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    .end local v14    # "raf":Ljava/io/RandomAccessFile;
    .local v15, "raf":Ljava/io/RandomAccessFile;
    :try_start_1
    move-wide/from16 v0, v18

    invoke-virtual {v15, v0, v1}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 88
    const/16 v22, 0x2000

    move/from16 v0, v22

    new-array v3, v0, [B

    .line 89
    .local v3, "buffer":[B
    move-wide/from16 v20, v18

    .line 91
    .local v20, "totalLength":J
    const/4 v13, 0x0

    .line 92
    .local v13, "precent":I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    .line 94
    .local v11, "oldtime":J
    :cond_2
    :goto_0
    sget-boolean v22, Lcom/boyaa/downloader/util/DownloadRunnable;->isCanceled:Z

    if-nez v22, :cond_3

    invoke-virtual {v7, v3}, Ljava/io/InputStream;->read([B)I

    move-result v16

    .local v16, "readLength":I
    if-gtz v16, :cond_8

    .line 110
    .end local v16    # "readLength":I
    :cond_3
    if-eqz p3, :cond_15

    .line 113
    sget-boolean v22, Lcom/boyaa/downloader/util/DownloadRunnable;->isCanceled:Z

    if-eqz v22, :cond_d

    const/16 v22, 0x2

    .line 112
    :goto_1
    move-object/from16 v0, p3

    move-object/from16 v1, p1

    move/from16 v2, v22

    invoke-interface {v0, v1, v2}, Lcom/boyaa/downloader/util/DownloadRunnable$IDownloadResponse;->onDownloadResult(Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 132
    if-eqz v15, :cond_4

    .line 135
    :try_start_2
    invoke-virtual {v15}, Ljava/io/RandomAccessFile;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 141
    :cond_4
    :goto_2
    if-eqz v7, :cond_5

    .line 144
    :try_start_3
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 148
    :goto_3
    const/4 v7, 0x0

    .line 151
    :cond_5
    if-eqz v6, :cond_6

    .line 153
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 154
    const/4 v6, 0x0

    :cond_6
    move-object v14, v15

    .line 162
    .end local v3    # "buffer":[B
    .end local v5    # "fileLength":I
    .end local v8    # "mURL":Ljava/net/URL;
    .end local v11    # "oldtime":J
    .end local v13    # "precent":I
    .end local v15    # "raf":Ljava/io/RandomAccessFile;
    .end local v17    # "responseCode":I
    .end local v18    # "startPos":J
    .end local v20    # "totalLength":J
    .restart local v14    # "raf":Ljava/io/RandomAccessFile;
    :cond_7
    :goto_4
    return-void

    .line 96
    .end local v14    # "raf":Ljava/io/RandomAccessFile;
    .restart local v3    # "buffer":[B
    .restart local v5    # "fileLength":I
    .restart local v8    # "mURL":Ljava/net/URL;
    .restart local v11    # "oldtime":J
    .restart local v13    # "precent":I
    .restart local v15    # "raf":Ljava/io/RandomAccessFile;
    .restart local v16    # "readLength":I
    .restart local v17    # "responseCode":I
    .restart local v18    # "startPos":J
    .restart local v20    # "totalLength":J
    :cond_8
    const/16 v22, 0x0

    :try_start_4
    move/from16 v0, v22

    move/from16 v1, v16

    invoke-virtual {v15, v3, v0, v1}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 97
    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v22, v0

    add-long v20, v20, v22

    .line 99
    const-wide/16 v22, 0x64

    mul-long v22, v22, v20

    int-to-long v0, v5

    move-wide/from16 v24, v0

    div-long v22, v22, v24

    move-wide/from16 v0, v22

    long-to-int v13, v0

    .line 100
    const-string v22, "DownloadRunnable"

    new-instance v23, Ljava/lang/StringBuilder;

    const-string v24, "precent:"

    invoke-direct/range {v23 .. v24}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v23

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Lcom/boyaa/app/debug/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    .line 103
    .local v9, "newtime":J
    if-eqz p3, :cond_2

    const/16 v22, 0x64

    move/from16 v0, v22

    if-eq v13, v0, :cond_9

    sub-long v22, v9, v11

    move-object/from16 v0, p0

    iget v0, v0, Lcom/boyaa/downloader/util/DownloadRunnable;->timerPeriod:I

    move/from16 v24, v0

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    cmp-long v22, v22, v24

    if-lez v22, :cond_2

    .line 105
    :cond_9
    move-wide v11, v9

    .line 106
    move-object/from16 v0, p3

    move-object/from16 v1, p1

    invoke-interface {v0, v1, v13}, Lcom/boyaa/downloader/util/DownloadRunnable$IDownloadResponse;->onDownloadProgress(Ljava/lang/String;I)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto/16 :goto_0

    .line 128
    .end local v3    # "buffer":[B
    .end local v9    # "newtime":J
    .end local v11    # "oldtime":J
    .end local v13    # "precent":I
    .end local v16    # "readLength":I
    .end local v20    # "totalLength":J
    :catch_0
    move-exception v4

    move-object v14, v15

    .line 129
    .end local v5    # "fileLength":I
    .end local v8    # "mURL":Ljava/net/URL;
    .end local v15    # "raf":Ljava/io/RandomAccessFile;
    .end local v17    # "responseCode":I
    .end local v18    # "startPos":J
    .local v4, "e":Ljava/lang/Exception;
    .restart local v14    # "raf":Ljava/io/RandomAccessFile;
    :goto_5
    :try_start_5
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 132
    if-eqz v14, :cond_a

    .line 135
    :try_start_6
    invoke-virtual {v14}, Ljava/io/RandomAccessFile;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5

    .line 141
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_a
    :goto_6
    if-eqz v7, :cond_b

    .line 144
    :try_start_7
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6

    .line 148
    :goto_7
    const/4 v7, 0x0

    .line 151
    :cond_b
    if-eqz v6, :cond_c

    .line 153
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 154
    const/4 v6, 0x0

    .line 158
    :cond_c
    :goto_8
    if-eqz p3, :cond_7

    .line 160
    const/16 v22, 0x3

    move-object/from16 v0, p3

    move-object/from16 v1, p1

    move/from16 v2, v22

    invoke-interface {v0, v1, v2}, Lcom/boyaa/downloader/util/DownloadRunnable$IDownloadResponse;->onDownloadResult(Ljava/lang/String;I)V

    goto :goto_4

    .line 114
    .end local v14    # "raf":Ljava/io/RandomAccessFile;
    .restart local v3    # "buffer":[B
    .restart local v5    # "fileLength":I
    .restart local v8    # "mURL":Ljava/net/URL;
    .restart local v11    # "oldtime":J
    .restart local v13    # "precent":I
    .restart local v15    # "raf":Ljava/io/RandomAccessFile;
    .restart local v17    # "responseCode":I
    .restart local v18    # "startPos":J
    .restart local v20    # "totalLength":J
    :cond_d
    const/16 v22, 0x64

    move/from16 v0, v22

    if-ne v13, v0, :cond_e

    const/16 v22, 0x1

    goto/16 :goto_1

    :cond_e
    const/16 v22, 0x3

    goto/16 :goto_1

    .line 136
    :catch_1
    move-exception v4

    .line 137
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 145
    .end local v4    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v4

    .line 146
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_3

    .line 118
    .end local v3    # "buffer":[B
    .end local v4    # "e":Ljava/io/IOException;
    .end local v5    # "fileLength":I
    .end local v11    # "oldtime":J
    .end local v13    # "precent":I
    .end local v15    # "raf":Ljava/io/RandomAccessFile;
    .end local v20    # "totalLength":J
    .restart local v14    # "raf":Ljava/io/RandomAccessFile;
    :cond_f
    const/16 v22, 0x1a0

    move/from16 v0, v17

    move/from16 v1, v22

    if-ne v0, v1, :cond_16

    .line 120
    if-eqz p3, :cond_16

    .line 122
    const/16 v22, 0x64

    :try_start_8
    move-object/from16 v0, p3

    move-object/from16 v1, p1

    move/from16 v2, v22

    invoke-interface {v0, v1, v2}, Lcom/boyaa/downloader/util/DownloadRunnable$IDownloadResponse;->onDownloadProgress(Ljava/lang/String;I)V

    .line 123
    const/16 v22, 0x1

    move-object/from16 v0, p3

    move-object/from16 v1, p1

    move/from16 v2, v22

    invoke-interface {v0, v1, v2}, Lcom/boyaa/downloader/util/DownloadRunnable$IDownloadResponse;->onDownloadResult(Ljava/lang/String;I)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_b
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 132
    if-eqz v14, :cond_10

    .line 135
    :try_start_9
    invoke-virtual {v14}, Ljava/io/RandomAccessFile;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    .line 141
    :cond_10
    :goto_9
    if-eqz v7, :cond_11

    .line 144
    :try_start_a
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_4

    .line 148
    :goto_a
    const/4 v7, 0x0

    .line 151
    :cond_11
    if-eqz v6, :cond_7

    .line 153
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 154
    const/4 v6, 0x0

    goto/16 :goto_4

    .line 136
    :catch_3
    move-exception v4

    .line 137
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_9

    .line 145
    .end local v4    # "e":Ljava/io/IOException;
    :catch_4
    move-exception v4

    .line 146
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_a

    .line 136
    .end local v8    # "mURL":Ljava/net/URL;
    .end local v17    # "responseCode":I
    .end local v18    # "startPos":J
    .local v4, "e":Ljava/lang/Exception;
    :catch_5
    move-exception v4

    .line 137
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_6

    .line 145
    .end local v4    # "e":Ljava/io/IOException;
    :catch_6
    move-exception v4

    .line 146
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_7

    .line 130
    .end local v4    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v22

    .line 132
    :goto_b
    if-eqz v14, :cond_12

    .line 135
    :try_start_b
    invoke-virtual {v14}, Ljava/io/RandomAccessFile;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_7

    .line 141
    :cond_12
    :goto_c
    if-eqz v7, :cond_13

    .line 144
    :try_start_c
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_8

    .line 148
    :goto_d
    const/4 v7, 0x0

    .line 151
    :cond_13
    if-eqz v6, :cond_14

    .line 153
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 154
    const/4 v6, 0x0

    .line 156
    :cond_14
    throw v22

    .line 136
    :catch_7
    move-exception v4

    .line 137
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_c

    .line 145
    .end local v4    # "e":Ljava/io/IOException;
    :catch_8
    move-exception v4

    .line 146
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_d

    .end local v4    # "e":Ljava/io/IOException;
    .end local v14    # "raf":Ljava/io/RandomAccessFile;
    .restart local v3    # "buffer":[B
    .restart local v5    # "fileLength":I
    .restart local v8    # "mURL":Ljava/net/URL;
    .restart local v11    # "oldtime":J
    .restart local v13    # "precent":I
    .restart local v15    # "raf":Ljava/io/RandomAccessFile;
    .restart local v17    # "responseCode":I
    .restart local v18    # "startPos":J
    .restart local v20    # "totalLength":J
    :cond_15
    move-object v14, v15

    .line 132
    .end local v3    # "buffer":[B
    .end local v5    # "fileLength":I
    .end local v11    # "oldtime":J
    .end local v13    # "precent":I
    .end local v15    # "raf":Ljava/io/RandomAccessFile;
    .end local v20    # "totalLength":J
    .restart local v14    # "raf":Ljava/io/RandomAccessFile;
    :cond_16
    if-eqz v14, :cond_17

    .line 135
    :try_start_d
    invoke-virtual {v14}, Ljava/io/RandomAccessFile;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_9

    .line 141
    :cond_17
    :goto_e
    if-eqz v7, :cond_18

    .line 144
    :try_start_e
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_a

    .line 148
    :goto_f
    const/4 v7, 0x0

    .line 151
    :cond_18
    if-eqz v6, :cond_c

    .line 153
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 154
    const/4 v6, 0x0

    goto/16 :goto_8

    .line 136
    :catch_9
    move-exception v4

    .line 137
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_e

    .line 145
    .end local v4    # "e":Ljava/io/IOException;
    :catch_a
    move-exception v4

    .line 146
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_f

    .line 130
    .end local v4    # "e":Ljava/io/IOException;
    .end local v14    # "raf":Ljava/io/RandomAccessFile;
    .restart local v5    # "fileLength":I
    .restart local v15    # "raf":Ljava/io/RandomAccessFile;
    :catchall_1
    move-exception v22

    move-object v14, v15

    .end local v15    # "raf":Ljava/io/RandomAccessFile;
    .restart local v14    # "raf":Ljava/io/RandomAccessFile;
    goto :goto_b

    .line 128
    .end local v5    # "fileLength":I
    .end local v8    # "mURL":Ljava/net/URL;
    .end local v17    # "responseCode":I
    .end local v18    # "startPos":J
    :catch_b
    move-exception v4

    goto/16 :goto_5
.end method

.method public run()V
    .locals 3

    .prologue
    .line 45
    iget-object v0, p0, Lcom/boyaa/downloader/util/DownloadRunnable;->url:Ljava/lang/String;

    iget-object v1, p0, Lcom/boyaa/downloader/util/DownloadRunnable;->saveFilePath:Ljava/lang/String;

    iget-object v2, p0, Lcom/boyaa/downloader/util/DownloadRunnable;->mResponseListener:Lcom/boyaa/downloader/util/DownloadRunnable$IDownloadResponse;

    invoke-virtual {p0, v0, v1, v2}, Lcom/boyaa/downloader/util/DownloadRunnable;->download(Ljava/lang/String;Ljava/lang/String;Lcom/boyaa/downloader/util/DownloadRunnable$IDownloadResponse;)V

    .line 47
    return-void
.end method
