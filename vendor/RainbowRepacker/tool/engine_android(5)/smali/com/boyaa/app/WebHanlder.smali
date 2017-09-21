.class public Lcom/boyaa/app/WebHanlder;
.super Ljava/lang/Object;
.source "WebHanlder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/app/WebHanlder$JavaScriptInterface;
    }
.end annotation


# static fields
.field public static final CMD_GET_USERDATA:I = 0x3e9

.field public static final CMD_SEND_DOWNLOAD:I = 0x3ea

.field public static final CMD_SEND_WEB_INPUT:I = 0x3f5

.field public static final CMD_WEB_GO_BACK:I = 0x3f6

.field public static final INTERFACE_TAG:Ljava/lang/String; = "df_interface"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDownloadHandler:Lcom/boyaa/app/download/DownloadHandler;

.field public mJs:Lcom/boyaa/app/WebHanlder$JavaScriptInterface;

.field private mWebView:Lcom/boyaa/app/EmbedWebView;

.field private mid:I

.field private money:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/boyaa/app/EmbedWebView;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "webView"    # Lcom/boyaa/app/EmbedWebView;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/boyaa/app/WebHanlder;->mContext:Landroid/content/Context;

    .line 38
    iput-object p2, p0, Lcom/boyaa/app/WebHanlder;->mWebView:Lcom/boyaa/app/EmbedWebView;

    .line 39
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/app/WebHanlder;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 171
    invoke-direct {p0}, Lcom/boyaa/app/WebHanlder;->getUserData()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lcom/boyaa/app/WebHanlder;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 195
    invoke-direct {p0, p1}, Lcom/boyaa/app/WebHanlder;->go2Download(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2(Lcom/boyaa/app/WebHanlder;Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 230
    invoke-direct {p0, p1}, Lcom/boyaa/app/WebHanlder;->showEditView(Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$3(Lcom/boyaa/app/WebHanlder;)V
    .locals 0

    .prologue
    .line 201
    invoke-direct {p0}, Lcom/boyaa/app/WebHanlder;->doWebViewBack()V

    return-void
.end method

.method static synthetic access$4(Lcom/boyaa/app/WebHanlder;Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 217
    invoke-direct {p0, p1}, Lcom/boyaa/app/WebHanlder;->send2Lua(Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$5(Lcom/boyaa/app/WebHanlder;)Lcom/boyaa/app/EmbedWebView;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/boyaa/app/WebHanlder;->mWebView:Lcom/boyaa/app/EmbedWebView;

    return-object v0
.end method

.method private doWebViewBack()V
    .locals 2

    .prologue
    .line 203
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/app/WebHanlder$1;

    invoke-direct {v1, p0}, Lcom/boyaa/app/WebHanlder$1;-><init>(Lcom/boyaa/app/WebHanlder;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 215
    return-void
.end method

.method private getUserData()Ljava/lang/String;
    .locals 5

    .prologue
    .line 174
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 175
    .local v1, "jo":Lorg/json/JSONObject;
    const-string v2, "mid"

    iget v3, p0, Lcom/boyaa/app/WebHanlder;->mid:I

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 176
    const-string v2, "money"

    iget-wide v3, p0, Lcom/boyaa/app/WebHanlder;->money:J

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 177
    const-string v2, "platformid"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 178
    const-string v2, "deviceid"

    invoke-static {}, Lcom/boyaa/util/SimUtil;->getDeviceId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 179
    const-string v2, "macaddr"

    invoke-static {}, Lcom/boyaa/util/SimUtil;->getLocalMacAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 180
    const-string v2, "version"

    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v3}, Lcom/boyaa/app/sys/SystemInfo;->getVersionCode(Landroid/app/Activity;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 181
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 186
    .end local v1    # "jo":Lorg/json/JSONObject;
    :goto_0
    return-object v2

    .line 182
    :catch_0
    move-exception v0

    .line 184
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 186
    const-string v2, ""

    goto :goto_0
.end method

.method private go2Download(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 196
    iget-object v0, p0, Lcom/boyaa/app/WebHanlder;->mDownloadHandler:Lcom/boyaa/app/download/DownloadHandler;

    if-nez v0, :cond_0

    .line 197
    new-instance v0, Lcom/boyaa/app/download/DownloadHandler;

    iget-object v1, p0, Lcom/boyaa/app/WebHanlder;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/boyaa/app/download/DownloadHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/boyaa/app/WebHanlder;->mDownloadHandler:Lcom/boyaa/app/download/DownloadHandler;

    .line 198
    :cond_0
    iget-object v0, p0, Lcom/boyaa/app/WebHanlder;->mDownloadHandler:Lcom/boyaa/app/download/DownloadHandler;

    invoke-virtual {v0, p1}, Lcom/boyaa/app/download/DownloadHandler;->startDownload(Ljava/lang/String;)V

    .line 199
    return-void
.end method

.method private go2Friend()V
    .locals 0

    .prologue
    .line 350
    return-void
.end method

.method private go2Game(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "jo"    # Lorg/json/JSONObject;

    .prologue
    .line 301
    const-string v3, "gameid"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    .line 302
    .local v1, "mid":I
    const-string v3, "level"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    .line 303
    .local v0, "level":I
    const-string v3, "tableid"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    .line 304
    .local v2, "tableid":I
    return-void
.end method

.method private go2Hall()V
    .locals 0

    .prologue
    .line 286
    return-void
.end method

.method private go2Login()V
    .locals 0

    .prologue
    .line 270
    return-void
.end method

.method private go2Profile()V
    .locals 0

    .prologue
    .line 278
    return-void
.end method

.method private go2Quit()V
    .locals 0

    .prologue
    .line 262
    return-void
.end method

.method private go2Rank(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "jo"    # Lorg/json/JSONObject;

    .prologue
    .line 341
    const-string v1, "type"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 342
    .local v0, "rankType":Ljava/lang/String;
    return-void
.end method

.method private go2Shop()V
    .locals 0

    .prologue
    .line 312
    return-void
.end method

.method private go2Task(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "jo"    # Lorg/json/JSONObject;

    .prologue
    .line 326
    const-string v1, "type"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    .line 327
    .local v0, "taskId":I
    return-void
.end method

.method private send2Lua(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "jo"    # Lorg/json/JSONObject;

    .prologue
    .line 219
    if-nez p1, :cond_0

    .line 227
    :goto_0
    return-void

    .line 221
    :cond_0
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v1, Lcom/boyaa/app/WebHanlder$2;

    invoke-direct {v1, p0, p1}, Lcom/boyaa/app/WebHanlder$2;-><init>(Lcom/boyaa/app/WebHanlder;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private showEditView(Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "jo"    # Lorg/json/JSONObject;

    .prologue
    .line 232
    const-string v2, "cb_func"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 233
    .local v0, "cbFuncName":Ljava/lang/String;
    const-string v2, "value"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 234
    .local v1, "str":Ljava/lang/String;
    const-string v2, "null"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 235
    const-string v1, ""

    .line 237
    :cond_0
    new-instance v2, Lcom/boyaa/app/web/WebInputDialog;

    iget-object v3, p0, Lcom/boyaa/app/WebHanlder;->mContext:Landroid/content/Context;

    new-instance v4, Lcom/boyaa/app/WebHanlder$3;

    invoke-direct {v4, p0, v0}, Lcom/boyaa/app/WebHanlder$3;-><init>(Lcom/boyaa/app/WebHanlder;Ljava/lang/String;)V

    invoke-direct {v2, v3, v4}, Lcom/boyaa/app/web/WebInputDialog;-><init>(Landroid/content/Context;Lcom/boyaa/app/web/WebInputDialog$WebInputDialogCallBack;)V

    .line 254
    invoke-virtual {v2, v1}, Lcom/boyaa/app/web/WebInputDialog;->showDialog(Ljava/lang/String;)V

    .line 255
    return-void
.end method


# virtual methods
.method public adJsFunction(Ljava/lang/String;)V
    .locals 3
    .param p1, "function"    # Ljava/lang/String;

    .prologue
    .line 71
    iget-object v1, p0, Lcom/boyaa/app/WebHanlder;->mWebView:Lcom/boyaa/app/EmbedWebView;

    if-eqz v1, :cond_0

    .line 72
    iget-object v1, p0, Lcom/boyaa/app/WebHanlder;->mWebView:Lcom/boyaa/app/EmbedWebView;

    invoke-virtual {v1}, Lcom/boyaa/app/EmbedWebView;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 73
    .local v0, "wv":Landroid/webkit/WebView;
    if-eqz v0, :cond_0

    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "javascript:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 77
    .end local v0    # "wv":Landroid/webkit/WebView;
    :cond_0
    return-void
.end method

.method public addJSInterface()V
    .locals 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/boyaa/app/WebHanlder;->mJs:Lcom/boyaa/app/WebHanlder$JavaScriptInterface;

    if-nez v0, :cond_0

    .line 95
    new-instance v0, Lcom/boyaa/app/WebHanlder$JavaScriptInterface;

    invoke-direct {v0, p0}, Lcom/boyaa/app/WebHanlder$JavaScriptInterface;-><init>(Lcom/boyaa/app/WebHanlder;)V

    iput-object v0, p0, Lcom/boyaa/app/WebHanlder;->mJs:Lcom/boyaa/app/WebHanlder$JavaScriptInterface;

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/boyaa/app/WebHanlder;->mJs:Lcom/boyaa/app/WebHanlder$JavaScriptInterface;

    const-string v1, "df_interface"

    invoke-virtual {p0, v0, v1}, Lcom/boyaa/app/WebHanlder;->addJSInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 98
    return-void
.end method

.method public addJSInterface(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 2
    .param p1, "jsObject"    # Ljava/lang/Object;
    .param p2, "jsName"    # Ljava/lang/String;

    .prologue
    .line 106
    iget-object v1, p0, Lcom/boyaa/app/WebHanlder;->mWebView:Lcom/boyaa/app/EmbedWebView;

    if-eqz v1, :cond_0

    .line 107
    iget-object v1, p0, Lcom/boyaa/app/WebHanlder;->mWebView:Lcom/boyaa/app/EmbedWebView;

    invoke-virtual {v1}, Lcom/boyaa/app/EmbedWebView;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 108
    .local v0, "wv":Landroid/webkit/WebView;
    if-eqz v0, :cond_0

    .line 109
    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 112
    .end local v0    # "wv":Landroid/webkit/WebView;
    :cond_0
    return-void
.end method

.method public doJsFuction(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "funcName"    # Ljava/lang/String;
    .param p2, "result"    # Ljava/lang/String;

    .prologue
    .line 54
    iget-object v1, p0, Lcom/boyaa/app/WebHanlder;->mWebView:Lcom/boyaa/app/EmbedWebView;

    if-eqz v1, :cond_0

    .line 55
    iget-object v1, p0, Lcom/boyaa/app/WebHanlder;->mWebView:Lcom/boyaa/app/EmbedWebView;

    invoke-virtual {v1}, Lcom/boyaa/app/EmbedWebView;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 56
    .local v0, "wv":Landroid/webkit/WebView;
    if-eqz v0, :cond_0

    .line 57
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "javascript:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 64
    .end local v0    # "wv":Landroid/webkit/WebView;
    :cond_0
    :goto_0
    return-void

    .line 60
    .restart local v0    # "wv":Landroid/webkit/WebView;
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "javascript:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\')"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public endJSInterface()V
    .locals 0

    .prologue
    .line 116
    return-void
.end method

.method public getJSInterface()Lcom/boyaa/app/WebHanlder$JavaScriptInterface;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/boyaa/app/WebHanlder;->mJs:Lcom/boyaa/app/WebHanlder$JavaScriptInterface;

    if-nez v0, :cond_0

    .line 85
    new-instance v0, Lcom/boyaa/app/WebHanlder$JavaScriptInterface;

    invoke-direct {v0, p0}, Lcom/boyaa/app/WebHanlder$JavaScriptInterface;-><init>(Lcom/boyaa/app/WebHanlder;)V

    iput-object v0, p0, Lcom/boyaa/app/WebHanlder;->mJs:Lcom/boyaa/app/WebHanlder$JavaScriptInterface;

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/boyaa/app/WebHanlder;->mJs:Lcom/boyaa/app/WebHanlder$JavaScriptInterface;

    return-object v0
.end method

.method public setMid(I)V
    .locals 0
    .param p1, "mid"    # I

    .prologue
    .line 42
    iput p1, p0, Lcom/boyaa/app/WebHanlder;->mid:I

    .line 43
    return-void
.end method

.method public setMoney(J)V
    .locals 0
    .param p1, "money"    # J

    .prologue
    .line 46
    iput-wide p1, p0, Lcom/boyaa/app/WebHanlder;->money:J

    .line 47
    return-void
.end method
