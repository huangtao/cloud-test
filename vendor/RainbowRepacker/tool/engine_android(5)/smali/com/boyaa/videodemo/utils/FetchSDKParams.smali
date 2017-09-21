.class public Lcom/boyaa/videodemo/utils/FetchSDKParams;
.super Ljava/lang/Object;
.source "FetchSDKParams.java"


# static fields
.field public static paramsValue:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field urlPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/FetchSDKParams;->urlPath:Ljava/lang/String;

    .line 22
    return-void
.end method

.method public static getRequest(III)Ljava/lang/String;
    .locals 13
    .param p0, "tidValue"    # I
    .param p1, "appid"    # I
    .param p2, "uid"    # I

    .prologue
    .line 38
    const/4 v1, 0x0

    .line 39
    .local v1, "content":Ljava/lang/String;
    const-string v7, ""

    .line 40
    .local v7, "result":Ljava/lang/String;
    invoke-static {p0, p1, p2}, Lcom/boyaa/videodemo/utils/FetchSDKParams;->initData(III)V

    .line 43
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .local v0, "buf":Ljava/lang/StringBuilder;
    sget-object v9, Lcom/boyaa/videodemo/utils/FetchSDKParams;->paramsValue:Ljava/util/Map;

    if-eqz v9, :cond_0

    sget-object v9, Lcom/boyaa/videodemo/utils/FetchSDKParams;->paramsValue:Ljava/util/Map;

    invoke-interface {v9}, Ljava/util/Map;->size()I

    move-result v9

    if-eqz v9, :cond_0

    .line 46
    sget-object v9, Lcom/boyaa/videodemo/utils/FetchSDKParams;->paramsValue:Ljava/util/Map;

    invoke-interface {v9}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_2

    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 53
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 55
    new-instance v5, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v5}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 56
    .local v5, "httpClient":Lorg/apache/http/client/HttpClient;
    const-string v8, ""

    .line 57
    .local v8, "strUrl":Ljava/lang/String;
    sget v9, Lcom/boyaa/videosdk/BoyaaVoice;->mVersionTag:I

    packed-switch v9, :pswitch_data_0

    .line 69
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "http://audio.boyaa.com/Dfqp/audio_dir.php?"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 74
    :goto_1
    const-string v9, "xuanfu"

    invoke-static {v9, v8}, Lcom/boyaa/videodemo/utils/LogUtils;->s(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    new-instance v4, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v4, v8}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 77
    .local v4, "getMethod":Lorg/apache/http/client/methods/HttpGet;
    const/4 v6, 0x0

    .line 79
    .local v6, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v5, v4}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 80
    if-eqz v6, :cond_1

    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/StatusLine;->getStatusCode()I
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    move-result v9

    const/16 v10, 0xc8

    if-ne v9, v10, :cond_1

    .line 82
    :try_start_1
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v9

    invoke-static {v9}, Lcom/boyaa/videodemo/utils/FetchSDKParams;->inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    :try_end_1
    .catch Landroid/net/ParseException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    move-result-object v7

    .line 97
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v4    # "getMethod":Lorg/apache/http/client/methods/HttpGet;
    .end local v5    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v6    # "response":Lorg/apache/http/HttpResponse;
    .end local v8    # "strUrl":Ljava/lang/String;
    :cond_1
    :goto_2
    return-object v7

    .line 46
    .restart local v0    # "buf":Ljava/lang/StringBuilder;
    :cond_2
    :try_start_2
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 48
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, "="

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    const-string v12, "utf-8"

    invoke-static {v9, v12}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    const-string v9, "&"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    goto/16 :goto_0

    .line 89
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v2

    .line 90
    .local v2, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v2}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    goto :goto_2

    .line 60
    .end local v2    # "e":Lorg/apache/http/client/ClientProtocolException;
    .restart local v0    # "buf":Ljava/lang/StringBuilder;
    .restart local v5    # "httpClient":Lorg/apache/http/client/HttpClient;
    .restart local v8    # "strUrl":Ljava/lang/String;
    :pswitch_0
    :try_start_3
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "http://audio.boyaa.com/Dfqp/audio_dir.php?"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 61
    goto :goto_1

    .line 63
    :pswitch_1
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "http://audio.boyaa.com/Dfqp/audio_dir_pre.php?"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 64
    goto :goto_1

    .line 66
    :pswitch_2
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "http://audio.boyaa.com/Dfqp/audio_dir_test.php?"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 67
    goto/16 :goto_1

    .line 83
    .restart local v4    # "getMethod":Lorg/apache/http/client/methods/HttpGet;
    .restart local v6    # "response":Lorg/apache/http/HttpResponse;
    :catch_1
    move-exception v2

    .line 84
    .local v2, "e":Landroid/net/ParseException;
    invoke-virtual {v2}, Landroid/net/ParseException;->printStackTrace()V
    :try_end_3
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    goto :goto_2

    .line 91
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v2    # "e":Landroid/net/ParseException;
    .end local v4    # "getMethod":Lorg/apache/http/client/methods/HttpGet;
    .end local v5    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v6    # "response":Lorg/apache/http/HttpResponse;
    .end local v8    # "strUrl":Ljava/lang/String;
    :catch_2
    move-exception v2

    .line 92
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 85
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "buf":Ljava/lang/StringBuilder;
    .restart local v4    # "getMethod":Lorg/apache/http/client/methods/HttpGet;
    .restart local v5    # "httpClient":Lorg/apache/http/client/HttpClient;
    .restart local v6    # "response":Lorg/apache/http/HttpResponse;
    .restart local v8    # "strUrl":Ljava/lang/String;
    :catch_3
    move-exception v2

    .line 86
    .restart local v2    # "e":Ljava/io/IOException;
    :try_start_4
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_4
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_2

    .line 93
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v2    # "e":Ljava/io/IOException;
    .end local v4    # "getMethod":Lorg/apache/http/client/methods/HttpGet;
    .end local v5    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v6    # "response":Lorg/apache/http/HttpResponse;
    .end local v8    # "strUrl":Ljava/lang/String;
    :catch_4
    move-exception v2

    .line 94
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 57
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static initData(III)V
    .locals 3
    .param p0, "tid"    # I
    .param p1, "appid"    # I
    .param p2, "uid"    # I

    .prologue
    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/boyaa/videodemo/utils/FetchSDKParams;->paramsValue:Ljava/util/Map;

    .line 31
    sget-object v0, Lcom/boyaa/videodemo/utils/FetchSDKParams;->paramsValue:Ljava/util/Map;

    const-string v1, "tid"

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    sget-object v0, Lcom/boyaa/videodemo/utils/FetchSDKParams;->paramsValue:Ljava/util/Map;

    const-string v1, "appid"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    sget-object v0, Lcom/boyaa/videodemo/utils/FetchSDKParams;->paramsValue:Ljava/util/Map;

    const-string v1, "uid"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    return-void
.end method

.method private static inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 5
    .param p0, "is"    # Ljava/io/InputStream;

    .prologue
    .line 103
    const-string v2, ""

    .line 104
    .local v2, "s":Ljava/lang/String;
    const-string v0, ""

    .line 108
    .local v0, "line":Ljava/lang/String;
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 109
    .local v1, "rd":Ljava/io/BufferedReader;
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 115
    .end local v1    # "rd":Ljava/io/BufferedReader;
    :goto_1
    return-object v2

    .line 109
    .restart local v1    # "rd":Ljava/io/BufferedReader;
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 111
    .end local v1    # "rd":Ljava/io/BufferedReader;
    :catch_0
    move-exception v3

    goto :goto_1
.end method
