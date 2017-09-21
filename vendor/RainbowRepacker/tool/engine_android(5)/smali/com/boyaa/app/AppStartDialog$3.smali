.class Lcom/boyaa/app/AppStartDialog$3;
.super Ljava/lang/Object;
.source "AppStartDialog.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/AppStartDialog;->onVideoOrImageShowingFinished()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/app/AppStartDialog;


# direct methods
.method constructor <init>(Lcom/boyaa/app/AppStartDialog;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/AppStartDialog$3;->this$0:Lcom/boyaa/app/AppStartDialog;

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog$3;->this$0:Lcom/boyaa/app/AppStartDialog;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/boyaa/app/AppStartDialog;->access$2(Lcom/boyaa/app/AppStartDialog;Z)V

    .line 126
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog$3;->this$0:Lcom/boyaa/app/AppStartDialog;

    # getter for: Lcom/boyaa/app/AppStartDialog;->isLuaLoaded:Z
    invoke-static {v0}, Lcom/boyaa/app/AppStartDialog;->access$3(Lcom/boyaa/app/AppStartDialog;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 127
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog$3;->this$0:Lcom/boyaa/app/AppStartDialog;

    # getter for: Lcom/boyaa/app/AppStartDialog;->listener:Lcom/boyaa/app/AppStartDialog$AppLoadingListener;
    invoke-static {v0}, Lcom/boyaa/app/AppStartDialog;->access$4(Lcom/boyaa/app/AppStartDialog;)Lcom/boyaa/app/AppStartDialog$AppLoadingListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog$3;->this$0:Lcom/boyaa/app/AppStartDialog;

    # getter for: Lcom/boyaa/app/AppStartDialog;->listener:Lcom/boyaa/app/AppStartDialog$AppLoadingListener;
    invoke-static {v0}, Lcom/boyaa/app/AppStartDialog;->access$4(Lcom/boyaa/app/AppStartDialog;)Lcom/boyaa/app/AppStartDialog$AppLoadingListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/boyaa/app/AppStartDialog$AppLoadingListener;->onFinished()V

    .line 132
    :goto_0
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog$3;->this$0:Lcom/boyaa/app/AppStartDialog;

    # getter for: Lcom/boyaa/app/AppStartDialog;->activity:Landroid/app/Activity;
    invoke-static {v0}, Lcom/boyaa/app/AppStartDialog;->access$5(Lcom/boyaa/app/AppStartDialog;)Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/boyaa/enginedlqp/maindevelop/Game;

    invoke-virtual {v0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->splashScreenFinish()V

    .line 136
    :goto_1
    return-void

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog$3;->this$0:Lcom/boyaa/app/AppStartDialog;

    invoke-virtual {v0}, Lcom/boyaa/app/AppStartDialog;->dismiss()V

    goto :goto_0

    .line 134
    :cond_1
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog$3;->this$0:Lcom/boyaa/app/AppStartDialog;

    # invokes: Lcom/boyaa/app/AppStartDialog;->showLoading()V
    invoke-static {v0}, Lcom/boyaa/app/AppStartDialog;->access$6(Lcom/boyaa/app/AppStartDialog;)V

    goto :goto_1
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 121
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 117
    return-void
.end method
