.class final Lcom/boyaa/engine/made/AppHttpGet$2;
.super Ljava/lang/Object;
.source "AppHttpGet.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppHttpGet;->HandleTimeout(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$event:Ljava/lang/String;

.field final synthetic val$id:I

.field final synthetic val$strDictName:Ljava/lang/String;


# direct methods
.method constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 242
    iput p1, p0, Lcom/boyaa/engine/made/AppHttpGet$2;->val$id:I

    iput-object p2, p0, Lcom/boyaa/engine/made/AppHttpGet$2;->val$strDictName:Ljava/lang/String;

    iput-object p3, p0, Lcom/boyaa/engine/made/AppHttpGet$2;->val$event:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 245
    const-string v1, "http_response"

    const-string v2, "id"

    iget v3, p0, Lcom/boyaa/engine/made/AppHttpGet$2;->val$id:I

    invoke-static {v1, v2, v3}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 246
    iget-object v1, p0, Lcom/boyaa/engine/made/AppHttpGet$2;->val$strDictName:Ljava/lang/String;

    const-string v2, "step"

    const/4 v3, 0x3

    invoke-static {v1, v2, v3}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 247
    iget-object v1, p0, Lcom/boyaa/engine/made/AppHttpGet$2;->val$strDictName:Ljava/lang/String;

    const-string v2, "error"

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 248
    iget-object v1, p0, Lcom/boyaa/engine/made/AppHttpGet$2;->val$strDictName:Ljava/lang/String;

    const-string v2, "code"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 249
    iget-object v1, p0, Lcom/boyaa/engine/made/AppHttpGet$2;->val$strDictName:Ljava/lang/String;

    const-string v2, "ret"

    const-string v3, "timeout"

    invoke-static {v1, v2, v3}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    iget-object v1, p0, Lcom/boyaa/engine/made/AppHttpGet$2;->val$event:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 252
    const-string v0, "event_http_response"

    .line 257
    .local v0, "strFunc":Ljava/lang/String;
    :goto_0
    invoke-static {v0}, Lcom/boyaa/engine/made/Sys;->callLua(Ljava/lang/String;)I

    .line 258
    return-void

    .line 254
    .end local v0    # "strFunc":Ljava/lang/String;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "event_http_response_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/engine/made/AppHttpGet$2;->val$event:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "strFunc":Ljava/lang/String;
    goto :goto_0
.end method
