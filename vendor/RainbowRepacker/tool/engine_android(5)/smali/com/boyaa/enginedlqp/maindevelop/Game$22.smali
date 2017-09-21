.class Lcom/boyaa/enginedlqp/maindevelop/Game$22;
.super Ljava/lang/Object;
.source "Game.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/enginedlqp/maindevelop/Game;->callLua(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

.field private final synthetic val$funStr:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/Game;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$22;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    iput-object p2, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$22;->val$funStr:Ljava/lang/String;

    .line 1182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1187
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$22;->val$funStr:Ljava/lang/String;

    invoke-static {v0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->call_lua(Ljava/lang/String;)I

    .line 1188
    const-string v0, "guangli.liu"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "---------------------\u8c03\u7528lua\u65b9\u6cd5\uff1a"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$22;->val$funStr:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1189
    return-void
.end method
