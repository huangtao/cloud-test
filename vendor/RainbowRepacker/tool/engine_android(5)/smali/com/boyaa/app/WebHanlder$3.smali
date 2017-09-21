.class Lcom/boyaa/app/WebHanlder$3;
.super Ljava/lang/Object;
.source "WebHanlder.java"

# interfaces
.implements Lcom/boyaa/app/web/WebInputDialog$WebInputDialogCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/WebHanlder;->showEditView(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/app/WebHanlder;

.field private final synthetic val$cbFuncName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/app/WebHanlder;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/WebHanlder$3;->this$0:Lcom/boyaa/app/WebHanlder;

    iput-object p2, p0, Lcom/boyaa/app/WebHanlder$3;->val$cbFuncName:Ljava/lang/String;

    .line 237
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/app/WebHanlder$3;)Lcom/boyaa/app/WebHanlder;
    .locals 1

    .prologue
    .line 237
    iget-object v0, p0, Lcom/boyaa/app/WebHanlder$3;->this$0:Lcom/boyaa/app/WebHanlder;

    return-object v0
.end method


# virtual methods
.method public onCallBack(Ljava/lang/String;)V
    .locals 4
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 242
    iget-object v1, p0, Lcom/boyaa/app/WebHanlder$3;->this$0:Lcom/boyaa/app/WebHanlder;

    # getter for: Lcom/boyaa/app/WebHanlder;->mWebView:Lcom/boyaa/app/EmbedWebView;
    invoke-static {v1}, Lcom/boyaa/app/WebHanlder;->access$5(Lcom/boyaa/app/WebHanlder;)Lcom/boyaa/app/EmbedWebView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/boyaa/app/EmbedWebView;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    .line 243
    .local v0, "wv":Landroid/webkit/WebView;
    if-eqz v0, :cond_0

    .line 244
    invoke-virtual {v0}, Landroid/webkit/WebView;->getHandler()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/boyaa/app/WebHanlder$3$1;

    iget-object v3, p0, Lcom/boyaa/app/WebHanlder$3;->val$cbFuncName:Ljava/lang/String;

    invoke-direct {v2, p0, v3, p1}, Lcom/boyaa/app/WebHanlder$3$1;-><init>(Lcom/boyaa/app/WebHanlder$3;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 253
    :cond_0
    return-void
.end method
