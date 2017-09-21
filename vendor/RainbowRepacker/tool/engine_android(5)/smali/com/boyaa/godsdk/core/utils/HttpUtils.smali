.class public Lcom/boyaa/godsdk/core/utils/HttpUtils;
.super Ljava/lang/Object;
.source "HttpUtils.java"


# static fields
.field public static final HTTP_BODY:Ljava/lang/String; = "http_body"

.field private static final HTTP_CONNECTIONTIMEOUT:I = 0x3a98

.field private static final HTTP_SOTIMEOUT:I = 0x3a98

.field public static final HTTP_STATUS:Ljava/lang/String; = "http_status"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mContext:Landroid/content/Context;

.field private final mDebug:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    const-class v0, Lcom/boyaa/godsdk/core/utils/HttpUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/boyaa/godsdk/core/utils/HttpUtils;->TAG:Ljava/lang/String;

    .line 55
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugMode()Z

    move-result v0

    iput-boolean v0, p0, Lcom/boyaa/godsdk/core/utils/HttpUtils;->mDebug:Z

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugMode()Z

    move-result v0

    iput-boolean v0, p0, Lcom/boyaa/godsdk/core/utils/HttpUtils;->mDebug:Z

    .line 63
    iput-object p1, p0, Lcom/boyaa/godsdk/core/utils/HttpUtils;->mContext:Landroid/content/Context;

    .line 64
    return-void
.end method

