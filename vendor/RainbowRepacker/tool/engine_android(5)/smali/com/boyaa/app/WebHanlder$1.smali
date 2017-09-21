.class Lcom/boyaa/app/WebHanlder$1;
.super Ljava/lang/Object;
.source "WebHanlder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/WebHanlder;->doWebViewBack()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/app/WebHanlder;


# direct methods
.method constructor <init>(Lcom/boyaa/app/WebHanlder;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/WebHanlder$1;->this$0:Lcom/boyaa/app/WebHanlder;

    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lcom/boyaa/app/WebHanlder$1;->this$0:Lcom/boyaa/app/WebHanlder;

    # getter for: Lcom/boyaa/app/WebHanlder;->mWebView:Lcom/boyaa/app/EmbedWebView;
    invoke-static {v0}, Lcom/boyaa/app/WebHanlder;->access$5(Lcom/boyaa/app/WebHanlder;)Lcom/boyaa/app/EmbedWebView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/app/EmbedWebView;->goBackWebView()V

    .line 213
    return-void
.end method
