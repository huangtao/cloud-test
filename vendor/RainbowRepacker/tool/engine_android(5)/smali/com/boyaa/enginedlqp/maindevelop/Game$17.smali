.class Lcom/boyaa/enginedlqp/maindevelop/Game$17;
.super Ljava/lang/Object;
.source "Game.java"

# interfaces
.implements Lcom/boyaa/app/AppStartDialog$AppLoadingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/enginedlqp/maindevelop/Game;->showStartDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;


# direct methods
.method constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/Game;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$17;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    .line 876
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 2

    .prologue
    .line 880
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$17;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    # getter for: Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;
    invoke-static {v0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->access$0(Lcom/boyaa/enginedlqp/maindevelop/Game;)Lcom/boyaa/app/AppStartDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$17;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    # getter for: Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;
    invoke-static {v0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->access$0(Lcom/boyaa/enginedlqp/maindevelop/Game;)Lcom/boyaa/app/AppStartDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/app/AppStartDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 881
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$17;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    # getter for: Lcom/boyaa/enginedlqp/maindevelop/Game;->mStartDialog:Lcom/boyaa/app/AppStartDialog;
    invoke-static {v0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->access$0(Lcom/boyaa/enginedlqp/maindevelop/Game;)Lcom/boyaa/app/AppStartDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/app/AppStartDialog;->dismiss()V

    .line 882
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$17;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->access$1(Lcom/boyaa/enginedlqp/maindevelop/Game;Lcom/boyaa/app/AppStartDialog;)V

    .line 884
    :cond_0
    return-void
.end method