.method private addHttpBody(Landroid/os/Bundle;Lorg/apache/http/HttpResponse;)V
    .locals 4
    .param p1, "data"    # Landroid/os/Bundle;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 267
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 268
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    const-string v2, "Content-Encoding"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 269
    .local v1, "s":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string v2, "gzip"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-ltz v2, :cond_0

    .line 270
    const-string v2, "http_body"

    const/4 v3, 0x1

    invoke-direct {p0, v0, v3}, Lcom/boyaa/godsdk/core/utils/HttpUtils;->readHttpBody(Lorg/apache/http/HttpEntity;Z)[B

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 274
    :goto_0
    return-void

    .line 272
    :cond_0
    const-string v2, "http_body"

    const/4 v3, 0x0

    invoke-direct {p0, v0, v3}, Lcom/boyaa/godsdk/core/utils/HttpUtils;->readHttpBody(Lorg/apache/http/HttpEntity;Z)[B

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    goto :goto_0
.end method

.method private addHttpHeader(Landroid/os/Bundle;Lorg/apache/http/HttpResponse;)V
    .locals 5
    .param p1, "data"    # Landroid/os/Bundle;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 251
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v1

    .line 252
    .local v1, "headers":[Lorg/apache/http/Header;
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v3

    array-length v0, v3

    .line 254
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v0, :cond_1

    .line 261
    if-eqz v1, :cond_0

    .line 262
    const/4 v1, 0x0

    .line 264
    :cond_0
    return-void

    .line 258
    :cond_1
    aget-object v3, v1, v2

    invoke-interface {v3}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v3

    aget-object v4, v1, v2

    invoke-interface {v4}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 6
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 340
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    .line 341
    const-string v5, "UTF-8"

    invoke-direct {v4, p0, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 340
    invoke-direct {v2, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 342
    .local v2, "reader":Ljava/io/BufferedReader;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 343
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 345
    .local v1, "line":Ljava/lang/String;
    :goto_0
    :try_start_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 352
    if-eqz p0, :cond_0

    .line 353
    :try_start_1
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 359
    :cond_0
    :goto_1
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 346
    :cond_1
    :try_start_2
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 348
    :catch_0
    move-exception v0

    .line 349
    .local v0, "e":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 352
    if-eqz p0, :cond_0

    .line 353
    :try_start_4
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 355
    :catch_1
    move-exception v0

    .line 356
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 350
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    .line 352
    if-eqz p0, :cond_2

    .line 353
    :try_start_5
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 358
    :cond_2
    :goto_2
    throw v4

    .line 355
    :catch_2
    move-exception v0

    .line 356
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 355
    .end local v0    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v0

    .line 356
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method private createHttpClient()Lorg/apache/http/client/HttpClient;
    .locals 8

    .prologue
    const/16 v4, 0x3a98

    .line 223
    new-instance v2, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v2}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 226
    .local v2, "params":Lorg/apache/http/params/HttpParams;
    invoke-static {v2, v4}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 228
    invoke-static {v2, v4}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 233
    const/4 v4, 0x1

    invoke-static {v2, v4}, Lorg/apache/http/client/params/HttpClientParams;->setRedirecting(Lorg/apache/http/params/HttpParams;Z)V

    .line 236
    :try_start_0
    new-instance v3, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v3}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 237
    .local v3, "schemeRegistry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v4, Lorg/apache/http/conn/scheme/Scheme;

    const-string v5, "http"

    .line 238
    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v6

    const/16 v7, 0x50

    invoke-direct {v4, v5, v6, v7}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    .line 237
    invoke-virtual {v3, v4}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 239
    new-instance v4, Lorg/apache/http/conn/scheme/Scheme;

    const-string v5, "https"

    .line 240
    invoke-static {}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->getSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;

    move-result-object v6

    const/16 v7, 0x1bb

    invoke-direct {v4, v5, v6, v7}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    .line 239
    invoke-virtual {v3, v4}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 241
    new-instance v1, Lorg/apache/http/impl/conn/SingleClientConnManager;

    invoke-direct {v1, v2, v3}, Lorg/apache/http/impl/conn/SingleClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 244
    .local v1, "mgr":Lorg/apache/http/impl/conn/SingleClientConnManager;
    new-instance v4, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v4, v1, v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 246
    .end local v1    # "mgr":Lorg/apache/http/impl/conn/SingleClientConnManager;
    .end local v3    # "schemeRegistry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    :goto_0
    return-object v4

    .line 245
    :catch_0
    move-exception v0

    .line 246
    .local v0, "e":Ljava/lang/Exception;
    new-instance v4, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v4, v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    goto :goto_0
.end method

.method private debug(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 532
    iget-boolean v0, p0, Lcom/boyaa/godsdk/core/utils/HttpUtils;->mDebug:Z

    if-eqz v0, :cond_0

    .line 533
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "GodSDK-"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/boyaa/godsdk/core/utils/HttpUtils;->TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 535
    :cond_0
    return-void
.end method

.method private detectProxy()Lorg/apache/http/HttpHost;
    .locals 7

    .prologue
    .line 185
    const/4 v2, 0x0

    .line 196
    .local v2, "proxy":Lorg/apache/http/HttpHost;
    invoke-static {}, Landroid/net/Proxy;->getDefaultHost()Ljava/lang/String;

    move-result-object v3

    .line 197
    .local v3, "proxyHost":Ljava/lang/String;
    invoke-static {}, Landroid/net/Proxy;->getDefaultPort()I

    move-result v1

    .line 199
    .local v1, "port":I
    const/4 v0, 0x0

    .line 201
    .local v0, "enabled":Z
    :try_start_0
    iget-object v5, p0, Lcom/boyaa/godsdk/core/utils/HttpUtils;->mContext:Landroid/content/Context;

    if-eqz v5, :cond_0

    .line 202
    iget-object v5, p0, Lcom/boyaa/godsdk/core/utils/HttpUtils;->mContext:Landroid/content/Context;

    .line 203
    const-string v6, "wifi"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 202
    check-cast v4, Landroid/net/wifi/WifiManager;

    .line 204
    .local v4, "wifiManager":Landroid/net/wifi/WifiManager;
    if-eqz v4, :cond_0

    .line 205
    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    .line 206
    if-eqz v0, :cond_0

    .line 207
    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/wifi/WifiInfo;->getIpAddress()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-nez v5, :cond_0

    .line 208
    const/4 v0, 0x0

    .line 216
    .end local v4    # "wifiManager":Landroid/net/wifi/WifiManager;
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    if-eqz v3, :cond_1

    .line 217
    new-instance v2, Lorg/apache/http/HttpHost;

    .end local v2    # "proxy":Lorg/apache/http/HttpHost;
    invoke-direct {v2, v3, v1}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;I)V

    .line 219
    .restart local v2    # "proxy":Lorg/apache/http/HttpHost;
    :cond_1
    return-object v2

    .line 213
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method private doHttp(ILjava/lang/String;)Landroid/os/Bundle;
    .locals 13
    .param p1, "op"    # I
    .param p2, "request"    # Ljava/lang/String;

    .prologue
    const/16 v12, 0xce

    const/16 v11, 0xc8

    .line 94
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 95
    .local v0, "data":Landroid/os/Bundle;
    const/4 v3, 0x0

    .line 96
    .local v3, "http_client":Lorg/apache/http/client/HttpClient;
    const/4 v6, 0x0

    .line 97
    .local v6, "http_resp":Lorg/apache/http/HttpResponse;
    const/4 v4, 0x0

    .line 98
    .local v4, "http_req":Lorg/apache/http/client/methods/HttpUriRequest;
    const/4 v8, 0x0

    .line 101
    .local v8, "status":I
    :try_start_0
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/utils/HttpUtils;->createHttpClient()Lorg/apache/http/client/HttpClient;

    move-result-object v3

    .line 104
    invoke-direct {p0}, Lcom/boyaa/godsdk/core/utils/HttpUtils;->detectProxy()Lorg/apache/http/HttpHost;

    move-result-object v7

    .line 105
    .local v7, "proxy":Lorg/apache/http/HttpHost;
    if-eqz v7, :cond_0

    .line 106
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v9

    .line 107
    const-string v10, "http.route.default-proxy"

    .line 106
    invoke-interface {v9, v10, v7}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 110
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 118
    new-instance v5, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v5, p2}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .end local v4    # "http_req":Lorg/apache/http/client/methods/HttpUriRequest;
    .local v5, "http_req":Lorg/apache/http/client/methods/HttpUriRequest;
    move-object v4, v5

    .line 123
    .end local v5    # "http_req":Lorg/apache/http/client/methods/HttpUriRequest;
    .restart local v4    # "http_req":Lorg/apache/http/client/methods/HttpUriRequest;
    :goto_0
    const-string v9, "Accept-Encoding"

    const-string v10, "gzip,deflate"

    invoke-interface {v4, v9, v10}, Lorg/apache/http/client/methods/HttpUriRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    const-string v9, "Charset"

    const-string v10, "UTF-8"

    invoke-interface {v4, v9, v10}, Lorg/apache/http/client/methods/HttpUriRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    if-eqz v7, :cond_1

    .line 126
    const-string v9, "X-Online-Host"

    invoke-interface {v4}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v10

    invoke-virtual {v10}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v4, v9, v10}, Lorg/apache/http/client/methods/HttpUriRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    const-string v9, "User-Agent"

    .line 128
    const-string v10, "Mozilla/5.0 (Macintosh; PPC Mac OS X; U; en) Opera 8.0"

    .line 127
    invoke-interface {v4, v9, v10}, Lorg/apache/http/client/methods/HttpUriRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    :cond_1
    invoke-interface {v3, v4}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 132
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v8

    .line 133
    const-string v9, "http_status"

    invoke-virtual {v0, v9, v8}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 135
    if-eq v8, v11, :cond_4

    .line 136
    if-eq v8, v12, :cond_4

    .line 137
    invoke-interface {v4}, Lorg/apache/http/client/methods/HttpUriRequest;->abort()V
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 172
    if-eqz v3, :cond_2

    .line 173
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 174
    const/4 v3, 0x0

    .line 176
    :cond_2
    if-eqz v6, :cond_3

    .line 177
    const/4 v6, 0x0

    .line 181
    .end local v7    # "proxy":Lorg/apache/http/HttpHost;
    :cond_3
    :goto_1
    return-object v0

    .line 112
    .restart local v7    # "proxy":Lorg/apache/http/HttpHost;
    :pswitch_0
    :try_start_1
    new-instance v5, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v5, p2}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .end local v4    # "http_req":Lorg/apache/http/client/methods/HttpUriRequest;
    .restart local v5    # "http_req":Lorg/apache/http/client/methods/HttpUriRequest;
    move-object v4, v5

    .line 113
    .end local v5    # "http_req":Lorg/apache/http/client/methods/HttpUriRequest;
    .restart local v4    # "http_req":Lorg/apache/http/client/methods/HttpUriRequest;
    goto :goto_0

    .line 115
    :pswitch_1
    new-instance v5, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v5, p2}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .end local v4    # "http_req":Lorg/apache/http/client/methods/HttpUriRequest;
    .restart local v5    # "http_req":Lorg/apache/http/client/methods/HttpUriRequest;
    move-object v4, v5

    .line 116
    .end local v5    # "http_req":Lorg/apache/http/client/methods/HttpUriRequest;
    .restart local v4    # "http_req":Lorg/apache/http/client/methods/HttpUriRequest;
    goto :goto_0

    .line 142
    :cond_4
    const-string v9, "Content-Type"

    invoke-interface {v6, v9}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v2

    .line 143
    .local v2, "header":Lorg/apache/http/Header;
    if-eqz v2, :cond_6

    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_6

    .line 144
    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v9

    const-string v10, "wap.wml"

    invoke-virtual {v9, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    if-lez v9, :cond_6

    .line 145
    const-string v9, "erik"

    const-string v10, "cmwap wap.wml content-type found"

    invoke-direct {p0, v9, v10}, Lcom/boyaa/godsdk/core/utils/HttpUtils;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    invoke-interface {v3, v4}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 147
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v8

    .line 149
    if-eq v8, v11, :cond_6

    .line 150
    if-eq v8, v12, :cond_6

    .line 151
    invoke-interface {v4}, Lorg/apache/http/client/methods/HttpUriRequest;->abort()V
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 172
    if-eqz v3, :cond_5

    .line 173
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 174
    const/4 v3, 0x0

    .line 176
    :cond_5
    if-eqz v6, :cond_3

    .line 177
    const/4 v6, 0x0

    goto :goto_1

    .line 156
    :cond_6
    :try_start_2
    invoke-direct {p0, v0, v6}, Lcom/boyaa/godsdk/core/utils/HttpUtils;->addHttpHeader(Landroid/os/Bundle;Lorg/apache/http/HttpResponse;)V

    .line 157
    invoke-direct {p0, v0, v6}, Lcom/boyaa/godsdk/core/utils/HttpUtils;->addHttpBody(Landroid/os/Bundle;Lorg/apache/http/HttpResponse;)V
    :try_end_2
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/net/SocketException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 172
    if-eqz v3, :cond_7

    .line 173
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 174
    const/4 v3, 0x0

    .line 176
    :cond_7
    if-eqz v6, :cond_3

    .line 177
    const/4 v6, 0x0

    goto :goto_1

    .line 159
    .end local v2    # "header":Lorg/apache/http/Header;
    .end local v7    # "proxy":Lorg/apache/http/HttpHost;
    :catch_0
    move-exception v1

    .line 160
    .local v1, "e":Lorg/apache/http/client/ClientProtocolException;
    :try_start_3
    invoke-virtual {v1}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 172
    if-eqz v3, :cond_8

    .line 173
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 174
    const/4 v3, 0x0

    .line 176
    :cond_8
    if-eqz v6, :cond_3

    .line 177
    const/4 v6, 0x0

    goto :goto_1

    .line 162
    .end local v1    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_1
    move-exception v1

    .line 163
    .local v1, "e":Ljava/net/SocketTimeoutException;
    :try_start_4
    invoke-virtual {v1}, Ljava/net/SocketTimeoutException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 172
    if-eqz v3, :cond_9

    .line 173
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 174
    const/4 v3, 0x0

    .line 176
    :cond_9
    if-eqz v6, :cond_3

    .line 177
    const/4 v6, 0x0

    goto/16 :goto_1

    .line 165
    .end local v1    # "e":Ljava/net/SocketTimeoutException;
    :catch_2
    move-exception v1

    .line 166
    .local v1, "e":Ljava/net/SocketException;
    :try_start_5
    invoke-virtual {v1}, Ljava/net/SocketException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 172
    if-eqz v3, :cond_a

    .line 173
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 174
    const/4 v3, 0x0

    .line 176
    :cond_a
    if-eqz v6, :cond_3

    .line 177
    const/4 v6, 0x0

    goto/16 :goto_1

    .line 168
    .end local v1    # "e":Ljava/net/SocketException;
    :catch_3
    move-exception v1

    .line 169
    .local v1, "e":Ljava/io/IOException;
    :try_start_6
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 172
    if-eqz v3, :cond_b

    .line 173
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 174
    const/4 v3, 0x0

    .line 176
    :cond_b
    if-eqz v6, :cond_3

    .line 177
    const/4 v6, 0x0

    goto/16 :goto_1

    .line 171
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v9

    .line 172
    if-eqz v3, :cond_c

    .line 173
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v10

    invoke-interface {v10}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 174
    const/4 v3, 0x0

    .line 176
    :cond_c
    if-eqz v6, :cond_d

    .line 177
    const/4 v6, 0x0

    .line 179
    :cond_d
    throw v9

    .line 110
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static genURL(Landroid/content/Context;Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;
    .locals 37
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 375
    .local p2, "parameterMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v23, Ljava/util/HashMap;

    invoke-direct/range {v23 .. v23}, Ljava/util/HashMap;-><init>()V

    .line 377
    .local v23, "orderParamMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v32, "appid"

    move-object/from16 v0, p2

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 378
    .local v3, "appid":Ljava/lang/String;
    const-string v32, "pmode"

    move-object/from16 v0, p2

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Ljava/lang/String;

    .line 379
    .local v26, "pmode":Ljava/lang/String;
    const-string v32, "sid"

    move-object/from16 v0, p2

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Ljava/lang/String;

    .line 380
    .local v29, "sid":Ljava/lang/String;
    const-string v32, "sitemid"

    move-object/from16 v0, p2

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Ljava/lang/String;

    .line 381
    .local v30, "sitemid":Ljava/lang/String;
    const-string v32, "mid"

    move-object/from16 v0, p2

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    .line 382
    .local v18, "mid":Ljava/lang/String;
    const-string v32, "pamount"

    move-object/from16 v0, p2

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/lang/String;

    .line 383
    .local v24, "pamount":Ljava/lang/String;
    const-string v32, "item_id"

    move-object/from16 v0, p2

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 384
    .local v14, "item_id":Ljava/lang/String;
    const-string v32, "client_data"

    move-object/from16 v0, p2

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 385
    .local v4, "client_data":Ljava/lang/String;
    const-string v32, "ext"

    move-object/from16 v0, p2

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 386
    .local v8, "ext":Ljava/lang/String;
    const-string v32, "time"

    move-object/from16 v0, p2

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Ljava/lang/String;

    .line 389
    .local v31, "time":Ljava/lang/String;
    new-instance v32, Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v33

    const-wide/16 v35, 0x3e8

    div-long v33, v33, v35

    move-wide/from16 v0, v33

    long-to-int v0, v0

    move/from16 v33, v0

    invoke-static/range {v33 .. v33}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v33

    invoke-direct/range {v32 .. v33}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 390
    .local v21, "nowTime":Ljava/lang/String;
    const-string v32, "appid"

    if-nez v3, :cond_0

    const-string v3, ""

    .end local v3    # "appid":Ljava/lang/String;
    :cond_0
    move-object/from16 v0, v23

    move-object/from16 v1, v32

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    const-string v32, "pmode"

    if-nez v26, :cond_1

    const-string v26, ""

    .end local v26    # "pmode":Ljava/lang/String;
    :cond_1
    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    const-string v32, "sid"

    if-nez v29, :cond_2

    const-string v29, ""

    .end local v29    # "sid":Ljava/lang/String;
    :cond_2
    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    const-string v32, "sitemid"

    if-nez v30, :cond_3

    const-string v30, ""

    .end local v30    # "sitemid":Ljava/lang/String;
    :cond_3
    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    const-string v32, "mid"

    if-nez v18, :cond_4

    const-string v18, ""

    .end local v18    # "mid":Ljava/lang/String;
    :cond_4
    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    const-string v32, "pamount"

    if-nez v24, :cond_5

    const-string v24, ""

    .end local v24    # "pamount":Ljava/lang/String;
    :cond_5
    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    const-string v32, "item_id"

    if-nez v14, :cond_6

    const-string v14, ""

    .end local v14    # "item_id":Ljava/lang/String;
    :cond_6
    move-object/from16 v0, v23

    move-object/from16 v1, v32

    invoke-virtual {v0, v1, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 403
    const-string v32, "ext"

    if-nez v8, :cond_7

    const-string v8, ""

    .end local v8    # "ext":Ljava/lang/String;
    :cond_7
    move-object/from16 v0, v23

    move-object/from16 v1, v32

    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    const-string v32, "time"

    if-nez v31, :cond_b

    .end local v21    # "nowTime":Ljava/lang/String;
    :goto_0
    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    if-nez v4, :cond_c

    .line 407
    new-instance v15, Lorg/json/JSONObject;

    invoke-direct {v15}, Lorg/json/JSONObject;-><init>()V

    .line 408
    .local v15, "jsonObject":Lorg/json/JSONObject;
    const-string v32, "phone"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getPhoneNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    invoke-virtual {v15, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v32

    .line 409
    const-string v33, "ip"

    invoke-static {}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getHostIp()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v32

    .line 410
    const-string v33, "imsi"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v32

    .line 411
    const-string v33, "iccid"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getMainCardICCID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v32

    .line 412
    const-string v33, "imei"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getIMEI(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v32

    .line 413
    const-string v33, "macid"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getMAC(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v32

    .line 414
    const-string v33, "network"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getNetworkType(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 415
    invoke-virtual {v15}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    .line 449
    :goto_1
    const-string v32, "client_data"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    invoke-virtual {v0, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 452
    const-string v32, "sign"

    invoke-static/range {v23 .. v23}, Lcom/boyaa/godsdk/core/utils/SignUtils;->getSign(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 454
    if-eqz v23, :cond_9

    .line 455
    invoke-virtual/range {v23 .. v23}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v32

    invoke-interface/range {v32 .. v32}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .line 456
    .local v16, "localIterator":Ljava/util/Iterator;
    :cond_8
    :goto_2
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v32

    if-nez v32, :cond_14

    .line 470
    .end local v16    # "localIterator":Ljava/util/Iterator;
    :cond_9
    new-instance v28, Ljava/lang/StringBuffer;

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 471
    .local v28, "sb":Ljava/lang/StringBuffer;
    const-string v32, "?"

    move-object/from16 v0, p1

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v32

    if-gez v32, :cond_a

    .line 472
    const-string v32, "?"

    move-object/from16 v0, v28

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 474
    :cond_a
    const/4 v9, 0x1

    .line 475
    .local v9, "first_param":Z
    invoke-virtual/range {v23 .. v23}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v32

    invoke-interface/range {v32 .. v32}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v33

    :goto_3
    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->hasNext()Z

    move-result v32

    if-nez v32, :cond_15

    .line 491
    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v27

    .line 492
    .local v27, "result":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v32

    new-instance v33, Ljava/lang/StringBuilder;

    const-string v34, "genURL:"

    invoke-direct/range {v33 .. v34}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v33

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Lcom/boyaa/godsdk/core/utils/Debug;->d(Ljava/lang/String;)V

    .line 493
    return-object v27

    .end local v9    # "first_param":Z
    .end local v15    # "jsonObject":Lorg/json/JSONObject;
    .end local v27    # "result":Ljava/lang/String;
    .end local v28    # "sb":Ljava/lang/StringBuffer;
    .restart local v21    # "nowTime":Ljava/lang/String;
    :cond_b
    move-object/from16 v21, v31

    .line 404
    goto/16 :goto_0

    .line 418
    .end local v21    # "nowTime":Ljava/lang/String;
    :cond_c
    new-instance v15, Lorg/json/JSONObject;

    invoke-direct {v15, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 419
    .restart local v15    # "jsonObject":Lorg/json/JSONObject;
    const-string v32, "phone"

    move-object/from16 v0, v32

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 420
    .local v25, "phone":Ljava/lang/String;
    const-string v32, "ip"

    move-object/from16 v0, v32

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 421
    .local v13, "ip":Ljava/lang/String;
    const-string v32, "imsi"

    move-object/from16 v0, v32

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 422
    .local v12, "imsi":Ljava/lang/String;
    const-string v32, "iccid"

    move-object/from16 v0, v32

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 423
    .local v10, "iccid":Ljava/lang/String;
    const-string v32, "imei"

    move-object/from16 v0, v32

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 424
    .local v11, "imei":Ljava/lang/String;
    const-string v32, "macid"

    move-object/from16 v0, v32

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 425
    .local v17, "macid":Ljava/lang/String;
    const-string v32, "network"

    move-object/from16 v0, v32

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 426
    .local v19, "network":Ljava/lang/String;
    const/4 v15, 0x0

    .line 427
    new-instance v20, Lorg/json/JSONObject;

    invoke-direct/range {v20 .. v20}, Lorg/json/JSONObject;-><init>()V

    .line 429
    .local v20, "newJson":Lorg/json/JSONObject;
    const-string v32, "phone"

    .line 430
    invoke-static/range {v25 .. v25}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v33

    if-eqz v33, :cond_d

    .line 431
    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getPhoneNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v25

    .line 429
    .end local v25    # "phone":Ljava/lang/String;
    :cond_d
    move-object/from16 v0, v20

    move-object/from16 v1, v32

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v32

    .line 432
    const-string v33, "ip"

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v34

    if-eqz v34, :cond_e

    invoke-static {}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getHostIp()Ljava/lang/String;

    move-result-object v13

    .end local v13    # "ip":Ljava/lang/String;
    :cond_e
    move-object/from16 v0, v32

    move-object/from16 v1, v33

    invoke-virtual {v0, v1, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v32

    .line 433
    const-string v33, "imsi"

    .line 434
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v34

    if-eqz v34, :cond_f

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    .line 433
    .end local v12    # "imsi":Ljava/lang/String;
    :cond_f
    move-object/from16 v0, v32

    move-object/from16 v1, v33

    invoke-virtual {v0, v1, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v32

    .line 435
    const-string v33, "iccid"

    .line 436
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v34

    if-eqz v34, :cond_10

    .line 437
    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getMainCardICCID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    .line 435
    .end local v10    # "iccid":Ljava/lang/String;
    :cond_10
    move-object/from16 v0, v32

    move-object/from16 v1, v33

    invoke-virtual {v0, v1, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v32

    .line 438
    const-string v33, "imei"

    .line 439
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v34

    if-eqz v34, :cond_11

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getIMEI(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v11

    .line 438
    .end local v11    # "imei":Ljava/lang/String;
    :cond_11
    move-object/from16 v0, v32

    move-object/from16 v1, v33

    invoke-virtual {v0, v1, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v32

    .line 440
    const-string v33, "macid"

    .line 441
    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v34

    if-eqz v34, :cond_12

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getMAC(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v17

    .line 440
    .end local v17    # "macid":Ljava/lang/String;
    :cond_12
    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v32

    .line 443
    const-string v33, "network"

    .line 444
    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v34

    if-eqz v34, :cond_13

    .line 445
    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getNetworkType(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v19

    .line 443
    .end local v19    # "network":Ljava/lang/String;
    :cond_13
    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 446
    invoke-virtual/range {v20 .. v20}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_1

    .line 457
    .end local v20    # "newJson":Lorg/json/JSONObject;
    .restart local v16    # "localIterator":Ljava/util/Iterator;
    :cond_14
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 459
    .local v6, "entry":Ljava/util/Map$Entry;
    :try_start_0
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v22

    .line 460
    .local v22, "obj":Ljava/lang/Object;
    if-eqz v22, :cond_8

    .line 461
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v32

    .line 462
    invoke-virtual/range {v22 .. v22}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v33

    const-string v34, "utf-8"

    invoke-static/range {v33 .. v34}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    .line 461
    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_2

    .line 464
    .end local v22    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v5

    .line 465
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_2

    .line 475
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v6    # "entry":Ljava/util/Map$Entry;
    .end local v16    # "localIterator":Ljava/util/Iterator;
    .restart local v9    # "first_param":Z
    .restart local v28    # "sb":Ljava/lang/StringBuffer;
    :cond_15
    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 476
    .local v7, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v9, :cond_16

    .line 477
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/String;

    move-object/from16 v0, v28

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 478
    const-string v32, "="

    move-object/from16 v0, v28

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 479
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/String;

    move-object/from16 v0, v28

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 480
    const/4 v9, 0x0

    .line 481
    goto/16 :goto_3

    .line 482
    :cond_16
    const-string v32, "&"

    move-object/from16 v0, v28

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 483
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/String;

    move-object/from16 v0, v28

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 484
    const-string v32, "="

    move-object/from16 v0, v28

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 485
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/String;

    move-object/from16 v0, v28

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3
.end method

.method public static generateBareCodeURL(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;
    .locals 33
    .param p0, "context"    # Landroid/app/Activity;
    .param p1, "params"    # Ljava/lang/String;

    .prologue
    .line 545
    const/4 v13, 0x0

    .line 546
    .local v13, "jsonResult":Lorg/json/JSONObject;
    const/16 v23, 0x1

    .line 547
    .local v23, "paramsVerify":Z
    const-string v21, ""

    .line 549
    .local v21, "paramsErrorInfo":Ljava/lang/String;
    const-string v3, ""

    .line 550
    .local v3, "appid":Ljava/lang/String;
    const-string v4, ""

    .line 551
    .local v4, "appkey":Ljava/lang/String;
    const-string v27, ""

    .line 552
    .local v27, "sid":Ljava/lang/String;
    const-string v28, ""

    .line 553
    .local v28, "url":Ljava/lang/String;
    const-string v25, ""

    .line 554
    .local v25, "pmode":Ljava/lang/String;
    const-string v6, ""

    .line 555
    .local v6, "client_data":Ljava/lang/String;
    const-string v7, ""

    .line 556
    .local v7, "ext":Ljava/lang/String;
    const-string v19, ""

    .line 558
    .local v19, "operator":Ljava/lang/String;
    new-instance v26, Ljava/lang/StringBuffer;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuffer;-><init>()V

    .line 560
    .local v26, "result":Ljava/lang/StringBuffer;
    :try_start_0
    new-instance v14, Lorg/json/JSONObject;

    move-object/from16 v0, p1

    invoke-direct {v14, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 562
    .end local v13    # "jsonResult":Lorg/json/JSONObject;
    .local v14, "jsonResult":Lorg/json/JSONObject;
    :try_start_1
    const-string v30, "appid"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 563
    const-string v30, "sid"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 564
    const-string v30, "url"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    .line 565
    const-string v30, "client_data"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 566
    const-string v30, "ext"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 567
    const-string v30, "pmode"

    const-string v31, "9999"

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 568
    const-string v30, "appkey"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 571
    const-string v30, "operator"

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/Operator;->getCurrentOperator(Landroid/content/Context;)Lcom/boyaa/godsdk/core/utils/Operator;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Lcom/boyaa/godsdk/core/utils/Operator;->getIdInServer()I

    move-result v32

    invoke-static/range {v32 .. v32}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v32

    invoke-direct/range {v31 .. v32}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 572
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v30

    new-instance v31, Ljava/lang/StringBuilder;

    const-string v32, "----generateBareCodeURL->operator:"

    invoke-direct/range {v31 .. v32}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v31

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 573
    const-string v30, "paytype"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v30

    if-nez v30, :cond_0

    .line 574
    const-string v30, "paytype"

    const-string v31, ""

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 577
    :cond_0
    const-string v30, "operator"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v30

    if-nez v30, :cond_1

    .line 578
    const-string v30, "operator"

    move-object/from16 v0, v30

    move-object/from16 v1, v19

    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 581
    :cond_1
    const-string v30, "pmode"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v30

    if-nez v30, :cond_2

    .line 582
    const-string v30, "pmode"

    const-string v31, "9999"

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 585
    :cond_2
    const-string v30, "time"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v30

    if-nez v30, :cond_3

    .line 586
    const-string v30, "time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v31

    move-object/from16 v0, v30

    move-wide/from16 v1, v31

    invoke-virtual {v14, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 589
    :cond_3
    const-string v30, "sitemid"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v30

    if-nez v30, :cond_4

    .line 590
    const/16 v23, 0x0

    .line 591
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v31, "\u4e0b\u5355\u53c2\u6570\u91cc\u6ca1\u6709\u7528\u6237\u5e73\u53f0id\uff1asitemid;"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 594
    :cond_4
    const-string v30, "mid"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v30

    if-nez v30, :cond_5

    .line 595
    const/16 v23, 0x0

    .line 596
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v31, "\u4e0b\u5355\u53c2\u6570\u91cc\u6ca1\u6709\u7528\u6237\u6e38\u620fid (\u65e0\u6570\u636e\u65f6\u4f20\u7a7a\u5b57\u7b26\u4e32)\uff1amid;"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 599
    :cond_5
    const-string v30, "pamount"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v30

    if-nez v30, :cond_6

    .line 600
    const/16 v23, 0x0

    .line 601
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v31, "\u4e0b\u5355\u53c2\u6570\u91cc\u6ca1\u6709\u6263\u8d39\u91d1\u989d(\u5355\u4f4d\u5143)\uff1apamount;"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 604
    :cond_6
    const-string v30, "item_id"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v30

    if-nez v30, :cond_7

    .line 605
    const/16 v23, 0x0

    .line 606
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v31, "\u4e0b\u5355\u53c2\u6570\u91cc\u6ca1\u6709\u4e1a\u52a1\u5546\u54c1id\u7f16\u53f7 [\u5bf9\u5e94\u652f\u4ed8\u4e2d\u5fc3\u5546\u54c1\u91cc\u7684\u9053\u5177id]\uff0c\u6ce8\u610f\u6b64\u5904\u662f\u4e1a\u52a1\u5546\u54c1id\u7f16\u53f7\uff0c\u4e0d\u662f\u652f\u4ed8\u4e2d\u5fc3\u7684\u5546\u54c1id\uff1aitem_id;"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 609
    :cond_7
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v30

    if-eqz v30, :cond_8

    .line 610
    const/16 v23, 0x0

    .line 611
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v31, "\u6e38\u620fappid\uff08\u652f\u4ed8\u540e\u53f0\u5206\u914d\uff09\u4e0d\u80fd\u4e3anull or \"\";"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 614
    :cond_8
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v30

    if-eqz v30, :cond_9

    .line 615
    const/16 v23, 0x0

    .line 616
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v31, "\u6e38\u620fappkey\uff08\u652f\u4ed8\u540e\u53f0\u5206\u914d\uff09\u4e0d\u80fd\u4e3anull or \"\";"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 619
    :cond_9
    invoke-static/range {v27 .. v27}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v30

    if-eqz v30, :cond_a

    .line 620
    const/16 v23, 0x0

    .line 621
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v31, "\u5e73\u53f0id\uff08\u652f\u4ed8\u540e\u53f0\u5206\u914d\uff09sid\u4e0d\u80fd\u4e3anull or \"\";"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 624
    :cond_a
    invoke-static/range {v28 .. v28}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v30

    if-eqz v30, :cond_b

    .line 625
    const/16 v23, 0x0

    .line 626
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v31, "\u8bf7\u6c42\u4ee3\u7406\u4e0b\u5355url\u4e0d\u80fd\u4e3anull or \"\";"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 629
    :cond_b
    invoke-static/range {v25 .. v25}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v30

    if-eqz v30, :cond_c

    .line 630
    const/16 v23, 0x0

    .line 631
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v31, "\u652f\u4ed8\u5e73\u53f0\u5206\u914d\u7684 pmode\u4e0d\u80fd\u4e3anull or \"\";"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 634
    :cond_c
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v30

    if-nez v30, :cond_d

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v30

    const/16 v31, 0xff

    move/from16 v0, v30

    move/from16 v1, v31

    if-le v0, v1, :cond_d

    .line 635
    const/16 v23, 0x0

    .line 636
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v31, "(\u65e0\u6570\u636e\u65f6\u4f20\u7a7a\u5b57\u7b26\u4e32)\uff0c\u81ea\u5b9a\u4e49\u6269\u5c55\u4fe1\u606f(\u9650\u5236\u6700\u957f\u4e0d\u8981\u8d85\u8fc7255\u5b57\u7b26)\u6570\u636e\u4f1a\u539f\u6837\u8fd4\u56de;"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 639
    :cond_d
    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v30

    if-eqz v30, :cond_e

    .line 640
    const/16 v23, 0x0

    .line 641
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v31, "\u8fd0\u8425\u5546\u53f7\u4e0d\u80fd\u4e3anull or \"\";"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 644
    :cond_e
    const-string v30, "url"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 645
    const-string v30, "pname"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 646
    const-string v30, "appkey"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 648
    const/4 v5, 0x0

    .line 649
    .local v5, "clientJson":Lorg/json/JSONObject;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v30

    if-eqz v30, :cond_13

    .line 650
    new-instance v5, Lorg/json/JSONObject;

    .end local v5    # "clientJson":Lorg/json/JSONObject;
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 651
    .restart local v5    # "clientJson":Lorg/json/JSONObject;
    const-string v30, "phone"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getPhoneNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v5, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v31

    .line 652
    const-string v32, "ip"

    invoke-static {}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getHostIp()Ljava/lang/String;

    move-result-object v30

    if-nez v30, :cond_12

    const-string v30, ""

    :goto_0
    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v30

    .line 653
    const-string v31, "imsi"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v30 .. v32}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v30

    .line 654
    const-string v31, "iccid"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getMainCardICCID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v30 .. v32}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v30

    .line 655
    const-string v31, "imei"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getIMEI(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v30 .. v32}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v30

    .line 656
    const-string v31, "macid"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getMAC(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v30 .. v32}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v30

    .line 657
    const-string v31, "network"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getNetworkType(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v30 .. v32}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 676
    :goto_1
    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    .line 678
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v30

    new-instance v31, Ljava/lang/StringBuilder;

    const-string v32, "----->barecode clientJson ip="

    invoke-direct/range {v31 .. v32}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v32, "ip"

    move-object/from16 v0, v32

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 680
    const-string v30, "client_data"

    move-object/from16 v0, v30

    invoke-virtual {v14, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 681
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v30

    new-instance v31, Ljava/lang/StringBuilder;

    const-string v32, "----->barecode clientJson="

    invoke-direct/range {v31 .. v32}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 682
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v30

    new-instance v31, Ljava/lang/StringBuilder;

    const-string v32, "----->barecode jsonResult="

    invoke-direct/range {v31 .. v32}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v31

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Lcom/boyaa/godsdk/core/utils/Debug;->i(Ljava/lang/String;)V

    .line 684
    if-eqz v23, :cond_18

    .line 687
    const/16 v30, 0x0

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuffer;->length()I

    move-result v31

    move-object/from16 v0, v26

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;

    .line 688
    const-string v30, "sign"

    invoke-static {v14, v4}, Lcom/boyaa/godsdk/core/utils/SignUtils;->getSign(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v31

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 690
    invoke-virtual {v14}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v16

    .line 692
    .local v16, "keyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_f
    :goto_2
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-nez v30, :cond_15

    .line 700
    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 701
    const-string v30, "?"

    move-object/from16 v0, v28

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v30

    if-gez v30, :cond_10

    .line 702
    const-string v30, "?"

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 705
    :cond_10
    invoke-virtual {v14}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v16

    .line 706
    const/4 v8, 0x1

    .line 708
    .local v8, "first_param":Z
    :cond_11
    :goto_3
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-nez v30, :cond_16

    .line 726
    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    .line 727
    .local v20, "orderUri":Ljava/lang/String;
    const/16 v30, 0x0

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuffer;->length()I

    move-result v31

    move-object/from16 v0, v26

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;

    .line 728
    new-instance v30, Ljava/lang/StringBuilder;

    const-string v31, "{\'ret\':1, \'result\':\'"

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v30

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\'}"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v13, v14

    .line 738
    .end local v5    # "clientJson":Lorg/json/JSONObject;
    .end local v8    # "first_param":Z
    .end local v14    # "jsonResult":Lorg/json/JSONObject;
    .end local v16    # "keyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v20    # "orderUri":Ljava/lang/String;
    .restart local v13    # "jsonResult":Lorg/json/JSONObject;
    :goto_4
    invoke-static {}, Lcom/boyaa/godsdk/core/GodSDK;->getInstance()Lcom/boyaa/godsdk/core/GodSDK;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/boyaa/godsdk/core/GodSDK;->getDebugger()Lcom/boyaa/godsdk/core/utils/Debug;

    move-result-object v30

    new-instance v31, Ljava/lang/StringBuilder;

    const-string v32, "barecode genURL:"

    invoke-direct/range {v31 .. v32}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v31

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Lcom/boyaa/godsdk/core/utils/Debug;->d(Ljava/lang/String;)V

    .line 739
    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v30

    return-object v30

    .line 652
    .end local v13    # "jsonResult":Lorg/json/JSONObject;
    .restart local v5    # "clientJson":Lorg/json/JSONObject;
    .restart local v14    # "jsonResult":Lorg/json/JSONObject;
    :cond_12
    :try_start_2
    invoke-static {}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getHostIp()Ljava/lang/String;

    move-result-object v30

    goto/16 :goto_0

    .line 659
    :cond_13
    new-instance v5, Lorg/json/JSONObject;

    .end local v5    # "clientJson":Lorg/json/JSONObject;
    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 660
    .restart local v5    # "clientJson":Lorg/json/JSONObject;
    const-string v30, "imsi"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v5, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 661
    .local v11, "imsi":Ljava/lang/String;
    const-string v31, "ip"

    invoke-static {}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getHostIp()Ljava/lang/String;

    move-result-object v30

    if-nez v30, :cond_14

    const-string v30, ""

    :goto_5
    move-object/from16 v0, v31

    move-object/from16 v1, v30

    invoke-virtual {v5, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 662
    .local v12, "ip":Ljava/lang/String;
    const-string v30, "iccid"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getMainCardICCID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v5, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 663
    .local v9, "iccid":Ljava/lang/String;
    const-string v30, "imei"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getIMEI(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v5, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 664
    .local v10, "imei":Ljava/lang/String;
    const-string v30, "phone"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getPhoneNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v5, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 665
    .local v24, "phone":Ljava/lang/String;
    const-string v30, "macid"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getMAC(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v5, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 666
    .local v17, "macid":Ljava/lang/String;
    const-string v30, "network"

    invoke-static/range {p0 .. p0}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getNetworkType(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v5, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 668
    .local v18, "network":Ljava/lang/String;
    const-string v30, "phone"

    move-object/from16 v0, v30

    move-object/from16 v1, v24

    invoke-virtual {v5, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v30

    .line 669
    const-string v31, "ip"

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v0, v1, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v30

    .line 670
    const-string v31, "imsi"

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v0, v1, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v30

    .line 671
    const-string v31, "iccid"

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v0, v1, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v30

    .line 672
    const-string v31, "imei"

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v0, v1, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v30

    .line 673
    const-string v31, "macid"

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v30

    .line 674
    const-string v31, "network"

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_1

    .line 734
    .end local v5    # "clientJson":Lorg/json/JSONObject;
    .end local v9    # "iccid":Ljava/lang/String;
    .end local v10    # "imei":Ljava/lang/String;
    .end local v11    # "imsi":Ljava/lang/String;
    .end local v12    # "ip":Ljava/lang/String;
    .end local v17    # "macid":Ljava/lang/String;
    .end local v18    # "network":Ljava/lang/String;
    .end local v24    # "phone":Ljava/lang/String;
    :catch_0
    move-exception v22

    move-object v13, v14

    .line 735
    .end local v14    # "jsonResult":Lorg/json/JSONObject;
    .restart local v13    # "jsonResult":Lorg/json/JSONObject;
    .local v22, "paramsException":Ljava/lang/Exception;
    :goto_6
    const/16 v30, 0x0

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuffer;->length()I

    move-result v31

    move-object/from16 v0, v26

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;

    .line 736
    new-instance v30, Ljava/lang/StringBuilder;

    const-string v31, "{\'ret\':0, \'result\':\'"

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\'}"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_4

    .line 661
    .end local v13    # "jsonResult":Lorg/json/JSONObject;
    .end local v22    # "paramsException":Ljava/lang/Exception;
    .restart local v5    # "clientJson":Lorg/json/JSONObject;
    .restart local v11    # "imsi":Ljava/lang/String;
    .restart local v14    # "jsonResult":Lorg/json/JSONObject;
    :cond_14
    :try_start_3
    invoke-static {}, Lcom/boyaa/godsdk/core/utils/NetworkUtils;->getHostIp()Ljava/lang/String;

    move-result-object v30

    goto/16 :goto_5

    .line 693
    .end local v11    # "imsi":Ljava/lang/String;
    .restart local v16    # "keyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_15
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 694
    .local v15, "key":Ljava/lang/String;
    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v29

    .line 695
    .local v29, "value":Ljava/lang/Object;
    if-eqz v29, :cond_f

    .line 696
    invoke-virtual/range {v29 .. v29}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v30

    const-string v31, "utf-8"

    invoke-static/range {v30 .. v31}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v14, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_2

    .line 709
    .end local v15    # "key":Ljava/lang/String;
    .end local v29    # "value":Ljava/lang/Object;
    .restart local v8    # "first_param":Z
    :cond_16
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 710
    .restart local v15    # "key":Ljava/lang/String;
    if-eqz v15, :cond_11

    .line 711
    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v29

    .line 712
    .restart local v29    # "value":Ljava/lang/Object;
    if-eqz v8, :cond_17

    .line 713
    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 714
    const-string v30, "="

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 715
    move-object/from16 v0, v26

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 716
    const/4 v8, 0x0

    .line 717
    goto/16 :goto_3

    .line 718
    :cond_17
    const-string v30, "&"

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 719
    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 720
    const-string v30, "="

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 721
    move-object/from16 v0, v26

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 731
    .end local v8    # "first_param":Z
    .end local v15    # "key":Ljava/lang/String;
    .end local v16    # "keyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v29    # "value":Ljava/lang/Object;
    :cond_18
    const/16 v30, 0x0

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuffer;->length()I

    move-result v31

    move-object/from16 v0, v26

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;

    .line 732
    new-instance v30, Ljava/lang/StringBuilder;

    const-string v31, "{\'ret\':0, \'result\':\'"

    invoke-direct/range {v30 .. v31}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v30

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "\'}"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-object v13, v14

    .line 734
    .end local v14    # "jsonResult":Lorg/json/JSONObject;
    .restart local v13    # "jsonResult":Lorg/json/JSONObject;
    goto/16 :goto_4

    .end local v5    # "clientJson":Lorg/json/JSONObject;
    :catch_1
    move-exception v22

    goto/16 :goto_6
.end method

.method public static jsonStrToMap(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 6
    .param p0, "jsonParam"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 503
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 504
    .local v4, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 523
    :cond_0
    :goto_0
    return-object v4

    .line 510
    :cond_1
    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 511
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 512
    .local v2, "localJSONObject":Lorg/json/JSONObject;
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 513
    .local v1, "localIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .line 514
    .local v3, "str":Ljava/lang/String;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 515
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "str":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 516
    .restart local v3    # "str":Ljava/lang/String;
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 519
    .end local v1    # "localIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v2    # "localJSONObject":Lorg/json/JSONObject;
    .end local v3    # "str":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 520
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private readHttpBody(Lorg/apache/http/HttpEntity;Z)[B
    .locals 8
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;
    .param p2, "ziped"    # Z

    .prologue
    .line 277
    const/4 v4, 0x0

    .line 278
    .local v4, "in":Ljava/io/InputStream;
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 279
    .local v0, "bout":Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x0

    .line 282
    .local v1, "byte_data":[B
    if-eqz p2, :cond_0

    .line 283
    :try_start_0
    new-instance v5, Ljava/util/zip/GZIPInputStream;

    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .end local v4    # "in":Ljava/io/InputStream;
    .local v5, "in":Ljava/io/InputStream;
    move-object v4, v5

    .line 293
    .end local v5    # "in":Ljava/io/InputStream;
    .restart local v4    # "in":Ljava/io/InputStream;
    :goto_0
    if-nez v4, :cond_1

    .line 294
    const/4 v7, 0x0

    .line 325
    :goto_1
    return-object v7

    .line 285
    :cond_0
    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v4

    goto :goto_0

    .line 287
    :catch_0
    move-exception v3

    .line 288
    .local v3, "e":Ljava/lang/IllegalStateException;
    invoke-virtual {v3}, Ljava/lang/IllegalStateException;->printStackTrace()V

    goto :goto_0

    .line 289
    .end local v3    # "e":Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v3

    .line 290
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 297
    .end local v3    # "e":Ljava/io/IOException;
    :cond_1
    const/16 v7, 0x400

    new-array v2, v7, [B

    .line 298
    .local v2, "bytearray":[B
    const/4 v6, 0x0

    .line 301
    .local v6, "len":I
    :goto_2
    :try_start_1
    invoke-virtual {v4, v2}, Ljava/io/InputStream;->read([B)I
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    move-result v6

    if-gtz v6, :cond_4

    .line 310
    :goto_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 313
    if-eqz v4, :cond_2

    .line 314
    :try_start_2
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 316
    :cond_2
    if-eqz v0, :cond_3

    .line 317
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 322
    :cond_3
    const/4 v4, 0x0

    :goto_4
    move-object v7, v1

    .line 325
    goto :goto_1

    .line 302
    :cond_4
    const/4 v7, 0x0

    :try_start_3
    invoke-virtual {v0, v2, v7, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_2

    .line 304
    :catch_2
    move-exception v3

    .line 305
    .local v3, "e":Ljava/lang/IllegalStateException;
    invoke-virtual {v3}, Ljava/lang/IllegalStateException;->printStackTrace()V

    goto :goto_3

    .line 306
    .end local v3    # "e":Ljava/lang/IllegalStateException;
    :catch_3
    move-exception v3

    .line 307
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    .line 319
    .end local v3    # "e":Ljava/io/IOException;
    :catch_4
    move-exception v3

    .line 320
    .restart local v3    # "e":Ljava/io/IOException;
    :try_start_4
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 322
    const/4 v4, 0x0

    goto :goto_4

    .line 321
    .end local v3    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v7

    .line 322
    const/4 v4, 0x0

    .line 323
    throw v7
.end method


# virtual methods
.method public doGet(Ljava/lang/String;)Landroid/os/Bundle;
    .locals 1
    .param p1, "request"    # Ljava/lang/String;

    .prologue
    .line 73
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/boyaa/godsdk/core/utils/HttpUtils;->doHttp(ILjava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public doPost(Ljava/lang/String;)Landroid/os/Bundle;
    .locals 1
    .param p1, "request"    # Ljava/lang/String;

    .prologue
    .line 83
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lcom/boyaa/godsdk/core/utils/HttpUtils;->doHttp(ILjava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public readIt(Ljava/io/InputStream;I)Ljava/lang/String;
    .locals 3
    .param p1, "stream"    # Ljava/io/InputStream;
    .param p2, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 331
    const/4 v1, 0x0

    .line 332
    .local v1, "reader":Ljava/io/Reader;
    new-instance v1, Ljava/io/InputStreamReader;

    .end local v1    # "reader":Ljava/io/Reader;
    const-string v2, "UTF-8"

    invoke-direct {v1, p1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 333
    .restart local v1    # "reader":Ljava/io/Reader;
    new-array v0, p2, [C

    .line 334
    .local v0, "buffer":[C
    invoke-virtual {v1, v0}, Ljava/io/Reader;->read([C)I

    .line 335
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([C)V

    return-object v2
.end method
