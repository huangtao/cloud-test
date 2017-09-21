.class public Lcom/boyaa/engine/made/AppHttpGet;
.super Ljava/lang/Object;
.source "AppHttpGet.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final HTTP_REQUEST_FINISH:I = 0x3

.field private static final KEventPrefix:Ljava/lang/String; = "event_http_response"

.field private static final KEventPrefix_:Ljava/lang/String; = "event_http_response_"

.field private static final kAbort:Ljava/lang/String; = "abort"

.field private static final kCode:Ljava/lang/String; = "code"

.field private static final kData:Ljava/lang/String; = "data"

.field private static final kError:Ljava/lang/String; = "error"

.field private static final kEvent:Ljava/lang/String; = "event"

.field private static final kHttpRequestExecute:Ljava/lang/String; = "http_request_execute"

.field private static final kHttpResponse:Ljava/lang/String; = "http_response"

.field private static final kId:Ljava/lang/String; = "id"

.field private static final kRet:Ljava/lang/String; = "ret"

.field private static final kStep:Ljava/lang/String; = "step"

.field private static final kTimeout:Ljava/lang/String; = "timeout"

.field private static final kUrl:Ljava/lang/String; = "url"

.field private static mMsgs:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Landroid/os/Message;",
            ">;"
        }
    .end annotation
.end field

.field private static mSyncMsgs:Ljava/lang/Object;


# instance fields
.field private code:I

.field private data:Ljava/lang/String;

.field private error:I

.field private event:Ljava/lang/String;

.field private id:I

.field private ret:Ljava/lang/String;

.field private timeout:I

.field private url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/boyaa/engine/made/AppHttpGet;->mMsgs:Ljava/util/HashMap;

    .line 39
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/boyaa/engine/made/AppHttpGet;->mSyncMsgs:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static AddMsg(ILandroid/os/Message;)V
    .locals 3
    .param p0, "id"    # I
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 42
    sget-object v1, Lcom/boyaa/engine/made/AppHttpGet;->mSyncMsgs:Ljava/lang/Object;

    monitor-enter v1

    .line 44
    :try_start_0
    sget-object v0, Lcom/boyaa/engine/made/AppHttpGet;->mMsgs:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    monitor-exit v1

    .line 46
    return-void

    .line 45
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private static GetDictName(I)Ljava/lang/String;
    .locals 4
    .param p0, "id"    # I

    .prologue
    .line 91
    const-string v0, "http_request_%d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static HandleTimeout(Landroid/os/Message;)V
    .locals 6
    .param p0, "msg"    # Landroid/os/Message;

    .prologue
    .line 234
    invoke-virtual {p0}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 235
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v4, "id"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 236
    .local v2, "id":I
    const-string v4, "event"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 237
    .local v1, "event":Ljava/lang/String;
    invoke-static {v2}, Lcom/boyaa/engine/made/AppHttpGet;->GetDictName(I)Ljava/lang/String;

    move-result-object v3

    .line 239
    .local v3, "strDictName":Ljava/lang/String;
    invoke-static {v2}, Lcom/boyaa/engine/made/AppHttpGet;->RemoveMsg(I)Landroid/os/Message;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 241
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v4

    new-instance v5, Lcom/boyaa/engine/made/AppHttpGet$2;

    invoke-direct {v5, v2, v3, v1}, Lcom/boyaa/engine/made/AppHttpGet$2;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Lcom/boyaa/engine/made/AppActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 261
    :cond_0
    return-void
.end method

.method public static RemoveMsg(I)Landroid/os/Message;
    .locals 5
    .param p0, "id"    # I

    .prologue
    .line 49
    const/4 v1, 0x0

    .line 50
    .local v1, "msg":Landroid/os/Message;
    sget-object v3, Lcom/boyaa/engine/made/AppHttpGet;->mSyncMsgs:Ljava/lang/Object;

    monitor-enter v3

    .line 52
    :try_start_0
    sget-object v2, Lcom/boyaa/engine/made/AppHttpGet;->mMsgs:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 54
    sget-object v2, Lcom/boyaa/engine/made/AppHttpGet;->mMsgs:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Landroid/os/Message;

    move-object v1, v0

    .line 55
    sget-object v2, Lcom/boyaa/engine/made/AppHttpGet;->mMsgs:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    :cond_0
    monitor-exit v3

    .line 58
    return-object v1

    .line 57
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method static synthetic access$000(Lcom/boyaa/engine/made/AppHttpGet;)I
    .locals 1
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppHttpGet;

    .prologue
    .line 36
    iget v0, p0, Lcom/boyaa/engine/made/AppHttpGet;->id:I

    return v0
