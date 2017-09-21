.class Lcom/boyaa/engine/made/AppHttpGet$1;
.super Ljava/lang/Object;
.source "AppHttpGet.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppHttpGet;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/made/AppHttpGet;

.field final synthetic val$strDictName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppHttpGet;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 199
    iput-object p1, p0, Lcom/boyaa/engine/made/AppHttpGet$1;->this$0:Lcom/boyaa/engine/made/AppHttpGet;

    iput-object p2, p0, Lcom/boyaa/engine/made/AppHttpGet$1;->val$strDictName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 203
    const-string v1, "http_response"

    const-string v2, "id"

    iget-object v3, p0, Lcom/boyaa/engine/made/AppHttpGet$1;->this$0:Lcom/boyaa/engine/made/AppHttpGet;

    # getter for: Lcom/boyaa/engine/made/AppHttpGet;->id:I
    invoke-static {v3}, Lcom/boyaa/engine/made/AppHttpGet;->access$000(Lcom/boyaa/engine/made/AppHttpGet;)I

    move-result v3

    invoke-static {v1, v2, v3}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 204
    iget-object v1, p0, Lcom/boyaa/engine/made/AppHttpGet$1;->val$strDictName:Ljava/lang/String;

    const-string v2, "step"

    const/4 v3, 0x3

    invoke-static {v1, v2, v3}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 205
    iget-object v1, p0, Lcom/boyaa/engine/made/AppHttpGet$1;->val$strDictName:Ljava/lang/String;

    const-string v2, "error"

    iget-object v3, p0, Lcom/boyaa/engine/made/AppHttpGet$1;->this$0:Lcom/boyaa/engine/made/AppHttpGet;

    # getter for: Lcom/boyaa/engine/made/AppHttpGet;->error:I
    invoke-static {v3}, Lcom/boyaa/engine/made/AppHttpGet;->access$100(Lcom/boyaa/engine/made/AppHttpGet;)I

    move-result v3

    invoke-static {v1, v2, v3}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 206
    iget-object v1, p0, Lcom/boyaa/engine/made/AppHttpGet$1;->val$strDictName:Ljava/lang/String;

    const-string v2, "code"

    iget-object v3, p0, Lcom/boyaa/engine/made/AppHttpGet$1;->this$0:Lcom/boyaa/engine/made/AppHttpGet;

    # getter for: Lcom/boyaa/engine/made/AppHttpGet;->code:I
    invoke-static {v3}, Lcom/boyaa/engine/made/AppHttpGet;->access$200(Lcom/boyaa/engine/made/AppHttpGet;)I

    move-result v3

    invoke-static {v1, v2, v3}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 207
    iget-object v1, p0, Lcom/boyaa/engine/made/AppHttpGet$1;->val$strDictName:Ljava/lang/String;

    const-string v2, "ret"

    iget-object v3, p0, Lcom/boyaa/engine/made/AppHttpGet$1;->this$0:Lcom/boyaa/engine/made/AppHttpGet;

    # getter for: Lcom/boyaa/engine/made/AppHttpGet;->ret:Ljava/lang/String;
    invoke-static {v3}, Lcom/boyaa/engine/made/AppHttpGet;->access$300(Lcom/boyaa/engine/made/AppHttpGet;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    iget-object v1, p0, Lcom/boyaa/engine/made/AppHttpGet$1;->this$0:Lcom/boyaa/engine/made/AppHttpGet;

    # getter for: Lcom/boyaa/engine/made/AppHttpGet;->event:Ljava/lang/String;
    invoke-static {v1}, Lcom/boyaa/engine/made/AppHttpGet;->access$400(Lcom/boyaa/engine/made/AppHttpGet;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 210
    const-string v0, "event_http_response"

    .line 215
    .local v0, "strFunc":Ljava/lang/String;
    :goto_0
    invoke-static {v0}, Lcom/boyaa/engine/made/Sys;->callLua(Ljava/lang/String;)I

    .line 216
    return-void

    .line 212
    .end local v0    # "strFunc":Ljava/lang/String;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "event_http_response_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/engine/made/AppHttpGet$1;->this$0:Lcom/boyaa/engine/made/AppHttpGet;

    # getter for: Lcom/boyaa/engine/made/AppHttpGet;->event:Ljava/lang/String;
    invoke-static {v2}, Lcom/boyaa/engine/made/AppHttpGet;->access$400(Lcom/boyaa/engine/made/AppHttpGet;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "strFunc":Ljava/lang/String;
    goto :goto_0
.end method
