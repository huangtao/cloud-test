.class public Lcom/boyaa/app/file/FileUnZip;
.super Ljava/lang/Object;
.source "FileUnZip.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    return-void
.end method


# virtual methods
.method public doDownLoad(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 4
    .param p1, "httpUrl"    # Ljava/lang/String;
    .param p2, "savePath"    # Ljava/lang/String;
    .param p3, "timeout"    # I

    .prologue
    .line 25
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-string v1, ""

    const/4 v2, 0x0

    new-instance v3, Lcom/boyaa/app/file/FileUnZip$1;

    invoke-direct {v3, p0, p1, p2}, Lcom/boyaa/app/file/FileUnZip$1;-><init>(Lcom/boyaa/app/file/FileUnZip;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v1, v2, v3}, Lcom/boyaa/app/common/ThreadTask;->start(Landroid/app/Activity;Ljava/lang/String;ZLcom/boyaa/app/common/OnThreadTask;)V

    .line 52
    return-void
.end method

.method public httpDownload(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 13
    .param p1, "httpUrl"    # Ljava/lang/String;
    .param p2, "saveFile"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 56
    const-string v11, "getUpdate"

    const-string v12, "getUpdate zip  \u5f00\u59cb\u4e0b\u8f7d ......"

    invoke-static {v11, v12}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    const/4 v2, 0x0

    .line 59
    .local v2, "bytesum":I
    const/4 v1, 0x0

    .line 61
    .local v1, "byteread":I
    const/4 v8, 0x0

    .line 63
    .local v8, "url":Ljava/net/URL;
    :try_start_0
    new-instance v9, Ljava/net/URL;

    invoke-direct {v9, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .end local v8    # "url":Ljava/net/URL;
    .local v9, "url":Ljava/net/URL;
    :try_start_1
    invoke-virtual {v9}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v3

    .line 71
    .local v3, "conn":Ljava/net/URLConnection;
    invoke-virtual {v3}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    .line 72
    .local v7, "inStream":Ljava/io/InputStream;
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 74
    .local v6, "fs":Ljava/io/FileOutputStream;
    const/16 v11, 0x4b4

    new-array v0, v11, [B

    .line 75
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {v7, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v11, -0x1

    if-ne v1, v11, :cond_0

    .line 80
    const-string v11, "getUpdate"

    const-string v12, "getUpdate zip  \u4e0b\u8f7d\u6210\u529f"

    invoke-static {v11, v12}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 81
    const/4 v10, 0x1

    move-object v8, v9

    .line 87
    .end local v0    # "buffer":[B
    .end local v3    # "conn":Ljava/net/URLConnection;
    .end local v6    # "fs":Ljava/io/FileOutputStream;
    .end local v7    # "inStream":Ljava/io/InputStream;
    .end local v9    # "url":Ljava/net/URL;
    .restart local v8    # "url":Ljava/net/URL;
    :goto_1
    return v10

    .line 64
    :catch_0
    move-exception v5

    .line 66
    .local v5, "e1":Ljava/net/MalformedURLException;
    invoke-virtual {v5}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_1

    .line 76
    .end local v5    # "e1":Ljava/net/MalformedURLException;
    .end local v8    # "url":Ljava/net/URL;
    .restart local v0    # "buffer":[B
    .restart local v3    # "conn":Ljava/net/URLConnection;
    .restart local v6    # "fs":Ljava/io/FileOutputStream;
    .restart local v7    # "inStream":Ljava/io/InputStream;
    .restart local v9    # "url":Ljava/net/URL;
    :cond_0
    add-int/2addr v2, v1

    .line 77
    :try_start_2
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v11, v2}, Ljava/io/PrintStream;->println(I)V

    .line 78
    const/4 v11, 0x0

    invoke-virtual {v6, v0, v11, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 82
    .end local v0    # "buffer":[B
    .end local v3    # "conn":Ljava/net/URLConnection;
    .end local v6    # "fs":Ljava/io/FileOutputStream;
    .end local v7    # "inStream":Ljava/io/InputStream;
    :catch_1
    move-exception v4

    .line 83
    .local v4, "e":Ljava/io/FileNotFoundException;
    const-string v11, "getUpdate"

    const-string v12, "getUpdate zip  \u4e0b\u8f7d \u5931\u8d25 \u6587\u4ef6\u4e0d\u80fd\u627e\u5230"

    invoke-static {v11, v12}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    move-object v8, v9

    .line 84
    .end local v9    # "url":Ljava/net/URL;
    .restart local v8    # "url":Ljava/net/URL;
    goto :goto_1

    .line 85
    .end local v4    # "e":Ljava/io/FileNotFoundException;
    .end local v8    # "url":Ljava/net/URL;
    .restart local v9    # "url":Ljava/net/URL;
    :catch_2
    move-exception v4

    .line 86
    .local v4, "e":Ljava/io/IOException;
    const-string v11, "getUpdate"

    const-string v12, "getUpdate zip  \u4e0b\u8f7d \u5931\u8d25 \u8def\u5f84\u5f02\u5e38"

    invoke-static {v11, v12}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    move-object v8, v9

    .line 87
    .end local v9    # "url":Ljava/net/URL;
    .restart local v8    # "url":Ljava/net/URL;
    goto :goto_1
.end method
