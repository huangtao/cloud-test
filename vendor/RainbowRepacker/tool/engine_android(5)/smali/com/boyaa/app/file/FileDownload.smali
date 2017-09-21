.class public Lcom/boyaa/app/file/FileDownload;
.super Ljava/lang/Object;
.source "FileDownload.java"


# static fields
.field public static final TAG_LOG:Ljava/lang/String; = "FileDownload"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method


# virtual methods
.method public doDownload(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "loadData"    # Ljava/lang/String;
    .param p2, "callLuaEvent"    # Ljava/lang/String;

    .prologue
    .line 27
    const/4 v1, 0x0

    .line 30
    .local v1, "jsonResult":Lorg/json/JSONObject;
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .end local v1    # "jsonResult":Lorg/json/JSONObject;
    .local v2, "jsonResult":Lorg/json/JSONObject;
    :try_start_1
    const-string v5, "loadUrl"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 32
    .local v3, "loadUrl":Ljava/lang/String;
    const-string v5, "savePath"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 33
    .local v4, "savePath":Ljava/lang/String;
    const-string v5, "FileDownload"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "loadUrl:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    const-string v5, "FileDownload"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "savaPath:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    const/16 v5, 0x2710

    invoke-virtual {p0, v3, v4, v5, p2}, Lcom/boyaa/app/file/FileDownload;->onDoDownload(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v1, v2

    .line 40
    .end local v2    # "jsonResult":Lorg/json/JSONObject;
    .end local v3    # "loadUrl":Ljava/lang/String;
    .end local v4    # "savePath":Ljava/lang/String;
    .restart local v1    # "jsonResult":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 36
    :catch_0
    move-exception v0

    .line 37
    .local v0, "e":Lorg/json/JSONException;
    :goto_1
    const-string v5, "FileDownload"

    invoke-virtual {v0}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 36
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

.method public httpDownload(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 13
    .param p1, "httpUrl"    # Ljava/lang/String;
    .param p2, "saveFile"    # Ljava/lang/String;

    .prologue
    .line 75
    const/4 v2, 0x0

    .line 76
    .local v2, "bytesum":I
    const/4 v1, 0x0

    .line 78
    .local v1, "byteread":I
    const/4 v8, 0x0

    .line 80
    .local v8, "url":Ljava/net/URL;
    :try_start_0
    new-instance v9, Ljava/net/URL;

    invoke-direct {v9, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .end local v8    # "url":Ljava/net/URL;
    .local v9, "url":Ljava/net/URL;
    :try_start_1
    invoke-virtual {v9}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v3

    .line 88
    .local v3, "conn":Ljava/net/URLConnection;
    invoke-virtual {v3}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    .line 89
    .local v7, "inStream":Ljava/io/InputStream;
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 91
    .local v6, "fs":Ljava/io/FileOutputStream;
    const/16 v10, 0x4b4

    new-array v0, v10, [B

    .line 92
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {v7, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v10, -0x1

    if-ne v1, v10, :cond_0

    .line 97
    const-string v10, "getVersion"

    const-string v11, "getVersion xml  \u4e0b\u8f7d\u6210\u529f"

    invoke-static {v10, v11}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 98
    const/4 v10, 0x1

    move-object v8, v9

    .line 104
    .end local v0    # "buffer":[B
    .end local v3    # "conn":Ljava/net/URLConnection;
    .end local v6    # "fs":Ljava/io/FileOutputStream;
    .end local v7    # "inStream":Ljava/io/InputStream;
    .end local v9    # "url":Ljava/net/URL;
    .restart local v8    # "url":Ljava/net/URL;
    :goto_1
    return v10

    .line 81
    :catch_0
    move-exception v5

    .line 83
    .local v5, "e1":Ljava/net/MalformedURLException;
    invoke-virtual {v5}, Ljava/net/MalformedURLException;->printStackTrace()V

    .line 84
    const/4 v10, 0x0

    goto :goto_1

    .line 93
    .end local v5    # "e1":Ljava/net/MalformedURLException;
    .end local v8    # "url":Ljava/net/URL;
    .restart local v0    # "buffer":[B
    .restart local v3    # "conn":Ljava/net/URLConnection;
    .restart local v6    # "fs":Ljava/io/FileOutputStream;
    .restart local v7    # "inStream":Ljava/io/InputStream;
    .restart local v9    # "url":Ljava/net/URL;
    :cond_0
    add-int/2addr v2, v1

    .line 95
    const/4 v10, 0x0

    :try_start_2
    invoke-virtual {v6, v0, v10, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 99
    .end local v0    # "buffer":[B
    .end local v3    # "conn":Ljava/net/URLConnection;
    .end local v6    # "fs":Ljava/io/FileOutputStream;
    .end local v7    # "inStream":Ljava/io/InputStream;
    :catch_1
    move-exception v4

    .line 100
    .local v4, "e":Ljava/io/FileNotFoundException;
    const-string v10, "getVersion"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "getVersion:"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    const/4 v10, 0x0

    move-object v8, v9

    .end local v9    # "url":Ljava/net/URL;
    .restart local v8    # "url":Ljava/net/URL;
    goto :goto_1

    .line 102
    .end local v4    # "e":Ljava/io/FileNotFoundException;
    .end local v8    # "url":Ljava/net/URL;
    .restart local v9    # "url":Ljava/net/URL;
    :catch_2
    move-exception v4

    .line 103
    .local v4, "e":Ljava/io/IOException;
    const-string v10, "getVersion"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "getVersion:"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    const/4 v10, 0x0

    move-object v8, v9

    .end local v9    # "url":Ljava/net/URL;
    .restart local v8    # "url":Ljava/net/URL;
    goto :goto_1
.end method

.method public onDoDownload(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 4
    .param p1, "loadUrl"    # Ljava/lang/String;
    .param p2, "savePath"    # Ljava/lang/String;
    .param p3, "timeout"    # I
    .param p4, "callLuaEvent"    # Ljava/lang/String;

    .prologue
    .line 44
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-string v1, ""

    const/4 v2, 0x0

    new-instance v3, Lcom/boyaa/app/file/FileDownload$1;

    invoke-direct {v3, p0, p1, p2, p4}, Lcom/boyaa/app/file/FileDownload$1;-><init>(Lcom/boyaa/app/file/FileDownload;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v1, v2, v3}, Lcom/boyaa/app/common/ThreadTask;->start(Landroid/app/Activity;Ljava/lang/String;ZLcom/boyaa/app/common/OnThreadTask;)V

    .line 69
    return-void
.end method