.end method

.method static synthetic access$100(Lcom/boyaa/engine/made/AppHttpGet;)I
    .locals 1
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppHttpGet;

    .prologue
    .line 36
    iget v0, p0, Lcom/boyaa/engine/made/AppHttpGet;->error:I

    return v0
.end method

.method static synthetic access$200(Lcom/boyaa/engine/made/AppHttpGet;)I
    .locals 1
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppHttpGet;

    .prologue
    .line 36
    iget v0, p0, Lcom/boyaa/engine/made/AppHttpGet;->code:I

    return v0
.end method

.method static synthetic access$300(Lcom/boyaa/engine/made/AppHttpGet;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppHttpGet;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/boyaa/engine/made/AppHttpGet;->ret:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/boyaa/engine/made/AppHttpGet;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppHttpGet;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/boyaa/engine/made/AppHttpGet;->event:Ljava/lang/String;

    return-object v0
.end method

.method private static setProxy(Lorg/apache/http/client/HttpClient;)V
    .locals 8
    .param p0, "client"    # Lorg/apache/http/client/HttpClient;

    .prologue
    .line 265
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/boyaa/engine/made/AppActivity;->getApplication()Landroid/app/Application;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 266
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/boyaa/engine/made/APNUtil;->hasProxy(Landroid/content/Context;)Z

    move-result v4

    .line 267
    .local v4, "useProxy":Z
    if-eqz v4, :cond_0

    .line 268
    invoke-static {v0}, Lcom/boyaa/engine/made/APNUtil;->getApnProxy(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 269
    .local v2, "proxyIP":Ljava/lang/String;
    invoke-static {v0}, Lcom/boyaa/engine/made/APNUtil;->getApnPortInt(Landroid/content/Context;)I

    move-result v3

    .line 270
    .local v3, "proxyPort":I
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 271
    new-instance v1, Lorg/apache/http/HttpHost;

    invoke-direct {v1, v2, v3}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;I)V

    .line 272
    .local v1, "proxy":Lorg/apache/http/HttpHost;
    invoke-interface {p0}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v5

    const-string v6, "http.route.default-proxy"

    invoke-interface {v5, v6, v1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 277
    .end local v1    # "proxy":Lorg/apache/http/HttpHost;
    .end local v2    # "proxyIP":Ljava/lang/String;
    .end local v3    # "proxyPort":I
    :goto_0
    return-void

    .line 276
    :cond_0
    invoke-interface {p0}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v5

    const-string v6, "http.route.default-proxy"

    const/4 v7, 0x0

    invoke-interface {v5, v6, v7}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    goto :goto_0
.end method


# virtual methods
.method public Execute()V
    .locals 7

    .prologue
    const/16 v6, 0x3e8

    const/4 v5, 0x0

    .line 103
    const-string v3, "http_request_execute"

    const-string v4, "id"

    invoke-static {v3, v4, v5}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/boyaa/engine/made/AppHttpGet;->id:I

    .line 104
    iget v3, p0, Lcom/boyaa/engine/made/AppHttpGet;->id:I

    if-nez v3, :cond_0

    .line 126
    :goto_0
    return-void

    .line 107
    :cond_0
    iget v3, p0, Lcom/boyaa/engine/made/AppHttpGet;->id:I

    invoke-static {v3}, Lcom/boyaa/engine/made/AppHttpGet;->GetDictName(I)Ljava/lang/String;

    move-result-object v2

    .line 108
    .local v2, "strDictName":Ljava/lang/String;
    const-string v3, "event"

    invoke-static {v2, v3}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/engine/made/AppHttpGet;->event:Ljava/lang/String;

    .line 109
    const-string v3, "timeout"

    invoke-static {v2, v3, v5}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/boyaa/engine/made/AppHttpGet;->timeout:I

    .line 110
    const-string v3, "url"

    invoke-static {v2, v3}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/engine/made/AppHttpGet;->url:Ljava/lang/String;

    .line 111
    const-string v3, "data"

    invoke-static {v2, v3}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/boyaa/engine/made/AppHttpGet;->data:Ljava/lang/String;

    .line 113
    iget v3, p0, Lcom/boyaa/engine/made/AppHttpGet;->timeout:I

    if-ge v3, v6, :cond_1

    iput v6, p0, Lcom/boyaa/engine/made/AppHttpGet;->timeout:I

    .line 115
    :cond_1
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 116
    .local v1, "msg":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 117
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v3, "id"

    iget v4, p0, Lcom/boyaa/engine/made/AppHttpGet;->id:I

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 118
    const-string v3, "event"

    iget-object v4, p0, Lcom/boyaa/engine/made/AppHttpGet;->event:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    const/4 v3, 0x1

    iput v3, v1, Landroid/os/Message;->what:I

    .line 120
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 121
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getHandler()Landroid/os/Handler;

    move-result-object v3

    iget v4, p0, Lcom/boyaa/engine/made/AppHttpGet;->timeout:I

    int-to-long v4, v4

    invoke-virtual {v3, v1, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 123
    iget v3, p0, Lcom/boyaa/engine/made/AppHttpGet;->id:I

    invoke-static {v3, v1}, Lcom/boyaa/engine/made/AppHttpGet;->AddMsg(ILandroid/os/Message;)V

    .line 124
    new-instance v3, Ljava/lang/Thread;

    invoke-direct {v3, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public run()V
    .locals 12

    .prologue
    const/4 v10, 0x0

    .line 140
    const-string v9, ""

    iput-object v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->ret:Ljava/lang/String;

    .line 141
    iput v10, p0, Lcom/boyaa/engine/made/AppHttpGet;->error:I

    .line 142
    iput v10, p0, Lcom/boyaa/engine/made/AppHttpGet;->code:I

    .line 143
    new-instance v4, Lorg/apache/http/client/methods/HttpGet;

    iget-object v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->url:Ljava/lang/String;

    invoke-direct {v4, v9}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 144
    .local v4, "getRequest":Lorg/apache/http/client/methods/HttpGet;
    const/4 v0, 0x0

    .line 145
    .local v0, "client":Lorg/apache/http/client/HttpClient;
    const/4 v7, 0x0

    .line 147
    .local v7, "response":Lorg/apache/http/HttpResponse;
    new-instance v5, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v5}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 148
    .local v5, "httpParams":Lorg/apache/http/params/HttpParams;
    iget v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->timeout:I

    invoke-static {v5, v9}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 149
    iget v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->timeout:I

    invoke-static {v5, v9}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 150
    const/16 v9, 0x2000

    invoke-static {v5, v9}, Lorg/apache/http/params/HttpConnectionParams;->setSocketBufferSize(Lorg/apache/http/params/HttpParams;I)V

    .line 151
    invoke-static {v5, v10}, Lorg/apache/http/params/HttpConnectionParams;->setTcpNoDelay(Lorg/apache/http/params/HttpParams;Z)V

    .line 152
    invoke-static {v5, v10}, Lorg/apache/http/params/HttpConnectionParams;->setStaleCheckingEnabled(Lorg/apache/http/params/HttpParams;Z)V

    .line 153
    invoke-static {v5, v10}, Lorg/apache/http/client/params/HttpClientParams;->setRedirecting(Lorg/apache/http/params/HttpParams;Z)V

    .line 154
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    invoke-direct {v0, v5}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 156
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    invoke-static {v0}, Lcom/boyaa/engine/made/AppHttpGet;->setProxy(Lorg/apache/http/client/HttpClient;)V

    .line 158
    :try_start_0
    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v9

    const-string v10, "http.connection.timeout"

    iget v11, p0, Lcom/boyaa/engine/made/AppHttpGet;->timeout:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v9, v10, v11}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 159
    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v9

    const-string v10, "http.socket.timeout"

    iget v11, p0, Lcom/boyaa/engine/made/AppHttpGet;->timeout:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v9, v10, v11}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 161
    new-instance v3, Lorg/apache/http/entity/StringEntity;

    iget-object v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->data:Ljava/lang/String;

    const-string v10, "UTF-8"

    invoke-direct {v3, v9, v10}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    .local v3, "entity":Lorg/apache/http/entity/StringEntity;
    invoke-interface {v0, v4}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v7

    .line 166
    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    .line 167
    .local v1, "code":I
    const/16 v9, 0xc8

    if-ne v1, v9, :cond_1

    .line 168
    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v9

    invoke-static {v9}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->ret:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/ProtocolException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 194
    .end local v1    # "code":I
    .end local v3    # "entity":Lorg/apache/http/entity/StringEntity;
    :goto_0
    iget v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->id:I

    invoke-static {v9}, Lcom/boyaa/engine/made/AppHttpGet;->RemoveMsg(I)Landroid/os/Message;

    move-result-object v6

    .line 195
    .local v6, "msg":Landroid/os/Message;
    if-eqz v6, :cond_0

    .line 197
    iget v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->id:I

    invoke-static {v9}, Lcom/boyaa/engine/made/AppHttpGet;->GetDictName(I)Ljava/lang/String;

    move-result-object v8

    .line 198
    .local v8, "strDictName":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v9

    new-instance v10, Lcom/boyaa/engine/made/AppHttpGet$1;

    invoke-direct {v10, p0, v8}, Lcom/boyaa/engine/made/AppHttpGet$1;-><init>(Lcom/boyaa/engine/made/AppHttpGet;Ljava/lang/String;)V

    invoke-virtual {v9, v10}, Lcom/boyaa/engine/made/AppActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 220
    .end local v8    # "strDictName":Ljava/lang/String;
    :cond_0
    return-void

    .line 171
    .end local v6    # "msg":Landroid/os/Message;
    .restart local v1    # "code":I
    .restart local v3    # "entity":Lorg/apache/http/entity/StringEntity;
    :cond_1
    :try_start_1
    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v9

    invoke-static {v9}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->ret:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/net/ProtocolException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 173
    .end local v1    # "code":I
    .end local v3    # "entity":Lorg/apache/http/entity/StringEntity;
    :catch_0
    move-exception v2

    .line 174
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    const/4 v9, 0x1

    :try_start_2
    iput v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->error:I

    .line 175
    invoke-virtual {v2}, Ljava/lang/IllegalArgumentException;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->ret:Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 192
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    :catchall_0
    move-exception v9

    throw v9

    .line 176
    :catch_1
    move-exception v2

    .line 177
    .local v2, "e":Ljava/net/MalformedURLException;
    const/4 v9, 0x1

    :try_start_3
    iput v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->error:I

    .line 178
    invoke-virtual {v2}, Ljava/net/MalformedURLException;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->ret:Ljava/lang/String;

    goto :goto_0

    .line 179
    .end local v2    # "e":Ljava/net/MalformedURLException;
    :catch_2
    move-exception v2

    .line 180
    .local v2, "e":Ljava/net/ProtocolException;
    const/4 v9, 0x1

    iput v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->error:I

    .line 181
    invoke-virtual {v2}, Ljava/net/ProtocolException;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->ret:Ljava/lang/String;

    goto :goto_0

    .line 183
    .end local v2    # "e":Ljava/net/ProtocolException;
    :catch_3
    move-exception v2

    .line 184
    .local v2, "e":Lorg/apache/http/conn/ConnectTimeoutException;
    const/4 v9, 0x1

    iput v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->error:I

    .line 185
    invoke-virtual {v2}, Lorg/apache/http/conn/ConnectTimeoutException;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->ret:Ljava/lang/String;

    goto :goto_0

    .line 186
    .end local v2    # "e":Lorg/apache/http/conn/ConnectTimeoutException;
    :catch_4
    move-exception v2

    .line 187
    .local v2, "e":Ljava/io/IOException;
    const/4 v9, 0x1

    iput v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->error:I

    .line 188
    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->ret:Ljava/lang/String;

    goto :goto_0

    .line 189
    .end local v2    # "e":Ljava/io/IOException;
    :catch_5
    move-exception v2

    .line 190
    .local v2, "e":Ljava/lang/Exception;
    const/4 v9, 0x1

    iput v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->error:I

    .line 191
    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/boyaa/engine/made/AppHttpGet;->ret:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method
