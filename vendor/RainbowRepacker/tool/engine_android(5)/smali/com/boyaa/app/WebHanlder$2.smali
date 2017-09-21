.class Lcom/boyaa/app/WebHanlder$2;
.super Ljava/lang/Object;
.source "WebHanlder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/WebHanlder;->send2Lua(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/app/WebHanlder;

.field private final synthetic val$jo:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lcom/boyaa/app/WebHanlder;Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/WebHanlder$2;->this$0:Lcom/boyaa/app/WebHanlder;

    iput-object p2, p0, Lcom/boyaa/app/WebHanlder$2;->val$jo:Lorg/json/JSONObject;

    .line 221
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 224
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    const-string v1, "OnWebViewCall"

    iget-object v2, p0, Lcom/boyaa/app/WebHanlder$2;->val$jo:Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    return-void
.end method
