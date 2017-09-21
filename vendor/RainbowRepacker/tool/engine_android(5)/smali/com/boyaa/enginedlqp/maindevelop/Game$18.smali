.class Lcom/boyaa/enginedlqp/maindevelop/Game$18;
.super Ljava/lang/Object;
.source "Game.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/enginedlqp/maindevelop/Game;->onHandleKeyDown(ILandroid/view/KeyEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

.field private final synthetic val$kc:I


# direct methods
.method constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/Game;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$18;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    iput p2, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$18;->val$kc:I

    .line 1005
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 1008
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    iget v1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$18;->val$kc:I

    const-string v2, ""

    const-string v3, ""

    invoke-virtual {v0, v1, v2, v3}, Lcom/boyaa/app/core/HandlerManager;->handler(ILjava/lang/Object;Ljava/lang/String;)V

    .line 1009
    return-void
.end method
