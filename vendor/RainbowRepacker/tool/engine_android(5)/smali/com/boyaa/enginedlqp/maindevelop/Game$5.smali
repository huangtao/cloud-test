.class Lcom/boyaa/enginedlqp/maindevelop/Game$5;
.super Ljava/lang/Object;
.source "Game.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/enginedlqp/maindevelop/Game;->onHandleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

.field private final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/Game;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$5;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    iput p2, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$5;->val$id:I

    .line 370
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 373
    const-string v0, "SystemTimer"

    const-string v1, "Id"

    iget v2, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$5;->val$id:I

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 374
    const-string v0, "event_system_timer"

    invoke-static {v0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->call_lua(Ljava/lang/String;)I

    .line 375
    return-void
.end method
